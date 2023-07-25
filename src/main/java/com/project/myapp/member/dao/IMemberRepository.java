package com.project.myapp.member.dao;

import java.util.List;

import com.project.myapp.flight.model.Ticket;
import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;

public interface IMemberRepository {
	
	void insertMember(Member member); //회원가입
	Member selectMember(String memberId); //회원정보 조회
	List<Member> selectAllMembers();
	String getPassword(String memeberId); //로그인
	void updateMember(Member member); //회원정보 수정
	void deleteMember(Member member); //회원탈퇴
	

	Member idCheck(String memberId);//아이디 체크
	int checkId(String memberId);//아이디 중복체크
	void updatePassword(Member member); //임시비밀번호받으면 임시비밀번호로 업데이트
	void updatePasswordByMember(Member member);
	
	void insertPassenger(Companion companion); //동승자 정보 추가
	
	List<Member> viewReservation(String memberId); //예약 조회

}


