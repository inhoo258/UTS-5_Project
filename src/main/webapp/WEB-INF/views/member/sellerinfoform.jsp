<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header&footer/header.jsp" />
${sellerInfo.member_id}<br>
${sellerInfo.seller_reg_num}<br>
${sellerInfo.seller_company_info}
${sellerInfo.seller_company_tel}
${sellerInfo.seller_company_address }
${sellerInfo.seller_company_additional }
${sellerInfo.seller_company_email }
</body>
</html>