package com.spring.project.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.product.service.CartService;

@RestController
@RequestMapping("/product/rest")
public class ProductRestController {
	@Autowired
	CartService cartService;
	
	@PostMapping("/updateCart")
	public void updateCart(String member_id,@RequestParam("product_id[]")List<Integer>product_id,@RequestParam("cart_product_count[]")List<Integer>cart_product_count) {
		System.out.println("--------------------------------------------------rest update cart in");
		System.out.println("member_id : "+member_id);
		System.out.println("product_id len : "+product_id);
		System.out.println("cart_product_count len : "+cart_product_count);
		cartService.updateCart(member_id,product_id,cart_product_count);
	}
	@PostMapping("/deleteFromCart")
	public void deleteFromCart(@RequestParam("member_id")String member_id,@RequestParam("product_ids[]")List<Integer>product_ids) {
		cartService.deleteCart(member_id, product_ids);
	}
}
