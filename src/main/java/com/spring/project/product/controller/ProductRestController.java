package com.spring.project.product.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender mailSender;

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

	@PostMapping(value = "/sendMail.do")
	public String mailSending(HttpServletRequest request) {
		String setfrom = "ihimchan746@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
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
		return "/product/payment";
	}

}
