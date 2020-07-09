package com.spring.project.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.product.service.CartService;
import com.spring.project.product.service.OrderService;
import com.spring.project.product.service.ProductService;

@Controller
@RequestMapping("")
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
//	@RequestMapping("")
//	public String getProductList(Model model) {
//		ArrayList<ProductsVO> productList = productService.getProductList();
//		model.addAttribute("product", productList);
//		return "";
//	}
//
//	// 한개의 상품 정보
//	@RequestMapping("")
//	public String getProduct(@PathVariable int product_id, Model model) {
//		ProductsVO product = productService.getProduct(product_id);
//		model.addAttribute("product", product);
//		return "";
//	}
//
//	// 상품 입고
//	@RequestMapping("")
//	public String insertProduct(@ModelAttribute("product") @Validated ProductsVO product, Model model) {
//		productService.insertProduct(product.getMemeber_id(), product.getProduct_info(), product.getProduct_img(),
//				product.getProduct_name(), product.getProduct_count(), product.getProduct_price(),
//				product.getProduct_weight());
//		return "";
//	}
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
