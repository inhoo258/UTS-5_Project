package com.spring.project.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public int checkemail(Model model, @RequestParam(value = "member_email") String member_email) {
		if (memberSerivce.getMemberEmail(member_email) == null) {
			return 0;
		} else {
			return 1;
		}
	}

	@RequestMapping("/list")
	public List<MemberVO> memberList() {
		return memberSerivce.getMemberList(1, "");
	}

	@PostMapping("/choice_delete")
	public void choice_delete(@RequestBody String member_id) {
		System.out.println("delete member_id : " + member_id);
		memberSerivce.memberDelete(member_id);
	}

	@PostMapping(value="/member_enable" , produces="application/json;charset=UTF-8")
	public void member_enable (@RequestBody String member_id) {
		System.out.println("enable : " +memberSerivce.getMemberInfo(member_id).getMember_enabled());
		if(memberSerivce.getMemberInfo(member_id).getMember_enabled() == 1) {
			System.out.println("0일때");
//			memberSerivce.member_enable(1 , member_id);
		}else {
			System.out.println("1일때");
			
		}
//			memberSerivce.member_enable(0 , member_id);
//	}
	}

}
