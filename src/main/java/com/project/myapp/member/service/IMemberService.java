package com.project.myapp.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;

public interface IMemberService {
	
	void insertMember(Member member); //회원가입
	Member selectMember(String memberId);//회원정보 조회
	List<Member> selectAllMembers();
	String getPassword(String memeberId); //로그인
	void updateMember(Member member); //회원정보 수정
	void deleteMember(Member member); //회원탈퇴
	

	public void sendEmail(Member member, String mail); //임시비밀번호 이메일발송
	void findPassword(HttpServletResponse response, Member member); //비밀번호 찾기
	void updatePassword(Member member); //임시비밀번호받으면 임시비밀번호로 업데이트
	void updatePasswordByMember(Member member); //비밀번호 수정
	
	void insertPassenger(Companion companion); //동승자 정보 추가
	
	Member viewReservation(String memberId); //예약 조회
	
}