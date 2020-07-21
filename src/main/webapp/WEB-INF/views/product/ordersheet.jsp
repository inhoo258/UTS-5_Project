<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
            <div>
                <h3 class="title_section">바로구매 상품정보</h3>
                <div class="order_goodslist">
                    <div class="show_tbl">
                        <!--style="display:none;" 상세보기 버튼 클릭 시 변경-->
                        <div class="inner_show">
                            <div class="name">${productInfo.product_name }</div>
                            <!--상세보기 클릭 시 hidden으로 변경됨-->
                            <a class="show_btn" href="#none">
                                <span class="txt">상세보기&nbsp; <i class="fas fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>
                    <div id="orderGoodsList">
                        <!--상세보기 클릭 시 display:block으로 변경-->
                        <table class="detail_table">
                            <!-- 상품 정보 상세보기 -->
                            <tr class="th">
                                <th style="width: 130px;">상품 이미지</th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <tr>
                                <th><img src='<c:url value="/product/img/${productInfo.product_id }"/>' style="width: 100px;"></th>
                                <th>${productInfo.product_info }</th>
                                <th>${productInfo.product_price }</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div>
                <h3 class="title_section">장바구니 상품정보</h3>
                <div class="order_goodslist">
                    <div class="show_tbl">
                        <!--style="display:none;" 상세보기 버튼 클릭 시 변경-->
                        <div class="inner_show">
                            <div class="name">[맛의 고수] 양념차돌박이 200g 짭쪼롬감칠맛 외 1개 상품을 주문합니다.</div>
                            <!--상세보기 클릭 시 hidden으로 변경됨-->
                            <a class="show_btn" href="#none">
                                <span class="txt">상세보기&nbsp; <i class="fas fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>
                    <div id="orderGoodsList">
                        <!--상세보기 클릭 시 display:block으로 변경-->
                        <table class="detail_table">
                            <!-- 상품 정보 상세보기 -->
                            <tr class="th">
                                <th style="width: 130px;">상품 이미지</th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <c:forEach var="cartList" items="${cartList }">
                            	<tr>
                            		<th><img src='<c:url value="/product/img/${cartList.product_id}"/>' style="width: 100px;"></th>
                            		<th>${cartList.product_name }</th>
                            		<th>${cartList.product_price }</th>
                            	</tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <form action='<c:url value="/product/payment"/>' method="post">
                <div class="order_info">
                    <h3 class="title_section">주문자 정보</h3>
                    <div class="inner_show2">
                        <table class="order_info_table" style="padding-left: 20px;">
                            <tr>
                                <th>보내는 분 *</th>
                                <th><input type="text" name="order_receiver_name" required style="width: 162px;"value= ${memberInfo.member_name }> </th>
                            </tr>
                            <tr>
                                <th>휴대폰 *</th>
                                <th><input type="text" name="order_receiver_tel" required style="width: 162px;" value=${memberInfo.member_tel }> </th>
                            </tr>
                            <tr>
                                <th>이메일 *</th>
                                <th><input type="text" name="order_receiver_email" required style="width: 360px;" value=${memberInfo.member_email }> </th>
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
                <div class="delivery_info">
                    <h3 class="title_section">배송정보</h3>
                    <div class="inner_show2">
                    	주소 : <input type = "text" id="member_addr" name="order_receiver_address" value =${memberInfo.member_addr }>
                    </div>
                    <h3 class="title_section">받으실 장소</h3>
                    <div class="inner_show2">
                    	배송지
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
                	<input type="text" name = order_status value = "전">
                	<input type="text" name = "order_request" value = "22">
                	<input type="text" name = "order_prices" value = "${productInfo.product_price }">
                	<input type="text" name = "member_id" value = "${memberInfo.member_id }">
                	<input type="text" name = "order_receiver_name" value="${memberInfo.member_name}">
                	<input type="text" name = "product_ids" value = "${productInfo.product_id}">
                	<input type="text" name = "order_product_counts" value="${pOrder_count }">
                	<c:forEach var="cart" items="${cartList }">
                		<input type="text" name = "product_ids" value = ${cart.product_id }>
                		<input type="text" name = "order_prices" value = "${cart.product_price }">
                		<input type = "text" name = "order_product_counts" value = ${cart.cart_product_count }> 
                	</c:forEach>
                    <input type="submit" value="결제하기"  style="width: 200px; height: 48px; background-color: #5f0080; color: white; border: none; display : block; margin : 40px auto;" >
                </div>
            </form>
        </div>
        <ul>
            <li>* 직접 주문취소는 <strong style="color: #5f0080;">‘입금확인’</strong> 상태일 경우에만 가능합니다.</li>
            <li>* 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
        </ul>
    </div>
    
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
</body>
<script type="text/javascript">
	function changeAddr(){
		document.getElementById('member_addr').readOnly = "";
		document.getElementById('addrbtn').value = "저장";
		document.getElementById('addrbtn').setAttribute("onClick", "insertAddr();");
	}
	function insertAddr(){
		document.getElementById('member_addr').readOnly = "readonly";
		document.getElementById('addrbtn').value = "변경";
		document.getElementById('addrbtn').setAttribute("onClick", "changeAddr();");
	}
</script>
</html>