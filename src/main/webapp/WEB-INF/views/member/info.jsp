<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/info.css'/>" />
</head>
<body>
	<jsp:include page="../header&footer/header.jsp"/>
	${member.member_id}<br>
	${member.member_name }<br>
	${member.member_tel }<br>
	${member.member_addr }<br>
	${member.member_email }<br>
	${member.member_auth eq 'ROLE_SELLER' ? 'seller':'customer'}
	<a href='<c:url value="/member/form/${member.member_id}"/>'>정보수정</a>
</body>
</html>