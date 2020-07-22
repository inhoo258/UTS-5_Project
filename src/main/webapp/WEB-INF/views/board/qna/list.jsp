<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaList</title>
</head>
<body>
<jsp:include page="../../header&footer/header.jsp"/>
	<table border="1" style="border-collapse: collapse;">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
		</thead>
		<!-- 	 varStatus="status" 이용시 idx 가져오기 가능-->
		<tbody>
			<c:forEach var="list" items="${qnaList}" varStatus="status">
				<tr>
					<td>${list.qna_number}</td>
					<td><a href='<c:url value="/board/qna/${list.qna_rn}"/>'>${list.qna_title}</a></td>
					<td>${list.qna_date}</td>
					<td>${list.qna_views}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="4"><c:if test="${pagingManager.nowPage ne 1}">
					<a href="<c:url value='/board/qna/list?page=1'/>">처음</a>
				</c:if> <c:if test="${pagingManager.nowBlock gt 1 }">
					<button
						onclick='location.href="<c:url value='/board/qna/list?page=${pagingManager.startPage-1}'/>"'>이전</button>
				</c:if> <c:forEach var="i" begin="${pagingManager.startPage}"
					end="${pagingManager.endPage}">
[<a href='<c:url value="/board/qna/list?page=${i}"/>'>${i}</a>]
</c:forEach> <c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
					<button
						onclick='location.href="<c:url value='/board/qna/list?page=${pagingManager.endPage+1}'/>"'>다음</button>
				</c:if> <c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
					<a
						href="<c:url value='/board/qna/list?page=${pagingManager.totalPage}'/>">끝</a>
				</c:if></td>
		</tr>
	</table>
<jsp:include page="../../header&footer/footer.jsp"/>
</body>
</html>