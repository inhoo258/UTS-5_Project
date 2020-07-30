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
<%-- 	<jsp:include page="../header&footer/header.jsp"/> --%>
	${member.member_id}<br>
	${member.member_name }<br>
	${member.member_tel }<br>
	${member.member_main_addr }<br>
	${member.member_sub_addr }<br>
	${member.member_email }<br>
	${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'}
	<a href='<c:url value="/member/form/${member.member_id}"/>'>정보수정</a><br>
	<sec:authorize access="hasRole('ROLE_SELLER')">
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
	<jsp:include page="../header&footer/footer.jsp"/>
</body>
</html>