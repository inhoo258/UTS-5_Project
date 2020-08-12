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

      <form action='<c:url value="/product/ordersheet"/>' method="POST" id="updateCart">
      <input type="hidden" name="member_id" value="${member_id}">
      <div  align="center">
         <div class="pro_section">
            <div id="ordersheet">
               <h1>장 바 구 니</h1>
               <label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
            </div>
				<div id="orderGoodsList">
					<table class="detail_table" border="1">
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
				<c:forEach var="cartList" items="${cartLists}" varStatus="status">
							<tr>
								<td colspan="5">
									<table border="1" style="border-color:red;" class="innerTable">
									<c:set var="totalPriceForEachCompany" value="0"/>
										<c:forEach var="cart" items="${cartList}">
											<tr class="eachCompany">
												<td style="padding-left: 20px;">
													<input type="checkbox" class="ico_check" style="margin-right: 40px;">
													<input type="hidden"class="hidden_product_id" name="product_ids" value="${cart.product_id}">
													<span>
														<a href='<c:url value="/product/${cart.product_id}"/>'><img src='<c:url value="/product/img/${cart.product_id}"/>' width="80px"></a>
													</span>
												</td>
												<td>
													<a class="product_name" href='<c:url value="/product/${cart.product_id}"/>'>[${cart.seller_company_name}]${cart.product_name}</a>
													<div class="each_price">
														<span class="price"> <fmt:formatNumber value="${cart.product_price}" pattern="#,### 원"/></span>
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
													<span class="cart_product_price"><fmt:formatNumber value="${cart.product_total_price}" pattern="#,### 원"/></span>
												</td>
												<td>
													<button type="button" class="btn btn_delete">x</button>
												</td>
											</tr>
											<c:set var="totalPriceForEachCompany" value="${totalPriceForEachCompany + cart.product_total_price}"/>
										</c:forEach>
										<tr>
											<td colspan="5">
												
												총 가격 : <span class="totalPriceForEachCompany"><fmt:formatNumber value="${totalPriceForEachCompany}" pattern="#,### 원"/></span>
												배송비 : <span class="deliveryCostForEachCompany"><fmt:formatNumber value="${cartList[0].product_delivery_price}" pattern="#,### 원"/></span> 
												<label class="deliveryLimit" style="display: block;"><fmt:formatNumber value="${50000-totalPriceForEachCompany}" pattern="#,### 원 추가주문 시 무료배송"/></label>
											</td>
										</tr>
									</table>
								</td>
							</tr>
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
										<span class="delPriceOk" style="display: block;"> 0 원 </span>
								</dt>
									<dd>
										<div class="delPriceCheck"  style="background-color: green;"> 
											<span id="totalDelPrice"></span> 원
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
										<span id="finalPrice"></span>
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
		let totalPriceForEachCompanyArr = [];
		let eachProductPriceArr = [];
		let deliveryCostForEachCompanyArr = [];
		let member_id = '${member_id}';
		let checkedCnt=$(".ico_check").length;
		let totalPrice=0;
		let totalDelPrice=0;
		
		$(document).ready(function(){
			console.log("document ready start");
			//각 상점 별 상품 총액 배열에 넣기
			$("input:checkbox").prop("checked",true);
			$(".totalPriceForEachCompany").each(function(){
				totalPriceForEachCompanyArr.push(parseInt($(this).text().replace(/,/gi,"").replace("원","")));
				totalPrice+=parseInt($(this).text().replace(/,/gi,"").replace("원",""));
				
			});
			//각 상품의 개별 금액 배열에 넣기
			$(".price").each(function(){
				eachProductPriceArr.push(parseInt($(this).text().replace(/,/gi,"").replace("원","")));
			});
			$(".deliveryCostForEachCompany").each(function(){
				deliveryCostForEachCompanyArr.push(parseInt($(this).text().replace(/,/gi,"").replace("원","")));
				totalDelPrice+=parseInt($(this).text().replace(/,/gi,"").replace("원",""));
			});
			$(".totalPrice").text(totalPrice.toLocaleString());
			if(totalDelPrice>0){
				$(".delPriceOk").hide();
			}
			$("#totalDelPrice").text(totalDelPrice.toLocaleString());
			$("#finalPrice").text((totalPrice+totalDelPrice).toLocaleString());
			console.log("deliveryCostForEachCompanyArr : "+deliveryCostForEachCompanyArr)
			console.log("totalPriceForEachCompanyArr : "+totalPriceForEachCompanyArr);
			console.log("eachProductPriceArr : " + eachProductPriceArr);
			console.log("totalPrice : " + totalPrice);
			console.log("totalDelPrice : "+totalDelPrice);
			console.log("document ready ended");
		});
		
		$(".checkAll").on("click",function(){
			if($(this).prop("checked")){
				$(".checkAll").prop("checked",true);
				$(".ico_check").prop("checked",true);
				checkedCnt = $(".ico_check").length;
			}else{
				$(".checkAll").prop("checked",false);
				$(".ico_check").prop("checked",false);
				checkedCnt = 0;
			}
		});
		$(".ico_check").on("click",function(){
			if($(this).prop("checked")){
				checkedCnt++;
			}else{
				checkedCnt--;
			}
			if(checkedCnt == $(".ico_check").length){
				$(".checkAll").prop("checked",true);
			}else{
				$(".checkAll").prop("checked",false);
			}
		});
		$("button.btn_rise").on("click",function(){
			console.log("rise clicked");
			let idx = $(".btn_rise").index($(this));
			let cnt = $(".cart_product_count").get(idx).value;
			let tableIdx = $("table.innerTable").index($(this).parent().parent().parent().parent().parent());
			console.log("table idx : " + $("table.innerTable").index($(this).parent().parent().parent().parent().parent()));
			console.log("table : " + $(this).parent().parent().parent().parent().parent());
			console.log("idx : "+idx);
			console.log("cnt : "+cnt);
			if(cnt<10){
				$(".cart_product_price").get(idx).innerText=(parseInt($(".cart_product_price").get(idx).innerText.replace(/,/gi,"").replace("원",""))+eachProductPriceArr[idx]).toLocaleString()+" 원";
				$(".cart_product_count").get(idx).value=parseInt(cnt)+1;
				totalPrice+=eachProductPriceArr[idx];
				console.log("totalPrice : "+totalPrice);
			}
		});
		$("button.btn_reduce").on("click",function(){
			console.log("reduce clicked");
			let idx = $(".btn_reduce").index($(this));
			let cnt = $(".cart_product_count").get(idx).value;
			let tableIdx = $("table.innerTable").index($(this).parent().parent().parent().parent().parent());
			console.log("table idx : " + $("table.innerTable").index($(this).parent().parent().parent().parent().parent()));
			console.log("table : " + $(this).parent().parent().parent().parent().parent());
			console.log("idx : "+idx);
			console.log("cnt : "+cnt);
			if(cnt>1){
				$(".cart_product_count").get(idx).value=parseInt(cnt)-1;
				$(".cart_product_price").get(idx).innerText=(parseInt($(".cart_product_price").get(idx).innerText.replace(/,/gi,"").replace("원",""))-eachProductPriceArr[idx]).toLocaleString()+" 원";
				totalPrice-=eachProductPriceArr[idx];
				console.log("totalPrice : "+totalPrice);
			}
		});
	</script>
</body>
</html>