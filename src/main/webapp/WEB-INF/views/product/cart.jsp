<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<c:set var="member_id">
	<sec:authentication property="principal.username"/>
</c:set>
<jsp:include page="../header&footer/header.jsp"></jsp:include>
<table border="1" style="border-collapse:collapse; border-color:red;" id="outerTable">
	<tr>
		<th><input type="checkbox" class="checkAll">전체선택(/)</th>		
		<th>상품정보</th>
		<th>수량</th>
		<th>금액</th>
		<th></th>
	</tr>
	<c:forEach var="cartList" items="${cartLists}" varStatus="status">
	<tr>
		<td colspan="5">
			<table class="innerTable" style="border-color:green;"border="1" id="${status.index}">
				<c:set var="totalPriceForEachCompany" value="0"/>
				<c:forEach var="cart" items="${cartList}">
				<tr class="trForEachCompany">
					<td>
						<input type="checkbox" class="checkOne">
						<img src="/project/product/img/${cart.product_id}" width="200px">
					</td>
					<td>
						[${cart.seller_company_name}]${cart.product_name}<br>
						<span class="productPrice"><fmt:formatNumber value="${cart.product_price}" pattern="#,###"/></span>
					</td>
					<td>
						<input type="button" value="-" class="minusBtn">
						<input type="text" class="cartProductCount" value="${cart.cart_product_count}">
						<input type="button" value="+" class="plusBtn">
						<input type="hidden" value="${status.index}" class="innerTableId">
					</td>
					<td>
						<span class="productTotalPrice">
							<fmt:formatNumber value="${cart.product_total_price}" pattern="#,###"/>
						</span>
					</td>
					<td>
						<input type="button" value="x" class="deleteOne">
						<input type="hidden" value="${cart.product_id}" class="product_ids">
					</td>
				</tr>
				<c:set var="totalPriceForEachCompany" value="${totalPriceForEachCompany+cart.product_total_price}"/>
				</c:forEach>
				<tr>
					<td colspan="5">
						<span class="totalPriceForEachCompany">
							<fmt:formatNumber value="${totalPriceForEachCompany}" pattern="#,###"/>
						</span>
						<span class="productDeliveryPrice" style="display:none;">
							<fmt:formatNumber value="${cartList[0].product_delivery_price}" pattern="#,###"/>
						</span>
						<span class="freeDelivery" style="display:none;">
							무료배송
						</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<th colspan="5">
			<input type="checkbox" class="checkAll">전체선택(/)
			<input type="button" id="deleteSelected" value="선택삭제">
		</th>
	</tr>
</table>
<input type="button" value="주문하기" id="orderBtn">
<div>
	<span id="totalPriceWithoutDel"></span>
	<span id="totalDel"></span>
	<span id="totalPriceWithDel"></span>
