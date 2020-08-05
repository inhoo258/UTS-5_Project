<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/orderlist.css'/>" />
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                    <c:if test="${order.review_check eq 0}">
	                    <form name="reviewForm">
	                    	<input type="hidden" name="member_id" value="${order.member_id}">
	                    	<input type="hidden" name="order_number" value="${order.order_number}">
	                    </form>
	                        <input class="review_popup_btn" type="button" value = "후기쓰기"><br>
                    </c:if>
                    <c:if test="${order.order_status eq '배송전'}">
                        <input type="button" value = "주문 취소하기" >
                    </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </section>
</c:forEach>
<script type="text/javascript">
$(".review_popup_btn").on("click",function(){
	let idx = $(".review_popup_btn").index(this);
	let reviewForm;
	if($(".review_popup_btn").length>1)reviewForm = document.reviewForm[idx];
	else reviewForm = document.reviewForm;
	window.open("","reviewForm","width=700, height=700, resizable=no");
	reviewForm.action = "<c:url value='/board/review/form'/>";
	reviewForm.method="POST";
	reviewForm.target="reviewForm";
	reviewForm.submit();
});
</script>
</body>
</html>

