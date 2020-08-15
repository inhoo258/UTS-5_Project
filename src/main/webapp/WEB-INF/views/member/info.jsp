<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/member/info.css'/>" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"
	integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
	integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg=="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header&footer/header.jsp" />
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
						<li><a>&nbsp;&nbsp;상품 총 관리</a>>&nbsp;&nbsp;</li>
						<li><a>&nbsp;&nbsp;주문 총 관리</a>>&nbsp;&nbsp;</li>
						<li><a>&nbsp;&nbsp;월별 매출 통계</a>>&nbsp;&nbsp;</li>
					</ul>
				</section>
			</div>
			<div id=contents_div>
				<!-- 1. 개인 정보 수정 -->
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
										<input type="password" name="member_pw"
											placeholder="비밀번호를 입력해주세요">
									</div>
									<div class="frameA">
										<input type="button" value="전송" onclick="pwd_send()">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id=pw_section_form>
						<jsp:include page="form.jsp" />
					</div>
				</div>
				<!-- 2. 나의 구매 목록 -->
				<div>
					<h2>나의 구매 목록</h2>
					<div id=contents_bouthlist_table>
						<c:set var="totalCost" value="0" />
						<div class="orderlist_section">
							<c:choose>
								<c:when test="${not empty orderLists}">
									<section>
										<c:forEach var="orderList" items="${orderLists}">
											<c:set var="totalCost" value="0" />
											<c:forEach var="order" items="${orderList}">
												<c:set var="totalCost"
													value="${totalCost + order.order_price}" />
											</c:forEach>
											<table class="orderlist_table" border="1"
												style="border-collapse: collapse;">
												<tr onclick="pro_info(${orderList[0].order_group_number})">
													<td><span class="order_num"> 주문번호 <span
															class="order_group_number">${orderList[0].order_group_number}</span>
													</span> <i class="fas fa-chevron-right"></i></td>
												</tr>
												<tr>
													<td>
														<div id=main_content_div>
															<span class="span_order_info span_three">상 품 명 </span><span>${orderList[0].product_name}
																외 ${fn:length(orderList)-1}개</span>
														</div>
														<div>
															<span class="span_order_info">결제 일시 </span>
															<fmt:formatDate value="${orderList[0].order_date}"
																pattern="yyyy-MM-dd HH:mm:ss" />
														</div> <c:set var="order_tel"
															value="${orderList[0].order_receiver_tel}" /> <c:set
															var="order_tel_len" value="${fn:length(order_tel)}" /> <c:set
															var="order_tel_len_check"
															value="${order_tel_len eq 10 ? 6:7}" /> <c:set
															var="order_tel_first"
															value="${fn:substring(order_tel,0,3)}" /> <c:set
															var="order_tel_second"
															value="${fn:substring(order_tel,3,order_tel_len_check)}" />
														<c:set var="order_tel_third"
															value="${fn:substring(order_tel,order_tel_len_check,order_tel_len)}" />
														<div>
															<span class="span_order_info span_three">연 락 처 </span>${order_tel_first}-${order_tel_second}-${order_tel_third}</div>
														<div>
															<span class="span_order_info span_three">배 송 지 </span>${orderList[0].order_receiver_main_address}
															${orderList[0].order_receiver_sub_address}
														</div>
														<div>
															<span class="span_order_info">결제 금액 </span>
															<fmt:formatNumber value="${totalCost}" pattern="#,###" />
														</div>
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
				<!-- 3. 상품 관리 -->
				<div>
					<h2>상품 관리</h2>
					<div id="contents_productlist_search">
						<table border="1">
							<tr>
								<td colspan="4">재고상태</td>
								<td><input type="radio" name="statusproduct"
									id="statusproduct"><font for="#statusproduct">품절</font>
									<input type="radio" name="statusproduct" id="statusproduct"><font
									for="#statusproduct">품절</font></td>
							</tr>
							<tr>
								<td colspan="4">검색조건</td>
								<td><select>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
								</select> <input type="text"><input type="button" value="검색">
								</td>
							</tr>
							<tr>
								<td>21</td>
								<td>22</td>
								<td>23</td>
								<td>24</td>
							</tr>
							<tr>
								<td>31</td>
								<td>32</td>
								<td>33</td>
								<td>34</td>
							</tr>
							<tr>
								<td>41</td>
								<td>42</td>
								<td>43</td>
								<td>44</td>
							</tr>
							<tr>
								<td>51</td>
								<td>52</td>
								<td><input type="button" value="등록"
									onclick="location.href='/project/product/upload'"></td>
								<td><input type="button" value="취소"></td>
							</tr>
						</table>
					</div>
					<div id=contents_sellerprdoct_list>
						<!-- 						<table id="order_table" border="1"> -->
						<!--                        		 <tr> -->
						<!-- 	                            <th>제품번호</th> -->
						<!-- 	                            <th>제 품 명</th> -->
						<!-- 	                            <td>상품가격</td> -->
						<!-- 	                            <td>재고</td> -->
						<!-- 	                            <td>등록일</td> -->
						<!-- 	                            <td>수정</td> -->
						<!--                				 </tr> -->
						<!-- 						</table> -->
					</div>
				</div>
				<!--   4. 주문 관리 -->
				<div>
					<h2>주문 총 관리</h2>
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

				<!-- 지현 start ============================== -->
				<!--  5.월별 매출 통계 -->
				<div>
					<h2>월별 매출 통계</h2>
					<table>
						<tr>
							<td>
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="0"
									style="BORDER: #dcdcdc 1px solid; padding: 0 0 0 0">
									<tr height="0">
										<td width="15%"></td>
										<td width="*%"></td>
									</tr>
									<tr>
										<td height="1" colspan="4" bgcolor="#dfdfdf"></td>
									</tr>
									<tr height="25">
										<td class="item_title_border">년월선택</td>
										<td class="item_input">
										<select id="fd_year" name="fd_year" style="width: 130px;">
											<option value=""></option>
										</select> 
										<select id="fd_month" name="fd_month" style="width: 130px;"></select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<div style="width: 100%">
						<canvas id="myChart" width="900" height="600"></canvas>
					</div>
				</div>
				<!-- 지현  end============================== -->

			</div>
		</div>
	</div>
	<script>
	    function pwd_send(){
			var xhr = new XMLHttpRequest();
	        xhr.open("post", "/project/member/rest/password_test");
	        xhr.setRequestHeader("content-type", "application/json");
	//	        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
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
	            	console.log("나의 구매 목록")
	            }else if(contents_div_index == 3){
	            	$.ajax({
	    				url:'<c:url value="/product/sellerProductList"/>',
	    				type:'GET',
	    				success:function(seller_product_list){
// 	    					alert(seller_product_list);
// 	    					$('#contents_sellerprdoct_list').append(seller_product_list);
	    				},error:function(){
	    					alert('실패');
	    				}
	    			}) 
	            }else if(contents_div_index == 5){
	            	console.log("매출 통계")
	            	sales_month(2020);
	            }
	            $("#contents_div>div:nth-child("+contents_div_index+")").css({"display" : "block"});
	        });
	    
	    </script>
	<script type="text/javascript">
