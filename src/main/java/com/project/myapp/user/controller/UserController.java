package com.project.myapp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.user.model.User;
import com.project.myapp.user.service.IUserService;

import lombok.RequiredArgsConstructor;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequiredArgsConstructor
public class UserController {
	static final Logger logger= LoggerFactory.getLogger(UserController.class);
	
	private final IUserService userService;	
	HttpServletRequest req;
	
	@Value("#{pt['test.key']}")
	private String test;
	
	@GetMapping(value= {"/" , "/home"})
	public String home() {
		return "home";
	}
	
	@GetMapping("/login")
	public String userLogin() {
		return "login";
	}
	
	@PostMapping("/login")
	public String userLogin(Model model, String id, String password, HttpSession session, RedirectAttributes redirectAttr) {
		logger.info("UserId: {}", id);
		
		User user = userService.getUserPassword(id);
		if(user.getId() != null) {
			model.addAttribute("id", user.getId());
			model.addAttribute("password", user.getPassword());
			session.setAttribute("id", user.getId());
			session.setAttribute("password", user.getPassword());
			return "redirect:home";
		}
		return "login";
	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession session, Locale locale) {
		logger.info("Logout User: {}", session.getAttribute("id"));
		
		// session 삭제		
		session.invalidate();
		return "redirect:home";
	}
	
	@RequestMapping("/signup")
	public String signUp() {
		return "signup";
	}
	
	@RequestMapping("/qna")
	public String QnA() {
		return "qna";
	}
}
