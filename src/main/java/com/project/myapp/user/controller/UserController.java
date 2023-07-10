package com.project.myapp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.user.model.User;
import com.project.myapp.user.service.IUserService;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class UserController {
	static final Logger logger= LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	IUserService userService;
	
	@GetMapping(value= {"/" , "/home"})
	public String home() {
		return "home";
	}
	
	@GetMapping("/login")
	public String userLogin() {
		return "login";
	}
	
	@PostMapping("/login")
	public String userLogin(HttpServletRequest request, Model model, String id, String password, HttpSession session, RedirectAttributes redirectAttr) {
		logger.info("URI:"  + request.getRequestURI() + " UserId: " + id);
		User user = userService.getUserPassword(id);
		model.addAttribute("id", user.getId());
		model.addAttribute("password", user.getPassword());
		session.setAttribute("id", user.getId());
		session.setAttribute("password", user.getPassword());
		return "redirect:home";
	}
	
	@GetMapping("/logout")
	public String userLogout(HttpServletRequest request, HttpSession session, Locale locale) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		logger.info("URI: " +  request.getRequestURI() + " User: " + session.getAttribute("id") + " Logout Time: " + formattedDate);
		
		session.invalidate();
		return "redirect:home";
	}
}
