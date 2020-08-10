<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<c:set var="member_id">
	<sec:authentication property="principal.username"/>
</c:set>
	<c:forEach var="orderList" items="${orderListsByOrderGroupNumber}">
	<table class="orderlist_table" border="1" style="border-collapse: collapse;">
		<div class="qna_register" align="right">
			 배송 또는 상품에 문제가 있나요? <a href="#"> 1:1 문의하기 ></a>
		</div>
			<c:forEach var="order" items="${orderList}">
			<tr class="tr_order">
			<td class="td_product_img"><img id="orderlist_product_img"
				src='<c:url value = "/product/img/${order.product_id}"/>' width="300px"> <input
				type="hidden" class="order_number" value="${order.order_number}">
			</td>
			<td>
				<div class="orderlist_product_name">[${order.seller_company_name}]${order.product_name}</div> <span
				class="orderlist_order_price"><fmt:formatNumber
						value="${order.order_price}" pattern="#,###" />원 </span> <span
				class="orderlist_order_count">${order.order_product_count}개
					구매</span>
				<div>
					요청사항 <span>${order.order_request}</span>
				</div>
			</td>
			<td class="td_status_and_btn">
				<div class="order_status">${order.order_status}</div>
			</td>
			<td class="td_status_and_btn">
				<form name="reviewForm">
					<input type="hidden" name="member_id" value="${order.member_id}">
					<input type="hidden" name="order_number"
						value="${order.order_number}">
				</form> <input class="review_popup_btn" type="button" value="후기 쓰기">
				<input type="hidden" class="review_check"
				value="${order.review_check}">
			</td>
		</tr>
		</c:forEach>
			<tr>
				<td colspan="4">
					배송비 : ${orderList[0].order_delivery_price} 
					<input class="cancel_btn" type="button" value="주문 취소">
					<input type="hidden" class="seller_company_name" value="${orderList[0].seller_company_name}">
				</td>
			</tr>
	</table>
	</c:forEach>
</body>
<script type="text/javascript">
   $(".review_check").each(function(){
	   if($(this).val()!=0){
		   let idx = $(".review_check").index(this);
		   console.log("!=0 idx : "+idx);
		   $(".review_popup_btn").get(idx).disabled="true";
		   $(".review_popup_btn").get(idx).style.color="#908d8d";
		   $(".review_popup_btn").get(idx).style.backgroundColor="white";
		   $(".review_popup_btn").get(idx).style.border="1px solid #9a9a9a";
		   $(".review_popup_btn").get(idx).value="작성 완료";
	   }
   });
   $(".order_status").each(function(){
	   if($(this).text()!="배송전"){
			let idx = $(".order_status").index(this);
			console.log("!=배송전 idx : "+idx);
			$(".cancel_btn").get(idx).disabled="true";
			$(".cancel_btn").get(idx).style.color="#908d8d";
			$(".cancel_btn").get(idx).style.backgroundColor="white";
			$(".cancel_btn").get(idx).style.border="1px solid #9a9a9a";
			
	   }
   });
   $(".review_popup_btn").on("click",function() {
            let idx = $(".review_popup_btn").index(this);
            let reviewForm;
            if ($(".review_popup_btn").length > 1)
               reviewForm = document.reviewForm[idx];
            else
               reviewForm = document.reviewForm;
            window.open("", "reviewForm",
                  "width=700, height=700, resizable=no");
            reviewForm.action = "<c:url value='/board/review/form'/>";
            reviewForm.method = "POST";
            reviewForm.target = "reviewForm";
            reviewForm.submit();
    });
   $(".cancel_btn").on("click", function(){
	   let idx = $(".cancel_btn").index(this);
	   console.log("idx : "+idx);
	   let seller_company_name =$(".seller_company_name").get(idx).value;
	   let member_id = '${member_id}';
	   console.log("member_id : "+member_id);
	   console.log("company name : "+seller_company_name);
	   let conf = confirm("주문을 취소 하시겠습니까?");
	   if(conf){
		   $.ajax({
			  url:'<c:url value="/product/rest/orderCancel"/>',
			  type:"POST",
			  data:{
				  seller_company_name:seller_company_name,
				  member_id:member_id
			  },success:function(result){
				  if(result){
					  $(".orderlist_table").get(idx).remove();
				  }else{
					  console.log("returned "+result);
				  }
			  }
		   });
	   }
   });
   </script>
</html>