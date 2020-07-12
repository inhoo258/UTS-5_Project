<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<body>
<h1>cart page</h1>
${cartList}
<c:forEach var="cart" items="${cartList}">
	${cart.member_id}<br>
	${cart.product_id}<br>
	${cart.cart_product_count}<br>
	${cart.product_info}
	${cart.product_name}
	${cart.product_price}
	${cart.product_img}
</c:forEach>
</body>
</html>