<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>" />
</head>
<body>
<h1>home.jsp</h1>
<h3></h3>
	<jsp:include page="header/header.jsp"/>
	<section>
		<div id="imgbox">
<!-- 			<img src="resources/test.jpg"> -->
		</div>
		<div><h3><a href='<c:url value="/product/upload"/>'>upload 화면</a></h3></div>
		<div><h3><a href='<c:url value="/product/list"/>'>list 화면</a></h3></div>
	</section>
</body>
</html>