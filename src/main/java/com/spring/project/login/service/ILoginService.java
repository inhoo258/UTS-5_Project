package com.spring.project.login.service;

import com.spring.project.member.model.MemberVO;

public interface ILoginService {
	public MemberVO getMember(String member_id);
	public String getPassword(String member_id);
}
