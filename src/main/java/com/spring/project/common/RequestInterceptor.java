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
		System.out.println("url : "+url);
//		 || !url.contains("/product/img/")
		System.out.println("param : "+param);
		if ((!url.contains("login") && !url.contains("logout"))) {
			session.setAttribute("url", url);
			session.setAttribute("param", param);
		}else {
			session.setAttribute("url", "/");
		}
		
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
