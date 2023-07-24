package com.project.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.member.model.Member;
import com.project.myapp.member.service.IMemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

   static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   private final IMemberService memberService;
   
   private final MemberValidator memberValidator;
   
   //스프링 밸리데이터 메서드 추가(유효성검사)
   @InitBinder 
   private void initBinder(WebDataBinder binder) {
	   binder.setValidator(memberValidator);
   }

   /*   API no.3
      method : GET
      information : 회원가입기능
    */
   @RequestMapping(value="/member/insert" , method=RequestMethod.GET)
   public String insertMember(Model model) {
	  model.addAttribute("member", new Member());
      return "member/insertform";
   }

   /*   API no.3
      method : POST
      information : 회원가입기능
      response : member   
    */
   @RequestMapping(value="/member/insert", method=RequestMethod.POST)
   public String insertMember(@Valid Member member,BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "member/insertform";
		}
      try{
    	  if(!member.getPassword().equals(member.getPassword2())) {
    	         model.addAttribute("member", member);
    	         model.addAttribute("message", "MEMBER_PW_RE");
    	         return "member/insertform";
    	  }
         memberService.insertMember(member);
      }catch(DuplicateKeyException e){
         member.setMemberId(null);
         model.addAttribute("member", member);
         model.addAttribute("message", "ID_ALREADY_EXIST");
         return "member/insertform";
      }
      session.invalidate();
      return "home";
   }

   @RequestMapping(value="/member/login", method=RequestMethod.GET)
   public String login() {
      return "member/login";
   }
   /*   API no.2
      method : POST
      information : 로그인 기능   
    */
   @RequestMapping(value="/member/login", method=RequestMethod.POST)
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
               session.setAttribute("email", member.getEmail());
               session.setAttribute("phoneNumber", member.getPhoneNumber());
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

   /*   API no.5
      method : GET
      information : 로그아웃 기능   
    */
   @RequestMapping(value="/member/logout", method=RequestMethod.GET)
   public String logout(HttpSession session, HttpServletRequest request) {
      session.invalidate();
      return "redirect:/"; //주소 요청으로 변경
   }

   /*   API no.8
      method : GET
      information : 마이페이지 조회
    */
   @RequestMapping(value="/member/mp", method=RequestMethod.GET)
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

   /*   API no.9
      method : GET
      information : 마이페이지 수정
    */
   @RequestMapping(value="/member/mp/update", method=RequestMethod.GET)
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
   /*   API no.9
      method : POST
      information : 마이페이지 수정
      response : member
    */
   @RequestMapping(value="/member/mp/update", method=RequestMethod.POST)
   public String updateMember(Member member,HttpSession session, Model model) {
      try {
         memberService.updateMember(member);
         model.addAttribute("message", "UPDATE_MEMBER_INFO");
         model.addAttribute("member", member);
         session.setAttribute("email", member.getEmail());
         return "member/mypage";
      }catch(Exception e){
         model.addAttribute("message", e.getMessage());
         return "member/error";
      }
   }
   /*   API no.4
      method : GET
      information : 회원탈퇴
    */
   @RequestMapping(value="/member/mp/delete", method=RequestMethod.GET)
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
   /*   API no.4
      method : POST
      information : 회원탈퇴
    */

   @RequestMapping(value="/member/mp/delete", method=RequestMethod.POST)
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

   /*   API no.6
      method : GET
      information : 비밀번호 찾기(이메일 인증)
    */
   @RequestMapping(value = "/member/findpwd", method = RequestMethod.GET)
   public String findPassword(){
      return "member/pwd";
   }

   /*   API no.6
      method : POST
      information : 비밀번호 찾기(이메일 인증)
    */
   @RequestMapping(value = "/member/findpwd", method = RequestMethod.POST)
   public String findPassword(Member member, HttpServletResponse response){
      memberService.findPassword(response, member);
      return "member/login";
   }

   /*   API no.7
      method : GET
      information : 비밀번호 변경
    */
   @RequestMapping(value="/member/updatepwd", method = RequestMethod.GET)
   public String updatePassword(HttpSession session, Model model) {
      Member member = new Member();
      String memberId = (String) session.getAttribute("memberId");
      if(memberId!=null && !memberId.equals("")&& member.getIsDeleted()!=1) {
         member = memberService.selectMember(memberId);
         model.addAttribute("member", member);
         model.addAttribute("message", "UPDATE_PASSWORD");
         return "member/updatepwd";
      }else {
         model.addAttribute("message", "NOT_LOGIN_MEMBER");
         return "member/login";   
      }
   }
   /*   API no.7
      method : POST
      information : 비밀번호 변경
    */
   @RequestMapping(value="/member/updatepwd", method=RequestMethod.POST)
   public String updatePassword(Member member,HttpSession session, Model model) {
      try {
         memberService.updatePasswordByMember(member);
         model.addAttribute("message", "UPDATE_MEMBER_PASSWORD");
         model.addAttribute("member", member);
         session.setAttribute("password", member.getPassword());
         session.invalidate();//로그아웃
         return "member/login";
      }catch(Exception e){
         model.addAttribute("message", e.getMessage());
         return "member/error";
      }
   }

//   /*   API no.10
//      method : GET
//      information : 동승자 정보 입력
//    */
//   @RequestMapping(value="/member/passengerList" , method=RequestMethod.GET)
//   public String insertPassenger() {
//      return "member/passengerList";
//   }
//   /*   API no.10
//      method : POST
//      information : 동승자 정보 입력
//      response : companion   
//    */
//   @RequestMapping(value="member/insertPassenger", method=RequestMethod.POST)
//   public String insertPassenger(Companion companion, HttpSession session, Model model) {
//      try{
//         memberService.insertPassenger(companion);
//         return "member/passengerList";
//      }catch(DuplicateKeyException e){
//         model.addAttribute("message", e.getMessage());
//         return "member/error";
//      }
//   }
   /*   API no.11
      method : GET
      information : 예약정보조회
    */
   @RequestMapping(value="/member/reservationList", method=RequestMethod.GET)
   public String viewReservation(HttpSession session, Model model,Member member) {
      String memberId = (String) session.getAttribute("memberId");
      if(memberId!=null && !memberId.equals("")&& member.getIsDeleted()!=1) {
         member = memberService.viewReservation(memberId);
         model.addAttribute("member", member);
         model.addAttribute("message", "VIEW_RESERVATION");
         return "member/reservationList";
      }else {
         model.addAttribute("message", "NOT_LOGIN_MEMBER");
         return "member/login";   
      }
   }
   /*   API no.15
   		method : POST
   		information : 예약취소
   */
   
   //Id 중복체크
   @RequestMapping("/member/idcheck")
   @ResponseBody //view 없을 때 사용	
   public String idCheck(String memberId) {
	   String result = "";
	   Member member = null;
	   try {
		   member = memberService.selectMember(memberId);
		   if(member==null) {
			   result = "true";
		   }else {
			   result = "false";
		   }
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return result;
	}
  
}
