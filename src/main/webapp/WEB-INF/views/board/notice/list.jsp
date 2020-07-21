<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/list.css'/>" />
</head>
<body>
	<jsp:include page="../../header&footer/header.jsp" />
	<div class="noice_section">
		<div style="padding-bottom: 45px;">
			<h2 class="tit">공지사항</h2>
			<span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
		</div>
		<div align="center">
			<table class="notice_table" border="1">
				<thead>
					<tr style="height: 58px">
						<th style="width: 70px;">글번호</th>
						<th>제목</th>
						<th style="width: 130px;">작성일</th>
						<th style="width: 70px;">조회</th>
					</tr>
				</thead>
				<!-- 	 varStatus="status" 이용시 idx 가져오기 가능-->
				<tbody>
					<c:forEach var="list" items="${noticeList}" varStatus="status">
						<tr>
							<td>${list.notice_number}</td>
							<td class="td_title"><a
								href='<c:url value="/board/notice/${list.notice_rn}"/>'>${list.notice_title}</a></td>
							<td>${list.notice_date}</td>
							<td>${list.notice_views}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="4"><c:if test="${pagingManager.nowPage ne 1}">
							<a href="<c:url value='/board/notice/list?page=1'/>">처음</a>
						</c:if> <c:if test="${pagingManager.nowBlock gt 1 }">
							<button
								onclick='location.href="<c:url value='/board/notice/list?page=${pagingManager.startPage-1}'/>"'>이전</button>
						</c:if> <c:forEach var="i" begin="${pagingManager.startPage}"
							end="${pagingManager.endPage}">
											[<a href='<c:url value="/board/notice/list?page=${i}"/>'>${i}</a>]
											</c:forEach> <c:if
							test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
							<button
								onclick='location.href="<c:url value='/board/notice/list?page=${pagingManager.endPage+1}'/>"'>다음</button>
						</c:if> <c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
							<a
								href="<c:url value='/board/notice/list?page=${pagingManager.totalPage}'/>">끝</a>
						</c:if></td>
				</tr>
			</table>
			<sec:authorize access="hasRole('ROLE_MASTER')">
				<a href="<c:url value='/board/notice/form'/>">글쓰기</a>
			</sec:authorize>
		</div>
	</div>
	<jsp:include page="../../header&footer/footer.jsp" />
</body>
</html>