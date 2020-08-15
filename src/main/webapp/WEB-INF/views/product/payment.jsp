<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header&footer/header.jsp"/>
	<div>
	<h1>주문이 확인되었습니다.</h1>
	주문내역 및 배송에 관한 안내는 주문조회를 통하여 확인 가능합니다<br>
	주문번호 : ${orderedList[0].order_group_number}<br>
	주무일자 : ${orderedList[0].order_date}<br>
	입금자 : ${orderList[0].orderer_name}, 계좌번호 : ${orderList[0].seller_bank_name} ${orderList[0].seller_bank_account}(${orderList[0].seller_company_name})
		<table>
		<c:forEach var="ordered" items="${orderedList}">
			${ordered.ordered_price}<br>
			${ordered.order_delivery_price}<br>
			${ordered.order_receiver_name}<br>
			${ordered.order_receiver_main_address}<br>
			${ordered.order_receiver_sub_address}<br>
			${ordered.order_receiver_tel}<br>
			${ordered.order_request}<br>
			${ordered.seller_bank_account}<br>
			${ordered.seller_bank_name}<br>
			${ordered.seller_company_name}<br>
		</c:forEach>
		</table>
	</div>

    <jsp:include page="../header&footer/footer.jsp"/>
</body>
</html>