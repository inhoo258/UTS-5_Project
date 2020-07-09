package com.spring.project.member.service;

import java.util.List;

import com.spring.project.member.model.MemberVO;

public interface IMemberService {
	public String getMemberPassword(String userId);
	public MemberVO getMemberInfo(String userId);
	public void memberInsert(MemberVO member);
	public void updateMember(MemberVO member);
	public List<MemberVO> getMemberList();
}
