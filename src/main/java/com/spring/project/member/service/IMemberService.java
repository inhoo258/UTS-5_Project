package com.spring.project.member.service;

import java.util.List;

import com.spring.project.member.model.MemberVO;

public interface IMemberService {
	public String getMemberPassword(String member_id);
	public MemberVO getMemberInfo(String member_id);
	public void memberInsert(MemberVO member);
	public void updateMember(MemberVO member);
	public List<MemberVO> getMemberList(int memberPage , String member_word);
	public int getMemberCount(String member_word);
	public void membersDelete(String[] member_ids);
	public void memberDelete(String member_id);
	

	public List<MemberVO> getPermissionList(int permissionPage ,String permission_word);
	public int getPermissionCount(String permission_word);
	void permissions(String[] permission_ids);
	public void permission(String permission_id);
}
