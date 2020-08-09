<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header&footer/header.jsp"/>
	<h1>payment.jsp</h1>
	<div>
		무통장입금 <br>
		결제내역  : 무통장 입금 : 신한은행 110-354-543411 (예금주 : 이힘찬)<br>
		(입금확인 후 배송이 됩니다.)<br>
		입금자명 : --회원 NAME이 들어와야함---;<br>
	</div>
	<input type="button" onclick="gotolist()" value = "쇼핑 더 하기"><br>
	<input type="button" onclick="myOrderList()" value = "나의 주문 내역"><br>
</body>
<script type="text/javascript">
	function gotolist(){
		location.href = '<c:url value="/product/list"/>'
	}
	
</script>
</html>