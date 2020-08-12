package com.spring.project.member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
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

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.model.SellerInfoVO;
import com.spring.project.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	IMemberService memberSerivce;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/form")
	public void form(Model model) {
		model.addAttribute("message", "insert");
	}
	
	@PostMapping("/checkpwd")
	public String checkemail(MemberVO membervo,Model model) {
		System.out.println("힘찬: 여기들어옴??? /checkpwd");
		System.out.println("여기 : " + membervo.getMember_id());
		System.out.println("인코더하고 비교 : "+pwEncoder.matches(membervo.getMember_pw(), memberSerivce.getMemberPassword(membervo.getMember_id())));
		if(pwEncoder.matches(membervo.getMember_pw(), memberSerivce.getMemberPassword(membervo.getMember_id()))) { // 1번째 방법
			String userId = membervo.getMember_id();
			return "redirect:/member/form/"+userId;
		}else {
			model.addAttribute("message", "nomatchpw");
			return "redirect:/member/info";
		}
	}
	
	@GetMapping("/form/{userId}")
	public String form(@PathVariable("userId") String userId, Model model) {
		System.out.println("힘찬: 여기들어옴??? /form/{userId}");
		model.addAttribute("member", memberSerivce.getMemberInfo(userId));
		model.addAttribute("message", "update");
		System.out.println("여기는 수정");
		return "member/form";
	}
	
	@PostMapping("/insert")
	public String insertMember(MemberVO member, RedirectAttributes redirectAttributes,@RequestParam(value="seller_reg_num",required=false) String seller_reg_num) {
		System.out.println("------------------\nmember-insert process---------------------\n");
		member.setMember_pw(pwEncoder.encode(member.getPassword()));
			if (member.getMember_auth().equals("ROLE_CUSTOMER"))
				member.setMember_enabled(1);
			System.out.println("seller_reg_num : "+seller_reg_num);
			memberSerivce.memberInsert(member);
		if(!seller_reg_num.equals(""))memberSerivce.insertSellerRegNum(member.getMember_id(), seller_reg_num);
		return "redirect:/";
	}
	
	@PreAuthorize("isAuthenticated() and hasRole('ROLE_MASTER')")
	@RequestMapping("/list")
	public void getMemberList() {
	}


	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/info")
	public String getMember(Authentication authentication, Model model) {
		MemberVO member =  memberSerivce.getMemberInfo(authentication.getName());
		model.addAttribute("member",member);
		if(member.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_SELLER"))){
			model.addAttribute("sellerInfo", memberSerivce.getSellerInfo(authentication.getName()));
		}
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
		if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MASTER"))) {
			return "redirect:/member/list";
		}
		return "redirect:/member/info";
	}
	
	@PostMapping("/changepwd")
	public String changePwd(MemberVO memberVO, RedirectAttributes redirectAttributes) {
		System.out.println("pwd : "+memberVO.getMember_pw());
		System.out.println("id : " +memberVO.getMember_id());
		memberSerivce.changePwd(pwEncoder.encode(memberVO.getMember_pw()), memberVO.getMember_id());
		redirectAttributes.addAttribute("message","update");
		return "redirect:/login";
	}
	
	//=========================seller_info============================================
	@GetMapping("/sellerinfoform")
	public void sellerInfoForm(Authentication authentication, Model model) {
		System.out.println("userId : "+authentication.getPrincipal());
		MemberVO member = (MemberVO)authentication.getPrincipal();
		model.addAttribute("sellerInfo",memberSerivce.getSellerInfo(member.getMember_id()));
	}
	
	//아이디 비번 찾기
	@RequestMapping("/findidpwd")
	public void findidpwd(Model model, @RequestParam("choice")String choice, @RequestParam(value = "message", required = false)String message) {
		model.addAttribute("chocie",choice);
		model.addAttribute("message",message);
	}
	@PostMapping("/certification")
	public String certification(Model model, @RequestParam(value = "choice")String choice, MemberVO memberVO , RedirectAttributes redirectAttributes) {
		if( memberVO.getMember_email() == null ) {
			redirectAttributes.addAttribute("message","nonemessage");
			redirectAttributes.addAttribute("choice" , choice);
			return "redirect:/member/findidpwd";
		}else if(memberSerivce.getMemberEmail(memberVO.getMember_email()) == null){
			redirectAttributes.addAttribute("message","reloadpage");
			redirectAttributes.addAttribute("choice" , choice);
			return "redirect:/member/findidpwd";
		} //걸러주는 역할입니다. -> 주석처리
		model.addAttribute("findInfo", memberVO);
		model.addAttribute("choice", choice);
		return "/member/certification";
	}
	
	@PostMapping("/findsendemail")
	public void findsendemail(MemberVO memberVO, Model model, @RequestParam(value = "choice")String choice) {
		String setfrom = "underthesea5@naver.com";
		String tomail = memberVO.getMember_email(); // 받는 사람 이메일
		String title = memberVO.getMember_name() + "님" + "UTS-5 [Under The Sea 5] 인증번호 메일입니다."; // 제목
		int num = ((int)(Math.random()*10000) + 1000);
		System.out.println("인증번호 : " + num);
		String content = "인증번호 : [ " + Integer.toString(num) + " ]"; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			mailSender.send(message);
			System.out.println("메일 보내기 성공!!!!");
		} catch (Exception e) {
			System.out.println(e);
		} // 메일 보내져서 주석처리
		model.addAttribute("member",memberVO);
		model.addAttribute("choice",choice);
		model.addAttribute("number",num);
		// 내일 할일!!!!!!!!!!!
		// 인증하는 사람이 본인이 맞는지 아닌지 확인하는 것
		// 인증번호 재전송 클릭 시 다시 메일 발송하는 REST CONTROLLER로 연결하기
		// 확인 버튼 클릭시 해당아이디를 가지고 넘겨준뒤 UPDATE로 수정할 것
	}

	@PostMapping("/lastfindidpwd")
	public String lastfindidpwd(MemberVO memberVO, Model model, @RequestParam(value = "choice")String choice) {
		model.addAttribute("choice", choice);
		model.addAttribute("member",memberSerivce.getMemberEmail(memberVO.getMember_email()).getMember_id());
		return "/member/lastfindidpwd";
	}

	@PostMapping("/sellerinfoupdate")
	public String sellerInfoUpdate(SellerInfoVO sellerInfo) {
		memberSerivce.updateSellerInfo(sellerInfo);
		return "redirect:/member/info/"+sellerInfo.getMember_id();
	}
}
