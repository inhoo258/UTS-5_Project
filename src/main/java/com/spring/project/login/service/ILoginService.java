package com.spring.project.login.service;

import java.util.List;

import com.spring.project.member.model.MemberVO;

public interface ILoginService {
	public List<MemberVO> getMemberList();
	public MemberVO getMemberInfo(String member_id);
}
