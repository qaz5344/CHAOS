package com.human.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//인터셉트 기능을 정의한 객체 (HandlerInterceptorAdapter를 상속 받아야 한다)
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 유무 검사 체크  1. 세션에서 값을 가져와야 한다. 
		HttpSession session = request.getSession();
		String username= (String)session.getAttribute("Nick");
		if(username == null) {  // 로그인 하지 않았다
			System.out.println("로그인걸림?");
			response.sendRedirect(request.getContextPath()+"/login");
			return false;  // 23번에 지정한 경로 우회하여라
		}		
		return super.preHandle(request, response, handler);  // 이 리턴을 만나면 너가 가고 싶은 컨트롤러 가라.
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}
