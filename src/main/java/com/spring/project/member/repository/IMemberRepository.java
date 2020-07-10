package com.spring.project.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.member.model.MemberVO;

@Repository
public interface IMemberRepository {

	@Select("select member_pw from members where member_id=#{member_id}")
	public String getMemberPassword(String member_id);

	@Select("select m.member_id , member_pw, member_name, member_tel, member_addr, member_email, member_enabled, au.authority as member_auth "
			+ "from members m " + "join authorities au " + "on m.member_id=au.member_id "
			+ "where m.member_id=#{member_id}")
	public MemberVO getMemberInfo(String member_id);

	// 회원 목록 출력
	@Select("select m.member_id , member_pw, member_name, member_tel, member_addr, member_email, member_enabled, au.authority as member_auth"
			+ " from members m join authorities au on m.member_id=au.member_id ")
	public List<MemberVO> getMemberList();

	// 회원가입 sql
	@Insert("insert into members (member_id, member_pw, member_name, member_tel, member_addr, member_email,member_enabled) "
			+ "values(#{member_id},#{member_pw},#{member_name},#{member_tel},#{member_addr},#{member_email},#{member_enabled})")
	public void memberJoin(MemberVO member);
	
	@Insert("insert into authorities values(#{0} , #{1})")
	public void authJoin(String member_id, String member_auth);

	// 회원 탈퇴
	@Delete("delete from members where member_id=#{member_id}")
	public void deleteMember(int member_id);

	// 회원 정보 수정

	@Update("update members set member_pw=#{member_pw},member_name=#{member_name}, member_tel=#{member_tel}, member_addr=#{member_addr}, member_email=#{member_email} "
			+ "where member_id=#{member_id}")
	public void updateMember(MemberVO member);




}
