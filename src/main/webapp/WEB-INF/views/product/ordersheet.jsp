<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
    <link rel="stylesheet" href='<c:url value="/resources/css/product/ordersheet.css"/>' />
</head>
<body>
	<jsp:include page="../header&footer/header.jsp"/>
    <div class="section">
        
        <div id="ordersheet">
            <h1>주 문 서</h1>
            <label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
        </div>
        <div>
        <c:if test = "${not empty productInfo}">
            <div>
                <h3 class="title_section">바로구매 상품정보</h3>
                <div class="order_goodslist">
                    <div class="show_tbl">
                        <div class="inner_show">
                            <div class="name">${productInfo.product_name } 상품을 주문합니다.</div>
                            <a class="show_btn" href="#none">
                                <span class="txt" id="show_good_btn" onclick = "showMyGood()">상세보기&nbsp; <i class="fas fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>
                    <div id="orderGoodsList">
                        <table class="detail_table">
                            <tr class="th">
                                <th style="width: 130px;">상품 이미지</th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: auto;">주문 갯수</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <tr>
                                <th><img src='<c:url value="/product/img/${productInfo.product_id }"/>' style="width: 100px;"></th>
                                <th>
                                	상품이름 : ${productInfo.product_info }
                                <br>
                                	상품가격 : <fmt:formatNumber value ="${productInfo.product_price }" pattern="#,###"/> 
                                </th>
                                <th>${pOrder_count }</th>
                                <th><fmt:formatNumber value="${productInfo.product_price * pOrder_count}" pattern="#,###"/></th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test = "${not empty cartList}">
            <div>
                <h3 class="title_section">장바구니 상품정보</h3>
                <div class="order_goodslist">
                    <div class="show_tbl">
                        <!--style="display:none;" 상세보기 버튼 클릭 시 변경-->
                        <div class="inner_show">
                        	<c:choose>
	                        	<c:when test = "${(fn:length(cartList)-1) ne 0}">
	                            	<div class="name">${cartList[0].product_name } 외 ${fn:length(cartList)-1} 상품을 주문합니다.</div>
	                            </c:when>
								<c:otherwise>
	                            	<div class="name">${cartList[0].product_name } 상품을 주문합니다.</div>
								</c:otherwise>                        	
                            </c:choose>
                            <!--상세보기 클릭 시 hidden으로 변경됨-->
                            <a class="show_btn" id="show_cart_btn" href="#none">
                                <span class="txt" onclick="showMyCart()">상세보기&nbsp; <i class="fas fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>
                    <div id="orderCartList">
                        <!--상세보기 클릭 시 display:block으로 변경-->
                        <table class="detail_table">
                            <!-- 상품 정보 상세보기 -->
                            <tr class="th">
                                <th style="width: 130px;">상품 이미지</th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: auto;">주문 수량</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <c:forEach var="cartList" items="${cartList }">
                            	<tr>
                            		<th><img src='<c:url value="/product/img/${cartList.product_id}"/>' style="width: 100px;"></th>
                            		<th>
                            			상품 이름 : ${cartList.product_name }
                            			<br>
                            			상품 가격 : ${cartList.product_price }
                            		</th>
                            		<th>${cartList.cart_product_count }</th>
                            		<th><fmt:formatNumber value = "${cartList.cart_product_count*cartList.product_price }"/></th>
                            	</tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            </c:if>
                <div class="order_info">
                    <h3 class="title_section">주문자 정보</h3>
                    <div class="inner_show2">
                        <table class="order_info_table" style="padding-left: 20px;">
                            <tr>
                                <th>보내는 분 *</th>
                                <th><input type="text" id="username" readonly="readonly" autocomplete="off" style="width: 162px;"value= ${memberInfo.member_name }> </th>
                            </tr>
                            <tr>
                                <th>휴대폰 *</th>
                                <th><input type="text" id="usertel" readonly="readonly"  style="width: 162px;" value=${memberInfo.member_tel }> </th>
                            </tr>
                            <tr>
                                <th>이메일 *</th>
                                <th><input type="text" readonly="readonly" required style="width: 360px;" value=${memberInfo.member_email }> </th>
                            </tr>
                            <tr>
                                <th>주 소 *</th>
                                <th><input type = "text" id="useraddr" readonly="readonly" style="width: 360px" value =${memberInfo.member_addr } > </th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>
                                    <p class="txt_guide">
                                        <span>이메일을 통해 주문처리과정을 보내드립니다.</span>
                                        <span>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</span>
                                    </p>
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
                <form action='<c:url value="/product/payment"/>' method="post">
                <div class="delivery_info">
                    <h3 class="title_section">받는 사람 정보</h3>
                    <div class="inner_show2"><table class="order_info_table" style="padding-left: 20px;">
                            <tr>
                                <th>수 령 인 *</th>
                                <th>
                                	<input type="text" id = "member_name" name="order_receiver_name"  required style="width: 162px;"> 
	                                &nbsp;
	                                <label class="checkbox">
										<input type="checkbox" name = "chkaddr" onclick="addrcheck()"> 
										<span class="icon"></span> 
										<span class="text">주문자와 동일</span>
 									</label>
                                </th>
                            </tr>
                            <tr>
                                <th>휴 대 폰 *</th>
                                <th><input type="text" id = "member_tel" name="order_receiver_tel" required style="width: 162px;" > </th>
                            </tr>
                            <tr>
                                <th>주   소 *</th>
                                <th><input type = "text" id="member_addr" name="order_receiver_address" required style="width: 360px" > </th>
                            </tr>
                        </table>
                     </div>
                </div>
                <div class="payment">
                    <h3 class="title_section">배송정보 결제수단</h3>
                    <div class="inner_show2"></div>
                </div>
                <div class="agree">
                    <h3 class="title_section">개인정보 수집/제공*</h3>
                    <div class="inner_show2"></div>
                </div>
                <div>
	                <input type="hidden" name = "member_id" value = <sec:authentication property="principal.username"/>>
						                	
                	<c:if test="${not empty productInfo}">
	                	<input type="hidden" name = "product_ids" value = "${productInfo.product_id}">
	                	<input type="hidden" name = "order_prices" value = "${productInfo.product_price }">
	                	<input type="hidden" name = "order_product_counts" value="${pOrder_count }">
	                	<input type="hidden" name = order_status value = "전">
	                	<input type="hidden" name = "order_request" value = "22">
                	</c:if>
                	<c:forEach var="cart" items="${cartList }">
                		<input type="hidden" name = "product_ids" value = ${cart.product_id }>
                		<input type="hidden" name = "order_prices" value = "${cart.product_price }">
                		<input type="hidden" name = "order_product_counts" value = ${cart.cart_product_count }> 
	                	<input type="hidden" name = order_status value = "전">
	                	<input type="hidden" name = "order_request" value = "22">
                	</c:forEach>
                    	<input type="submit" value="결제하기" class="paymentbtn" >
                </div>
            </form>
        </div>
        <ul>
            <li>* 직접 주문취소는 <strong style="color: #5f0080;">‘입금확인’</strong> 상태일 경우에만 가능합니다.</li>
            <li>* 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
        </ul>
    </div>
    
