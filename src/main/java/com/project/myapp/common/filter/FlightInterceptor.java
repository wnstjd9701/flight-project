package com.project.myapp.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project.myapp.flight.model.Search;

public class FlightInterceptor implements HandlerInterceptor{
	
	static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	// URL: /flight/ticket/insert 외의 모든 요청시
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int requestCount = 0;
		int person = 0;
		String requestURL = request.getRequestURL().toString();
	    String contextPath = request.getContextPath();
	    String requestURI = requestURL.replaceFirst(request.getScheme() + "://", "")
	                                  .replaceFirst(":" + request.getServerPort(), "")
	                                  .replaceFirst(request.getServerName(), "")
	                                  .replaceFirst(contextPath, "");
		
		if(request.getSession().getAttribute("requestCount") != null && request.getSession().getAttribute("search") != null ) {
			requestCount = Integer.parseInt(request.getSession().getAttribute("requestCount").toString());
			person = ((Search)request.getSession().getAttribute("search")).getPerson();
			
			logger.info("SessionRequestCount: " + requestCount);
			response.sendRedirect("/update/seat");
			return false;
		}
		response.sendRedirect(request.getContextPath() + "/" + requestURI);
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
