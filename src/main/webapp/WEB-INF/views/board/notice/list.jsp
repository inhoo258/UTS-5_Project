<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/list.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../../header&footer/header.jsp" />
	<div class="noice_section">
		<div style="padding-bottom: 45px; ">
			<h2 class="tit">공지사항</h2>
			<span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
		</div>
		<div align="center">
<<<<<<< HEAD
			<table class="notice_table" >
=======
			<form action="">
			<table class="notice_table" border="1">
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
				<thead>
<<<<<<< HEAD
					<tr class="tr_notice" style="height: 56px">
=======
					<tr class="tr_notice th_notice">
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
						<th style="width: 70px;">글번호</th>
						<th>제목</th>
						<th style="width: 130px;">작성일</th>
						<th style="width: 70px;">조회</th>
					</tr>
				</thead>
				<!-- 	 varStatus="status" 이용시 idx 가져오기 가능-->
				<tbody>
					<c:forEach var="list" items="${noticeList}" varStatus="status">
<<<<<<< HEAD
						<tr class="tr_notice" style="height: 56px">
=======
						<tr class="tr_notice">
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
							<td>${list.notice_number}</td>
							<td class="td_title">
								<a href='<c:url value="/board/notice/${list.notice_rn}"/>' class="a_title">${list.notice_title}</a>
							</td>
							<td>${list.notice_date}</td>
							<td>${list.notice_views}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="4">
<<<<<<< HEAD
=======
					<div class="notice_paging">
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
						<c:if test="${pagingManager.nowPage ne 1}">
							<a href="<c:url value='/board/notice/list?page=1'/>">처음</a>
						</c:if> 
						<c:if test="${pagingManager.nowBlock gt 1 }">
<<<<<<< HEAD
							<button onclick='location.href="<c:url value='/board/notice/list?page=${pagingManager.startPage-1}'/>"'>이전</button>
						</c:if> 
						<c:forEach var="i" begin="${pagingManager.startPage}" end="${pagingManager.endPage}">
							[<a href='<c:url value="/board/notice/list?page=${i}"/>'>${i}</a>]
						</c:forEach> <c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
							<button onclick='location.href="<c:url value='/board/notice/list?page=${pagingManager.endPage+1}'/>"'>다음</button>
						</c:if> 
						<c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
							<a href="<c:url value='/board/notice/list?page=${pagingManager.totalPage}'/>">끝</a>
						</c:if>
					</td>
=======
							<a href='<c:url value="/board/notice/list?page=${pagingManager.startPage-1}"/>'>이전</a>
						</c:if> 
						<c:forEach var="i" begin="${pagingManager.startPage}" end="${pagingManager.endPage}">
											[<a href='<c:url value="/board/notice/list?page=${i}"/>'>${i}</a>]
						</c:forEach> 
						<c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
							<a href="<c:url value='/board/notice/list?page=${pagingManager.endPage+1}'/>">다음</a>
						</c:if> 
						<c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
							<a href="<c:url value='/board/notice/list?page=${pagingManager.totalPage}'/>">끝</a>
						</c:if>
						</div>
					</td>
				</tr>
				<tr >
					<td style="width: 130px;">> 검색어 </td>	
					<td align="left" style="width: 300px;">
						<input type="checkbox" name="search_title"> 제목 &nbsp;&nbsp;
						<input type="checkbox" name="search_content"> 내용
					</td>	
					<td colspan="2" >
						<div class="notice_search" style="display: flex;">
							<input type="text" style="height: 40px; border: none;">
							<div align="center" style="width: 40px; height: 40px; background-color: #795c90; color: white; line-height: 40px;"><i class="fas fa-search"></i></div>
						</div>
					
					</td>	
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
				</tr>
			</table>
			<sec:authorize access="hasRole('ROLE_MASTER')">
				<a href="<c:url value='/board/notice/form'/>">글쓰기</a>
			</sec:authorize>
			</form>
		</div>
	</div>
</body>
</html>