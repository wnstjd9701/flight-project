package com.project.myapp.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class FlightSessionInterceptor implements HandlerInterceptor {

	/*
	 *  URL 적용 
	 *  /flight/ticket/select
	 *  /flight/ticket/insert
	 *  /flight/ticket/payment
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*
		 * 1. memberId가 세션에 존재하는지 확인
		 * 존재하지 않는다면 로그인 페이지로 이동
		 */
		if(request.getSession().getAttribute("memberId") == null) {
			response.sendRedirect("/signin");
			return false;
		}
		/* 
		 * 2. 검색 기록이 존재하는지 확인
		 * 존재하지 않으면 홈으로 이동
		 */
		if(request.getSession().getAttribute("search") == null || request.getSession().getAttribute("requestCount") == null) {
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}

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
