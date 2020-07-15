<<<<<<< HEAD
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
    <link rel="stylesheet" href="cart.css" />
</head>

<body>
    <div class="section">
        <div id="ordersheet">
            <h1>주 문 서</h1>
            <label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
        </div>
        <div>
            <div>
                <h3 class="title_section">상품정보</h3>
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
                                <th style="width: 130px;"><!--상품 이미지--></th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <tr>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                            </tr>
                            <tr>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <form action="">
                <div class="order_info">
                    <h3 class="title_section">주문자 정보</h3>
                    <div class="inner_show2">
                        <table class="order_info_table" style="padding-left: 20px;">
                            <tr>
                                <th>보내는 분 *
                                    <!-- ${orderSheet.member_name }-->
                                </th>
                                <th><input type="text" name="name" required style="width: 162px;"> </th>
                            </tr>
                            <tr>
                                <th>휴대폰 *
                                    <!--${orderSheet.member_tel }-->
                                </th>
                                <th><input type="text" name="tel" required style="width: 162px;"> </th>
                            </tr>
                            <tr>
                                <th>이메일 *
                                    <!--${orderSheet.member_email }-->
                                </th>
                                <th><input type="text" name="email" required style="width: 360px;"> </th>
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
                        <!-- ${orderSheet.member_addr } -->
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
                    <input type="submit" value="결제하기" 
                    style="width: 200px; height: 48px;
                    background-color: #5f0080; color: white; border: none; display : block; margin : 40px auto;" >
                </div>
            </form>
        </div>
        <ul>
            <li>* 직접 주문취소는 <strong style="color: #5f0080;">‘입금확인’</strong> 상태일 경우에만 가능합니다.</li>
            <li>* 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
        </ul>
    </div>
</body>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<body>
	<c:set var="member_id">
		<sec:authentication property="principal.username" />
	</c:set>
	<h1>cart page</h1>
	<c:set var="totalPrice" value="0" />
	<form action='<c:url value="/product/ordersheet"/>' method="post"
		id="updateCart">
		<c:forEach var="cart" items="${cartList}">
			<input type="checkbox" class="selectOne">
			<br>
   구매자 아이디 : ${cart.member_id}<br>
   상품아이디 : ${cart.product_id}<br>
			<input type="hidden" class="hidden_product_id" name="product_id"
				value="${cart.product_id}">
      개수 : 
   <input type="button" class="minusBtn" value="-">
			<font class="cart_product_count">${cart.cart_product_count}</font>
			<input type="hidden" name="cart_product_count"
				value="${cart.cart_product_count}" class="hidden_count">
			<input type="button" class="plusBtn" value="+">
			<br>
   상품정보 : ${cart.product_info}<br>
   상품명 : ${cart.product_name}<br>
   상품 개당 금액 : ${cart.product_price}<br>
   상품금액  : <font class="cart_product_price">${cart.product_price * cart.cart_product_count}</font>
			<br>
			<img src='<c:url value="/product/img/${cart.product_id}"/>'>
			<hr>
			<c:set var="totalPrice"
				value="${totalPrice + cart.product_price * cart.cart_product_count}" />
		</c:forEach>
		<input type="checkbox" class="selectAll">전체선택&nbsp;<input
			type="button" value="선택삭제" class="deleteFromCart"> 결제 예정 금액 :
		<font id="total_price">${totalPrice}</font> <input type="hidden"
			name="member_id" value="${member_id}"> <input type="submit"
			value="주문하기">
	</form>
	<br>
	<script type="text/javascript">
		let totalPrice = '${totalPrice}'
		let member_id = '${member_id}';
		console.log(totalPrice)
		let idx;
		let cnt;
		$(".minusBtn")
				.click(
						function() {
							idx = $(".minusBtn").index(this);
							console.log("idx : " + idx)
							cnt = $(".cart_product_count").get(idx).innerText;
							console.log("cnt : " + cnt)
							var originalPrice = $(".cart_product_price").get(
									idx).innerText
									/ cnt;
							if (cnt > 1) {
								cnt--;
								$(".cart_product_count").get(idx).innerText = cnt;
								$(".hidden_count").get(idx).value = cnt;
								console.log($(".hidden_count").get(idx).value);
								$(".cart_product_price").get(idx).innerText = cnt
										* originalPrice;
								totalPrice -= originalPrice;
								$("#total_price").text(totalPrice);
							}
						});
		$(".plusBtn")
				.click(
						function() {
							idx = $(".plusBtn").index(this);
							console.log("idx : " + idx);
							cnt = $(".cart_product_count").get(idx).innerText;
							console.log("cnt : " + cnt);
							var originalPrice = $(".cart_product_price").get(
									idx).innerText
									/ cnt;
							//일단 10개까지만 선택 가능하도록
							if (cnt < 10) {
								cnt++;
								$(".cart_product_count").get(idx).innerText = cnt;
								$(".hidden_count").get(idx).value = cnt;
								console.log($(".hidden_count").get(idx).value);
								$(".cart_product_price").get(idx).innerText = cnt
										* originalPrice;
								totalPrice += originalPrice;
								$("#total_price").text(totalPrice);
							}
						});
		//주문시 장바구니 업데이트 작업중
		$("#updateCart").submit(function() {
			let hidden_product_id = [];
			let hidden_count = [];
			
			$(".hidden_count").each(function() {
				hidden_count.push(parseInt($(this).val()));
			})
			$(".hidden_product_id").each(function() {
				hidden_product_id.push(parseInt($(this).val()));
			})
			console.log(hidden_product_id);
			console.log(hidden_count);
			console.log(member_id);
			alert("update cart in");
			$.ajax({
				url : '<c:url value="/product/rest/updateCart"/>',
				type : 'POST',
				data : {
					product_id : hidden_product_id,
					cart_product_count : hidden_count,
					member_id : member_id
				}
			});
			$(".selectOne").each(function(){
				if(!$(this).is(":checked")){
					var idx = $(".selectOne").index(this);
					$(".hidden_product_id").get(idx).disabled="disabled";
					$(".hidden_count").get(idx).disabled="disabled";
				}	
			});
		});
		$(".deleteFromCart").click(function() {
			let product_ids = []
			$(".selectOne:checked").each(function(){
				var idx = $(".selectOne").index(this);
				console.log($(".hidden_product_id").get(idx).value);
				product_ids.push(parseInt($(".hidden_product_id").get(idx).value));
			})
			$.ajax({
				url:'<c:url value="/product/rest/deleteFromCart"/>',
				type:"POST",
				data:{
					member_id : member_id,
					product_ids : product_ids
				},
				success:function(){
					location.reload();
				}
			})
		});
		$(".selectAll").click(function(){
			if($(this).is(":checked")){
				$(".selectOne").attr("checked",true);
			}else{
				$(".selectOne").attr("checked",false);
			}
		});
	</script>
</body>
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
</html>