<<<<<<< HEAD
    <hr>
        	구매자 정보 들고오는값<br>
    	member_id : ${memberInfo.member_id }<br>
    	member_name : ${memberInfo.member_name }<br>
    	member_tel : ${memberInfo.member_tel }<br>
    	member_email : ${memberInfo.member_email }<br>
    	member_addr : ${memberInfo.member_addr }<br>
    	상품 정보 들고오는값<br>
    	product_id : ${productInfo.product_id }<br>
    	member_id : ${productInfo.member_id }<br>
    	product_info : ${productInfo.product_info }<br>
    	product_name : ${productInfo.product_name }<br>
    	product_count : ${productInfo.product_count }<br>
    	product_price : ${productInfo.product_price }<br>
    	product_weight : ${productInfo.product_weight }<br>
   		판매자 정보 들고오는 값<br>
   		member_id : ${productMemInfo.member_id }<br>
   		member_name : ${productMemInfo.member_name }<br>
   		member_tel : ${productMemInfo.member_tel }<br>
   		member_email : ${productMemInfo.member_email }<br>
   		member_addr : ${productMemInfo.member_addr }<br>
   		장바구니 판매자 정보<br>
   		<c:forEach var="cartList" items="${cartList }">
	        cartList.product_id : ${cartList.product_id }<br>
	        cartList.product_name : ${cartList.product_name } <br>
			cartList.product_price : ${cartList.product_price } <br>
			cartList.cart_product_count : ${cartList.cart_product_count } <br>
			cartList.product_info : ${cartList.product_info } <br>
			cartList.member_id : ${cartList.member_id } <br>
			cartList.seller_name : ${cartList.seller_name } <br>
			cartList.seller_email : ${cartList.seller_email } <br>
			cartList.seller_id : ${cartList.seller_id } <br>
			cartList.seller_tel : ${cartList.seller_tel } <br>
		</c:forEach>
    
    
    
    
    
    
    
    
    
    <jsp:include page="../header&footer/footer.jsp"/>
=======
    
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
</body>
<script type="text/javascript">
	function showMyGood(){
		document.getElementById('orderGoodsList').style.display="block";
		document.getElementById('show_good_btn').style.display="none";
		
	}
	function showMyCart(){
		document.getElementById('orderCartList').style.display="block";
		document.getElementById('show_cart_btn').style.display="none";
	}
	function addrcheck(){
		console.log("in")
		let username = document.getElementById('username').value
		let usertel = document.getElementById('usertel').value
		let useraddr = document.getElementById('useraddr').value
		var checkAddrbox = document.getElementsByName('chkaddr')[0];
		if(checkAddrbox.checked){
			document.getElementById('member_name').value = username
			document.getElementById('member_tel').value = usertel
			document.getElementById('member_addr').value = useraddr
		}else{
			document.getElementById('member_name').value = ""
			document.getElementById('member_tel').value = ""
			document.getElementById('member_addr').value = ""
		}
	}
</script>
</html>