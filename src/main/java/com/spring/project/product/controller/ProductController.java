package com.spring.project.product.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.member.service.IMemberService;
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
	@RequestMapping("/cart/{member_id}")
	public String getCart(@PathVariable("member_id")String member_id, Model model) {
		model.addAttribute("cartList", cartService.getCart(member_id));
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
	public String getOrderSheet(
			@RequestParam("member_id")String member_id,
			@RequestParam(value = "product_id", required = false, defaultValue = "0")int product_id,
			@RequestParam(value = "pOrder_count",required = false, defaultValue = "0")int pOrder_count,
			@RequestParam(value="product_ids",required = false)int[]product_ids,
			Model model) {
		System.out.println("-------------------ordersheet in");
		System.out.println("member_id : "+member_id);
		System.out.println("product_id : " + product_id);
		System.out.println("pOrder_count : "+pOrder_count);
		System.out.println("product_ids : "+product_ids);
		model.addAttribute("memberInfo", memberService.getMemberInfo(member_id)); 	// 구매중인 회원정보
		//장바구니 통하지 않은 바로 구매 요청 처리
		if(product_id != 0 && pOrder_count!=0 && product_ids==null) {
			System.out.println("product/view 통한 요청처리");
			ProductsVO product = productService.getProduct(product_id);
			model.addAttribute("productInfo", product);	// 개인구매상품 정보
			model.addAttribute("productMemInfo", memberService.getMemberInfo(product.getMember_id())); //독립상품 구매시 판매자 정보
			model.addAttribute("pOrder_count",pOrder_count); // 주문 수량 -> payment 로 보내줄 주문수량
			model.addAttribute("cartList", cartService.getCart(member_id)); // 해당 개인장바구니의 상품의 정보와 상품판매자 정보
		//장바구니 통한 구매 요청 처리
		}else if(product_id==0&&pOrder_count==0&&product_ids!=null){
			System.out.println("product/cart 통한 요청 처리");
			System.out.println("product_ids.length : "+product_ids.length);
			model.addAttribute("cartList",cartService.getSelectedCart(member_id,product_ids));//선택된 상품의 정보와 상품 판매자 정보
		}else {
			System.out.println("ordersheet의 뭔가가 잘못되었음");
		}
		return "product/ordersheet";
	}
	
	// 주문서 최종 주문 후 실행하는 코드(client용)
	@PostMapping("/payment")
	public String payment(@RequestParam("member_id")String member_id, @RequestParam("pOrder_count")int pOrder_count,@RequestParam("cart_Id_List")int[] product_ids,@RequestParam("cart_product_count")int[] cart_product_count, @RequestParam("pOrder_count")int product_id, Model model) {
//		ArrayList<Object> products = null;
//		Map<String, Object> productsVoList = null;
//		ProductsVO product = productService.getProduct(product_id); //바로 주문 상품의 정보들을 캐오는 메소드
//		int productCount = pOrder_count; //바로 주문 상품의 정보들을 캐오는 메소드
//		
//		int putMapNumProduct =0; // 개인상품 Array에 넣어줄 변수
//		for(int i=0; i < product_ids.length; i++) { //장바구니 상품들의 각각 정보들 캐오는 메소드
//			products.clear(); //각 장바구니 상품들을 따로 넣어주기위한 null작업
//			products.add(productService.getProduct(product_ids[i]));
//			products.add(cart_product_count[i]);
//			productsVoList.put("cartProduct_Count"+i, products);//장바구니 상품들의 각 정보들의 객체를 담는 Map
//			products.clear();
//		}
//		products.add(product); // 바로구매 상품 넣어주기
//		products.add(productCount); //바로 구매 상품 주문 갯수 넣어주기
//		productsVoList.put("directproduct", products);
//		orderService.modifyDb(product,productsVoList,cart_product_count);
//		orderService.insertOrder();
//		cartService.deleteCart(member_id, product_ids); // 해당 개인장바구니의 상품의 정보와 상품판매자 정보삭제
		return "product/payment";
	}
	
//
//	// 장바구니>>주문목록
//	@RequestMapping("")
//	public String insertOrder(@ModelAttribute("order") @Validated OrdersVO order, Model model) {
//		orderService.insertOrder(order.getMember_id(), order.getProduct_id(), order.getOrder_date(),
//				order.getOrder_receiver_addr(), order.getOrder_receiver_name(), order.getOrder_receiver_tel(),
//				order.getOrder_product_count(), order.getOrder_price(), order.getOrder_request());
//		return "";
//	}
//
//	// 주문 취소시 삭제
//	@RequestMapping("")
//	public String deleteOrder(@PathVariable String member_id, int product_id) {
//		orderService.deleteOrder(member_id, product_id);
//		return "";
//	}
//
//	// 배송 전/중/완료
//	@RequestMapping("")
//	public String deliveryOrder(@PathVariable String member_id, int product_id, String order_status) {
//		orderService.deliveryOrder(member_id, product_id, order_status);
//		return "";
//	}
//
//	// =======================================
//	// -------------Product------------
//	// 전체 상품 목록
	@RequestMapping("/list")
	public void getProductList(Model model) {
		System.out.println("=====product 통과=====");
		model.addAttribute("productList", productService.getProductList());
	}
	
	@RequestMapping("/img/{product_id}")
	public ResponseEntity<byte[]> getImage(@PathVariable("product_id")int product_id){
		System.out.println("getImage in ! by product id = "+product_id);
		ProductsVO product = productService.getProduct(product_id);
//		System.out.println("product_img_name = "+product.getProduct_img_name());
//		System.out.println("product_img_name size = "+product.getProduct_img_name().split("\\.").length);
//		System.out.println("product_img_name[0] = "+product.getProduct_img_name().split("\\.")[0]);
//		System.out.println("product_img_name[1] = "+product.getProduct_img_name().split("\\.")[1]);
		String product_type = product.getProduct_img_name().split("\\.")[1];
		byte[] product_img = product.getProduct_img();
		final HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("image",product_type));
		header.setContentDispositionFormData("attachment", product.getProduct_img_name());
		ResponseEntity<byte[]> image = new ResponseEntity<byte[]>(product_img,header,HttpStatus.OK);
		return image;
	}
