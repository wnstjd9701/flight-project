package com.project.myapp.flight.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class testController {
	@RequestMapping("/flight/tickect/search")
	public String search() {
		return "flight/tickect/search";
	}

	@RequestMapping(value="/flight/reservation")
	public String reservation() {
		return "flight/reservation";
	}

}
