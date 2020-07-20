<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>" />
</head>
<body>
	<jsp:include page="header&footer/header.jsp" />
	<sec:authorize access="isAnonymous()">

		<section>
		<div class = "l_login_all">
		<div class = "l_login_form">
			<div class = "l_login_title">
				<h1 id= "l_login_titlemsg">로 그 인</h1>
			</div>
			<form action="<c:url value='/loginProcess'/>" method="post">
				<div class="l_collection_btn">
					<div class="l_login_inputId">
						<input type="text" id="l_id_input" name="id" 
						placeholder="아이디를 입력해주세요." autofocus="autofocus" autocomplete="off">
					</div>
					
					<div class="l_login_inputPwd">
						<input type="password" id="l_pwd_input" name="pw" 
						placeholder="비밀번호를 입력해주세요.">
					</div>
					
					
					<div class="l_login_signin">
						<input type="submit" id="l_signin_button" value="로그인">
					</div>
					<div class="l_login_checkmsg">
						<label id="showMessage">${message }</label>
					</div>
					<div class="l_login_other">
						<div class="l_login_otherfix">
							<div id="l_collection_checkbox">
								<label class="checkbox">
									<input type="checkbox"> 
									<span class="icon"></span> 
									<span class="text">아이디 기억하기</span>
								</label>
							</div>
							<div id="l_collection_find">
							<!-- url 잘못설정된거 바꿈 -승우 -->
								<a href='<c:url value="/member/find"/>'>아이디 찾기</a> | 
								<a href='<c:url value="/member/find"/>'>비밀번호 찾기</a>
							</div>
						</div>
					</div>
					<div class="l_login_signup">
						<input type="button" id="l_signup_button" 
						value="회원가입" onclick="location.href='<c:url value='/member/form'/>'">
					</div>
					
					
				</div>
			</form>
		</div>
		</div>
		</section>
		
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" />님 안녕하세요.<br>
		<a href="<c:url value="/hr/index" />">메인페이지</a>
		<form action='<c:url value="/logout"/>' method="post">
			<sec:csrfInput />
			<input type=submit value="로그아웃">test
		</form>
	</sec:authorize>
	<c:remove var="message" scope="session"/>
	<jsp:include page="header&footer/footer.jsp"/>
</body>
</html>