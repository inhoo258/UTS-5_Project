<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/info.css'/>" />
</head>
<body>
<<<<<<< HEAD
<jsp:include page="../header&footer/header.jsp"/>
   <sec:authorize access="hasRole('ROLE_CUSTOMER')"> 
   <section id="info-main">
=======
<section id="info-main">
>>>>>>> refs/remotes/origin/getout
        <div class="first">
            <div>
                <div class="myinfotextframe">
                    <div>
                        <h2>내 정 보</h2>
                    </div>
                    <div class="maininfo">
                        <p><span>${member.member_name }</span><span>님</span><span>[ ${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'} ]</span></p>
                    </div>
                </div>
                <div class="myinfotextframe">
                	<div>
                        <h2>세 부 정 보</h2>
                    </div>
                    <div class="subinfo">
                    	<div id="keyframe">
                    		<p><span id="key">아이디</span></p>
                    		<p><span id="key">전화번호</span></p>
                    		<p><span id="key">주소</span></p>
                    		<p><span id="key">상세주소</span></p>
                    		<p><span id="key">이메일</span></p>
                    	</div>
                    	<div id="valueframe">
                    		<p><span id="value">${member.member_id}</span></p>
                    		<p><span id="value">${member.member_tel }</span></p>
                    		<p><span id="value">${member.member_main_addr }</span></p>
                    		<p><span id="value">${member.member_sub_addr }</span></p>
                    		<p><span id="value">${member.member_email }</span></p>
                    	</div>
                    </div>
                </div>
                <div class="myinfotextframe infoframeB">
                    <div>
                        <h2>내가 산 총 금액</h2>
                    </div>
                    <div>
                    	<p><span id="value">10000</span></p>
                    </div>
                    <div>
                        <h2>등급</h2>
                    </div>
                    <div>
                    	<p><span id="value">Gold</span></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="secondsection">
            <div>
                <div>
                    <p>나의 메뉴</p>
                    <ul>
                        <li>
                            <a href="#" onClick="orderLists()">나의 주문 내역<p>></p></a>
                        </li>
                        <li>
<<<<<<< HEAD
                            <a href="#myinfomodifyform">회원 정보 수정<p>></p></a>
=======
                            <a href="#myinfomodifyform" onClick="myinfomodify()">개인 정보 수정<p>></p></a>
                        </li>
                        <li>
                            <a href='#' onClick="showmenubar()">상품 관리<p>></p></a>
                        </li>
                        <li >
                        	<a href="<c:url value="/product/sellerProductList"/>">상품 조회 / 수정</a>
                        </li>
                        <li>
                        	<a href="<c:url value="/product/upload"/>">상품 등록</a>
                        </li>
                        <li>
                            <a href="#" >주문 관리<p>></p></a>
                        </li>
<!--                         <li> -->
<!--                         	<a href="#">신규 주문()</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                         	<a href="#">주문 취소()</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                         	<a href="#">상품준비 완료시 배송상태()</a> -->
<!--                         </li> -->
                        <li>
                            <a href="#">판매자 정보 수정<p>></p></a>
>>>>>>> refs/remotes/origin/getout
                        </li>
                    </ul>
                </div>
                <div>
                    <p id="infotitle"></p>
                    <hr>
                    <ul>
                        <li id="orderlist" style="display: none">
                            <div>
                                <jsp:include page="../product/orderlist.jsp"></jsp:include>
                            </div>
                        </li>
                        <li id="myinfomodify" style="display: none">
                            <div id="myinfomodifysubtitle">
                                  <h2>비밀번호 재확인</h2>
                                  <h5>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</h5>
                                  <hr>
                            </div>
                            <form action="<c:url value='/member/checkpwd'/>" method="post">
                                <div id="myinfomodifyform" >
                                    <div id="myinfomodifyframe">
                                        <div class="frameA ">
                                            <input type="hidden" name="member_id" value="${member.member_id}">
                                            <input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="frameA">
                                            <input type="submit" value="전송">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <hr>
                         </li>
                    </ul>
                </div>
            </div>
            </div>
    	</section>
   </sec:authorize>
   <sec:authorize access="hasRole('ROLE_SELLER')"> <!--============================================ 여기는 판매자 권한인 사람 -->
  <!--============================================ 여기는 판매자 권한인 사람 -->
    <!--============================================ 여기는 판매자 권한인 사람 -->
    <!--============================================ 여기는 판매자 권한인 사람 -->
   <section id="info-main">
        <div class="first">
            <div>
                <div class="myinfotextframe">
                    <div>
                        <h2>내 정 보</h2>
                    </div>
                    <div class="maininfo">
                        <p><span>${member.member_name }</span><span>님</span><span>[ ${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'} ]</span></p>
                        <p><span>사업자 번호 : </span><span>[ ${sellerInfo.seller_reg_num} ]</span></p>
                    </div> 
                    <div>
                    </div>
                </div>
                <div class="myinfotextframe">
                    <div>
                        <h2>세 부 정 보</h2>
                    </div>
                    <div class="subinfo">
                        <div id="keyframe">
                            <p><span id="key">아이디</span></p>
                            <p><span id="key">전화번호</span></p>
                            <p><span id="key">주소</span></p>
                            <p><span id="key">상세주소</span></p>
                            <p><span id="key">이메일</span></p>
                        </div>
                        <div id="valueframe">
                            <p><span id="value">${sellerInfo.member_id}</span></p>
                            <p><span id="value">${member.member_tel }</span></p>
                            <p><span id="value">${member.member_main_addr }</span></p>
                            <p><span id="value">${member.member_sub_addr }</span></p>
                            <p><span id="value">${member.member_email }</span></p>
                        </div>
                    </div>
                </div>
                <div class="infoframeB">
                    <div>
                        <h2>나의 총 구매 금액</h2>
                    </div>
                    <div>
                        <p><span id="value">10000</span></p>
                    </div>
                    <div>
                        <h2>회원 님의 등급</h2>
                    </div>
                    <div>
                        <p><span id="memberclass">Gold</span></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="secondsection" id="secsecond">
            <div>
                <div>
                    <ul>
                        <li>
                            <a href="#memberclass" name="myinfocollection">판매자 정보 수정<p>></p></a>
                        </li>
                        <li>
                            <a href="#memberclass" name="myinfocollection">나의 구매 내역<p>></p></a>
                        </li>
                        <li>
                            <a href="#memberclass" name="myinfocollection">상품 관리<p>></p></a>
                        </li>
                        <li>
                            <a href="#memberclass" name="myinfocollection">주문 관리<p>></p></a>
                        </li>
                    </ul>
                </div>
                <div>
                    <ul>
                        <!--                         ============================================================================= myinfomodify-->
                        <li id="myinfomodify" name="adminpage" style="display: none;">
                        	<section id=pw_section_test>
	                            <div id="myinfomodifysubtitle">
	                                <h2>비밀번호 재확인</h2>
	                                <h5>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</h5>
	                                <hr>
	                            </div>
	                            <div id="myinfomodifyform">
	                            	<div id="myinfomodifyframe">
										<div class="frameA ">
											<input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요">
		                                </div>
										<div class="frameA">
		                                	<input type="button" value="전송" onclick="pwd_send()">
										</div>
	                                </div>
	                             </div>
                             </section>
                             <section id=pw_section_form>
	                             <jsp:include page="form.jsp"/>
                             </section>
                        </li>
                        <!--============================================================================= orderlist-->
                        <li id="orderlist" name="adminpage" style="display: none;">
                       		<div>
                       			<div id="ajaxlistlayout">
                       				
                       			
                       			
                       			</div>
                       		</div>
                        </li>
                        <!--====================================================================================== uploadproduct-->
                        <li id="uploadproduct" name="adminpage" style="display: none;">
                            <div class="productadminframe">
                                <div class="productadminbar" id="productbar_menu">
                                    <ul>
                                        <li class="on"><a href="#producttotaladmin">상품 총 관리</a></li>
                                        <li><a href="#productlist">상품 목록</a></li>
                                        <li><a href="#productupload">상품 등록</a></li>
                                        <li><a href="#productcancel">상품 삭제</a></li>
                                    </ul>
                                </div>
                                <div class="productpageframe">
                                    <div class="productadminbarpage" id="productadminbarpage">
                                        <div id="producttotaladmin">
                                            <h3>상품 총 관리</h3>
                                            <div>아아</div>
                                        </div>
                                        <div id="productlist">
                                            <h3>상품 목록</h3>
                                        </div>
                                        <div id="productupload">
                                            <h3>상품 등록</h3>
                                        </div>
                                        <div id="productcancel">
                                            <h3>상품 삭제</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!--======================================================================================= order-->
                        <li id="orderadmin" name="adminpage">
                            <div class="orderadminframe">
                                <div class="orderadminbar" id="orderbar_menu">
                                    <ul>
                                        <!-- <p id="infotitle">판매자 정보 수정</p> -->
                                        <li class="on"><a href="#ordertotaladmin">주문 총 관리</a></li>
                                        <li><a href="#checkmoney">입금 확인</a></li>
                                        <li><a href="#canceloreder">주문 취소</a></li>
                                        <li><a href="#changeorder">주문 교환</a></li>
                                        <li><a href="#refundorder">주문 환불</a></li>
                                        <li><a href="#returnorder">주문 반품</a></li>
                                    </ul>
                                </div>
                                <div class="orderpageframe">
                                    <div class="orderadminbarpage" id="orderadminbarpage">
                                        <div id="ordertotaladmin">
                                            <h3>주문 총 관리</h3>
                                        </div>
                                        <div id="checkmoney">
                                            <h3>입금 확인</h3>
                                        </div>
                                        <div id="canceloreder">
                                            <h3>주문 취소</h3>
                                        </div>
                                        <div id="changeorder">
                                            <h3>주문 교환</h3>
                                        </div>
                                        <div id="refundorder">
                                            <h3>주문 환불</h3>
                                        </div>
                                        <div id="returnorder">
                                            <h3>주문 반품</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</sec:authorize>
	<script>
		function pwd_send(){
			var xhr = new XMLHttpRequest();
	        xhr.open("post", "/project/member/rest/password_test");
	        xhr.setRequestHeader("content-type", "application/json");
// 	        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			let member = {
				member_id:"${member.member_id}",
				member_pw:document.getElementsByName("member_pw")[0].value
			}
			xhr.send(JSON.stringify(member));
			xhr.onreadystatechange = function () {
                if (xhr.readyState === xhr.LOADING) {
//                     $("#loding").show();
                }
                if (xhr.readyState === xhr.DONE) {
                    if (xhr.status === 200 || xhr.status === 201) {
                    	let test = xhr.responseText
						if(test == "true"){
							document.getElementById("pw_section_test").style.display = "none";
							document.getElementById("pw_section_form").style.display = "block";
						}else{
							console.log("false")
// 							실패
						}
                    }
                }
			}
		}
	
	
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
        // orderadminbarpage

        let infotitle = document.getElementById("infotitle");
        let orderList = document.getElementById("orderlist");
        let modify = document.getElementById("myinfomodify");
        let upload = document.getElementById("uploadproduct");
        let myinfocollection = document.getElementsByName("myinfocollection");
        let adminPage = document.getElementsByName("adminpage");
        let orderbtn = document.getElementsByName("orderadminbtn");
		let message = "${message }";
        $(function () {
            var $productmenu = $('#productbar_menu ul li');
            $contentsproduct = $('#productadminbarpage > div');
            $productmenu.click(function (y) {
                y.preventDefault();
                $productmenu.removeClass('on');
                $(this).addClass('on');
                var pidx = $(this).index();
                console.log(pidx)
                if (pidx == 0) {
                    $('#productadminbarpage').animate({ "top": "0px" }, 500)
                } else if (pidx == 1) {
                    $('#productadminbarpage').animate({ "top": "-800px" }, 500)
                } else if (pidx == 2) {
                    $('#productadminbarpage').animate({ "top": "-1600px" }, 500)
                } else {
                    $('#productadminbarpage').animate({ "top": "-2400px" }, 500)
                }
            });
        })

        $(function () {
            var $menu = $('#orderbar_menu ul li'),
                $contents = $('#orderadminbarpage > div');
            $menu.click(function (x) {
                x.preventDefault();
                $menu.removeClass('on');
                $(this).addClass('on');
                var idx = $(this).index();
                if (idx == 0) {
                    $('#orderadminbarpage').animate({ "top": "0px" }, 500)
                } else if (idx == 1) {
                    $('#orderadminbarpage').animate({ "top": "-800px" }, 500)
                } else if (idx == 2) {
                    $('#orderadminbarpage').animate({ "top": "-1600px" }, 500)
                } else if (idx == 3) {
                    $('#orderadminbarpage').animate({ "top": "-2400px" }, 500)
                } else if (idx == 4) {
                    $('#orderadminbarpage').animate({ "top": "-3200px" }, 500)
                } else if (idx == 5) {
                    $('#orderadminbarpage').animate({ "top": "-4000px" }, 500)
                } else {
                    $('#orderadminbarpage').animate({ "top": "-4800px" }, 500)
                }
            });
        });

        for (let a = 0; a < adminPage.length; a++) {
            adminPage[a].style.display = "none"
        }
        for (let i = 0; i < myinfocollection.length; i++) {
            (function (index) {
                myinfocollection[index].addEventListener("click", function () {
                	document.getElementById("pw_section_test").style.display = "block";
					document.getElementById("pw_section_form").style.display = "none";
					document.getElementsByName("member_pw")[0].value="";
                    adminPage[index].style.display = "block";
                    if (index == 0) {
                        console.log(0);
                    } else if (index == 1) {
						$.ajax({
							url:'<c:url value="/product/rest/orderlist/${member.member_id}"/>',
							type:'GET',
							success:function(orderlist){
								showMyOrderList(orderlist);
							},error:function(){
								alert('실패');	
							}
						})                     
                    } else if (index == 2) {
                        console.log(2);
                    } else if (index == 3) {
                        console.log(3);
                    } else{
                        console.log(4);
                    }
                    for (var b = 0; b < myinfocollection.length; b++) { //각각의 인덱스에 있는 페이지 닫아주는 역할
                        if (index != b) {
                            adminPage[b].style.display = "none";
                        }
                    }
                })
            })(i);
        }
        function showMyOrderList(orderList){
        	for(var i = 0 ;i < orderList[0].length ; i++){
	        	let order_list ="<div>"+
	        	"<p>"+orderList[0][i].member_id+"</p>"+
		       	"<p>"+orderList[0][i].product_name+"</p>"+
		       	"<p>"+orderList[0][i].product_id+"</p>"+
		       	"<p>"+orderList[0][i].order_date+"</p>"+
		       	"<p>"+orderList[0][i].order_receiver_main_address+"</p>"+
		       	"<p>"+orderList[0][i].order_receiver_sub_address+"</p>"+
		       	"<p>"+orderList[0][i].order_receiver_name+"</p>"+
		       	"<p>"+orderList[0][i].order_receiver_tel+"</p>"+
		       	"<p>"+orderList[0][i].order_product_count+"</p>"+
		       	"<p>"+orderList[0][i].order_price+"</p>"+
		       	"<p>"+orderList[0][i].order_request+"</p>"+
		       	"<p>"+orderList[0][i].order_status+"</p>"+
		       	"<p>"+orderList[0][i].order_number+"</p>"+
		       	"<p>"+orderList[0][i].order_group_number+"</p>"+
		       	"<p>"+orderList[0][i].review_check+"</p>"+
		       	"<p>"+orderList[0][i].product_weight+"</p>"+
		       	"<p>"+orderList[0][i].seller_company_name+"</p>"+
		       	"<p>"+orderList[0][i].seller_company_tel+"</p>"+
		       	"<p>"+orderList[0][i].order_delivery_price+"</p>"+
		       	"</div>"
        	$("#ajaxlistlayout").append(order_list)
        	}
        	
        	
        	
        }

        for (let c = 0; c < orderbtn.length; c++) {
            (function (index) {
                orderbtn[index].addEventListener("click", function () {
                    console.log("btnIndex : " + index)
                })
            })(c);
        }
        
    </script>
</html>