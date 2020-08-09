package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
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
	IMemberService memberSerivce;
	@Autowired
	private JavaMailSender mailSender;
	
	@PostMapping("/memberCheck")
	public int memberCheck(@RequestParam("member_id") String member_id) {
		System.out.println("request member_id : " + member_id);
		MemberVO member = memberSerivce.getMemberInfo(member_id);
		System.out.println("result member : " + member);
		if (memberSerivce.getMemberInfo(member_id) == null)
			return 0;
		else
			return 1;
	}

	@PostMapping("/regNumCheck")
	public boolean regNumCheck(@RequestParam("seller_reg_num") String seller_reg_num) {
		return memberSerivce.getSellerRegNum(seller_reg_num);
	}
	
	@PostMapping("/checkemail")
	public int checkemail(Model model,@RequestParam(value = "member_email")String member_email) {
		if(memberSerivce.getMemberEmail(member_email) == null) {
			return 0;
		}else {
			return 1;
		}
	}
	
}
