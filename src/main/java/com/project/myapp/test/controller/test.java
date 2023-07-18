package com.project.myapp.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	@RequestMapping(value="/login")
	public String goLogin(){
		return "login";
	}
	
	@RequestMapping(value="/home")
	public String goHome(){
		return "home";
	}
	
	@RequestMapping(value="/signup")
	public String goSignup(){
		return "signup";
	}
	
	@RequestMapping(value="/qna")
	public String goQnA(){
		return "qna";
	}
	
	@RequestMapping(value="/mypage")
	public String goMypage(){
		return "login";
	}
	
}	
