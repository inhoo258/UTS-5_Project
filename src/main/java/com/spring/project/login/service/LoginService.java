package com.spring.project.login.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.repository.IMemberRepository;

@Service
public class LoginService implements ILoginService{
	
	@Autowired
	IMemberRepository memberRepository;

	@Override
	public ArrayList<MemberVO> getMemberList() {
		return memberRepository.getMemberList();
	}

	@Override
	public MemberVO getMemberInfo(String member_id) {
		return memberRepository.getMemberInfo(member_id);
	}

	@Override
	public String getPassword(String member_id) {
		return memberRepository.getPassword(member_id);
	}




}
