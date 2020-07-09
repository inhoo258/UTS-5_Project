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
	<c:forEach var="member" items="${memberList}">
	</c:forEach>
</body>
</html>
