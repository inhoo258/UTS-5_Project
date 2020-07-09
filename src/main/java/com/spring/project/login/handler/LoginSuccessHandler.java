package com.spring.project.login.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("===SuccessHandler===");
		System.out.println("===성공===");
		
		authentication = SecurityContextHolder.getContext().getAuthentication();
//		MemberVO member = (MemberVO) authentication.getDetails();
//		request.getSession().setAttribute("userId", member.getUsername());
		String url = "/";
		if(request.getSession().getAttribute("url") != null) {
			System.out.println("일로 들어왔다 나감");
			url = (String) request.getSession().getAttribute("url");
			request.getSession().removeAttribute("url");
		}
		response.sendRedirect("/project"+url);
		System.out.println("url : " + url);
		
//		if(request.getSession().getAttribute("param") != null) {
//			url = (String) request.getSession().getAttribute("param");
//		}
		
	}

}
