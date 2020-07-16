package com.spring.project.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.login.service.ILoginService;

@Controller
public class LoginController {
	@Autowired
	ILoginService loginService;
	
	@RequestMapping("/")
	public String home(Authentication auth) {
		System.out.println("===권한===");
		System.out.println(SecurityContextHolder.getContext().getAuthentication().isAuthenticated());
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		return "home";
		}
	@RequestMapping("/login")
	public void login() {
	}
	
//	@RequestMapping("/logout")
//	public String logout(Model model, HttpSession session) {
//		System.out.println("===logout===");
//		session.invalidate();
//		return "redirect:/";
//	}
	

}
