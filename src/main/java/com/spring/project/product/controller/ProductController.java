package com.spring.project.product.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.board.service.QnAService;
import com.spring.project.board.service.ReviewService;
import com.spring.project.common.PagingManager;
import com.spring.project.member.service.IMemberService;
import com.spring.project.product.model.OrdersVO;
import com.spring.project.product.model.ProductsVO;
import com.spring.project.product.service.CartService;
import com.spring.project.product.service.OrderService;
import com.spring.project.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	CartService cartService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;
	@Autowired
	IMemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QnAService qnaService;

	// -------------cart------------
	// 전체 장바구니 목록(관리자용)
//	@RequestMapping("")
//	public String getCarList(Model model) {
//		ArrayList<CartVO> cartList = cartService.getCartList();
//		model.addAttribute("cartList", cartList);
//		return "";
//	}
//
	// 개인의 장바구니 목록 조회
	@RequestMapping("/cart")
	public String getCart(Authentication authentication, Model model) {
		model.addAttribute("cartLists", cartService.getCart(authentication.getName()));
		return "product/cart";
	}

//
//
//	// 장바구니 삭제(결제시 or client 삭제)
//	@RequestMapping("")
//	public String deleteCart(@PathVariable String member_id, int product_id) {
//		cartService.deleteCart(member_id, product_id);
//		return "redirect:/";
//	}
//
//	// ========================================
//	// -------------Order------------
//	// 전체 주문 목록(관리자용)
//	@RequestMapping("")
//	public String getOrderList(Model model) {
//		ArrayList<OrdersVO> orderList = orderService.getOrderList();
//		model.addAttribute("orderList", orderList);
//		return "";
//	}
//
	// 주문서 최종 주문하기전에 실행하는 코드(client용)
	@PostMapping("/ordersheet")
	public String getOrderSheet(@RequestParam("member_id") String member_id,
			@RequestParam(value = "product_id", required = false, defaultValue = "0") int product_id,
			@RequestParam(value = "pOrder_count", required = false, defaultValue = "0") int pOrder_count,
			@RequestParam(value = "product_ids", required = false) int[] product_ids,
			@RequestParam(value="delivery_price", required = false, defaultValue="0")int delivery_price,
			Model model) {
		System.out.println("----------------------------------------ordersheet in-----------------------------------------------------");
		System.out.println("member_id : " + member_id);
		System.out.println("product_id : " + product_id);
		System.out.println("pOrder_count : " + pOrder_count);
		System.out.println("product_ids : " + product_ids);
		model.addAttribute("memberInfo", memberService.getMemberInfo(member_id)); // 구매중인 회원정보
		// 장바구니 통하지 않은 바로 구매 요청 처리
		if (product_id != 0 && pOrder_count != 0 && product_ids == null && delivery_price!=-1) {
			System.out.println("product/view 통한 요청처리");
			ProductsVO product = productService.getProduct(product_id);
			model.addAttribute("sellerCompanyName",productService.getSellerCompanyName(product_id));
			model.addAttribute("productInfo", product); // 개인구매상품 정보
			model.addAttribute("productMemInfo", memberService.getMemberInfo(product.getMember_id())); // 독립상품 구매시 판매자
			model.addAttribute("pOrder_count", pOrder_count); // 주문 수량 -> payment 로 보내줄 주문수량
//			model.addAttribute("cartList", cartService.getCartInOrderSheet(member_id)); // 해당 개인장바구니의 상품의 정보와 상품판매자 정보
			model.addAttribute("delivery_price",delivery_price);
			// 장바구니 통한 구매 요청 처리
		} else if (product_id == 0 && pOrder_count == 0 && product_ids != null && delivery_price==0) {
			System.out.println("product/cart 통한 요청 처리");
			System.out.println("product_ids.length : " + product_ids.length);
			model.addAttribute("cartList", cartService.getSelectedCart(member_id, product_ids));// 선택된 상품의 정보와 상품 판매자 정보
		} else {
			System.out.println("ordersheet의 뭔가가 잘못되었음");
		}
		return "product/ordersheet";
	}

	// 주문서 최종 주문 후 실행하는 코드(client용)----------------------힘찬
	@PostMapping("/payment")
	public String payment(OrdersVO ordersVO, @RequestParam(value = "product_ids") int[] product_ids,
			@RequestParam(value = "order_product_counts") int[] order_product_counts,
			@RequestParam(value = "order_prices") int[] order_prices,
			@RequestParam("order_requests")String[]order_requests,
			@RequestParam("order_statuses")String[] order_statuses,
			Model model) {
		orderService.paymentInOrder(ordersVO, product_ids, order_product_counts, order_prices,order_requests,order_statuses); // 주문하는 곳에 넣는거고
		productService.afterPayment(product_ids, order_product_counts); // 상품 주문후 전체 수량에서 빼기
		cartService.deleteCart(ordersVO.getMember_id(), product_ids); // 해당 개인장바구니의 상품의 정보와 상품판매자 정보삭제
		for (int i = 0; i < product_ids.length; i++) {
			String setfrom = "underthesea5@naver.com";
			String tomail = memberService.getMemberInfo(productService.getProduct(product_ids[i]).getMember_id()).getMember_email(); // 받는 사람 이메일
			String title = productService.getProduct(product_ids[i]).getProduct_name() + "을 " + ordersVO.getMember_id()  +" 님이 주문하셧습니다."; // 제목
			String content = "주문서 보내고싶다."; // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용
				mailSender.send(message);
				System.out.println("메일 보내기 성공!!!!");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		model.addAttribute("orderedList",orderService.getOrderResult(ordersVO.getOrder_group_number()));
		return "product/payment";
	}
	// ===========================================================힘찬

	// 결제 완료 후 나의 주문내역 ===========================================지현
	@GetMapping("/orderlist/{member_id}")
	public String myOrderLIst(@PathVariable("member_id") String member_id, Model model) {
		model.addAttribute("orderLists", orderService.getOrderList(member_id));
		return "product/orderlist";
	}
	@PostMapping("/orderview")
	public void orderView(@RequestParam("member_id")String member_id, @RequestParam("order_group_number")int order_group_number, Model model) {
		model.addAttribute("orderListsByOrderGroupNumber", orderService.getOrder(member_id, order_group_number));
		model.addAttribute("order_group_number",order_group_number);
	}
	


//	// -------------Product------------
//	// 전체 상품 목록
	@RequestMapping("/list")
	public void getProductList(@RequestParam(value="search", required = false)String search,Model model) {
		System.out.println("=====product 통과=====");
		System.out.println("search : "+search);
		if(search==null) {
			model.addAttribute("productList", productService.getProductList());
		}else {
			model.addAttribute("productList",productService.getProductListBySearch(search));
		}
	}

	@RequestMapping("/img/{product_id}")
	public ResponseEntity<byte[]> getImage(@PathVariable("product_id") int product_id) {
		ProductsVO product = productService.getProduct(product_id);
		String product_type = product.getProduct_img_name().split("\\.")[1];
		byte[] product_img = product.getProduct_img();
		final HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("image", product_type));
		header.setContentDispositionFormData("attachment", product.getProduct_img_name());
		ResponseEntity<byte[]> image = new ResponseEntity<byte[]>(product_img, header, HttpStatus.OK);
		return image;
	}

	// 한개의 상품 정보
	@RequestMapping("{product_id}")
	public String getProduct(
			@PathVariable("product_id") int product_id,
			@RequestParam(value = "reviewPage", required = false)String reviewPage, 
			@RequestParam(value="qnaPage",required=false)String qnaPage,
			Model model) {
		System.out.println("reviewPage : "+reviewPage);
		if(reviewPage!=null) {
			model.addAttribute("reviewRequest","reviewRequest");
		}else {
			reviewPage="1";
		}
		if(qnaPage!=null) {
			model.addAttribute("qnaRequest","qnaRequest");
		}else {
			qnaPage="1";
		}
		int rPage = Integer.parseInt(reviewPage);
		int qPage = Integer.parseInt(qnaPage);
		ProductsVO product = productService.getProduct(product_id);
		model.addAttribute("product", product);
		model.addAttribute("sellerInfo",memberService.getSellerInfo(product.getMember_id()));
		model.addAttribute("reviewList",reviewService.getReviewList(product_id,rPage));
		model.addAttribute("reviewPagingManager",new PagingManager(reviewService.getTotalCount(product_id), rPage));
		model.addAttribute("qnaList",qnaService.getQnAList(qPage));
		model.addAttribute("qnaPagingManager",new PagingManager(qnaService.getTotalCount(product_id),qPage));
		return "product/view";
	}

	// 상품 입고화면
	@GetMapping("/upload")
	public void insertProduct(Model model) {
		model.addAttribute("msg","upload");
	}
	
	
	
	//sellerProductList에서 수정 버튼 클릭 시
	@GetMapping("/upload/{product_id}")
	public String modify(@PathVariable("product_id") int product_id, Model model) {
		model.addAttribute("product", productService.getProduct(product_id));
		model.addAttribute("msg", "update");
		return "product/upload";
	}
	
	
	//판매자 페이지 등록된 상품 삭제
	@PostMapping("/deleteSellerPoduct")
	public String deleteSellerProduct(@RequestParam int[] product_ids) {
		productService.deleteSellerProduct(product_ids);
		return "redirect:/member/info";
	}
	
}
