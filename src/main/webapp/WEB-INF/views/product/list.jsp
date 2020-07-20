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
	<jsp:include page="../header&footer/header.jsp"/>
	<c:forEach var="product" items="${productList}">
		<a href='<c:url value="/product/${product.product_id}"/>'>${product.product_id}.</a><br>
		${product.product_name}<br>
		<img src='<c:url value="/product/img/${product.product_id}"/>' width="500px" height="500px"><br>
		${product.product_info}
		<hr>
	</c:forEach>
	<jsp:include page="../header&footer/footer.jsp"/>
</body>
</html>