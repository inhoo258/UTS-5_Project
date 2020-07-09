package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	IMemberService memberSerivce;
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@GetMapping("/form")
	public void form(Model model) {
		model.addAttribute("message","insert");
	}
	@GetMapping("/form/{userId}")
	public String form(@PathVariable("userId")String userId, Model model) {
		model.addAttribute("member",memberSerivce.getMemberInfo(userId));
		model.addAttribute("message","update");
		return "member/form";
	}

	@PostMapping("/insert")
	public String insertMember(MemberVO member, RedirectAttributes redirectAttributes) {
		member.setMember_pw(pwEncoder.encode(member.getPassword()));
		memberSerivce.memberInsert(member);
		return "redirect:/";

	}

	@RequestMapping("list")
	public void getMemberList() {

	}

	@RequestMapping("/info/{userId}")
	public String getMember(@PathVariable("userId")String userId, Model model) {
		model.addAttribute("member",memberSerivce.getMemberInfo(userId));
		return "member/info";
	}
	@PostMapping("/update")
	public String update(MemberVO member) {
		memberSerivce.updateMember(member);
		return "redirect:/member/info/"+member.getMember_id();
	}
}
