package com.spring.project.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
