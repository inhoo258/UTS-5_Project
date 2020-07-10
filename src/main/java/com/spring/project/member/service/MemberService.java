package com.spring.project.member.service;

import java.util.List;

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
	
	
	public List<MemberVO> getMemberList() {
		return memberRepository.getMemberList();
	}
	@Override
	@Transactional(value="tsManager")
	public void memberInsert(MemberVO member) {
		memberRepository.memberJoin(member);
		memberRepository.authJoin(member.getUsername(),member.getMember_auth());
	}
	
	@Override
	public void updateMember(MemberVO member) {
		memberRepository.updateMember(member);
	}

	@Override
	@Transactional(value = "tsManager")
	public void memberDelete(String member_id) {
		memberRepository.authDelete(member_id);
		memberRepository.membersDelete(member_id);
		
	}

	@Override
	@Transactional(value = "tsManager")
	public void membersDelete(String[] member_ids) {
		for(int i=0; i<member_ids.length; i++) {
			memberRepository.authDelete(member_ids[i]);
			memberRepository.membersDelete(member_ids[i]);
		}
		
	}
}
	
