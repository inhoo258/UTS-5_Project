<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myorderList</h1>
<jsp:include page="../header&footer/header.jsp" />
<!-- 주문내역에서 필요한 것들 -->
<!-- 사진, 결제방법 -->

<c:forEach var="myOrderList" items="${myOrderList}">

주문자 아이디 : ${myOrderList.member_id}<br>
상품 아이디: ${myOrderList.product_id}<br>
주문 사품 갯수 : ${myOrderList.order_product_count}<br>
주문 가격: ${myOrderList.order_price}<br>
배송상태 : ${myOrderList.order_status}<br>
요청사항 : ${myOrderList.order_request}<br>
주문날짜 : ${myOrderList.order_date}<br>
배송지 : ${myOrderList.order_receiver_address}<br>
상품 이미지 : <img src='<c:url value="/product/img/${myOrderList.product_id}"/>'><br>
<input type="button" value = "주문 취소하기" >

<!-- 주문번호 필요  -->
<hr>
</c:forEach>

</body>
</html>

