package com.project.myapp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.myapp.user.model.User;
import com.project.myapp.user.service.IUserService;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class UserController {
	static final Logger logger= LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	IUserService userService;
	
	@GetMapping("/test")
	public String userTest(Model model) {
		List<User> user = userService.getUserInformation();
		logger.info("UserTest" + user.toString());
		return "home";
	}
}
