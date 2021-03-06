<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel="stylesheet"	href="<c:url value='/resources/css/board/notice/view.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<td>${notice.notice_views}</td>
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
								<input class="btn" type="button" value="수정" onclick='location.href="<c:url value='/board/notice/form/${notice.notice_rn}'/>"'>
								<input class="btn" type="button" value="삭제" onclick='location.href="<c:url value='/board/notice/delete/${notice.notice_number}'/>"'>
							</sec:authorize>
					</td>
				</tr>
			</table>
			<table class="movement_table"
						style="width: 100%; border-collapse: collapse; ">
				<tr id="pre" style="border-bottom : 1px solid #ddd;">
					<td style="width: 70px;	height:36px; text-align: center; border-right: 1px solid #ddd;">
						<c:if test="${notice.notice_rn gt 1}">
							<i class="fas fa-angle-up"></i>  다음글
						</c:if>
					</td>
					<td>
						<a href='<c:url value="/board/notice/${notice.notice_rn-1}"/>' >${preTitle}</a>
					</td>
				</tr>
				<tr id="post" style="border-bottom:3px solid #5f0080 ; ">
					<td style="width: 70px;	height:36px; text-align: center; border-right: 1px solid #ddd;">
						<c:if test="${notice.notice_rn lt totalCount}">
							<i class="fas fa-angle-down"></i> 이전글
						</c:if>
					</td>
					<td>
						<a href='<c:url value="/board/notice/${notice.notice_rn+1}"/>'>${postTitle}</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../../header&footer/footer.jsp"/>
	<div>
<!-- 	// .view_table css borderbottom & .movement_table css 안먹음  -->
	</div>
	
	<!-- 다음/ 이전 페이지 처리 --> 
	<script type="text/javascript">
		if(${notice.notice_rn eq 1} ){
			$('#pre').attr('style', "display:none;")	
		}
		if(${notice.notice_rn eq totalCount} ){
			$('#post').attr('style', "display:none;")	
		}
	</script>
</body>
</html>