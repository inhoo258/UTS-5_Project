<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
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
                        <li><a>&nbsp;&nbsp;상품 총 관리</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;주문 총 관리</a>>&nbsp;&nbsp;</li>
                    </ul>
                </section>
            </div>
            <div id=contents_div>
                <div>
	                <div id=pw_section_test>
	                    <h2>개인정보 수정</h2>
	                    <div id=contents_notis_table>
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
                    <h2>나의 구매 목록</h2>
					<div>
						<table id="order_table">
                       		 <tr>
	                            <th>제품번호</th>
	                            <th>제 품 명</th>
	                            <td>구매수량</td>
	                            <td>결제금액</td>
	                            <td>결제기간</td>
	                            <td>결제상태</td>
               				 </tr>
						</table>
					</div>
                </div>
                <div>
                    <h2>상품 총 관리</h2>
                    <h4></h4>
                </div>
                <div>
                    <h2>주문 총 관리</h2>
                    <h4></h4>
                </div>
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
            	alert("여기");
            	$.ajax({
    				url:'<c:url value="/product/rest/orderlist/${member.member_id}"/>',
    				type:'GET',
    				success:function(orderlist){
    					showMyOrderList(orderlist);
    				},error:function(){
    					alert('실패');
    				}
    			}) 
            }
            $("#contents_div>div:nth-child("+contents_div_index+")").css({"display" : "block"});
        });
    
        
        
        function showMyOrderList(orderList){
        	let order_list;
        	for(var i = 0 ;i < orderList[0].length ; i++){
				order_list += 
					'<tr>'
					+'<td>'+orderList[0][i].order_number+'</td>'
					+'<td>'+orderList[0][i].product_name+'</td>'
					+'<td>'+orderList[0][i].order_product_count+'</td>'
					+'<td>'+orderList[0][i].order_price+'</td>'
					+'<td>'+orderList[0][i].order_date+'</td>'
					+'<td>'+orderList[0][i].order_status+'</td>'
					+'</tr>'
        	}
        	$("#order_table").append(order_list);
        };
// 	        	"<p>"member_id : +orderList[0][i].member_id+"</p>"+
// 		       	"<p>"product_name : +orderList[0][i].product_name+"</p>"+
// 		       	"<p>"+orderList[0][i].product_id+"</p>"+
// 		       	"<p>"+orderList[0][i].order_date+"</p>"+
// 		       	"<p>"+orderList[0][i].order_receiver_main_address+"</p>"+
// 		       	"<p>"+orderList[0][i].order_receiver_sub_address+"</p>"+
// 		       	"<p>"+orderList[0][i].order_receiver_name+"</p>"+
// 		       	"<p>"+orderList[0][i].order_receiver_tel+"</p>"+
// 		       	"<p>"+orderList[0][i].order_product_count+"</p>"+
// 		       	"<p>"+orderList[0][i].order_price+"</p>"+
// 		       	"<p>"+orderList[0][i].order_request+"</p>"+
// 		       	"<p>"+orderList[0][i].order_status+"</p>"+
// 		       	"<p>"+orderList[0][i].order_number+"</p>"+
// 		       	"<p>"+orderList[0][i].order_group_number+"</p>"+
// 		       	"<p>"+orderList[0][i].review_check+"</p>"+
// 		       	"<p>"+orderList[0][i].product_weight+"</p>"+
// 		       	"<p>"+orderList[0][i].seller_company_name+"</p>"+
// 		       	"<p>"+orderList[0][i].seller_company_tel+"</p>"+
// 		       	"<p>"+orderList[0][i].order_delivery_price+"</p>"
    </script>
	    
<%-- 		1: ${sellerInfo}<br> --%>
<%-- 		4: ${sellerInfo.seller_company_info}<br> --%>
<%-- 		5: ${sellerInfo.seller_company_tel}<br> --%>
<%-- 		6: ${sellerInfo.seller_company_main_address}<br> --%>
<%-- 		7: ${sellerInfo.seller_company_sub_address }<br> --%>
<%-- 		8: ${sellerInfo.seller_company_email }<br> --%>
<%-- 		9: ${sellerInfo.seller_company_name}<br> --%>
<%-- 		10: ${sellerInfo.seller_company_head_name}<br> --%>
</body>
<script type="text/javascript">

//         let infotitle = document.getElementById("infotitle");
//         let orderList = document.getElementById("orderlist");
//         let modify = document.getElementById("myinfomodify");
//         let upload = document.getElementById("uploadproduct");
//         let myinfocollection = document.getElementsByName("myinfocollection");
//         let adminPage = document.getElementsByName("adminpage");
//         let orderbtn = document.getElementsByName("orderadminbtn");
// 		let message = "${message }";
//         $(function () {
//             var $productmenu = $('#productbar_menu ul li');
//             $contentsproduct = $('#productadminbarpage > div');
//             $productmenu.click(function (y) {
//                 y.preventDefault();
//                 $productmenu.removeClass('on');
//                 $(this).addClass('on');
//                 var pidx = $(this).index();
//                 console.log(pidx)
//                 if (pidx == 0) {
//                     $('#productadminbarpage').animate({ "top": "0px" }, 500)
//                 } else if (pidx == 1) {
//                     $('#productadminbarpage').animate({ "top": "-800px" }, 500)
//                 } else if (pidx == 2) {
//                     $('#productadminbarpage').animate({ "top": "-1600px" }, 500)
//                 } else {
//                     $('#productadminbarpage').animate({ "top": "-2400px" }, 500)
//                 }
//             });
//         })

//         $(function () {
//             var $menu = $('#orderbar_menu ul li'),
//                 $contents = $('#orderadminbarpage > div');
//             $menu.click(function (x) {
//                 x.preventDefault();
//                 $menu.removeClass('on');
//                 $(this).addClass('on');
//                 var idx = $(this).index();
//                 if (idx == 0) {
//                     $('#orderadminbarpage').animate({ "top": "0px" }, 500)
//                 } else if (idx == 1) {
//                     $('#orderadminbarpage').animate({ "top": "-800px" }, 500)
//                 } else if (idx == 2) {
//                     $('#orderadminbarpage').animate({ "top": "-1600px" }, 500)
//                 } else if (idx == 3) {
//                     $('#orderadminbarpage').animate({ "top": "-2400px" }, 500)
//                 } else if (idx == 4) {
//                     $('#orderadminbarpage').animate({ "top": "-3200px" }, 500)
//                 } else if (idx == 5) {
//                     $('#orderadminbarpage').animate({ "top": "-4000px" }, 500)
//                 } else {
//                     $('#orderadminbarpage').animate({ "top": "-4800px" }, 500)
//                 }
//             });
//         });
        
        
    </script>
</html>