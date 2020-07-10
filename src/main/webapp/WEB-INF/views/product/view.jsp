<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header/header.jsp" />
<h1>상품 정보</h1>
	${product.product_id}.<br>
	${product.product_name}<br>
	<img src='<c:url value="/product/img/${product.product_id}"/>' width="400"><br>
	${product.product_info}
</body>
</html>