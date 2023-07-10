package com.project.myapp.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// Controller에 전달되기 전에 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 처리 로직
		// jwt
		String userId = (String) request.getSession().getAttribute("id"); 
		try {
			if(userId == null || userId.equals("")) {
				logger.info("URI:" + request.getRequestURI() + " ID: " + request.getSession().getAttribute("id") + " Password: " + request.getSession().getAttribute("password"));
				response.sendRedirect(request.getContextPath() + "/login");
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	// Controller 진입 후  View가 랜더링 되기 전에 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	// Controller가 실행이 끝나고 실행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