// 		1: ${sellerInfo}<br>
// 		4: ${sellerInfo.seller_company_info}<br>
// 		5: ${sellerInfo.seller_company_tel}<br>
// 		6: ${sellerInfo.seller_company_main_address}<br>
// 		7: ${sellerInfo.seller_company_sub_address }<br>
// 		8: ${sellerInfo.seller_company_email }<br>
// 		9: ${sellerInfo.seller_company_name}<br>
// 		10: ${sellerInfo.seller_company_head_name}<br>

	    function pro_info(order_number){
	    	let member_id = "${member.member_id}"
	    	
	    	console.log(order_number)
	    	console.log(member_id)
			$.ajax({
				url:"/project/product/rest/orderview",
				type:'POST',
				data:{
					member_id:member_id,
					order_group_number:order_number
				},success:function(order_list_info){
					console.log(order_list_info[0][0])
					console.log(order_list_info[0][1])
					console.log(order_list_info.length)
					console.log(order_list_info[0].length)
// 					let orderview =(function(){
// 						for(var i = 0 ; i < order_list_info.length ; i++){
// 							return "<table>"+
// 							"<div>배송 또는 상품에 문제가 있나용?<a href='#'>1:1 문의하기 ></a></div>"+
							
// 							"</table>"
// 						}
						
// 					})()
// 					console.log(orderview)
				}
			})
	    }
    </script>
	<!-- 지현 start ============================== -->
	<script>
	// 날짜 선택  j쿼리
    $(document).ready(function(){            
        var now = new Date();
        var nowYear = now.getFullYear();
        var nowMonth = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);            
        console.log(now)
        console.log(nowYear)
        console.log(nowMonth)
        
        //년도 selectbox만들기               
        for(var sy = 2018 ; sy <= nowYear ; sy++) {
            $('#fd_year').append('<option value="' + sy + '">' + sy + '년</option>');    
        }

        // 월별 selectbox 만들기            
        for(var i=1; i <= 12; i++) {
            var sm = i > 9 ? i : "0"+i ;            
            $('#fd_month').append('<option value="' + sm + '">' + sm + '월</option>');    
         }            
        
        $("#fd_year>option[value="+nowYear+"]").attr("selected", "true");    
        $("#fd_month>option[value="+nowMonth+"]").attr("selected", "true");             
    })
    
    
    	//그래프 j쿼리
	    var ctx = document.getElementById('myChart');
	    
	    function sales_month(year){
	    	console.log(year);
	    	let month_sales_cnt = [];
		    var xhr = new XMLHttpRequest();
	        xhr.open("post", "/project/member/rest/monthly_sales");
	        xhr.setRequestHeader("content-type", "application/json");
			//xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			xhr.send(JSON.stringify(year));
			xhr.onreadystatechange = function () {
	            if (xhr.readyState === xhr.LOADING) {
	                $("#loding").show();
	            }
	            if (xhr.readyState === xhr.DONE) {
	                if (xhr.status === 200 || xhr.status === 201) {
	                	let monthly_sales = JSON.parse(xhr.responseText)
	                	console.log("monthly_sales : "+monthly_sales);
	                	console.log(monthly_sales);
	                	console.log(monthly_sales.length);
	                	for (var i = 0; i < monthly_sales.length; i++) { 
	                		console.log((i+1)+"월 : "+i)
	                		if(monthly_sales[i].length!=0){
	               				let cnt = 0 ;
	                			for (var j = 0; j < monthly_sales[i].length; j++) {
	                				console.log("구매건의  인덱스j : "+j);
									console.log("order_product_count : "+monthly_sales[i][j].order_product_count);
									console.log("order_price : "+monthly_sales[i][j].order_price);
									cnt+=monthly_sales[i][j].order_product_count
								}
								month_sales_cnt.push(cnt);
	                		}else{
	                			month_sales_cnt.push(0);
	                		} 
	                			
						}
	                	
	                	
	                }
	                
	                insertChart(month_sales_cnt)
	            }
	        }
	    }
	    function insertChart(month_sales_cnt){
            
	    var myChart = new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월'],   // 차트 라벨명=> 날짜가 들어와야함
	            datasets: [{
	                label: '#월별 상품 판매량 ', 
	                data: [ month_sales_cnt[0] , month_sales_cnt[1] ,month_sales_cnt[2] ,month_sales_cnt[3] ,month_sales_cnt[4] ,month_sales_cnt[5] ,
	                	month_sales_cnt[6] ,month_sales_cnt[7] ,month_sales_cnt[8] ,month_sales_cnt[9] ,month_sales_cnt[10] ,month_sales_cnt[11] 
	                	],    //데이터 배열=> 판매 건수가 들어와야함
	              	fill:false,
// 	                backgroundColor: [
// 	                ],
	                borderColor: [
	                    'rgba(80, 195, 195, 1)'
	                ],
	                borderWidth: 2    // 차트 테두리 두께
	            }]
	        },
	        options: {
	            responsive: false,
	            title: {
	                display: true,
	                text: '년 매출 건 수',
	                // fontColor: "red",
	                fontSize: 20
	            },
	            scales: {
	                yAxes: [{   //  y축에 관련된 옵션 
	                    ticks: {
	                        beginAtZero: true   //데이터 표기를 0부터 표기
	                    }
	                }]
	            },
	            animation: {
					duration: 1,
					onComplete: function () {
						var chartInstance = this.chart,
							ctx = chartInstance.ctx;
						ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						ctx.fillStyle = 'purple';
						ctx.textAlign = 'center';
						ctx.textBaseline = 'bottom';

						this.data.datasets.forEach(function (dataset, i) {
							var meta = chartInstance.controller.getDatasetMeta(i);
							meta.data.forEach(function (bar, index) {
								var data = dataset.data[index];							
								ctx.fillText(data, bar._model.x, bar._model.y - 5);
							});
						});
					}
				}
	        }
	    });
	    }
	</script>
	<!-- 지현 start ============================== -->
</body>
</html>