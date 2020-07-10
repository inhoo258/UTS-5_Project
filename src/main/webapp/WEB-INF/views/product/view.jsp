<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/view.css'/>" />
</head>
<body>
<jsp:include page="../header/header.jsp" />
    <section>
        <div class="p_product_main">
            <div class="p_product_collection">
                <div class="p_product_desc">
                    <div class="p_product_explain">
                        <div class="p_product_title">
                            <span id="title"><span id="titletext">판매 제품 이름</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 단위</span></span>
                            <span id="value"><span id="text">KG</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 중량</span></span>
                            <span id="value"><span id="text">ㅇㅇㅇㅇㅇ</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">배송구분</span></span>
                            <span id="value"><span id="text">택배배송/퀵서비스</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">원산지</span></span>
                            <span id="value"><span id="text">제주도산</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">포장타입</span></span>
                            <span id="value"><span id="text">냉동/비닐포장</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">유통기한</span></span>
                            <span id="value"><span id="text">수산물이므로 꼭 하루를 넘기지 마십쇼잉</span></span>
                        </div>
                        <div>
                            <span id="explain_key"><span id="keytext">안내사항</span></span>
                            <span id="explain_value">어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성
				                                되려나?어디까지 작성 되려나?어디까지 어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성
				                                되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성
				                                되려나?어디까지 작성어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나? 되려나?어디까지 작성
				                                되려나?작성 되려나?지 작성어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나? 되려나?어디까지 작성
				                                되려나?작성 되려나지 작성어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나?어디까지 작성 되려나? 되려나?어디까지 작성
                                                                    되려나?작성 되려나</span>
                        </div>
                        <div>
                            <span id="">
	                            <span id="">안내사항</span>
	                            </span>
	                            <span id="">
	                            </span>
                        </div>
                    </div>
                </div>
                <div class="p_product_pic">
                    <div class="p_pic_setting">
                        <img src='<c:url value="/product/img/${product.product_id}"/>'>
                    </div>
                </div>

            </div>
        </div>
    </section>
<hr>
		
<!-- 		<div> -->
<!-- 		</div> -->
		
			
	
<%-- 	${product.product_id}.<br> --%>
<%-- 	${product.product_name}<br> --%>
<%-- 	${product.product_count }<br> --%>
	
<!-- 	<div> -->
		
<!-- 	</div> -->
<!-- 	<div> -->
<!-- 		<input id="p_minus_btn" type="button" value ="-" onclick="p_count_minus()" disabled="disabled"> -->
<!-- 		<label id="p_count_num">0</label> -->
<!-- 		<input type="button" value ="+" onclick="p_count_plus()"><br> -->
<!-- 	</div> -->
<%-- 	${product.product_info} --%>
<!-- 	총 가격 : <label id="p_total_price"></label> -->
<!-- 	<div> -->
<%-- 		<form action='<c:url value="/product/ordersheet"/>' method="post" onsubmit="return p_send_order()"> --%>
<%-- 			<input type="hidden" name="product_id" value="${product.product_id}"> --%>
<!-- 			<input type="hidden" id="product_count" name="product_count" value=""> -->
<%-- 			<input type="hidden" name="member_id" value="<sec:authentication property="principal.username"/>"> --%>
<!-- 			<input type="submit" value ="주문하기">   -->
<!-- 		</form> -->
<!-- 	</div> -->

</body>
<script type="text/javascript">
	function p_count_plus() {
		let p_num = parseInt(document.getElementById("p_count_num").innerText)
		document.getElementById("p_minus_btn").disabled=false;
		p_num += 1;
		document.getElementById("p_count_num").innerText=p_num;
	}
	function p_count_minus() {
		let p_num = parseInt(document.getElementById("p_count_num").innerText)
		if(p_num > 0){
			p_num -= 1;
			if(p_num == 0){
			document.getElementById("p_minus_btn").disabled="disabled";
			}
		}
		document.getElementById("p_count_num").innerText=p_num;
	}
	function p_send_order(){
		let p_num = parseInt(document.getElementById("p_count_num").innerText);
		if (p_num > 0) {
			document.getElementById("product_count").value = p_num;
			console.log(document.getElementById("product_count").value);
			return true;
		}else {
			alert("수량이 0") 
			return false;
		}
	}
</script>
</html>