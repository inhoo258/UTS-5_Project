package com.spring.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

	@GetMapping("/form/{userId}")
	public String form(@PathVariable("userId") String userId, Model model) {
		model.addAttribute("member", memberSerivce.getMemberInfo(userId));
		model.addAttribute("message", "update");
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

	@RequestMapping("/list")
	public void getMemberList(@RequestParam(required = false, defaultValue = "1") int memberpage,
			@RequestParam(required = false) String member_word, @RequestParam(required = false) String permission_word,
			@RequestParam(required = false, defaultValue = "1") int permissionpage,
			@RequestParam(value = "message", required = false) String message, Model model) {
		System.out.println(permission_word);
		System.out.println(member_word);

		model.addAttribute("memberlist", memberSerivce.getMemberList(memberpage, member_word));
		System.out.println("1번확인");
		model.addAttribute("memberPage", new PagingManager(memberSerivce.getMemberCount(member_word), memberpage));
		System.out.println("2번확인");
		model.addAttribute("permission", memberSerivce.getPermissionList(permissionpage, permission_word));
		System.out.println("3번확인");
		model.addAttribute("permissionPage",
				new PagingManager(memberSerivce.getPermissionCount(permission_word), permissionpage));
		System.out.println("4번확인");
	}

	@PostMapping("/permission")
	public String permission(@RequestParam(value = "permission_id", required = false) String permission_id,
			@RequestParam(required = false) String[] permission_ids, RedirectAttributes attributes,
			@RequestParam(required = false) String permission_word,
			@RequestParam(value = "permissionpage", required = false, defaultValue = "1") int permissionpage,
			@RequestParam(value = "memberpage", required = false, defaultValue = "1") int memberpage) {
		if (permission_ids != null) {
			memberSerivce.permissions(permission_ids);
		}
		if (permission_id != null) {
			memberSerivce.permission(permission_id);
		}
		attributes.addAttribute("permission_word" , permission_word);
		attributes.addAttribute("permissionpage", permissionpage);
		attributes.addAttribute("memberpage", memberpage);
		return "redirect:/member/list";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam(value = "member_id", required = false) String member_id,
			@RequestParam(required = false) String[] member_ids, RedirectAttributes attributes,
			@RequestParam(required = false) String member_word,
			@RequestParam(value = "permissionpage", required = false, defaultValue = "1") int permissionpage,
			@RequestParam(value = "memberpage", required = false, defaultValue = "1") int memberpage) {
		System.out.println("permissionpage : : " + permissionpage);
		System.out.println("memberpage : : " + memberpage);
		if (member_ids != null) {
			memberSerivce.membersDelete(member_ids);
		}
		if (member_id != null) {
			memberSerivce.memberDelete(member_id);
		}
		attributes.addAttribute("member_word" , member_word);
		attributes.addAttribute("permissionpage", permissionpage);
		attributes.addAttribute("memberpage", memberpage);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MASTER"))) {
			return "redirect:/member/list";
		}
		return "redirect:/logout";
	}

	@RequestMapping("/info/{userId}")
	public String getMember(@PathVariable("userId") String userId, Model model) {
		MemberVO member =  memberSerivce.getMemberInfo(userId);
		model.addAttribute("member",member);
		if(member.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_SELLER"))){
			model.addAttribute("sellerInfo", memberSerivce.getSellerInfo(userId));
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
		return "redirect:/member/info/" + member.getMember_id();
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
	public void findidpwd() {
	}
	@PostMapping("/certification")
	public void certification(Model model, MemberVO memberVO) {
		model.addAttribute("findInfo", memberVO);
	}
	@PostMapping("/findsendemail")
	public void findsendemail(MemberVO memberVO, Model model) {
		String setfrom = "underthesea5@naver.com";
		String tomail = memberVO.getMember_email(); // 받는 사람 이메일
		String title = memberVO.getMember_name() + "님" + "UTS-5 [Under The Sea 5] 인증번호 메일입니다."; // 제목
		int num = ((int)(Math.random()*10000) + 1000);
		System.out.println(num);
		String content = "인증번호 : [ " + Integer.toString(num) + " ]"; // 내용
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
//			messageHelper.setTo(tomail); // 받는사람 이메일
//			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//			messageHelper.setText(content); // 메일 내용
//			mailSender.send(message);
//			System.out.println("메일 보내기 성공!!!!");
//		} catch (Exception e) {
//			System.out.println(e);
//		} 메일 보내져서 주석처리
		
		
		// 내일 할일!!!!!!!!!!!
		// 인증하는 사람이 본인이 맞는지 아닌지 확인하는 것
		// 인증번호 재전송 클릭 시 다시 메일 발송하는 REST CONTROLLER로 연결하기
		// 확인 버튼 클릭시 해당아이디를 가지고 넘겨준뒤 UPDATE로 수정할 것
		model.addAttribute("ctfnum",num);
	}
	

	@PostMapping("/sellerinfoupdate")
	public String sellerInfoUpdate(SellerInfoVO sellerInfo) {
		memberSerivce.updateSellerInfo(sellerInfo);
		return "redirect:/member/info/"+sellerInfo.getMember_id();
	}
}
