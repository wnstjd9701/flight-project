package com.project.myapp.member.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.IMemberRepository;
import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService implements IMemberService {
	
	private final IMemberRepository IMemberRepository;

	@Override
	public void insertMember(Member member) {
		IMemberRepository.insertMember(member);
		
	}

	@Override
	public Member selectMember(String memberId) {
		return IMemberRepository.selectMember(memberId);
	}

	@Override
	public List<Member> selectAllMembers() {
		return IMemberRepository.selectAllMembers();
	}

	@Override
	public String getPassword(String memeberId) {
		return IMemberRepository.getPassword(memeberId);
	}

	@Override
	public void updateMember(Member member) {
		IMemberRepository.updateMember(member);
		
	}

	@Override
	public void deleteMember(Member member) {
		IMemberRepository.deleteMember(member);
		
	}

	@Override
	public void findPassword(String memberId) {
		IMemberRepository.findPassword(memberId);
		
	}

	@Override
	public void updatePassword(String memberId, String password) {
		IMemberRepository.updatePassword(memberId, password);
		
	}

	@Override
	public void insertPassenger(Companion companion) {
		IMemberRepository.insertPassenger(companion);
		
	}

	@Override
	public void viewReservation(String memberId) {
		IMemberRepository.viewReservation(memberId);
		
	}

}
