package com.spring.project.member.service;

import java.util.List;

import com.spring.project.member.model.MemberVO;

public interface IMemberService {
	public String getMemberPassword(String member_id);
	public MemberVO getMemberInfo(String member_id);
	public void memberInsert(MemberVO member);
	public void updateMember(MemberVO member);
	public List<MemberVO> getMemberList(int page);
	public void memberDelete(String member_id);
	public void membersDelete(String[] member_ids);
	public void multi_permission(String[] permission_ids);
	public void permission(String permission_id);
	public List<MemberVO> getMemberPermission();
	public int getMemberCount();
}
