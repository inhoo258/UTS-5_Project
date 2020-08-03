<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/view.css'/>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../header&footer/sidebar.jsp"></jsp:include>
	<div id="main_menu">
    <jsp:include page="../header&footer/header.jsp"></jsp:include>
     <section id="view_section">
        <div class="p_product_main">
            <div class="p_product_collection">
                <div class="p_product_desc">
                    <div class="p_product_explain">
                        <div class="p_product_title">
                            <span id="title"><span id="titletext">${product.product_name}</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">상품 가격</span></span>
                        	<span id="value"><span id="text"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 단위</span></span>
                            <span id="value"><span id="text">KG</span></span>
                        </div>
                        <div>
                            <span id="key"><span id="keytext">판매 중량</span></span>
                            <span id="value"><span id="text">${product.product_weight}kg</span></span>
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
                            <span id="explain_value"></span>
                        </div>
                        <div>
                           	<span id="key"><span id="keytext">구매수량</span></span>
                           	<span id="value">
                           		<span id="text">
		                            <input id="p_minus_btn" type="button" value ="-" onclick="p_count_minus()" disabled="disabled">
									<label>&nbsp;<span id="p_count_num">1</span>&nbsp;</label>
									<input id="p_plus_btn" type="button" value ="+" onclick="p_count_plus()">
								</span>
							</span>
                        </div>
                        <div>
                        	<span id="key"><span id="keytext">총 상품 금액</span ></span>
                        	<span id="value">
	                        	<span id="text">
	                        		<span id= "p_tprice_value"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/></span> 원
	                        	</span>
                        	</span>
                        </div>
						<div>
							<form name='myForm'>
								<input type="hidden" id = "pOrder_product_id" name="product_id" value="${product.product_id}">
								<input type="hidden" id = "pOrder_count" name="pOrder_count" value="">
								<input type="hidden" id = "pOrder_member_id" name="member_id" value="<sec:authentication property="principal.username"/>">
								<input class="btn" type="button" value ="주문하기" onclick="redirectOrder()"> 
								<input class="btn" type="button" value ="장바구니담기" onclick="redirectInsertCart()"> 
							</form>
<%-- 							<form action ='<c:url value ="/product/cart/${member_id}"/>'> --%>
<!-- 							</form> -->
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
			      <li><a href="#tab2">업체 정보</a></li>
			      <li><a href="#tab3">고객 후기(<span id="reviewCounts"></span>)</a></li>
			      <li><a href="#tab4">상품 문의()</a></li>
			   </ul>
			   <ul class="panel">
			         <li id="tab1">${product.product_info }</li>
			         <li id="tab2">
		         		${sellerInfo.member_id}<br>
						${sellerInfo.seller_reg_num}<br>
						${sellerInfo.seller_company_info}<br>
						${sellerInfo.seller_company_tel}<br>
						${sellerInfo.seller_company_main_address}<br>
						${sellerInfo.seller_company_sub_address }<br>
						${sellerInfo.seller_company_email }<br>
						${sellerInfo.seller_company_name}<br>
						${sellerInfo.seller_company_head_name}<br>
			         </li>
			         <li id="tab3"> 
		         		<table border="1">
		         			<tr>
		         				<th>번호</th>
		         				<th>제목</th>
		         				<th>작성자</th>
		         				<th>작성일</th>
		         				<th>별점</th>
		         				<th>조회</th>
		         			</tr>
				         	<tbody id="tbody">
					         	<c:forEach var="review" items="${reviewList}">
					         		<tr>
					         			<td>${review.review_number}</td>
					         			<td>${review.review_title}</td>
					         			<td>${review.member_id }</td>
					         			<td>${review.review_date }</td>
					         			<td>${review.review_score }</td>
					         			<td>${review.review_views }</td>
					         		</tr>
					         	</c:forEach>
				         	</tbody>
				         	<tr>
				         		<td colspan="6">
				         			<c:if test="${pagingManager.nowPage ne 1}">
				         				<span id="span_start">처음</span>
					                </c:if> 
					                <c:if test="${pagingManager.nowBlock gt 1 }">
					                	<span id="span_pre">이전</span>
					                </c:if> 
					                <c:forEach var="i" begin="${pagingManager.startPage}" end="${pagingManager.endPage}">
					                	<span class="span_page">${i}</span>
					                </c:forEach> 
					                <c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
					                	<span id="span_post">다음</span>
					                </c:if> 
					                <c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
					                	<span id="span_end">끝</span>
					                </c:if>
				         		</td>
				         	</tr>
		         		</table>
		         		<input type="button" value="후기쓰기">
			          </li>
			         <li id="tab4"> 탭메뉴 내용 </li>
			   </ul>
			</nav>
        </div>
        	
    </section>
    </div>
