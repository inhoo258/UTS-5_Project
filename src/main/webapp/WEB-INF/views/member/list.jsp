<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/list.css'/>" />
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	회원관리페이지
	<br>
	<table>
	<tr>
		<td>ID</td>
		<td>Password</td>
		<td>Name</td>
		<td>Tel</td>
		<td>Address</td>
		<td>Email</td>
		<td>Enabled</td>
		<td>Authority</td>
	</tr>
	<c:forEach var="member" items="${memberList}">
		<tr>
			<td>${member.member_id}</td>
			<td>${member.member_pw}</td>
			<td>${member.member_name}</td>
			<td>${member.member_tel}</td>
			<td>${member.member_addr}</td>
			<td>${member.member_email}</td>
			<td>${member.member_enabled}</td>
			<td>${member.member_auth}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>
