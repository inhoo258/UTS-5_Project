<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myorderList</h1>
<jsp:include page="../header&footer/header.jsp" />
<!-- 주문내역에서 필요한 것들 -->
<!-- 사진, 결제방법 -->
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
						<c:forEach var="cart" items="${myOrderList}">
							<tr>
								<td style="padding-left: 20px;">
									<input type="checkbox" class="ico_check" style="margin-right: 40px;">
									<input type="hidden"class="hidden_product_id" name="product_ids" value="${cart.product_id}">
									<span>
										<a href='<c:url value="/product/${cart.product_id}"/>'>
										<img src='<c:url value="/product/img/${cart.product_id}"/>' width="80px"></a>
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
				
				<hr>
				<hr>
				<hr>
				<hr>
				<hr>
				<hr>
<c:forEach var="myOrderList" items="${myOrderList}">
    <section>
        <div class="collectionOrder">
            <div class="sectiontop">
                <div class="topoption2"><span class="onebyone">배송또는 상품에 문제가 있나요? <a href="#">1:1 문의하기 ></a></span></div>
                <div class="topoption1"><span class="ordernum">주문번호 : 1540384442344</span></div>
            </div>
            <hr>
            <table class="myorderproduct">
                <tr>
                    <td colspan="4">
                        <h5 class="mptitle">[픽어베이글] 베이글 4종</h5>
                    </td>
                </tr>
                <tr>
                    <td><img id="myorderimg" src='<c:url value = "/product/img/${myOrderList.product_id}"/>'></td>
                    <td>
                        <span>[픽미 베이글] 통밀 베이글</span><br>
                        <span>2600원</span><br>
                        <span>${myOrderList.order_product_count}개 구매</span>
                    </td>
                    <td><span>${myOrderList.order_status}배송완료</span></td>
                    <td>
                        <input class="" type="button" value = "후기쓰기" ><br>
                        <input type="button" value = "주문 취소하기" >
                    </td>
                </tr>
            </table>
        </div>
    </section>
</c:forEach>

</body>
</html>

