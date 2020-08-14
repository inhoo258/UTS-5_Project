package com.spring.project.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.common.PagingManager;
import com.spring.project.product.model.OrdersVO;
import com.spring.project.product.service.CartService;
import com.spring.project.product.service.OrderService;
import com.spring.project.product.service.ProductService;

@RestController
@RequestMapping("/product/rest")
public class ProductRestController {
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	ProductService productService;
	@PostMapping("/updateCart")
	public void updateCart(String member_id, @RequestParam("product_ids[]") List<Integer> product_ids,
			@RequestParam("cart_product_counts[]") List<Integer> cart_product_counts) {
		System.out.println("--------------------------------------------------rest updateCart in");
		System.out.println("member_id : " + member_id);
		System.out.println("product_ids[] len : " + product_ids);
		System.out.println("cart_product_counts[] len : " + cart_product_counts);
		cartService.updateCart(member_id, product_ids, cart_product_counts);
		System.out.println("--------------------------------------------------rest updateCart out");
	}
	
	@RequestMapping("/orderlist_paging")
	public PagingManager orderlist_paging(@RequestParam(value="page" , required = false , defaultValue = "1")int page , 
			Authentication authentication) {
		String member_id = authentication.getName();
		return new PagingManager(orderService.getTotalCount(member_id), page); 
	}
	
	
	
	

	@PostMapping("/deleteFromCart")
	public void deleteFromCart(@RequestParam("member_id") String member_id,
			@RequestParam("product_ids[]") int[] product_ids) {
//		cartService.deleteCart(member_id, product_ids);
	}

	@PostMapping("/insertCart")
	public int insertCart(@RequestParam("member_id") String member_id, @RequestParam("product_id") int product_id,
			@RequestParam("pOrder_count") int product_count) throws Exception {
		return cartService.insertCart(member_id, product_id, product_count);
	}

	@PostMapping("/cartCheck")
	public int cartCheck(@RequestParam("member_id") String member_id, @RequestParam("product_id") int product_id) {
		return cartService.checkCart(member_id, product_id);
	}
	
	@GetMapping("/orderlist")
	public List<OrdersVO> myOrderLIst(@RequestParam(value="page" , required = false ,defaultValue = "1")int page ,
			Authentication authentication) {
		String member_id = authentication.getName();
		return orderService.getMyOrderList(member_id);
	}
	
	@PostMapping("/orderview")
	public List<List<OrdersVO>> orderView(@RequestParam(value="member_id") String member_id, @RequestParam(value="order_group_number")int order_group_number) {
		System.out.println(orderService.getOrder(member_id, order_group_number).get(0).toString());
		return orderService.getOrder(member_id, order_group_number);
	}
	//판매자 페이지===================================
//	@PostMapping("/deleteSellerProduct")
//	public void deleteSellerProduct(@RequestParam("product_ids[]") int[] product_ids) {
//		productService.deleteSellerProduct(product_ids);
//	}
}