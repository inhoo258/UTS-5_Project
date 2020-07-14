package com.spring.project.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.product.service.IProductService;

@Controller
@RequestMapping("/product/rest")
public class ProductRestController {
	@Autowired
	@Qualifier("cartService")
	IProductService cartService;
	@Autowired
	@Qualifier("productService")
	IProductService productService;
	@Autowired
	@Qualifier("orderService")
	IProductService orderService;
	@PostMapping("/updateCart")
	public void updateCart(@RequestParam("member_id")String member_id, @RequestParam("product_id")int[] product_id, @RequestParam("cart_product_count")int[]cart_product_count) {
		System.out.println("update cart in");
		System.out.println("member id : "+member_id);
		System.out.println("product id : "+product_id);
		System.out.println("product length : "+product_id.length);
		System.out.println("cart product count : "+cart_product_count);
		System.out.println("cart product count length : "+cart_product_count.length);
	}
}
