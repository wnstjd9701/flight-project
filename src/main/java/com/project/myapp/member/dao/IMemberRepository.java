package com.project.myapp.member.dao;

import java.util.List;

import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;

public interface IMemberRepository {
	
	void insertMember(Member member); //회원가입
	Member selectMember(String memberId); //회원정보 조회
	List<Member> selectAllMembers();
	String getPassword(String memeberId); //로그인
	void updateMember(Member member); //회원정보 수정
	void deleteMember(Member member); //회원탈퇴
	
	void findPassword(String memberId); //비밀번호 찾기
	void updatePassword(String memberId, String password); //비밀번호 수정
	
	void insertPassenger(Companion companion); //동승자 정보 추가
	
	void viewReservation(String memberId); //예약 조회
}
