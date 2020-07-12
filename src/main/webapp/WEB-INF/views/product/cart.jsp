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
<!-- 지금은 상품 하나에 대한 버튼조작만 완성입니다 수정할게 많으니 일단 무시해주세염 -->
<c:forEach var="cart" items="${cartList}">
	구매자 아이디 : ${cart.member_id}<br>
	상품아이디 : ${cart.product_id}<br>
	개수 : 
	<input type="button" onclick="minusCount()" id="minusBtn" value="-">
	<font id="cart_product_count">${cart.cart_product_count}</font>
	<input type="button" id="plusBtn" onclick="plusCount()" value="+"><br>
	상품정보 : ${cart.product_info}<br>
	상품명 : ${cart.product_name}<br>
	금액  : <font id="cart_product_price">${cart.product_price}</font><br>
	<img src='<c:url value="/product/img/${cart.product_id}"/>'>
	<hr>
</c:forEach>
총 상품금액 : <font id="total_price">${cart.product_price * cart.cart_product_count}</font><br>
<!-- 지금은 상품 하나에 대한 버튼조작만 완성입니다 수정할게 많으니 일단 무시해주세염 -->
<!-- 상황 보고 jQuery로 바꿔야할지도 멀라염 ㅜ -->
<script type="text/javascript">
	let cart_product_count = document.getElementById("cart_product_count").innerText;
	let cart_product_price = document.getElementById("cart_product_price");
	let originalPrice = cart_product_price/cart_product_count;
function minusCount(){
	if(cart_product_count>=1)cart_product_count-=1;
	document.getElementById("cart_product_count").innerText=cart_product_count;
	if(cart_product_count==0)document.getElementById("minusBtn").disabled="disabled";
	cart_product_price = originalPrice*cart_product_count;
	document.getElementById("cart_product_price").innerText = cart_product_price
}
function plusCount(){
	cart_product_count=cart_product_count*1+1;
	document.getElementById("cart_product_count").innerText=cart_product_count;
	if(cart_product_count>=1)document.getElementById("minusBtn").disabled=false;
	cart_product_price = originalPrice*cart_product_count;
	document.getElementById("cart_product_price").innerText = cart_product_price
}
</script>

</body>
</html>