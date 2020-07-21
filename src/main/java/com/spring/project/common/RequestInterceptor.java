package com.spring.project.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RequestInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String contextName = request.getContextPath();
		String url = request.getRequestURI().replaceFirst(contextName, "");
		String param = request.getQueryString();
		//Post 방식 확인 바람
		
		if(url.contains("resources")) {
			url = "/";
		}
		System.out.println("===contextName");
		System.out.println(contextName);
		System.out.println("===ContextPath===");
		System.out.println(request.getContextPath());
		System.out.println("===URL===");
		System.out.println(url);
		System.out.println("===requestURI===");
		System.out.println(request.getRequestURI());
		System.out.println("===param===");
		System.out.println(param);
		
//		System.out.println("===QueryString===");
//		System.out.println(param);
		
		if (!url.contains("login") && !url.contains("logout")) {
			session.setAttribute("url", url);
			session.setAttribute("param", param);
		}
		return true;
	}
	//여기까지만 보시오

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
