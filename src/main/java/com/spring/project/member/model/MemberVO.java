package com.spring.project.member.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails {
	private String rn;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_tel;
	private String member_addr;
	private String member_email;
	private int member_enabled;
	private String member_auth;
	
	
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getMember_id() {
		return this.member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_pw() {
		return this.member_pw;
	}
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_enabled() {
		return member_enabled;
	}

	public void setMember_enabled(int member_enabled) {
		this.member_enabled = member_enabled;
	}

	public String getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(String member_auth) {
		this.member_auth = member_auth;
	}

	// 관리자는 유저의 권한또한 포함하기에 리스트로 작성함
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(this.member_auth));
		return authorities;
	}

	@Override
	public String getPassword() {
		return this.member_pw;
	}

	@Override
	public String getUsername() {
		return this.member_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.member_enabled == 0 ? false : true;
	}

}
