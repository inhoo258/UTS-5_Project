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
	
	@Override
	public List<MemberVO> getMemberList(int memberPage) {
		int start = (memberPage-1)*10+1;
		int end = start+9;
		return memberRepository.getMemberList(start , end);
	}
	@Override
	public List<MemberVO> getMemberPermission(int permissionPage) {
		int start = (permissionPage-1)*10+1;
		int end = start+9;
		return memberRepository.getMemberPermission(start , end);
	}
	
	@Override
	@Transactional(value="tsManager")
	public void memberInsert(MemberVO member) {
		for(int i = 0 ; i < 10 ; i++) {
			String str = i+"";
			System.out.println(str);
			member.setMember_id(member.getMember_id()+str);
			System.out.println(member.getMember_id());
			memberRepository.memberJoin(member);
			memberRepository.authJoin(member.getUsername(),member.getMember_auth());
		}
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

	@Override
	@Transactional(value = "tsManager")
	public void multi_permission(String[] permission_ids) {
		for(int i = 0 ; i < permission_ids.length ; i++) {
			memberRepository.permission(permission_ids[i]);
		}
	}

	@Override
	public void permission(String permission_id) {
		memberRepository.permission(permission_id);
	}

	@Override
	public int getMemberCount() {
		return memberRepository.getMemberCount();
	}

	
}
	
