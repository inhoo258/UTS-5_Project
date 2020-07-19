<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/product/cart.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js"
	crossorigin="anonymous"></script>
<body>

	<jsp:include page="../header&footer/header.jsp" />

	<c:set var="member_id">
		<sec:authentication property="principal.username" />
	</c:set>
	<c:set var="totalPrice" value="0" />

	<form action='<c:url value="/product/ordersheet"/>' method="POST"
		id="updateCart">
		<input type="hidden" name="member_id" value="${member_id}">
		<div align="center" style="margin-top: 100px">
			<div class="pro_section">
				<div id="ordersheet">
					<h1>장 바 구 니</h1>
					<label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
				</div>

				<div id="orderGoodsList">
					<table class="detail_table">
						<!-- 장바구니 상품 정보 상세보기 -->
						<tr class="th">
							<th id="thSelect" style="width: 130px; text-align: left;"><input
								type="checkbox" class="checkAll" style="margin-right: 10px;">
								<label for="ico_check" class="bb"></label> <label
								for="ico_check" class="cc"></label> <span id="span_allCheck">
									전체선택</span></th>
							<th style="width: auto;">상품 정보</th>
							<th style="width: 85.69px;">수량</th>
							<th style="width: 109.6px;">상품 금액</th>
							<th style="width: 16.8px;"></th>
						</tr>
						<c:forEach var="cart" items="${cartList}">
							<tr>
								<td style="padding-left: 20px;">
									<input type="checkbox" class="ico_check">
									<input type="hidden"class="hidden_product_id" name="product_ids" value="${cart.product_id}">
									<span>
										<a href="#"><img src='<c:url value="/product/img/${cart.product_id}"/>' width="80px"></a>
									</span>
								</td>
								<td>
									<a class="product_name" href="#">${cart.product_name}</a>
									<div class="each_price">
										<span class="price"> ${cart.product_price}</span>
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
									<span class="cart_product_price">${cart.product_price * cart.cart_product_count}</span>
									<span class="txt">원</span>
								</td>
								<td>
									<button type="button" class="btn btn_delete">x</button>
								</td>
							</tr>
							<c:set var="totalPrice" value="${totalPrice + cart.product_price * cart.cart_product_count}" />
						</c:forEach>
						<tr class="emptyCart">
							<th colspan="5" class="td_emptyCart" style="display: none;">장바구니에
								등록된 상품이 없습니다.</th>
						</tr>
					</table>
				</div>
				<div class="delete" align="left" style="padding-left: 20px">
					<label>
						<input type="checkbox" class="checkAll" style="margin-right: 10px;">
					</label> 
					<span id="span_allCheck"> 전체선택</span>
					<button type="button" class="bottom_btn_delete">선택 삭제</button>
				</div>
				<div>
					<div class="cart_result" align="center">
						<div style="display: flex;">
							<div class="list product_total_price">
								<div class="tit">
									<div>상품금액</div>
									<div align="center">
										<span class="totalPrice">${totalPrice}</span>
										<span>원</span>
									</div>
								</div>
							</div>
							<div class="deco deco_plus">
								<i class="fas fa-plus"></i>
							</div>
							<div class="list delivery">
								<div class="tit">
									<div>배송비</div>
									<div align="center">
										<span class="delPriceOk"> 0원 </span>
									</div>
								</div>
								<span class="deliveryPrice" style="display: none;">3,000원</span>
								<div class="delPriceCheck">
									<label class="deliveryLimit" style="display: none;">${50000-totalPrice}</label>원 추가주문 시, 무료배송
								</div>
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
	<script type="text/javascript">
		let totalPrice = '${totalPrice}';
		let member_id = '${member_id}';
		console.log("total Price : " + totalPrice);
		let idx;
		let cnt;
		let priceCheck = function() {
			$(".totalPrice").text(totalPrice);
			if (totalPrice == 0) {
				$(".td_emptyCart").show();
				$(".submit").css("background-color", "lightgray");
				$(".submit").attr("disabled", true);
				$(".checkAll").prop("checked", false);
				$(".checkAll").prop("disabled", true);
				$(".delPriceOk").show();
				$(".delPriceCheck").hide();
				$(".deliveryPrice").hide();
				$(".finalPrice").text(totalPrice);
			} else if (50000 - totalPrice > 0) {
				$(".delPriceCheck").show();
				$(".delPriceOk").hide();
				$(".deliveryPrice").show();
				$(".deliveryLimit").text(50000 - totalPrice);
				$(".finalPrice").text(totalPrice * 1 + 3000);
			} else {
				$(".delPriceOk").show();
				$(".delPriceCheck").hide();
				$(".deliveryPrice").hide();
				$(".finalPrice").text(totalPrice);
			}
		}
		$(window).on("load", function() {
			if (totalPrice != 0) {
				$(".ico_check").prop("checked", true);
				$(".checkAll").prop("checked", true);
			}
			priceCheck();
		});

		$(".btn_reduce").click(function() {
			idx = $(".btn_reduce").index(this);
			console.log("idx : " + idx);
			cnt = $(".cart_product_count").get(idx).value;
			var originalPrice = $(".cart_product_price").get(idx).innerText / cnt;
			if (cnt > 1) {
				cnt--;
				$(".cart_product_count").get(idx).value = cnt;
				$(".cart_product_price").get(idx).innerText = cnt * originalPrice;
				totalPrice -= originalPrice;
				console.log("현 idx 상품 총금액 : " + $(".cart_product_price").get(idx).innerText);
				console.log("현 idx 상품 originP : " + originalPrice);
				console.log("현 idx 상품 cnt : " + cnt);
				priceCheck();
			}
		});
		$(".btn_rise").click(function() {
			idx = $(".btn_rise").index(this);
			console.log("idx : " + idx);
			cnt = $(".cart_product_count").get(idx).value;
			var originalPrice = $(".cart_product_price").get(idx).innerText / cnt;
			//일단 10개까지만 선택 가능하도록
			if (cnt < 10) {
				cnt++;
				$(".cart_product_count").get(idx).value = cnt;
				$(".cart_product_price").get(idx).innerText = cnt * originalPrice;
				totalPrice = totalPrice * 1 + originalPrice;
				$(".totalPrice").text(totalPrice);
				console.log("현 idx 상품 총금액 : " + $(".cart_product_price").get(idx).innerText);
				console.log("현 idx 상품 originP : " + originalPrice);
				console.log("현 idx 상품 cnt : " + cnt);
				priceCheck();
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
			console.log(member_id);
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
		});
		//선택삭제(체크박스)
		$(".bottom_btn_delete").click(function() {
			let product_ids = [];
			$(".ico_check:checked").each(function() {
				var idx = $(".ico_check").index(this);
				alert($(".hidden_product_id").get(idx).value);
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
						console.log(product_ids[i]);
						$(".hidden_product_id").each(function(j) {
							if ($(this).val() == product_ids[i]) {
								totalPrice -= $(".cart_product_price").get(j).innerText;
								$(this).parent().parent().remove();
							}
						});
					});
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
						console.log(product_ids[i]);
						$(".hidden_product_id").each(function(j) {
							if ($(this).val() == product_ids[i]) {
								totalPrice -= $(".cart_product_price").get(j).innerText;
								$(this).parent().parent().remove();
							}
						});
					});
					priceCheck();
				}
			});
		});
		let ico_check = $(".ico_check").length;
		console.log("checkbox cnt : " + ico_check);
		$(".checkAll").click(function() {
			totalPrice = 0;
			if ($(this).is(":checked")) {
				$(".ico_check").prop("checked", true);
				$(".checkAll").prop("checked", true);
				ico_check = $(".ico_check").length;
				$(".cart_product_price").each(function() {
					totalPrice = totalPrice * 1 + $(this).text() * 1;
				})
			} else {
				$(".ico_check").prop("checked", false);
				$(".checkAll").prop("checked", false);
				ico_check = 0;
			}
			priceCheck();
			console.log("totalPrice : " + totalPrice);
			console.log("checkbox checked cnt : " + ico_check);
		});
		$(".ico_check").click(function() {
			var idx = 0;
			if ($(this).is(":checked")) {
				idx = $(".ico_check").index(this);
				totalPrice = totalPrice* 1 + $(".cart_product_price").get(idx).innerText* 1;
				console.log("totalPrice : " + totalPrice);
				ico_check += 1;
			} else {
				idx = $(".ico_check").index(this);
				totalPrice -= $(".cart_product_price").get(idx).innerText;
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