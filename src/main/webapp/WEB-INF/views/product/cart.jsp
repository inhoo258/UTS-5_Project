<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<body>
<c:set var="member_id">
<sec:authentication property="principal.username"/>
</c:set>
	<h1>cart page</h1>
	<c:set var="totalPrice" value="0" />
	<form action='<c:url value="/product/ordersheet"/>' method="post" id="updateCart">
	<c:forEach var="cart" items="${cartList}">
	구매자 아이디 : ${cart.member_id}<br>
	상품아이디 : ${cart.product_id}<br>
	<input type="hidden" class="hidden_product_id"name="product_id" value="${cart.product_id}">
		개수 : 
	<input type="button" class="minusBtn" value="-">
		<font class="cart_product_count">${cart.cart_product_count}</font>
		<input type="hidden" name="cart_product_count" value="${cart.cart_product_count}" class="hidden_count">
		<input type="button" class="plusBtn" value="+">
		<br>
	상품정보 : ${cart.product_info}<br>
	상품명 : ${cart.product_name}<br>
	상품 개당 금액 : ${cart.product_price}<br>
	상품금액  : <font class="cart_product_price">${cart.product_price * cart.cart_product_count}</font>
		<br>
		<img src='<c:url value="/product/img/${cart.product_id}"/>'>
		<hr>
		<c:set var="totalPrice"
			value="${totalPrice + cart.product_price * cart.cart_product_count}" />
	</c:forEach>

	결제 예정 금액 :
	<font id="total_price">${totalPrice}</font>
	
		<input type="hidden" name="member_id" value="${member_id}">
		<input type="submit" value="주문하기">
	</form>
	<br>
<script type="text/javascript">
	let totalPrice = '${totalPrice}'
	console.log(totalPrice)
	let idx;
	let cnt;
	$(".minusBtn").click(function() {
		idx = $(".minusBtn").index(this);
		console.log("idx : " + idx)
		cnt = $(".cart_product_count").get(idx).innerText;
		console.log("cnt : " + cnt)
		var originalPrice = $(".cart_product_price").get(idx).innerText / cnt;
		if (cnt > 1) {
			cnt--;
			$(".cart_product_count").get(idx).innerText = cnt;
			$(".hidden_count").get(idx).innerText = cnt;
			$(".cart_product_price").get(idx).innerText = cnt * originalPrice;
			totalPrice -= originalPrice;
			$("#total_price").text(totalPrice);
		}
	});
	$(".plusBtn").click(function(){
		idx=$(".plusBtn").index(this);
		console.log("idx : "+idx);
		cnt = $(".cart_product_count").get(idx).innerText;
		console.log("cnt : "+cnt);
		var originalPrice = $(".cart_product_price").get(idx).innerText / cnt;
		//일단 10개까지만 선택 가능하도록
		if(cnt<10){
			cnt++;
			$(".cart_product_count").get(idx).innerText=cnt;
			$(".hidden_count").get(idx).innerText = cnt;
			$(".cart_product_price").get(idx).innerText = cnt * originalPrice;
			totalPrice += originalPrice;
			$("#total_price").text(totalPrice);
		}
	});
	//주문시 장바구니 업데이트 작업중
	$("#updateCart").submit(function(){
		alert("update cart in");
		let hidden_product_id = $(".hidden_product_id");
		let hidden_count = $(".hidden_count");
		alert(hidden_product_id.length);
		alert(hidden_product_id);
		alert(hidden_count.length);
		alert(hidden_count);
		alert('${member_id}')
		$.ajax({
			url:'<c:url value="/product/rest/updateCart"/>',
			data:{
				member_id:'${member_id}',
				product_id:hidden_product_id,
				cart_product_count:hidden_count,
			},
			type:"POST",
			success:function(){alert("승공");return false;},
			error:alert("실패")
		});
			
	});
</script>
</body>
</html>