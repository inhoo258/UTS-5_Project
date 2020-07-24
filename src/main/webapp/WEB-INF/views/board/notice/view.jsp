<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/view.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../../header&footer/header.jsp" />
	
	<div class="view_section">
		<div style="padding-bottom: 45px;">
			<h2 class="tit">공지사항</h2>
			<span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
		</div>
		<div align="center">

			<table class="view_table">
				<thead>
					<tr>
						<th class="view_th">제 목</th>
						<td colspan="3">${notice.notice_title}</td>
					</tr>
					<tr>
						<th class="view_th">작성일</th>
						<td style="width: 200px;">${notice.notice_date}</td>
						<th class="view_th">조회수</th>
						<td >${notice.notice_views}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="4">${notice.notice_content}</th>
					</tr>
				</tbody>
				<tr class="last_tr">
					<td colspan="4">
						<input class="btn" type="button" onclick='location.href="<c:url value='/board/notice/list'/>"' value="목록">
						<sec:authorize access="hasRole('ROLE_MASTER')">
						<input class="btn" type="button" value="수정" onclick=''>
						</sec:authorize>	
					</td>
				</tr>
			</table>
			
			<ul>
				<li>
					<c:if test="${notice.notice_rn gt 1}">
						<i class="fas fa-angle-up"></i>
						<a href='<c:url value="/board/notice/${notice.notice_rn-1}"/>'> 이전글</a>
					</c:if>
				</li>
				<li>
					<c:if test="${notice.notice_rn lt totalCount}">
						<i class="fas fa-angle-down"></i>
						<a href='<c:url value="/board/notice/${notice.notice_rn+1}"/>'> 다음글</a>
					</c:if>
				</li>
			</ul>
<!-- 			<table class="view_table2"> -->
<%-- 				<c:if test="${notice.notice_rn gt 1}"> --%>
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<i class="fas fa-angle-up"></i> -->
<%-- 							<a href='<c:url value="/board/notice/${notice.notice_rn-1}"/>'> 이전글</a> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${notice.notice_rn lt totalCount}"> --%>
<!-- 					<tr> -->
<!-- 						<td> -->
<!-- 							<i class="fas fa-angle-down"></i> -->
<%-- 							<a href='<c:url value="/board/notice/${notice.notice_rn+1}"/>'> 다음글</a> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>
<!-- 			</table> -->
		</div>
	</div>
	<div>글 삭제도 만들어야함~~~~~~~~~~~~
	// 리스트에서도 삭제 만들건지??
	// desc 확인해야함
	// 검색 기능 구현
	// 이전글 다음글 수정
	
	// .view_table css borderbottom 안먹음
	</div>
</body>
</html>