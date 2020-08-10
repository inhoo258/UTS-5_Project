<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/info.css'/>" />
</head>
<body onload="myinfofalse()">
<jsp:include page="../header&footer/header.jsp"/>
   <section id="info-main">
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
                            <a href="#myinfomodifyform" onClick="myinfomodify()">회원 정보 수정<p>></p></a>
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
    
    
    
   <sec:authorize access="hasRole('ROLE_SELLER')"> <!--============================================ 여기는 판매자 권한인 사람 -->
   <section id="info-main">
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
                            <a href="#myinfomodifyform" onClick="myinfomodify()">판매자 정보 수정<p>></p></a>
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
    <!-- <%--                             <a href="<c:url value="/product/orderlist/${member.member_id}"/>">주문 관리<p>></p></a> --%> -->
                            <a href="#orderLists" onClick="orderLists()">주문 관리<p>></p></a>
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
	    
		${sellerInfo}<br>
		${sellerInfo.member_id}<br>
		${sellerInfo.seller_reg_num}<br>
		${sellerInfo.seller_company_info}<br>
		${sellerInfo.seller_company_tel}<br>
		${sellerInfo.seller_company_main_address}<br>
		${sellerInfo.seller_company_sub_address }<br>
		${sellerInfo.seller_company_email }<br>
		${sellerInfo.seller_company_name}<br>
		${sellerInfo.seller_company_head_name}<br>
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
    	
</script>
</html>