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
<body>
	<jsp:include page="../header&footer/header.jsp"/>
	    <section id="info-main">
        <div class="first">
            <div>
                <div>
                    <h3>내정보</h3>
                    <div>
                    ${member.member_name } 님 <br>
                    ${member.member_id}<br>
					${member.member_tel }<br>
					${member.member_main_addr }<br>
					${member.member_sub_addr }<br>
					${member.member_email }<br>
					${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'}
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
                        <li><a href="#" onclick="orderList()">주문 내역 <p>></p></a></li>
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
                        <li><a href="#">개인 정보 수정 <p>></p></a></li>
                    </ul>
                </div>
                <div>
	                <p>나의 메뉴</p>
	                <hr>
	                <ul>
	                	<li>
		                	<div>
		                  		<h4>주문내역이 없습니다.</h4>
		                  	</div>
	                 	</li>
	                </ul>
                </div>
                </div>
            </div>
    </section>

	
	<a href='<c:url value="/member/form/${member.member_id}"/>'>정보수정</a><br>
	
	
	
	
	<sec:authorize access="hasRole('ROLE_SELLER')">
	    <section id="info-main">
        <div class="first">
            <div>
                <div>
                    <h3>내정보</h3>
                </div>
                <div>
                    <h3>현재 잔고</h3>
                </div>
                <div>
                    <h3>내가 산 내역</h3>
                </div>
                <div>
                    <h3>내돈내산</h3>
                </div>
            </div>
        </div>
        <div class="secondsection">
            <div>
                <div>
                    <p>나의 메뉴</p>
                    <ul>
                        <li><a href="#">주문 내역 <p>></p></a></li>
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
<!--                         <li><a href="#">주문 내역 <p>></p></a></li> -->
                        <li><a href="#">개인 정보 수정 <p>></p></a></li>
                    </ul>
                </div>
                    <div>
                    <p>나의 메뉴</p>
                    <hr>
                </div>
            </div>
        </div>
    </section>
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
	</sec:authorize>
<%-- 	<jsp:include page="../header&footer/footer.jsp"/> --%>

<script type="text/javascript">
// 	function orderList(){
// 		$.ajax{
// 			url : ,
// 			type : post,
			
// 		}
// 	}



</script>
</body>
</html>