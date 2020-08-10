package com.spring.project.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.common.PagingManager;
import com.spring.project.member.model.MemberVO;
import com.spring.project.member.model.SelectVO;
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

	@PostMapping("/list")
	public List<MemberVO> memberList(@RequestBody SelectVO select) {
		
//		if((select.getSelect_auth() == null && select.getSelect_enabled()==null && select.getSelect_option() == null && select.getSelect_word() == null )
//				||(select.getSelect_auth() == null && select.getSelect_enabled()==null && select.getSelect_option() != null && select.getSelect_word() == null)){
//			return memberSerivce.getMemberList(select.getPage(), "");
////			초기값
//		}else if(select.getSelect_auth() == null && select.getSelect_enabled()==null && select.getSelect_option() == null && select.getSelect_word() != null) {
////			word 만 있을경우
//			return null;
//		}else if(select.getSelect_auth() == null && select.getSelect_enabled()==null && select.getSelect_option() != null && select.getSelect_word() != null) {
////			word 에 옵션 ++
//			return null;
//		}else if(select.getSelect_auth() == null && select.getSelect_enabled()!=null && select.getSelect_option() == null && select.getSelect_word() == null) {
////			enabled만 있을때
//			return null;
//		}else if(select.getSelect_auth() != null && select.getSelect_enabled()==null && select.getSelect_option() == null && select.getSelect_word() == null) {
////			활성화 여부만
//			return null;
//		}else if(select.getSelect_auth() != null && select.getSelect_enabled()!=null && select.getSelect_option() == null && select.getSelect_word() == null) {
////			활성화 권한 두개
//			return null;
//		}else if(select.getSelect_auth() != null && select.getSelect_enabled()==null && select.getSelect_option() != null && select.getSelect_word() != null) {
////			권한 + 옵션 + 워드
//			return null;
//		}else if(select.getSelect_auth() == null && select.getSelect_enabled()==null && select.getSelect_option() == null && select.getSelect_word() == null) {
//			return null;
//		}
		System.out.println(select.getSelect_auth());
		System.out.println(select.getSelect_enabled());
		System.out.println(select.getSelect_option());
		System.out.println(select.getSelect_word());
		return memberSerivce.getMemberList(1, "");
	}
	
	@RequestMapping("/page_numbering")
	public PagingManager page_Numbering(@RequestParam(value="page" , defaultValue = "1")int page , @RequestParam(value = "word" , required = false) String word) {
		return new PagingManager(memberSerivce.getMemberCount(word), page);
	}

	@PostMapping("/choice_delete")
	public void choice_delete(@RequestBody String member_id) {
		memberSerivce.memberDelete(member_id);
	}

	@PostMapping(value="/member_enable" , produces="application/json;charset=UTF-8")
	public void member_enable (@RequestBody MemberVO member) {
		if(member.getMember_enabled() == 0) {
			memberSerivce.member_enable(1, member.getMember_id());
		}else {
			memberSerivce.member_enable(0, member.getMember_id());
		}
	}
	

}
