<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/orderlist.css'/>" />
</head>
<body>
<jsp:include page="../header&footer/header.jsp" />
<!-- 주문내역에서 필요한 것들 -->
<!-- 사진, 결제방법 -->

<c:forEach var="order" items="${orderList}">
    <section>
        <div class="collectionOrder">
            <div class="sectiontop">
                <div class="topoption2"><span class="onebyone">배송또는 상품에 문제가 있나요? <a href="#">1:1 문의하기 ></a></span></div>
                <div class="topoption1"><span class="ordernum">주문번호 : ${order.order_number }</span></div>
            </div>
            <hr>
            <table class="myorderproduct">
                <tr>
                    <td colspan="4">
                        <h5 class="mptitle">${order.product_name}</h5>
                    </td>
                </tr>
                <tr>
                    <td><img id="myorderimg" src='<c:url value = "/product/img/${order.product_id}"/>'></td>
                    <td>
                        <span>${order.order_price}원</span><br>
                        <span>${order.order_product_count}개 구매</span>
                    </td>
                    <td><span>${order.order_status}</span></td>
                    <td>
                        <input type="button" value = "후기쓰기" onclick='window.open("/project/board/review/form?member_id=${order.member_id}&order_number=${order.order_number}")'><br>
                        <input type="button" value = "주문 취소하기" >
                    </td>
                </tr>
            </table>
        </div>
    </section>
</c:forEach>

</body>
</html>

