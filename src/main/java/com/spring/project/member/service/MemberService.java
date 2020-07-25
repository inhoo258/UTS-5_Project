package com.spring.project.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.member.model.MemberVO;
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
	public List<MemberVO> getMemberList(int memberPage, String member_word) {
		int start = (memberPage - 1) * 10 + 1;
		int end = start + 9;
		if (member_word != null) {
			if (!member_word.equals("")) {
				return memberRepository.getSelectMemberList(start, end, member_word);
			}
		}
		return memberRepository.getMemberList(start, end);
	}

	@Override
	public int getMemberCount(String member_word) {
		if (member_word != null) {
			if (!member_word.equals("")) {
				return memberRepository.getSelectMemberCount(member_word);
			}
		}
		return memberRepository.getMemberCount();
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
	public void permission(String permission_id) {
		memberRepository.permission(permission_id);
	}

	@Override
	@Transactional(value = "tsManager")
	public void permissions(String[] permission_ids) {
		for (int i = 0; i < permission_ids.length; i++) {
			memberRepository.permission(permission_ids[i]);
		}
	}

}
