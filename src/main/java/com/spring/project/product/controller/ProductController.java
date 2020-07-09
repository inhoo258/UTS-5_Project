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

	// -------------cart------------
	// 전체 장바구니 목록(관리자용)
//	@RequestMapping("")
//	public String getCarList(Model model) {
//		ArrayList<CartVO> cartList = cartService.getCartList();
//		model.addAttribute("cartList", cartList);
//		return "";
//	}
//
//	// 개인 장바구니 조회
//	@RequestMapping("")
//	public String getCart(@PathVariable String member_id, Model model) {
//		CartVO cart = cartService.getCart(member_id);
//		model.addAttribute("cart", cart);
//		return "";
//	}
//
//	// 장바구니 담기
//	@PostMapping("")
//	public String insertCart(@ModelAttribute("cart") @Validated CartVO cart, Model model) {
//		cartService.insertCart(cart.getMember_id(), cart.getProduct_id(), cart.getCart_product_count());
//		model.addAttribute("cart", new CartVO());
//		return "";
//	}
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
//	// 주문 목록(client용)
//	@RequestMapping("")
//	public String getOrder(@PathVariable String member_id, Model model) {
//		OrdersVO order = orderService.getOrder(member_id);
//		model.addAttribute("order", order);
//		return "";
//	}
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
//	public String deliveryOrder(@PathVariable String member_id, int product_id, String delivery) {
//		orderService.deliveryOrder(member_id, product_id, delivery);
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
//	
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
	// 한개의 상품 정보
	@RequestMapping("{product_id}")
	public String getProduct(@PathVariable("product_id")int product_id, Model model) {
		model.addAttribute("product", productService.getProduct(product_id));
		return "product/view";
	}
//
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
//
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
