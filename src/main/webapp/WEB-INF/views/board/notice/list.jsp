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
${noticeList}<br>
<table border="1" style="border-collapse:collapse;">
	<thead>
		<tr>
			<th>rn</th>
			<th>글번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
	</thead>
<!-- 	 varStatus="status" 이용시 idx 가져오기 가능-->
<c:forEach var="list" items="${noticeList}" varStatus="status">
	<tbody>
		<tr>
			<td>${list.notice_rn}</td>
			<td>${list.notice_number}</td>
			<td><a href='<c:url value="/board/notice/${list.notice_rn}"/>'>${list.notice_title}</a></td>
			<td>${list.notice_date}</td>
			<td>${list.notice_views}, idx : ${status.index+1}</td>
		</tr>
	</tbody>
</c:forEach>
</table>

</body>
</html>