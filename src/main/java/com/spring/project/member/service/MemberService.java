package com.spring.project.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.repository.IMemberRepository;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	IMemberRepository memberRepository;

	@Override
	public String getMemberPassword(String userId) {
		return memberRepository.getMemberPassword(userId);
	}

	@Override
	public MemberVO getMemberInfo(String userId) {
		return memberRepository.getMemberInfo(userId);
	}
	
	
	public ArrayList<MemberVO> getMemberList() {
		return memberRepository.getMemberList();
	}
	@Override
	@Transactional(value="tsManager")
	public void memberInsert(MemberVO member) {
		memberRepository.memberJoin(member);
		memberRepository.authJoin(member.getUsername(),member.getMember_auth());
	}

	public String getPassword(String member_id) {
		return memberRepository.getPassword(member_id);
	}
	
	
	public void deleteMember(int member_id) {
		memberRepository.deleteMember(member_id);
	}
	
	@Override
	public void updateMember(MemberVO member) {
		memberRepository.updateMember(member);
	}
}
	
