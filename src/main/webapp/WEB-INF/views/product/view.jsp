<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/view.css'/>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../header/header.jsp" />
    <section>
        <div class="p_product_main">
            <div class="p_product_collection">
                <div class="p_product_desc">
                    <div class="p_product_explain">
                        <div class="p_product_title">
                            <span id="title"><span id="titletext">${product.product_name}</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 단위</span></span>
                            <span id="value"><span id="text">KG</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 중량</span></span>
                            <span id="value"><span id="text">아직 미입력</span></span>
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
                            <span id="explain_value">${product.product_info}</span>
                        </div>
                        <div>
                           	<span id="key"><span id="keytext">구매수량</span></span>
                           	<span id="value">
                           		<span id="text">
		                            <input id="p_minus_btn" type="button" value ="-" onclick="p_count_minus()" disabled="disabled">
									<label id="p_count_num">0</label>
									<input type="button" value ="+" onclick="p_count_plus()">
								</span>
							</span>
                        </div>
                        <div>
                        	<span id="p_tprice_key">총 상품 금액 :</span><span id="p_tprice_value"></span>
                        </div>
						<div>
							<form name='myForm' method="post">
								<input type="hidden" name="product_id" value="${product.product_id}">
								<input type="hidden" id="product_count" name="product_count" value="">
								<input type="hidden" name="member_id" value="<sec:authentication property="principal.username"/>">
								<input type="button" value ="주문하기" onclick="redirectOrder()"> 
								<input type="button" value ="장바구니담기" onclick="redirectCart()">  
							</form>
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
			
		<div class= "p_product_explain2">
			<nav class="container">
			   <ul class="tab">
			      <li><a href="#tab1" class="on">상품 설명</a></li>
			      <li><a href="#tab2" >상품 이미지</a></li>
			      <li><a href="#tab3">상세 정보</a></li>
			      <li><a href="#tab4">고객 후기()</a></li>
			      <li><a href="#tab5">상품 문의()</a></li>
			   </ul>
			   <ul class="panel">
			         <li id="tab1"> 탭메뉴1 내용 </li>
			         <li id="tab2"> 탭메뉴2 내용 </li>
			         <li id="tab3"> 탭메뉴3 내용 </li>
			         <li id="tab4"> 탭메뉴4 내용 </li>
			         <li id="tab5"> 탭메뉴5 내용 </li>
			   </ul>
			</nav>
        </div>
    </section>
<hr>
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
		
		
	}
	function redirectOrder(){
//	 	주문서로 이동하는 JS 메도스|
		let p_num = parseInt(document.getElementById("p_count_num").innerText);
		if (p_num > 0) {
			document.getElementById("product_count").value = p_num;
			document.myForm.action = '<c:url value="/product/ordersheet"/>'; 
			document.myForm.submit();
		}else {
			alert("수량이 0");
		}
	}
	
// 	function redirectCart(){
// //  		장바구니로 이동하는 JS 메소드
// 		document.myForm.action = <c:url value="/product/ordersheet"/>; 
// 		document.myForm.submit();
// 	}
	
	
	
	
	$(function(){
	   $("ul.panel li:not("+$("ul.tab li a.on").attr("href")+")").hide() //class 속성에 on이 설정되어 있는 a태그의 href 속성을 가져오고 이 이외의 패널은 숨김.
	   
	   $("ul.tab li a").click(function(){  // ul에 a를 클릭 했을 때 
	      $("ul.tab li a").removeClass("on"); // a에 있는 모든 클래스 on 삭제
	      $(this).addClass("on");  // 그리고 현재 요소에만 on 클래스 추가 
	      $("ul.panel li").slideUp("fast"); // 모든 패널 비표시
	      $($(this).attr("href")).slideDown("fast"); // 클릭된 a태그의 href의 속성을 가져와 같은 id 속성을 가진 패널 보여줌
	      return false; // 탭에 a요소로 되어 있어서 클릭했을 때 발생하는 click 이벤트 설정. 이동하지 못하게 함.
	   });
	});

</script>
</html>