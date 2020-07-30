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
<table border="1" style="border-collapse:collapse;">
	<tr>
		<th>사업자등록번호</th>
		<td>${sellerIfnfo.seller_reg_num}<input type="hidden" name="seller_reg_num" value="${sellerInfo.seller_reg_num}"></td>
	</tr>
	<tr>
		<th>상호명</th>
		<td><input type="text" name="seller_company_name" value="${sellerInfo.seller_company_name}" ${empty sellerInfo.seller_company_name ? "":"readonly"}></td>
	</tr>
	<tr>
		<th>회사 소개</th>
		
	</tr>
</table>
</body>
</html>