<hr>
</body>
<script type="text/javascript">
let idx;
let page;
$(".span_page").on("click",function(){
	idx = $(".span_page").index(this);
	page = $(".span_page").get(idx).innerText;
	pagingControl(page);
});
$("#span_start").on("click",function(){
	page=1;	
	pagingControl(page);
});
$("#span_end").on("click",function(){
	page = '${pagingManager.totalPage}';	
	pagingControl(page);
});
$("#span_pre").on("click",function(){
	page = '${pagingManager.startPage-1}';	
	pagingControl(page);
});
$("#span_post").on("click",function(){
	page = '${pagingManager.endPage+1}';	
	pagingControl(page);
});
function pagingControl(page){
	console.log("requested page : "+page);
	$.ajax({
		url:'<c:url value="/board/rest/reviewList"/>',
		data:{
			page:page,
			product_id:'${product.product_id}'
		},
		type:'GET',
		success:function(reviewList){
			$("#tbody").empty();
			for(var i = 0; i < reviewList.length; i++){
				console.log(reviewList[i].review_date);
				$("#tbody").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				$("#tbody>tr")[i].childNodes[0].innerText = reviewList[i].review_number;
				$("#tbody>tr")[i].childNodes[1].innerText = reviewList[i].review_title;
				$("#tbody>tr")[i].childNodes[2].innerText = reviewList[i].member_id;
				$("#tbody>tr")[i].childNodes[4].innerText = reviewList[i].review_score;
				$("#tbody>tr")[i].childNodes[5].innerText = reviewList[i].review_views;
			}
		},error:function(){
			alert("틀림 ;;;");
		}
	});
}


		let product_id = document.getElementById("pOrder_product_id").value;
		let member_id = document.getElementById("pOrder_member_id").value;
		let p_num = parseInt(document.getElementById("p_count_num").innerText);
		let originalPrice = parseInt('${product.product_price}')
		console.log("product_id : " + product_id);
		console.log("member_id : "+member_id);
		console.log("p_num : "+p_num);
		console.log("originalPrice : " + originalPrice);
	
	function p_count_plus() {
		document.getElementById("p_minus_btn").disabled=false;
		p_num += 1;
		document.getElementById("p_count_num").innerText=p_num;
		document.getElementById("p_tprice_value").innerText=(originalPrice*p_num).toLocaleString();
	}
	function p_count_minus() {
		if(p_num > 1){
			p_num -= 1;
			if(p_num == 1){
			document.getElementById("p_minus_btn").disabled="disabled";
			}
		document.getElementById("p_count_num").innerText=p_num;
		document.getElementById("p_tprice_value").innerText=(originalPrice*p_num).toLocaleString();
		}
	}
	function redirectOrder(){
//	 	주문서로 이동하는 JS 메소드
//		주문 전 카트에 해당 상품이 저장되어있는지 확인
		$.ajax({
			url:'<c:url value="/product/rest/cartCheck"/>',
			type:'POST',
			data : {
				member_id : member_id,
				product_id : product_id
			},
			success:function(data){
				if(data==1){
					document.getElementById("pOrder_count").value = p_num;
					document.myForm.action = '<c:url value="/product/ordersheet"/>';
					document.myForm.method = 'post';
					document.myForm.submit();
				}else{
					let ans = confirm("이미 동일한 상품이 장바구니에 존재합니다.\n장바구니로 이동하시겠습니까?");
					if(ans){
						location.href="<c:url value='/product/cart/'/>"+member_id;
					}
				}
			},
			error:function(){
				alert("오류")
			}
		})
	}
	
	function redirectInsertCart(){
		var cartData = $("form[name=myForm]").serialize();
		$.ajax({
			url: '<c:url value="/product/rest/insertCart"/>',
			type : "POST",
			data : {
				"member_id" : member_id,
				"product_id" : product_id,
				"pOrder_count" : p_num
			},
			success : function(data){
				if(data==1){
					let ans = confirm("장바구니 담기에 성공했습니다.\n장바구니로 이동하시겠습니까?");
					if(ans){
						location.href="<c:url value='/product/cart/'/>"+member_id;
					}
				}else{
					alert("이미 동일한 상품이 장바구니에 존재합니다.");
				}
				// 자바스크립트 모션넣어주세요!!
			},error : function(){
				alert("오류")
			}
		});
	};
	
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