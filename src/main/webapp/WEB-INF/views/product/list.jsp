<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/list.css'/>" />
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<c:forEach var="product" items="${productList}">
		${product.product_id}.<br>
		${product.product_name}<br>
		<img src='<c:url value="/product/img/${product.product_id}"/>' width="50px"><br>
		${product.product_info}
		<hr>
	</c:forEach>
</body>
</html>