package com.project.myapp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {
	@RequestMapping(value="/home")
	public  String gohome() {
		return "home";
	}
	@RequestMapping(value="/mp")
	public  String gomy() {
		return "member/mypage";
	}
	@RequestMapping(value="/qna")
	public  String goqna() {
		return "board/qna";
	}
	@RequestMapping(value="/insert")
	public  String goinsert() {
		return "member/insertform";
	}
	@RequestMapping(value="/login")
	public  String goilogin() {
		return "member/login";
	}
	@RequestMapping(value="/relist")
	public  String gorelist() {
		return "member/relist";
	}
	@RequestMapping(value="/meupdate")
	public  String gomeupdate() {
		return "member/meupdate";
	}
	@RequestMapping(value="/pwFind")
	public  String gopwFind() {
		return "member/pwFind";
	}
	@RequestMapping(value="/pwupdate")
	public  String gopwupdate() {
		return "member/pwupdate";
	}
	@RequestMapping(value="/colist")
	public  String gocolist() {
		return "member/colist";
	}
	@RequestMapping(value="/medelete")
	public  String gomedelete() {
		return "member/medelete";
	}
}
