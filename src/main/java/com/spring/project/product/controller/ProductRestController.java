package com.spring.project.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.product.model.OrdersVO;
import com.spring.project.product.service.CartService;
import com.spring.project.product.service.OrderService;

@RestController
@RequestMapping("/product/rest")
public class ProductRestController {
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
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

	@PostMapping("/deleteFromCart")
	public void deleteFromCart(@RequestParam("member_id") String member_id,
			@RequestParam("product_ids[]") int[] product_ids) {
		cartService.deleteCart(member_id, product_ids);
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
	@PostMapping("/orderCancel")
	public boolean orderCancel(@RequestParam("seller_company_name")String seller_company_name, @RequestParam("member_id")String member_id) {
		try {
			orderService.deleteOrder(seller_company_name,member_id);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
	@GetMapping("/orderlist/{member_id}")
	public List<List<OrdersVO>> myOrderLIst(@PathVariable("member_id") String member_id) {
//		System.out.println(orderService.getOrderList(member_id).get(0).get(4).get+"여기야");
		
		return orderService.getOrderList(member_id);
	}
}