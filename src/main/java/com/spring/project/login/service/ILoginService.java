package com.spring.project.login.service;

import java.util.ArrayList;

import com.spring.project.member.model.MemberVO;

public interface ILoginService {
	public ArrayList<MemberVO> getMemberList();
	public MemberVO getMemberInfo(String member_id);
	public String getPassword(String member_id);
}
