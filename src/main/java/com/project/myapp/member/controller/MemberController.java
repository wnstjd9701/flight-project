package com.project.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.member.model.Member;
import com.project.myapp.member.service.IMemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final IMemberService memberService;


	@RequestMapping(value="/member/insert" , method=RequestMethod.GET)
	public String insertMember() {
		return "member/insertForm";
	}

	/*	API no.3
		method : POST
		information : 회원가입기능
		response : member	*/
	@RequestMapping(value="member/insert", method=RequestMethod.POST)
	public String insertMember(Member member, HttpSession session, Model model) {
		try{
			memberService.insertMember(member);
		}catch(DuplicateKeyException e){
			member.setMemberId(null);
			model.addAttribute("member", member);
			model.addAttribute("message", "ID_ALREADY_EXIST");
			return "member/insertForm";
		}
		session.invalidate();
		return "home";
	}

	@RequestMapping(value="member/login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	/*	API no.2
		method : POST
		information : 로그인 기능	*/
	@RequestMapping(value="member/login", method=RequestMethod.POST)
	public String login(String memberId, String password, HttpSession session, Model model) {
		logger.info("memberId:" + memberId + "password : " + password );
		Member member = memberService.selectMember(memberId);
		if(member!=null) {
			String dbpassword = member.getPassword();
			if(dbpassword == null && member.getIsDeleted() == 1) { //아이디가 없는 경우
				model.addAttribute("message", "NOT_VALID_MEMBER");
			}else {
				if(dbpassword.equals(password)) {
					session.setAttribute("memberId", memberId);
					session.setAttribute("name", member.getName());
					session.setAttribute("firstName", member.getFirstName());
					session.setAttribute("lastName", member.getLastName());
					session.setAttribute("lastName", member.getLastName());
					session.setAttribute("phoneNumber", member.getPhoneNumber());
					session.setAttribute("birthday", member.getBirthday());
					session.setAttribute("address", member.getAddress());
					session.setAttribute("email", member.getEmail());
					session.setAttribute("gender", member.getGender());
					session.setAttribute("passportNumber", member.getPassportNumber());
					session.setAttribute("passportExpiryDate", member.getPassportExpiryDate());
					return "home";
				}else {
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		}else{
			model.addAttribute("message", "MEMBER_NOT_FOUND");
		}
		session.invalidate();
		return "member/login";
	}

	/*	API no.5
	method : GET
	information : 로그아웃 기능	*/
	@RequestMapping(value="member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "home";
	}

	/*	API no.8
	method : GET
	information : 마이페이지 조회
	 */
	@RequestMapping(value="member/mp", method=RequestMethod.GET)
	public String viewMypage(HttpSession session, Model model, Member member) {
		String memberId = (String) session.getAttribute("memberId");
		if(memberId!=null && !memberId.equals("")&& member.getIsDeleted()!=1) {
			member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			model.addAttribute("message", "VIEW_USER_INFO");
			return "member/mypage";
		}else {
			model.addAttribute("message", "NOT_LOGIN_MEMBER");
			return "member/login";	
		}
	}

	/*	API no.9
	method : GET
	information : 마이페이지 수정*/
	@RequestMapping(value="member/mp/update", method=RequestMethod.GET)
	public String updateMember(HttpSession session, Model model) {
		Member member = new Member();
		String memberId = (String) session.getAttribute("memberId");
		if(memberId!=null && !memberId.equals("")&& member.getIsDeleted()!=1) {
			member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			model.addAttribute("message", "UPDATE_MEMBER_INFO");
			return "member/update";
		}else {
			model.addAttribute("message", "NOT_LOGIN_MEMBER");
			return "member/login";	
		}
	}
	/*	API no.9
	method : POST
	information : 마이페이지 수정
	response : member
	 */
	@RequestMapping(value="member/mp/update", method=RequestMethod.POST)
	public String updateMember(Member member,HttpSession session, Model model) {
		try {
			memberService.updateMember(member);
			model.addAttribute("message", "UPDATE_MEMBER_INFO");
			model.addAttribute("member", member);
			session.setAttribute("name", member.getName());
			session.setAttribute("firstName", member.getFirstName());
			session.setAttribute("lastName", member.getLastName());
			session.setAttribute("lastName", member.getLastName());
			session.setAttribute("phoneNumber", member.getPhoneNumber());
			session.setAttribute("birthday", member.getBirthday());
			session.setAttribute("address", member.getAddress());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("gender", member.getGender());
			session.setAttribute("passportNumber", member.getPassportNumber());
			session.setAttribute("passportExpiryDate", member.getPassportExpiryDate());
			return "member/mypage";
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "member/error";
		}
	}
	/*	API no.6
		method : GET
		information : 회원탈퇴
	 */
	@RequestMapping(value="member/mp/delete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {
		Member member = new Member();
		String memberId = (String) session.getAttribute("memberId");
		if(memberId!=null && !memberId.equals("")&& member.getIsDeleted()!=1) {
			member = memberService.selectMember(memberId);
			model.addAttribute("member", member);
			model.addAttribute("message", "DELETE_MEMBER");
			return "member/delete";
		}else {
			model.addAttribute("message", "NOT_LOGIN_MEMBER");
			return "member/login";	
		}
		
	}
	/*	API no.6
		method : POST
		information : 회원탈퇴
	 */

	@RequestMapping(value="member/mp/delete", method=RequestMethod.POST)
	public String deleteMember(String password,Member member, HttpSession session, Model model) {
		try {
			member.setMemberId((String)session.getAttribute("memberId"));
			String dbpassword = memberService.getPassword(member.getMemberId());
			if(password!=null && password.equals(dbpassword)) {
				member.setPassword(password);
				memberService.deleteMember(member);
				session.invalidate();
				return "home";
			}else {
				model.addAttribute("message", "WRONG_PASSWORD");
				return "member/delete";
			}
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "member/mp";
		}
	}
}
