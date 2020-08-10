<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품조회</title>
</head>
<body>
	<div>상품 목록</div>
	<div>
		총 등록상품<span>${fn:length(productList)}</span>개
	</div>

	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td colspan="7"><input type="button" value="삭제"></td> 
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>번호</th>
			<th>제품명</th>
			<th>상품가격</th>
			<th>재고</th>
			<th>등록일</th>
			<th>수정</th>
		</tr>
			<c:forEach var="product" items="${productList}">
		<tr>
				<td><input type="checkbox"></td>
				<td></td>
				<td><img src='<c:url value="/product/img/${product.product_id}"/>' width="80px"> <sapn>${product.product_name}</sapn></td>
				<td>${product.product_price}</td>
				<td>${product.product_count}</td>
				<td>${product.product_upload_date}</td>
				<td><input type="button" value="수정"></td>
		</tr>
			</c:forEach>
	</table>
	
</body>
</html>