//	// 한개의 상품 정보
//	@RequestMapping("")
//	public String getProduct(@PathVariable int product_id, Model model) {
//		ProductsVO product = productService.getProduct(product_id);
//		model.addAttribute("product", product);
//		return "";
//	}
	// 한개의 상품 정보
	@RequestMapping("{product_id}")
	public String getProduct(@PathVariable("product_id")int product_id, Model model) {
		model.addAttribute("product", productService.getProduct(product_id));
		return "product/view";
	}
	// 상품 입고화면
	@GetMapping("/upload")
	public void insertProduct() {}
	
	@PostMapping("/upload")
	public String insertProduct(@RequestParam("file")MultipartFile file, ProductsVO product) {
		System.out.println("insert start");
		product.setProduct_img_name(file.getOriginalFilename());
		try {
			product.setProduct_img(file.getBytes());
		} catch (IOException e) {
			System.out.println("파일이 아니므니다");
		}
		productService.insertProduct(product);
		return "redirect:/product/list";
	}

//	// 상품 출고,재고없음
//	@RequestMapping("")
//	public String deleteProduct(@PathVariable int product_id) {
//		productService.deleteProduct(product_id);
//		return "";
//	}
//
//	// 팔린 만큼 수량 감소
//	@RequestMapping("")
//	public String minusProductCount(@PathVariable int minusCount, int product_id) {
//		productService.minusProductCount(minusCount, product_id);
//		return "";
//	}
//
//	// 입고 만큼 수량 증가
//	@RequestMapping("")
//	public String PlusProductCount(@PathVariable int plusCount, int product_id) {
//		productService.plusProductCount(plusCount, product_id);
//		return "";
//	}
}
