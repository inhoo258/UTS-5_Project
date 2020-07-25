<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/member/find.css'/>" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header&footer/header.jsp"/>
	<section class="m_find_section">
		<div>
			<label ><input type="radio" name="findIdPwd" value="findId"> 아이디 찾기 </label>
			<label ><input type="radio" name="findIdPwd" value="findPwd"> 비밀번호 찾기 </label><br>
			<form action="#">
				이름 <input type="text">
				전화번호 <input type="text"> <input >
				<input type="submit" value="찾기">
			</form>		
		</div>
	</section>
	<jsp:include page="../header&footer/footer.jsp"/>
</body>
</html>