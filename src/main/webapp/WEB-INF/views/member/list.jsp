<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/member/list.css'/>" />
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<div class="container">
		<div>
			<h1 id="memberlist_h1">회원리스트</h1>
		</div>
		<input type="radio" name="tabmenu" id="tab01"checked>
		<label for="tab01">회원 리스트</label>	
		<input type="radio" name="tabmenu" id="tab02">
		<label for="tab02">가입 대기 회원 리스트</label>
		
		<div class="conbox con1" align="center">
			<div class="m_background"></div>
			<div class="m_tablediv">
				<table border="1" style="z-index: 2; opacity: 1;">
				<tr>
					<th><button type="button">모두 선택</button></th>
					<td>ID<br>Name<br>Auth</td>
					<td>Password</td>
					<td>Tel</td>
					<td>Address</td>
					<td>Email</td>
					<td>Enabled</td>
				</tr>
				<c:forEach var="member" items="${memberlist}">
					<tr>
						<th>
							<label class="checkbox">
						<input type="checkbox"> <span class="icon"></span> 
						<span class="text">선택</span>
					</label>
						</th>
						<td>${member.member_id}<br>${member.member_name}<br>${member.member_auth}</td>
						<td>**********</td>
						<td>${member.member_tel}</td>
						<td>${member.member_addr}</td>
						<td>${member.member_email}</td>
						<td>${member.member_enabled}</td>
					</tr>
				</c:forEach>
				</table>
				</div>
		</div>
		<div class="conbox con2">2번내용</div>
	</div>	
	
	<script type="text/javascript">
		$(function() {
			// 화면의 높이와 너비 
			var maskHeight = $(window).height();
			var maskWidth = $(window).width();
			console.log(maskHeight)
			console.log(maskWidth)
			// 전체화면을 채운다
// 			$('.conbox').css({
// 				'width' : maskWidth,
// 				'height' : maskHeight
// 			});
			
// 			$('.m_background').css({
// 				'width' : maskWidth,
// 				'height' : maskHeight
// 			});
		});
	</script>
</body>
</html>
