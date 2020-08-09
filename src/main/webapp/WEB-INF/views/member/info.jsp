<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/info.css'/>" />
</head>
<body>
<section id="info-main">
        <div class="first">
            <div>
                <div class="myinfotextframe">
                    <div><h2>내 정보</h2></div>
                    <div>
                        <p><span>${member.member_name }</span><span>님</span><span>[ ${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'} ]</span></p>
                    </div>
                </div>
                <div>
                    <h3>내가 산 총 금액</h3>
                </div>
                <div>
                    <h3>내가 산 총 금액</h3>
                </div>
            </div>
        </div>
        <div class="secondsection">
            <div>
                <div>
                    <p>나의 메뉴</p>
                    <ul>
                        <li>
                            <a href="<c:url value='/product/orderlist/${member.member_id }'/>" onClick="orderLists()">나의 주문 내역<p>></p></a>
                        </li>
                        <li>
                            <a href="#myinfomodifyform" onClick="myinfomodify()">개인 정보 수정<p>></p></a>
                        </li>
                        <li>
                            <a href="#" onClick="showmenubar()">상품 관리<p>></p></a>
                        </li>
                        <li >
                        	<a href="#">상품 조회 / 수정</a>
                        </li>
                        <li>
                        	<a href="#">상품 등록</a>
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
                        </li>
                    </ul>
                </div>
                <div>
	                <p id="infotitle"></p>
	                <hr>
	                <ul>
	                	<li id="orderlist" style="display: none">
                            <div>
                            	<iframe src="<c:url value='http://www.naver.com'/>">dsaf</iframe>
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
<%--     ${member.member_id} --%>
<%-- 	<br> ${member.member_name } --%>
<%-- 	<br> ${member.member_tel } --%>
<%-- 	<br> ${member.member_main_addr } --%>
<%-- 	<br> ${member.member_sub_addr } --%>
<%-- 	<br> ${member.member_email } --%>
<%-- 	<br> ${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'} --%>
<%-- 	<a href='<c:url value="/member/form/${member.member_id}"/>'>정보수정</a> --%>
<!-- 	<br> -->
<%-- 	<sec:authorize access="hasRole('ROLE_SELLER')"> --%>
<%-- 	${sellerInfo}<br> --%>
<%-- 	${sellerInfo.member_id}<br> --%>
<%-- ${sellerInfo.seller_reg_num}<br> --%>
<%-- ${sellerInfo.seller_company_info}<br> --%>
<%-- ${sellerInfo.seller_company_tel}<br> --%>
<%-- ${sellerInfo.seller_company_main_address}<br> --%>
<%-- ${sellerInfo.seller_company_sub_address }<br> --%>
<%-- ${sellerInfo.seller_company_email }<br> --%>
<%-- ${sellerInfo.seller_company_name}<br> --%>
<%-- ${sellerInfo.seller_company_head_name}<br> --%>
<%-- 	</sec:authorize> --%>
    
    
</body>
<script type="text/javascript">
    let infotitle = document.getElementById("infotitle");
    let orderList = document.getElementById("orderlist");        
    let modify = document.getElementById("myinfomodify");
    let falsemessage = "${myinfofalse}";
    
    function orderLists(){
        infotitle.innerText="나의 주문 내역";
        orderList.style.display="block";
        modify.style.display="none";
    }
    function myinfomodify(){
        infotitle.innerText = "개인 정보 수정";
        modify.style.display="block";
        orderList.style.display="none";
    }
    function myinfofalse(){
    	if(falsemessage == ""){
    		alert("비어있음");
    	}else{
    		alert("차있음");
    	}
    }
    function showmenubar(){}
    	
</script>
</html>