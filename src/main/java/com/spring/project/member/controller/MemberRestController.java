package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.service.IMemberService;

@RestController
@RequestMapping("/member/rest")
public class MemberRestController {
	@Autowired
	IMemberService memberServ;
	@PostMapping("/memberCheck")
	public int memberCheck(@RequestParam("member_id")String member_id) {
		System.out.println("request member_id : "+member_id);
		MemberVO member=memberServ.getMemberInfo(member_id);
		System.out.println("result member : "+member);
		if(memberServ.getMemberInfo(member_id)==null)return 0;
		else return 1;
	}
}
