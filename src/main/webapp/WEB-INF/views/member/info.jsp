<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/member/info.css'/>" />
</head>
<body>
<jsp:include page="../header&footer/header.jsp"/>
   <sec:authorize access="hasRole('ROLE_CUSTERMER')"></sec:authorize>
   <sec:authorize access="hasRole('ROLE_SELLER')"></sec:authorize>
	<div id=center_div>
        <div>
            <div>
                <h1>마이메뉴</h1>
                <section id=center_menu_section>
                    <ul>
                        <li><a>&nbsp;&nbsp;개인 정보 수정</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;나의 구매 목록</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;상품 관리</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;주문 관리</a>>&nbsp;&nbsp;</li>
                    </ul>
                </section>
            </div>
            <div id=contents_div>
                <div>
	                <div id=pw_section_test>
	                    <h2>개인정보 수정</h2>
	                    <div id=contents_modify>	
	                        <div>
	                    		<h4>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</h4>
	                    	</div>
							<div id="myinfomodifyframe">
								<div>
									<div class="frameA ">
										<input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요">
									</div>
									<div class="frameA">
										<input type="button" value="전송" onclick="pwd_send()">
									</div>
								</div>
							</div>
	                    </div>
	                 </div>
	                 <div id=pw_section_form>
						<jsp:include page="form.jsp"/>
					</div>            
                </div>
                <div>
                    <h2>나의 구매 목록 </h2>
					<div id=contents_bouthlist_table>
						<c:set var="totalCost" value="0" />
					    <div class="orderlist_section">
					        <c:choose>
					            <c:when test="${not empty orderLists}">
					                <section id=table_section>
					                    <c:forEach var="orderList" items="${orderLists}" varStatus="table_number">
					                        <c:set var="totalCost" value="0" />
					                        <c:forEach var="order" items="${orderList}">
					                            <c:set var="totalCost" value="${totalCost + order.order_price}" />
					                        </c:forEach>
					                        <table class="orderlist_table" border="1" style="border-collapse: collapse;">
					                            <tr onclick="pro_info(${orderList[0].order_group_number} , ${table_number.index+1})">
					                                <td>
					                                    <span class="order_num">
					                                        	주문번호 <span class="order_group_number">${orderList[0].order_group_number}</span>
					                                    </span>
					                                    <i class="fas fa-chevron-right"></i>
					                                </td>
					                            </tr>
					                            <tr id="tr">
					                                <td>
					                                    <div id=main_content_div>
					                                        <span class="span_order_info span_three">상 품 명  </span><span>${orderList[0].product_name} 외 ${fn:length(orderList)-1}개</span>
					                                    </div>
					                                        <div><span class="span_order_info">결제 일시 </span><fmt:formatDate value="${orderList[0].order_date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					                                        <c:set var="order_tel" value="${orderList[0].order_receiver_tel}" />
					                                        <c:set var="order_tel_len" value="${fn:length(order_tel)}" />
					                                        <c:set var="order_tel_len_check" value="${order_tel_len eq 10 ? 6:7}" />
					                                        <c:set var="order_tel_first" value="${fn:substring(order_tel,0,3)}" />
					                                        <c:set var="order_tel_second" value="${fn:substring(order_tel,3,order_tel_len_check)}" />
					                                        <c:set var="order_tel_third" value="${fn:substring(order_tel,order_tel_len_check,order_tel_len)}" />
					                                        <div><span class="span_order_info span_three">연 락 처  </span>${order_tel_first}-${order_tel_second}-${order_tel_third}</div>
					                                        <div><span class="span_order_info span_three">배 송 지  </span>${orderList[0].order_receiver_main_address} ${orderList[0].order_receiver_sub_address}</div>
					                                        <div><span class="span_order_info">결제 금액  </span><fmt:formatNumber value="${totalCost}" pattern="#,###" /></div>
					                                </td>
					                            </tr>
					                        </table>
					                    </c:forEach>
					                </section>
					            </c:when>
					            <c:otherwise>
					                	주문 내역이 없습니다.
					            </c:otherwise>
					        </c:choose>
					    </div>
					</div>
                </div>
                <div id="contens_sellerproduct">
                    <h2>상품 관리</h2>
                    <div id="contens_sellerproduct_list" style="text-align: center;">
                    <p id="toptext">총 등록상품 <span id="total_product_count">${totalCount}</span>개</p>
                    <form action="/project/product/deleteSellerPoduct" method="post">
							<table border="1" style="border-collapse: collapse; text-align: center;">
								<tr>
									<td>
									 전체 선택 
									</td>
									<td rowspan="2">제품번호</td>
									<td rowspan="2">
										제품명
									</td>
									<td rowspan="2">
										상품가격
									</td>
									<td rowspan="2">
										상품재고
									</td>
									<td>
									 	상품 등록 : 
									</td>
									<td colspan="2"><input type="button" value="등록" id="btn_upload" onclick="window.open('/project/product/upload','새창','width:800px')"></td>
								</tr>
								<tr>
									<th>
										<input type="checkbox" id="checkAll">
									</th>	
									<th>
										등록일
									</th>	
									<th colspan="2">수정 / 삭제</th>
								</tr>
									<c:forEach var="product" items="${productList}">
										<tr>
											<td><input type="checkbox" name="checkOne" class="checkOne"></td>
											<td>${product.product_id}</td>
											<td>
												<div id="productimgframe"><img src='<c:url value="/product/img/${product.product_id}"/>'> </div>
			                                <div id="producttextframe">
			                                    <span>${product.product_name}asdjfklsadjfkljsdklfjlaksjdaklf</span>
			                                </div>
			                                <input type="hidden" value="${product.product_id }" class="hidden_product_id" name="product_ids">
											</td>
											<td>${product.product_price}</td>
											<td>${product.product_count}</td>
											<td>${product.product_upload_date}</td>
											<td><input type="button" id="modifiBotton" value="수정" onclick="window.open('/project/product/upload/${product.product_id}','새창','width:800px')"></td>
											<td><input type="submit" id="btn_delete" value="삭제"></td>
										</tr>
									</c:forEach>
								<tr id="emptyProduct" style="display: none;">
									<td colspan="7">등록된 상품이 없습니다.</td>
								</tr>
							</table>
						</form>
                	</div>
                </div>
                
                
                <div>
                    <h2>주문 관리</h2>
                    <div id="contents_orderlist_search">
                    	<table border="1">
                    		<tr>
                    			<td>검 색</td>
                    			<td><input type="text"></td>
                    			<td>13</td>
                    			<td>14</td>
	                    	</tr>
                    		<tr>
                    			<td>21</td>
                    			<td>22</td>
                    			<td>23</td>
                    			<td>24</td>
                    		</tr>
                    		<tr>
                    			<td>21</td>
                    			<td>22</td>
                    			<td>23</td>
                    			<td>24</td>
                    		</tr>
                    		<tr>
                    			<td>21</td>
                    			<td>22</td>
                    			<td>23</td>
                    			<td>24</td>
                    		</tr>
                    	</table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
		//전체 선택===========================================
		let checkCnt = 0;

		$("#checkAll").on("click",function(){
			if($(this).prop("checked")){
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
			console.log('checkOne 클릭')
			if($(this).prop("checked"))checkCnt++;
			else checkCnt--;
			console.log("개별 선택 checkCnt:"+checkCnt);
			if(checkCnt==$("input[name=checkOne]").length)$("#checkAll").prop("checked",true);
			else $("#checkAll").prop("checked",false);
			
		});
		//삭제 버튼 클릭 ===========================================
		let product_ids = [];
		$("#btn_delete").click(function(){
			$(".checkOne").each(function(){
				if(!$(this).prop("checked")){
					let idx = $(".checkOne").index(this);
// 					product_ids.push(parseInt($(".hidden_product_id").get(idx).value));	
// 					console.log("idx:"+$(".hidden_product_id").get(idx).value)
					$(".hidden_product_id").get(idx).setAttribute('disabled', false);
				}
			});
		})
		
	    function pwd_send(){
			var xhr = new XMLHttpRequest();
	        xhr.open("post", "/project/member/rest/password_test");
	        xhr.setRequestHeader("content-type", "application/json");
// 		        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			let member = {
				member_id:"${member.member_id}",
				member_pw:document.getElementsByName("member_pw")[0].value
			}
			xhr.send(JSON.stringify(member));
			xhr.onreadystatechange = function () {
	            if (xhr.readyState === xhr.LOADING) {
	                $("#loding").show();
	            }
	            if (xhr.readyState === xhr.DONE) {
	                if (xhr.status === 200 || xhr.status === 201) {
	                	let test = xhr.responseText;
						if(test == "true"){
							document.getElementById("pw_section_test").style.display = "none";
							document.getElementById("pw_section_form").style.display = "block";
						}else{
							console.log("false");
							alert('비밀번호가 틀립니다. 다시 입력해주세요.');
						}
	                }
	            }
			}
		}
    </script>
    <script type="text/javascript">
	    $("#center_menu_section>ul li:nth-child(1)").addClass("on");
	    $("#contents_div>div:nth-child(1)").css({"display" : "block"})
	    $("#center_menu_section>ul li").click(function() {
	         $(this).addClass("on");
	         $(this).siblings().removeClass("on");
	            let contents_div_index = $("#center_menu_section>ul li").index(this) + 1;
	            let li_count = $('#center_menu_section>ul li').length + 1;
	            for(var i = 0 ; i < li_count ; i++){
	                $("#contents_div>div:nth-child("+i+")").css({"display" : "none"});
	            }
	            if(contents_div_index == 2){
	            	$("#contents_div").css({"overflow" : "auto" , "height" : "100%"})
	            }else if(contents_div_index == 3){
					console.log('3번 클릭');	    			
	            }
	            $("#contents_div>div:nth-child("+contents_div_index+")").css({"display" : "block"});
	        });
	    
	    function pro_info(order_number , table_number){
	    	let member_id = "${member.member_id}"
	    	
	    	console.log("table_number : " + table_number)
	    	console.log("order_number : " + order_number)
	    	console.log("member_id : " + member_id)
			$.ajax({
				url:"/project/product/rest/orderview",
				type:'POST',
				data:{
					member_id:member_id,
					order_group_number:order_number
				},success:function(order_list_info){
					$("#orderview_details_table").remove()
// 					$("#table_section table:nth-child("+table_number+") tr:nth-child(2)").remove()
					console.log(order_list_info[0][0].order_price)
					console.log(order_list_info[0][1])
					console.log(order_list_info.length)
					console.log(order_list_info[0].length)
					let orderview_details = "";
					let orderview =(function(){
						for(var i = 0 ; i < order_list_info.length ; i++){
							return "<table id='orderview_details_table' border='1' style='background-color:red; width:100% ; height:300px;'><tr><th colspan='4'><div>배송 또는 상품에 문제가 있나용?<a href='#'>1:1 문의하기 ></a></div></th></tr>"
							+(function(){
								for(var y = 0 ; y < order_list_info[0].length ; y++){
									var price = numberWithCommas(order_list_info[0][y].order_price);
									orderview_details += "<tr><th>"
										+"<img id='orderlist_product_img' src='/project/product/img/"+order_list_info[0][y].product_id+"' width='200px'>"
										+"<input type='hidden' value='${order.order_number}'>"
										+"</th>"
										+"<td>"
										+"<div>["+order_list_info[0][y].seller_company_name+"]"+order_list_info[0][y].product_name+"</div>" 
										+"<span>"+price+"원 </span>"
										+"<span>"+order_list_info[0][y].order_product_count+"개 구매</span>"
										+"<div>요청사항<span>"+order_list_info[0][y].order_request+"</span></div>"
										+"</td>"
										+"<td>"
										+"<div class='order_status'>"+order_list_info[0][y].order_status+"</div>"
										+"</td>"
										+"<td>"
										+"<form name='reviewForm'>"
										+"<input type='hidden' name='member_id' value='"+order_list_info[0][y].member_id+"'>"
										+"<input type='hidden' name='order_number' value='"+order_list_info[0][y].order_number+"'>"
								    	+"<input type='hidden' name='table_number_index' value='"+table_number+"'>"
								    	+"<input type='hidden' name='order_group_number' value='"+order_number+"'>"
										+"<input type='button' value='후기 쓰기' class='review_writing'>"
										+"</form>"
										+"<input type='hidden' class='review_check' value='"+order_list_info[0][y].review_check+"'>"
										+"<input type='hidden' value='"+order_list_info[0][y].review_check+"'>"
										+"</td>"
										+"</tr>"
								}
								return orderview_details
							})()
							+"<tr>"
							+"<td colspan='2'>배송비 : "+order_list_info[0][i].order_delivery_price+"</td>"
							+"<th colspan='2'>"
							+"<input type='hidden' name='order_group_number' value='"+order_list_info[0][i].order_group_number+"'>"
							+"<input type='hidden' name='member_id' value='${member_id}'>"
							+"<input id='cancel_btn' type='submit' value='주문 취소'>"
							+"</th>"
							+"</tr>"
							+"</table>"
						}
					})()
					$("#table_section table:nth-child("+table_number+")").append(orderview);
					review_check();
					$(".review_writing").addClass("on");
				}
			})
	    }
	    function review_check(){
		    $(".review_check").each(function(){
		 	   if($(this).val()!=0){
		 		   let idx = $(".review_check").index(this);
		 		   console.log("!=0 idx : "+idx);
		 		   $(".review_writing").get(idx).disabled="true";
		 		   $(".review_writing").get(idx).style.color="#908d8d";
		 		   $(".review_writing").get(idx).style.backgroundColor="white";
		 		   $(".review_writing").get(idx).style.border="1px solid #9a9a9a";
		 		   $(".review_writing").get(idx).value="작성 완료";
		 	   }
		    });
	    }
	    
	    $(".orderlist_table").on("click",".review_writing.on", function(){
	    	let idx = $(".review_writing").index(this);
            if($(".order_status").get(idx).innerText!="배송중"){
            	alert("후기는 배송완료 후 가능");
            	return ;
            }
            let reviewForm;
            if ($(".review_writing").length > 1)
               reviewForm = document.reviewForm[idx];
            else
               reviewForm = document.reviewForm;
            window.open("", "reviewForm",
                  "width=700, height=700, resizable=no");
            reviewForm.action = "<c:url value='/board/review/form'/>";
            reviewForm.method = "POST";
            reviewForm.target = "reviewForm";
            reviewForm.submit();
       	});
	    
	    
// 		가격 패턴 함수
		function numberWithCommas(value) {
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
    </script>
</body>
</html>