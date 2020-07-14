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

	@Select("select m.member_id as member_id , member_pw, member_name, member_tel, member_addr, member_email, member_enabled, au.authority as member_auth "
			+ "from members m " + "join authorities au " + "on m.member_id=au.member_id "
			+ "where m.member_id=#{member_id}")
	public MemberVO getMemberInfo(String member_id);

	// 회원 목록 출력
	@Select("select * from (select rownum rn , m.member_id , member_pw, member_name, member_tel, member_addr, member_email, member_enabled, au.authority as member_auth"
			+ " from members m join authorities au on m.member_id=au.member_id) where rn between #{0} and #{1}")
	public List<MemberVO> getMemberList(int start, int end);

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

	//회원 권한 삭제
	@Delete("delete from authorities where member_id=#{member_id}")
	public void authDelete(String member_id);

	//회원 정보 삭제
	@Delete("delete from members where member_id=#{member_id}")
	public void membersDelete(String member_id);

	@Select("select * from (select rownum rn , m.member_id , member_pw, member_name, member_tel, member_addr, member_email, member_enabled, au.authority as member_auth "
			+ "from members m join authorities au on m.member_id=au.member_id where member_enabled = 0) "
			+ "where rn between #{0} and #{1} ;") 
	public List<MemberVO> getMemberPermission(int start , int end);

	@Update("update members set member_enabled='1' where member_id = #{permission_ids}")
	public void permission(String permission_ids);
	
	@Select("select count(*) from members m join authorities au on m.member_id=au.member_id")
	public int getMemberCount();
	
	
	




}
