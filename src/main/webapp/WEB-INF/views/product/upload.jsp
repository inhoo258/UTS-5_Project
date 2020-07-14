<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/upload.css'/>" />
</head>
<body>
<h1>UPLOAD.JSP</h1>
<h1>업로드</h1>
	<jsp:include page="../header/header.jsp"/>
	<c:set var="member_id">
		<sec:authentication property="principal.username"/>
	</c:set>
	<form action='<c:url value="/product/upload"/>' method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="${member_id}">
		<textarea rows="20" cols="30" name="product_info"></textarea><br>
		<input type="file" name="file"><br>
		pname<input type="text" name="product_name"><br>
		pcount<input type="text" name="product_count"><br>
		pprice<input type="text" name="product_price"><br>
		pweight<input type="text" name="product_weight"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>