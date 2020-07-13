<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<h1>주 문 서</h1>
	<h6>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</h6>
	
	<div>
		<hr>
			<div>
				장바구니에 있던 품목
				<div id="myCartList"></div>
			</div>
		<hr>
		<hr>
			<div>
				선택하신 품목
			</div>
		<hr>
		<hr>
			<div>
				주문자 정보<br>
				보내는 분 = ${orderSheet.member_name }<br>
				휴대폰 ${orderSheet.member_tel }<br>
				이메일 ${orderSheet.member_email }<br>
			</div>
		<hr>
		<hr>
			<div>
				배송정보<br>
				${orderSheet.member_addr }
				
			</div>
		<hr>
		<hr>
			<div>
				결제수단
			</div>
		<hr>
		<hr>
			<div>
				개인정보 수집/제공*
			</div>
			<div>
				<input type="button" value = "결제하기">
			</div>
		<hr>
		
	</div>
	<!-- -------------------------아직 미흡한 부분
	css 미흡
	
	
	
	 -->
	
	
</section>
</body>
<script type="text/javascript">
	// 제이쿼리로 장바구니 불러와야하고
	// 제이쿼리로 바로구매 품목 불러와야함.

</script>
</html>