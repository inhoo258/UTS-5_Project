<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="<c:url value='/resources/css/product/orderlist.css'/>" />
</head>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<c:set var="member_id">
	<sec:authentication property="principal.username"/>
</c:set>
   <jsp:include page="../header&footer/header.jsp" />
   <!-- 주문내역에서 필요한 것들 -->
   <!-- 사진, 결제방법 -->
<!--    배송 완료시에만 후기 쓰기 가능해야됨~~~~// 후기쓰기 완료 후 문구 변경해주고 색상 변경 해줘야함 -->
<c:set var="totalCost" value="0"/>
   <div class="orderlist_section">
      <div class="orderlist_tit">주문 내역 상세</div>
	      <c:choose>
		      <c:when test="${not empty orderLists}">
			      <section>
			         <c:forEach var="orderList" items="${orderLists}">
			         	<c:set var="totalCost" value="0"/>
			         	<c:forEach var="order" items="${orderList }">
			         		<c:set var="totalCost" value="${totalCost + order.order_price}"/>
			         	</c:forEach>
			           <table class="orderlist_table" border="1" style="border-collapse: collapse;">
				           <tr>
				          		<td colspan="4">
				          			<div class="order_num">
						               	주문번호 <span class="order_group_number">${orderList[0].order_group_number}</span>
				           			</div>
				           		</td>
				           </tr>
			               <tr>
			               		<td colspan="4">
			               		<div>상품명 <span>${orderList[0].product_name} 외 ${fn:length(orderList)}개</span></div>
			               		<span class="orderlist_order_date" ><fmt:formatDate value="${orderList[0].order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
			               		<c:set var="order_tel" value="${orderList[0].order_receiver_tel}"/>
			               		<c:set var="order_tel_len" value="${fn:length(order_tel)}"/>
			               		<c:set var="order_tel_len_check" value="${order_tel_len eq 10 ? 6:7}"/>
			               		<c:set var="order_tel_first" value="${fn:substring(order_tel,0,3)}"/>
			               		<c:set var="order_tel_second" value="${fn:substring(order_tel,3,order_tel_len_check)}"/>
			               		<c:set var="order_tel_third" value="${fn:substring(order_tel,order_tel_len_check,order_tel_len)}"/>
			               			전번 : ${order_tel_first}-${order_tel_second}-${order_tel_third}<br>
			               			메인 주소 : ${orderList[0].order_receiver_main_address}<br>	
			               			상세 주소 : ${orderList[0].order_receiver_sub_address}<br>
			               			총 금액 : <fmt:formatNumber value="${totalCost}" pattern="#,###"/>
			               		</td>
			               </tr>
			            </table>
			         </c:forEach>
			      </section>
		      </c:when>
		      <c:otherwise>
		      	주문 내역이 없습니다.
		      </c:otherwise>
	      </c:choose>
   </div>
   <script type="text/javascript">
   	$("div.order_num").on("click", function(){
   		let order_form = document.createElement("form");
   		console.log($(this).children().text());
   		let order_group_number = $(this).children().text();
   		let member_id = '${member_id}';
   		order_form.name="order_form";
   		order_form.action='<c:url value="/product/orderview"/>';
   		order_form.method = "post";
   		let input_order_group_number = document.createElement("input");
   		let input_member_id = document.createElement("input");
   		input_order_group_number.setAttribute("type",'hidden');
   		input_order_group_number.setAttribute("name","order_group_number");
   		input_order_group_number.setAttribute("value",order_group_number);
   		input_member_id.setAttribute("type",'hidden');
   		input_member_id.setAttribute("name","member_id");
   		input_member_id.setAttribute("value",member_id);
   		order_form.appendChild(input_order_group_number);
   		order_form.appendChild(input_member_id);
   		document.body.appendChild(order_form);
   		order_form.submit();
   	});
   </script>
</body>
</html>