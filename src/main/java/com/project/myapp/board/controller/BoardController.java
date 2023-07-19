package com.project.myapp.board.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class BoardController {
	@RequestMapping(value="/board/qna")
	   public String insertMember() {
	      return "board/qna";
	   }
}