</div>
<script type="text/javascript">
	let member_id = '${member_id}';
	let checkOneLength = $(".checkOne").length;
	console.log("first checkOneLength : "+checkOneLength);
	$(document).ready(function(){
		$(".checkAll").prop("checked",true);
		$(".checkOne").prop("checked",true);
		documentCheck();
	});
	function documentCheck(){
		let totalPriceWithoutDel=0;
		let totalDel=0;
		let totalPriceWithDel=0;
		$("table table").each(function(){
			let idx = $(this).attr("id");
			console.log("idx : " +$(this).attr("id"));
			let totalPriceForEachCompany=0;
			$("table table#"+idx+" input:checkbox.checkOne").each(function(){
				if($(this).prop("checked")){
					let checkIdx = $("table table#"+idx+" input:checkbox.checkOne").index(this);
					totalPriceForEachCompany+=parseInt($("table table#"+idx+" span.productTotalPrice").get(checkIdx).innerText.replace(/,/gi,""));
				}
			});
			console.log(totalPriceForEachCompany)
			$("table table#"+idx+" .totalPriceForEachCompany").text(totalPriceForEachCompany.toLocaleString());
			totalPriceWithoutDel+=totalPriceForEachCompany;
		});		
		
		$(".totalPriceForEachCompany").each(function(){
				let idx = $(".totalPriceForEachCompany").index(this);
				let productDeliveryPrice = parseInt($(".productDeliveryPrice").get(idx).innerText.replace(/,/gi,""));
			if($(this).text().replace(/,/gi,"")>=50000){
				$(".productDeliveryPrice").get(idx).style.display="none";
				$(".freeDelivery").get(idx).style.display="block";
			}else if(0<$(this).text().replace(/,/gi,"") && $(this).text().replace(/,/gi,"")<50000){
				$(".productDeliveryPrice").get(idx).style.display="block";
				$(".freeDelivery").get(idx).style.display="none";
			//상점당 총액이 0일때
			}else{
				$(".productDeliveryPrice").get(idx).style.display="none";
				$(".freeDelivery").get(idx).style.display="block";
			}
		});
		$(".productDeliveryPrice").each(function(){
			let idx =$(".productDeliveryPrice").index(this);
			if($(".freeDelivery").get(idx).style.display=="none"){
				totalDel+=parseInt($(this).text().replace(/,/gi,""));
			}
		});
		totalPriceWithDel = totalPriceWithoutDel+totalDel;
		$("#totalPriceWithoutDel").text(totalPriceWithoutDel.toLocaleString());
		$("#totalDel").text(totalDel.toLocaleString());
		$("#totalPriceWithDel").text(totalPriceWithDel.toLocaleString());
	}
	//plus 버튼 조작
	$(".plusBtn").on("click",function(){
		let idx =$(".plusBtn").index(this);
		let cnt = parseInt($(".cartProductCount").get(idx).value);
		if(cnt<10){
			let productTotalPrice = parseInt($(".productTotalPrice").get(idx).innerText.replace(/,/gi,""));
			let productPrice = parseInt($(".productPrice").get(idx).innerText.replace(/,/gi,""));
			let innerTableId = $(".innerTableId").get(idx).value;
			let totalPriceForEachCompany = parseInt($(".innerTable#"+innerTableId+" tr:last-child span.totalPriceForEachCompany").text().trim().replace(/,/gi,""));
			//갯수 변경
			cnt++;
			$(".cartProductCount").get(idx).value=cnt;
			//상품 개당 총금액 변경
			$(".productTotalPrice").get(idx).innerText=(productTotalPrice+productPrice).toLocaleString();
			//상점 당 금액 변경
			documentCheck();
		}
	});
	//minus 버튼 조작
	$(".minusBtn").on("click",function(){
		let idx =$(".minusBtn").index(this); 
		let cnt = parseInt($(".cartProductCount").get(idx).value);
		if(cnt>1){
			let productTotalPrice = parseInt($(".productTotalPrice").get(idx).innerText.replace(/,/gi,""));
			let productPrice = parseInt($(".productPrice").get(idx).innerText.replace(/,/gi,""));
			let innerTableId = $(".innerTableId").get(idx).value;
			let totalPriceForEachCompany = parseInt($(".innerTable#"+innerTableId+" tr:last-child span.totalPriceForEachCompany").text().trim().replace(/,/gi,""));
			//갯수 변경
			cnt--;
			$(".cartProductCount").get(idx).value=cnt;
			//상품 개당 총금액 변경
			$(".productTotalPrice").get(idx).innerText=(productTotalPrice-productPrice).toLocaleString();
			//상점 당 금액 변경
			documentCheck();
		}
	});
	//개별 삭제
	$(".deleteOne").on("click",function(){
		let idx =$(".deleteOne").index(this);
		let product_ids = [];
		product_ids.push(parseInt($(".product_ids").get(idx).value));
		$.ajax({
			url:'/project/product/rest/deleteFromCart',
			type:'POST',
			data:{
				member_id:member_id,
				product_ids:product_ids
			},success:function(){
				//테이블 길이 확인
				let innerTableId = $(".innerTableId").get(idx).value;
				let innerTableLength = $(".innerTable#"+innerTableId+" tr.trForEachCompany").length;
				//전체 상품가격에서 차감
				if($(".checkOne").get(idx).checked){
					let productTotalPrice = parseInt($(".productTotalPrice").get(idx).innerText.replace(/,/gi,""));
					let totalPriceForEachCompany = parseInt($(".innerTable#"+innerTableId+" tr:last-child span.totalPriceForEachCompany").text().trim().replace(/,/gi,""));
					$(".innerTable#"+innerTableId+" tr:last-child span.totalPriceForEachCompany").text((totalPriceForEachCompany-productTotalPrice).toLocaleString());
				}
				//해당 열 삭제
				$(".trForEachCompany").get(idx).remove();
				if(innerTableLength-1==0){
					$(".innerTable#"+innerTableId).remove();
				}
				checkOneLength--;
				console.log("checkOneLength: "+checkOneLength);
				documentCheck();
			},error:function(){
				alert("no~~");
			}
		})
	});
	//선택 삭제
	$("#deleteSelected").on("click",function(){
		let product_ids = [];
		$(".checkOne").each(function(){
			if($(this).prop("checked")){
				let idx = $(".checkOne").index(this);
				product_ids.push(parseInt($(".product_ids").get(idx).value));
			}
		});
		console.log("product_ids : "+product_ids);
		if(product_ids.length!=0){
			$.ajax({
				url:'/project/product/rest/deleteFromCart',
				type:'POST',
				data:{
					member_id:member_id,
					product_ids:product_ids
				},success:function(){
					$(product_ids).each(function(i){
						$(".product_ids").each(function(j){
							if($(this).val()==product_ids[i]){
								let innerTableId = $(".innerTableId").get(j).value;
								let innerTableLength = $(".innerTable#"+innerTableId+" tr.trForEachCompany").length;
								$(".trForEachCompany").get(j).remove();
								if(innerTableLength-1==0){
									$(".innerTable#"+innerTableId).remove();
								}
							}
						});
					});
					checkOneLength-=product_ids.length;
					console.log("checkOneLenghth : "+checkOneLength);
					documentCheck();
				},error:function(){
					alert("no~~");
				}
			});
		}
	});
	$(".checkAll").on("click",function(){
		if($(this).prop("checked")){
			$(".checkOne").prop("checked",true);
			$(".checkAll").prop("checked",true);
			checkOneLength = $(".checkOne").length;
		}else{
			$(".checkOne").prop("checked",false);
			$(".checkAll").prop("checked",false);
			checkOneLength = 0;
		}
		documentCheck();
	});
	$(".checkOne").on("click",function(){
		if($(this).prop("checked"))checkOneLength++;
		else checkOneLength--;
		if(checkOneLength==$(".checkOne").length)$(".checkAll").prop("checked",true);
		else $(".checkAll").prop("checked",false);
		documentCheck();
	});
	$("#orderBtn").on("click",function(){
		let product_ids = [];
		let cart_product_counts = [];
		$(".checkOne").each(function(){
			if($(this).prop("checked")){
				let idx = $(".checkOne").index(this);
				product_ids.push(parseInt($(".product_ids").get(idx).value));
				cart_product_counts.push(parseInt($(".cartProductCount").get(idx).value));
			}
		});
		$.ajax({
			url:"/project/product/rest/updateCart",
			type:"POST",
			data:{
				member_id:member_id,
				product_ids:product_ids,
				cart_product_counts:cart_product_counts
			},success:function(){
				 let order_form = document.createElement("form");
				 order_form.name = "order_form";
	             order_form.action = '/project/product/ordersheet';
	             order_form.method = "post";
	             let input_product_ids = document.createElement("input");
	             let input_member_id = document.createElement("input");
	             input_product_ids.setAttribute("type", 'hidden');
	             input_member_id.setAttribute("type", 'hidden');
	             input_product_ids.setAttribute("name","product_ids");
	             input_member_id.setAttribute("name","member_id");
	             input_product_ids.setAttribute("value",product_ids);
	             input_member_id.setAttribute("value",member_id);
	             order_form.appendChild(input_product_ids);
	             order_form.appendChild(input_member_id);
	             document.body.appendChild(order_form);
	             order_form.submit();
			},error:function(e){
				alert("error"+e)
			}
		});
	});
</script>
</body>
</html>