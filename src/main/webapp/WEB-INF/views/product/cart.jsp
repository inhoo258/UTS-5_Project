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
		<sec:authentication property="principal.username" />
	</c:set>
	<h1>cart page</h1>
	<c:set var="totalPrice" value="0" />
	<form action='<c:url value="/product/ordersheet"/>' method="post" id="updateCart">
		<c:forEach var="cart" items="${cartList}">
			<input type="checkbox" class="selectOne"> <br>
   			구매자 아이디 : ${cart.member_id} <br>
   			상품아이디 : ${cart.product_id} <br>
			<input type="hidden" class="hidden_product_id" name="product_id" value="${cart.product_id}">
     		 개수 : <input type="button" class="minusBtn" value="-">
			<font class="cart_product_count">${cart.cart_product_count}</font>
			<input type="hidden" name="cart_product_count" value="${cart.cart_product_count}" class="hidden_count">
			<input type="button" class="plusBtn" value="+"> <br>
  			 상품정보 : ${cart.product_info}<br>
   			상품명 : ${cart.product_name}<br>
   			상품 개당 금액 : ${cart.product_price}<br>
   			상품금액  : <font class="cart_product_price">${cart.product_price * cart.cart_product_count}</font>
			<br>
			<img src='<c:url value="/product/img/${cart.product_id}"/>' style="width: 100px;">
			<hr>
			<c:set var="totalPrice" value="${totalPrice + cart.product_price * cart.cart_product_count}" />
		</c:forEach>
		<input type="checkbox" class="selectAll">전체선택&nbsp; <br>
		<input type="button" value="선택삭제" class="deleteFromCart"> <br> 
		결제 예정 금액 : <font id="total_price">${totalPrice}</font> <br>
		<input type="hidden" name="member_id" value="${member_id}"> <br> 
		<input type="submit" value="주문하기"> 
	</form>
	<br>
	<script type="text/javascript">
		let totalPrice = '${totalPrice}'
		let member_id = '${member_id}';
		console.log(totalPrice)
		let idx;
		let cnt;
		$(".minusBtn")
				.click(
						function() {
							idx = $(".minusBtn").index(this);
							console.log("idx : " + idx)
							cnt = $(".cart_product_count").get(idx).innerText;
							console.log("cnt : " + cnt)
							var originalPrice = $(".cart_product_price").get(
									idx).innerText
									/ cnt;
							if (cnt > 1) {
								cnt--;
								$(".cart_product_count").get(idx).innerText = cnt;
								$(".hidden_count").get(idx).value = cnt;
								console.log($(".hidden_count").get(idx).value);
								$(".cart_product_price").get(idx).innerText = cnt
										* originalPrice;
								totalPrice -= originalPrice;
								$("#total_price").text(totalPrice);
							}
						});
		$(".plusBtn")
				.click(
						function() {
							idx = $(".plusBtn").index(this);
							console.log("idx : " + idx);
							cnt = $(".cart_product_count").get(idx).innerText;
							console.log("cnt : " + cnt);
							var originalPrice = $(".cart_product_price").get(
									idx).innerText
									/ cnt;
							//일단 10개까지만 선택 가능하도록
							if (cnt < 10) {
								cnt++;
								$(".cart_product_count").get(idx).innerText = cnt;
								$(".hidden_count").get(idx).value = cnt;
								console.log($(".hidden_count").get(idx).value);
								$(".cart_product_price").get(idx).innerText = cnt
										* originalPrice;
								totalPrice += originalPrice;
								$("#total_price").text(totalPrice);
							}
						});
		//주문시 장바구니 업데이트 작업중
		$("#updateCart").submit(function() {
			let hidden_product_id = [];
			let hidden_count = [];
			
			$(".hidden_count").each(function() {
				hidden_count.push(parseInt($(this).val()));
			})
			$(".hidden_product_id").each(function() {
				hidden_product_id.push(parseInt($(this).val()));
			})
			console.log(hidden_product_id);
			console.log(hidden_count);
			console.log(member_id);
			alert("update cart in");
			$.ajax({
				url : '<c:url value="/product/rest/updateCart"/>',
				type : 'POST',
				data : {
					product_id : hidden_product_id,
					cart_product_count : hidden_count,
					member_id : member_id
				}
			});
			$(".selectOne").each(function(){
				if(!$(this).is(":checked")){
					var idx = $(".selectOne").index(this);
					$(".hidden_product_id").get(idx).disabled="disabled";
					$(".hidden_count").get(idx).disabled="disabled";
				}	
			});
		});
		$(".deleteFromCart").click(function() {
			let product_ids = []
			$(".selectOne:checked").each(function(){
				var idx = $(".selectOne").index(this);
				console.log($(".hidden_product_id").get(idx).value);
				product_ids.push(parseInt($(".hidden_product_id").get(idx).value));
			})
			$.ajax({
				url:'<c:url value="/product/rest/deleteFromCart"/>',
				type:"POST",
				data:{
					member_id : member_id,
					product_ids : product_ids
				},
				success:function(){
					location.reload();
				}
			})
		});
		$(".selectAll").click(function(){
			if($(this).is(":checked")){
				$(".selectOne").attr("checked",true);
			}else{
				$(".selectOne").attr("checked",false);
			}
		});
	</script>
</body>
</html>