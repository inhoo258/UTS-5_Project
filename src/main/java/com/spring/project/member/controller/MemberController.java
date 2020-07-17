package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.common.PagingManager;
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
		if(member.getMember_auth().equals("ROLE_CUSTOMER"))member.setMember_enabled(1);
		memberSerivce.memberInsert(member);
		return "redirect:/";

	}

	@RequestMapping("/list")
	public void getMemberList(@RequestParam(required=false, defaultValue="1")int memberpage, 
			@RequestParam(required=false)String word, Model model ,@RequestParam(required=false, defaultValue="1")int permissionpage,
			@RequestParam(value="message" ,required = false)String message) {
		System.out.println("permissionpage : " + permissionpage);
		System.out.println("memberpage : " + memberpage);
		System.out.println("message : " +message);
		System.out.println("membercount : " + memberSerivce.getMemberCount());
		System.out.println("permissioncount : " + memberSerivce.getPermissionCount());
		
		model.addAttribute("memberlist" , memberSerivce.getMemberList(memberpage));
		model.addAttribute("memberPage",new PagingManager(memberSerivce.getMemberCount(),memberpage));
		model.addAttribute("permission" , memberSerivce.getMemberPermission(permissionpage));
		model.addAttribute("permissionPage",new PagingManager(memberSerivce.getPermissionCount(),permissionpage));
	}
	
	
	@PostMapping("/permission")
	public String permission(@RequestParam(value = "permission_id") String permission_id , @RequestParam(required = false)String[] permission_ids,
			@RequestParam(value="permissionpage" , required = false , defaultValue = "1") int page ,RedirectAttributes attributes) {
		if(permission_ids != null) {
			memberSerivce.permissions(permission_ids);
		}
		if(permission_id != null) {
			memberSerivce.permission(permission_id);
		}
		attributes.addAttribute("permissionpage" , page);
		return "redirect:/member/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam(required = false) String member_id ,@RequestParam(required = false)String[] member_ids ) {
		if(member_ids !=null && member_id==null) {
			memberSerivce.membersDelete(member_ids);
		}
		if(member_id !=null) {
			memberSerivce.memberDelete(member_id);
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MASTER"))) {
			return "redirect:/member/list";
		}
		return "redirect:/logout";
	}
	@RequestMapping("/info/{userId}")
	public String getMember(@PathVariable("userId")String userId, Model model) {
		model.addAttribute("member",memberSerivce.getMemberInfo(userId));
		return "member/info";
	}
	@PostMapping("/update")
	public String update(MemberVO member) {
		System.out.println("========update=========");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("auth : " + auth.getAuthorities());
		System.out.println("auth Id : " + auth.getName());
		member.setMember_pw(pwEncoder.encode(member.getMember_pw()));
		memberSerivce.updateMember(member);
		if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MASTER"))){
			return "redirect:/member/list";
		}
		return "redirect:/member/info/"+member.getMember_id();
	}
	
	
	
	

}
