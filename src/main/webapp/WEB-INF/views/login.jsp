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
	<jsp:include page="header/header.jsp" />
	<sec:authorize access="isAnonymous()">
		<form action="<c:url value='/loginProcess'/>" method="post">
			<table id="logintable">
				<tr height="60">
					<td colspan="3"><h2 style="color: #0066cc;">로그인</h2></td>
				</tr>
				<tr height="60">
					<th colspan="3"><input type="text" autocomplete="off" id="id" name="id" placeholder="아이디를 입력해주세요" autofocus="autofocus"><br></th>
				</tr>
				<tr height="60">
					<th colspan="3"><input type="password" autocomplete="off"
						id="password" name="pw" placeholder="비밀번호를 입력해주세요"><br></th>
				</tr>
				<tr height="60">
					<th colspan="3"><input type="submit" id="buttonLg" value="로그인"></th>
				</tr>
				<tr height="40" id="checkMessage" ${not empty message ? 'style="visibility:visible;"':''}>
					<th colspan="3"><label id="showMessage">${message}</label></th>
				</tr>
				<tr height="60">
					<td colspan="1">
					<label class="checkbox">
						<input type="checkbox"> <span class="icon"></span> <span class="text">아이디 기억하기</span>
					</label>
					</td>
					<td colspan="2" id="findidpw">
						<a href='<c:url value="#"/>'>아이디 찾기</a> | <a href='<c:url value="#"/>'>비밀번호 찾기</a>
					</td>
				</tr>
				<tr height="60">
					<th colspan="3"><input type="button" id="buttonJo" value="회원가입" onclick="location.href='<c:url value='/member/form'/>'"></th>
				</tr>
			</table>
		</form>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" />님 안녕하세요.<br>
		<a href="<c:url value="/hr/index" />">메인페이지</a>
		<form action='<c:url value="/logout"/>' method="post">
			<sec:csrfInput />
			<input type=submit value="로그아웃">
		</form>
	</sec:authorize>
	<c:remove var="message" scope="session"/>
</body>
</html>