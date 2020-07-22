<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="stylesheet"   href="<c:url value='/resources/css/product/cart.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js"  crossorigin="anonymous"></script>
<body>

   <jsp:include page="../header&footer/header.jsp" />
   
      <c:set var="member_id">
         <sec:authentication property="principal.username" />
      </c:set>
      <c:set var="totalPrice" value="0" />

      <form action='<c:url value="/product/ordersheet"/>' method="POST" id="updateCart">
      <div  align="center" style="margin-top: 100px">
         <div class="pro_section">
            <div id="ordersheet">
               <h1>장 바 구 니</h1>
               <label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
            </div>
				<div id="orderGoodsList">
					<table class="detail_table">
						<!-- 장바구니 상품 정보 상세보기 -->
						<tr class="th">
							<th id="thSelect" style="width: 160px; text-align: left;">
							<input type="checkbox" class="checkAll" id="checkAll_id" style="margin-right: 10px;">
								<span id="span_allCheck"><label for="checkAll_id" style="cursor:pointer; ">전체선택</label>(<label class="checkedItems"></label>/<label class="allItems"></label>)</span>
							</th>
							<th style="width: auto;">상품 정보</th>
							<th style="width: 85.69px;">수량</th>
							<th style="width: 109.6px;">상품 금액</th>
							<th style="width: 16.8px;"></th>
						</tr>
						<c:forEach var="cart" items="${cartList}">
							<tr>
								<td style="padding-left: 20px;">
									<input type="checkbox" class="ico_check" style="margin-right: 40px;">
									<input type="hidden"class="hidden_product_id" name="product_ids" value="${cart.product_id}">
									<span>
										<a href='<c:url value="/product/${cart.product_id}"/>'><img src='<c:url value="/product/img/${cart.product_id}"/>' width="80px"></a>
									</span>
								</td>
								<td>
									<a class="product_name" href='<c:url value="/product/${cart.product_id}"/>'>${cart.product_name}</a>
									<div class="each_price">
										<span class="price"> <fmt:formatNumber value="${cart.product_price}" pattern="#,###"/></span>
										<span class="txt">원</span>
									</div>
								</td>
								<td>
									<div class="quantity">
										<button type="button" class="btn btn_reduce">-</button>
										<input type="text" readonly class="cart_product_count" value="${cart.cart_product_count}"> 
										<button type="button" class="btn btn_rise">+</button>
									</div>
								</td>
								<td class="td_total_cost" style="text-align: center;">
									<span class="cart_product_price"><fmt:formatNumber value="${cart.product_price * cart.cart_product_count}" pattern="#,###"/></span>
									<span class="txt">원</span>
								</td>
								<td>
									<button type="button" class="btn btn_delete">x</button>
								</td>
							</tr>
							<c:set var="totalPrice" value="${totalPrice + cart.product_price * cart.cart_product_count}" />
						</c:forEach>
						<tr class="emptyCart">
							<th colspan="5" class="td_emptyCart" style="display: none;">장바구니에 등록된 상품이 없습니다.</th>
						</tr>
					</table>
				</div>
				<div class="delete" align="left" style="padding-left: 20px">
					<label>
						<input type="checkbox" class="checkAll" style="margin-right: 10px;">
					</label> 
					<span id="span_allCheck"><label for="checkAll_id" style="cursor:pointer; ">전체선택</label>(<label class="checkedItems"></label>/<label class="allItems"></label>)</span>
					<button type="button" class="bottom_btn_delete">선택 삭제</button>
				</div>
				<div>
					<div class="cart_result" align="center">
						<div style="display: flex;">
							<div class="list product_total_price">
								<div class="tit">
									<div>상품금액</div>
									<div align="center">
										<span class="totalPrice"></span>
										<span>원</span>
									</div>
								</div>
							</div>
							<div class="deco deco_plus">
								<i class="fas fa-plus"></i>
							</div>
							<div class="list delivery">
								<dl style="width: 200px;" >
								<dt class="tit">배송비
										<span class="delPriceOk" style="display: block;"> 0원 </span>
								</dt>
								
									<dd>
										<div class="deliveryPrice" style="display: none; background-color: pink; display: block;">+ 3,000원</div>
										<div class="delPriceCheck"  style="background-color: green;"> 
											<label class="deliveryLimit" style="display: block;">${50000-totalPrice}</label>원 추가주문 시, 무료배송 
 										</div>
									</dd>
								
								</dl>
								
							</div>
							<div class="deco deco_equal">
								<i class="fas fa-equals"></i>
							</div>
							<div class="list total_price">
								<div class="tit">
									<div>결제 예정 금액</div>
									<div align="center">
										<span class="finalPrice"></span>
										<span>원</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<input type="submit" value="주문하기" class="submit">
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../header&footer/footer.jsp"/>
	<script type="text/javascript">
		let totalPrice = parseInt('${totalPrice}');
		let member_id = '${member_id}';
		console.log("total Price : " + totalPrice);
		let idx;
		let cnt;
		//totalPrice의 가격 변동이 있을 시마다 실행될 메서드
		let priceCheck = function() {
			$(".checkedItems").text(ico_check);
			$(".allItems").text($(".ico_check").length);
			console.log("price check in, totalPrice : "+totalPrice);
			$(".totalPrice").text(totalPrice.toLocaleString());
			if (totalPrice == 0) {
				if($(".ico_check").length==0){
					$(".td_emptyCart").show();
					$(".checkAll").prop("disabled", true);
				}
				$(".submit").css("background-color", "lightgray");
				$(".submit").attr("disabled", true);
				$(".checkAll").prop("checked", false);
				$(".delPriceCheck").hide();
				$(".deliveryPrice").hide();
				$(".finalPrice").text(totalPrice);
				//50000원은 임의로 지정한 금액, 50000이상 주문 시 무료배송
			} else if (50000 - totalPrice > 0) {
				$(".submit").attr("disabled", false);
				$(".submit").css("background-color", "#5f0080");
				$(".delPriceCheck").show();
				$(".delPriceOk").hide();
				$(".deliveryPrice").show();
				$(".deliveryLimit").text(50000 - totalPrice);
				$(".finalPrice").text((totalPrice + 3000).toLocaleString());
			}else if(totalPrice<0 || ico_check<0){
				location.reload();
			} 
			else {
				$(".submit").attr("disabled", false);
				$(".submit").css("background-color", "#5f0080");
				$(".delPriceOk").show();
				$(".delPriceCheck").hide();
				$(".deliveryPrice").hide();
				$(".finalPrice").text(totalPrice.toLocaleString());
			}
		}
		//window load시 전체 가격을 확인해서 0이상일 시 체크박스 선택, 아닐 시 해제
		$(window).on("load", function() {
			if (totalPrice != 0) {
				$(".ico_check").prop("checked", true);
				$(".checkAll").prop("checked", true);
			}
			priceCheck();
		});
		//- 버튼 조작
		$(".btn_reduce").click(function() {
			idx = $(".btn_reduce").index(this);
			console.log("idx : " + idx);
			console.log("ico_check idx checked : "+$(".ico_check").get(idx).checked);
			cnt = $(".cart_product_count").get(idx).value;
			var cart_product_price = $(".cart_product_price").get(idx).innerText.replace(/,/gi,"");
			console.log("cart_product_price : " + cart_product_price);
			var originalPrice = cart_product_price / cnt;
			if (cnt > 1) {
				cnt--;
				$(".cart_product_count").get(idx).value = cnt;
				$(".cart_product_price").get(idx).innerText = (cnt * originalPrice).toLocaleString();
				if($(".ico_check").get(idx).checked){
					totalPrice -= originalPrice;
					console.log("현 idx 상품 총금액 : " + $(".cart_product_price").get(idx).innerText);
					console.log("현 idx 상품 originP : " + originalPrice);
					console.log("현 idx 상품 cnt : " + cnt);
					priceCheck();
				}
			}
		});
		//+ 버튼 조작
		$(".btn_rise").click(function() {
			idx = $(".btn_rise").index(this);
			console.log("idx : " + idx);
			console.log("ico_check idx checked : "+$(".ico_check").get(idx).checked);
			cnt = $(".cart_product_count").get(idx).value;
			var cart_product_price = $(".cart_product_price").get(idx).innerText.replace(/,/gi,"");
			console.log("cart_product_price : " + cart_product_price);
			var originalPrice = cart_product_price / cnt;
			//일단 10개까지만 선택 가능하도록
			if (cnt < 10) {
				cnt++;
				$(".cart_product_count").get(idx).value = cnt;
				$(".cart_product_price").get(idx).innerText = (cnt * originalPrice).toLocaleString();
				if($(".ico_check").get(idx).checked){
					totalPrice = totalPrice + originalPrice;
					console.log("현 idx 상품 총금액 : " + $(".cart_product_price").get(idx).innerText);
					console.log("현 idx 상품 originP : " + originalPrice);
					console.log("현 idx 상품 cnt : " + cnt);
					priceCheck();
				}
			}
		});
		
		$("#updateCart").submit(function() {
			//주문시 장바구니 업데이트 작업
			let product_ids = [];
			let cart_product_counts = [];
			$(".cart_product_count").each(function() {
				cart_product_counts.push(parseInt($(this).val()));
			})
			$(".hidden_product_id").each(function() {
				product_ids.push(parseInt($(this).val()));
			})
			console.log("product_ids[] : " + product_ids);
			console.log("cart_product_counts[] : " + cart_product_counts);
			console.log("member_id : " + member_id);
			alert("updating cart before submit-------");
			$.ajax({
				url : '<c:url value="/product/rest/updateCart"/>',
				type : 'POST',
				data : {
					product_ids : product_ids,
					cart_product_counts : cart_product_counts,
					member_id : member_id
				}
			});
			//주문시 장바구니 업데이트 완료
			
			//체크되어있는 상품만 주문 할 수 있도록 체크 해제된 상품 disable
			$(".ico_check").each(function() {
				if (!$(this).is(":checked")) {
					var idx = $(".ico_check").index(this);
					$(".hidden_product_id").get(idx).disabled = "disabled";
				}
			});
			//disable 완료 후 submit실행
		});
		//선택삭제(체크박스)
		//0720 15:19 여기까지 했음 여서부터 시작
		$(".bottom_btn_delete").click(function() {
			let product_ids = [];
			$(".ico_check:checked").each(function() {
				var idx = $(".ico_check").index(this);
				product_ids.push(parseInt($(".hidden_product_id").get(idx).value));
			});
			console.log("will delete product where product_ids in : " + product_ids);
			$.ajax({
				url : '<c:url value="/product/rest/deleteFromCart"/>',
				type : "POST",
				data : {
					member_id : member_id,
					product_ids : product_ids
				},
				success : function() {
					$(product_ids).each(function(i) {
						console.log("deleted product_id : " + product_ids[i]);
						$(".hidden_product_id").each(function(j) {
							if ($(this).val() == product_ids[i]) {
								totalPrice -= parseInt($(".cart_product_price").get(j).innerText.replace(/,/gi,""));
								$(this).parent().parent().remove();
							}
						});
					});
					ico_check-=product_ids.length;
					console.log("ico_check : "+ico_check);
					priceCheck();
				}
			});
		});
		//개별삭제(x버튼)
		$(".btn_delete").click(function() {
			var idx = $(".btn_delete").index(this);
			let product_ids = [];
			product_ids.push(parseInt($(".hidden_product_id").get(idx).value));
			console.log("will delete product where product_ids in : " + product_ids);
			$.ajax({
				url : '<c:url value="/product/rest/deleteFromCart"/>',
				type : "POST",
				data : {
					member_id : member_id,
					product_ids : product_ids
				},
				success : function() {
					console.log(product_ids);
					$(product_ids).each(function(i) {
						console.log("deleted product_id : " + product_ids[i]);
						$(".hidden_product_id").each(function(j) {
							if ($(this).val() == product_ids[i]) {
								totalPrice -= parseInt($(".cart_product_price").get(j).innerText.replace(/,/gi,""));
								$(this).parent().parent().remove();
							}
						});
					});
					ico_check-=product_ids.length;
					console.log("ico_check : "+ico_check);
					priceCheck();
				}
			});
		});
		//ico_check : 윈도우 로드 시 모든 장바구니 내역이 체크되어 있는 상태이기 때문에 초기값을  장바구니 체크박스의 크기로 줌
		let ico_check = $(".ico_check").length;
		console.log("checkbox cnt : " + ico_check);
		//전체선택 체크박스 클릭 시 실행
		$(".checkAll").click(function() {
			totalPrice = 0;
			//체크인 경우
			if ($(this).is(":checked")) {
				$(".ico_check").prop("checked", true);
				$(".checkAll").prop("checked", true);
				ico_check = $(".ico_check").length;
				$(".cart_product_price").each(function() {
					console.log("cart_product_price : "+parseInt($(this).text().replace(/,/gi,"")));
					totalPrice = totalPrice + parseInt($(this).text().replace(/,/gi,""));
				});
			}
			//체크 해제인 경우
			else {
				$(".ico_check").prop("checked", false);
				$(".checkAll").prop("checked", false);
				ico_check = 0;
			}
			priceCheck();
			console.log("totalPrice : " + totalPrice);
			console.log("checkbox checked cnt : " + ico_check);
		});
		//장바구니 각각의 체크박스 클릭 시 실행
		$(".ico_check").click(function() {
			var idx = 0;
			if ($(this).is(":checked")) {
				idx = $(".ico_check").index(this);
				totalPrice = totalPrice + parseInt($(".cart_product_price").get(idx).innerText.replace(/,/gi,""));
				console.log("totalPrice : " + totalPrice);
				ico_check += 1;
			} else {
				idx = $(".ico_check").index(this);
				totalPrice -= parseInt($(".cart_product_price").get(idx).innerText.replace(/,/gi,""));
				console.log("totalPrice : " + totalPrice);
				ico_check -= 1;
			}
			priceCheck();
			console.log("checkbox checked cnt : " + ico_check);
			if (ico_check == $(".ico_check").length) {
				$(".checkAll").prop("checked", true);
			} else {
				$(".checkAll").prop("checked", false);
			}
		});
	</script>
</body>
</html>