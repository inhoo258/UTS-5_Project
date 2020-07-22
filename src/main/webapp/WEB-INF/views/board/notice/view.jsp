<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../header&footer/header.jsp"/>
<table border="1" style="border-collapse:collapse;">
	<thead>
		<tr>
			<th> 제목</th><td colspan="3">${notice.notice_title}</td>
		</tr>
		<tr>
			<th> 작성일</th><td>${notice.notice_date}</td>
			<th> 조회수</th><td>${notice.notice_views}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th colspan="4">${notice.notice_content}</th>
		</tr>
	</tbody>
</table>
<input type="button" onclick='location.href="<c:url value='/board/notice/list'/>"' value="목록"><input type="button" value="수정" onclick=''>
<table border="1" style="border-collapse:collapse;">
	<c:if test="${notice.notice_rn gt 1}">
		<tr>
			<td><a href='<c:url value="/board/notice/${notice.notice_rn-1}"/>'>이전글</a></td>
		</tr>
	</c:if>
	<c:if test="${notice.notice_rn lt totalCount}">
		<tr>
			<td><a href='<c:url value="/board/notice/${notice.notice_rn+1}"/>'>다음글</a></td>
		</tr>
	</c:if>
</table>
<<<<<<< HEAD
<jsp:include page="../../header&footer/footer.jsp"/>
=======

	<div>글 삭제도 만들어야함~~~~~~~~~~~~</div>
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
</body>
</html>