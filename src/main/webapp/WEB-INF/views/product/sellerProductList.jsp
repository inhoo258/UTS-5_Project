<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품조회</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<body>
	<div>상품 목록</div>
	<div>
		총 등록상품<span id="total_product_count">${fn:length(productList)}</span>개
	</div>

	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td colspan="7">
				<input type="button" value="삭제" class="btn_delete">
			</td> 
		</tr>
		<tr>
			<th>번호</th>
			<th>
				<input type="checkbox" id="checkAll">
			</th>	
			<th>제품명</th>
			<th>상품가격</th>
			<th>재고</th>
			<th>등록일</th>
			<th>수정</th>
		</tr>
			<c:forEach var="product" items="${productList}" varStatus="status">
		<tr>
				<td></td>
				<td><input type="checkbox" name="checkOne" class="checkOne"> ${product.product_id} </td>
				<td>
					<img src='<c:url value="/product/img/${product.product_id}"/>' width="80px"> 
					<sapn>${product.product_name}</sapn>
					<input type="hidden" value="${product.product_id }" class="hidden_product_id">
				</td>
				<td>${product.product_price}</td>
				<td>${product.product_count}</td>
				<td>${product.product_upload_date}</td>
				<td><input type="button" value="수정" onclick="location.href='/project/product/upload/${product.product_id}'"></td>
		</tr>
			</c:forEach>
			<tr id="emptyProduct" style="display: none;">
				<td colspan="7">등록된 상품이 없습니다.</td>
			</tr>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			if(${fn:length(productList) == 0}){
				$("#emptyProduct").show();
			}
			else{
				$("#emptyProduct").hide();
			}
		});
		
		//전체 선택===========================================
		let checkCnt = 0;
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=checkOne]").prop("checked", true);
				checkCnt = $("input[name=checkOne]").length;
				console.log(checkCnt)
			}else{
				$("input[name=checkOne]").prop("checked", false);
				checkCnt = 0;
			}
		});
		//개별 선택===========================================
		$(".checkOne").click(function(){
			if($(this).prop("checked"))checkCnt++;
			else checkCnt--;
			console.log("개별 선택 checkCnt:"+checkCnt);
			if(checkCnt==$("input[name=checkOne]").length)$("#checkAll").prop("checked",true);
			else $("#checkAll").prop("checked",false);
			
		});
		//삭제 버튼 클릭 ===========================================
		let product_ids = [];
		$(".btn_delete").click(function(){
			$(".checkOne").each(function(){
				if($(this).prop("checked")){
					let idx = $(".checkOne").index(this);
					product_ids.push(parseInt($(".hidden_product_id").get(idx).value));	
				}
			});
			$.ajax({
				url: "/project/product/rest/deleteSellerProduct",
				type: "POST",
				data : {
					product_ids : product_ids
					},
				success : function(){
					$(product_ids).each(function(i) {
						console.log("deleted product_id : " + product_ids[i]);
						$(".hidden_product_id").each(function(j) {
							if ($(this).val() == product_ids[i]) {
								$(this).parent().parent().remove();
							}
						});
					});
					$("#total_product_count").text($(".checkOne").length);
					if($(".checkOne").length == 0){
						$("#emptyProduct").show();
						$("#checkAll").prop("checked",false);
					}
				}
			});
		});					
		
		
		
		
	</script>
</body>
</html>