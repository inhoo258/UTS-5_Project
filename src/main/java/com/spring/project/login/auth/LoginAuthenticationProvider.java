package com.spring.project.login.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.spring.project.member.model.MemberVO;
import com.spring.project.member.service.IMemberService;

@Component
public class LoginAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	IMemberService memberService;

	@Autowired
	BCryptPasswordEncoder bpe;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userId = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		String dbpw = memberService.getMemberPassword(userId);
		if (dbpw == null) {
			throw new InternalAuthenticationServiceException("없는 아이디입니다.");
		}
		if (!bpe.matches(password, dbpw)) {
			throw new BadCredentialsException("비밀번호가 다릅니다.");
		}
		MemberVO member = memberService.getMemberInfo(userId);
		if (!member.isEnabled()) {
			throw new DisabledException("정지당한 계정입니다. 관리자에게 문의하세요");
		}
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(member, password, member.getAuthorities() );
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
//		이 메서드는 여러 AuthenticationProvider들 중 인증을 진행할
//		Provider를 표시해줄 메서드 입니다. 시큐리티는 Authentication
//		매니저를 이용해 가지고 있는 인증 구현체인 Provider들 중 어떤
//		구현체가 인증을 진행할 것인지 체크합니다. 그 기준은 supports
//		메서드가 true 인지 false인지의 여부로 정해집니다. 여러분이
//		여러 개의 Provider를 각각의 인증방식을 위해 사용 중이라면 모든
//		인증 데이터가 모든 Provider를 거치지 않아야 하는 경우도 생깁니다.
//		사용할 Provider만 호출 가능하도록 매개변수로 현재 인증이 진행중인 인증 객체를 넘겨줍니다. 여러분은 저 객체가
//		여러분이 작성한 로직을 거쳐 왔는지 확인하시면 됩니다. 예를 들어 우리가 현재 만든 인증객체를 거쳐온 상태라면
//		해당 객체는 null 또는 MemberVO 의 Class 정보를 담고 있을 것입니다. Null 이라면 인증을 따로 진행해주면 될 것이고
//		MemberVO 라면 인증이 모두 끝난 상태이니 그대로 넘길 수 있도록 false를 리턴해주면 됩니다
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
