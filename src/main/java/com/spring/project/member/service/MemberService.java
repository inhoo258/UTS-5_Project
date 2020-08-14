package com.spring.project.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.model.SelectVO;
import com.spring.project.member.model.SellerInfoVO;
import com.spring.project.member.repository.IMemberRepository;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;

	@Override
	public String getMemberPassword(String userId) {
		return memberRepository.getMemberPassword(userId);
	}
	@Override
	public MemberVO getMemberInfo(String userId) {
		return memberRepository.getMemberInfo(userId);
	}
	@Override
	public List<MemberVO> getMemberList(int memberPage, SelectVO select) {
		int start = (memberPage - 1) * 10 + 1;
		int end = start + 9;
		return memberRepository.getSelectMemberList(start, end , select.getSelect_auth() , select.getSelect_enabled() , select.getSelect_word());
	}

	@Override
	public int getMemberCount(SelectVO select) {
		return memberRepository.getMemberCount(select.getSelect_auth() , select.getSelect_enabled() , select.getSelect_word());
	}

	@Override
	public List<MemberVO> getPermissionList(int permissionPage, String permission_word) {
		int start = (permissionPage - 1) * 10 + 1;
		int end = start + 9;
		if (permission_word != null) {
			if (!permission_word.equals("")) {
				return memberRepository.getSelectPermissionList(start, end, permission_word);
			}
		}
		return memberRepository.getPermissionList(start, end);
	}

	@Override
	public int getPermissionCount(String permission_word) {
		if (permission_word != null) {
			if (!permission_word.equals("")) {
				return memberRepository.getSelectPermissionCount(permission_word);
			}
		}
		return memberRepository.getPermissionCount();
	}

	@Override
	@Transactional(value = "tsManager")
	public void memberInsert(MemberVO member) {
			memberRepository.memberJoin(member);
			memberRepository.authJoin(member.getUsername(), member.getMember_auth());
	}

	@Override
	public void updateMember(MemberVO member) {
		memberRepository.updateMember(member);
	}
	@Override
	public void changePwd(String member_pw, String member_id) {
		memberRepository.changePwd(member_pw, member_id);
	}
	
	
	@Override
	@Transactional(value = "tsManager")
	public void memberDelete(String member_id) {
		memberRepository.authDelete(member_id);
		memberRepository.memberDelete(member_id);

	}

	@Override
	@Transactional(value = "tsManager")
	public void membersDelete(String[] member_ids) {
		for (int i = 0; i < member_ids.length; i++) {
			memberRepository.authDelete(member_ids[i]);
			memberRepository.memberDelete(member_ids[i]);
		}

	}

	@Override
	public void member_enable(int enable , String member_id) {
		memberRepository.member_enable(enable ,member_id);
	}

//	@Override
//	@Transactional(value = "tsManager")
//	public void permissions(String[] permission_ids) {
//		for (int i = 0; i < permission_ids.length; i++) {
//			memberRepository.permission(permission_ids[i]);
//		}
//	}
	@Override
	public MemberVO getMemberEmail(String member_email) {
		return memberRepository.getEmail(member_email);
	}
	
	@Override
	public Object getMonthlySales(String member_id) {
		return memberRepository.getMonthlySales(member_id);
	}
	
//------------------ seller_info queries-----------------------------------
	@Override
	public void insertSellerRegNum(String member_id, String seller_reg_num) {
		memberRepository.insertSellerRegNum(member_id, seller_reg_num);
	}

	@Override
	public SellerInfoVO getSellerInfo(String member_id) {
		return memberRepository.getSellerInfo(member_id);
	}

	@Override
	public boolean getSellerRegNum(String seller_reg_num) {
		if(memberRepository.getSellerRegNum(seller_reg_num)==null)return true;
		else return false;
	}
	@Override
	public void updateSellerInfo(SellerInfoVO sellerInfo) {
		memberRepository.updateSellerInfo(sellerInfo);
	}


	
}
