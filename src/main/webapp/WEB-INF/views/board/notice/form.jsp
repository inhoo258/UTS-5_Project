<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/form.css'/>" />
</head>
<body>


<!-- 컨트롤러에서 form에서 넘어가는 경로 맵핑해줘야 글 등록됨!!!!!!!!!!!!!!! -->



	<jsp:include page='../../header&footer/header.jsp' />

	<div class="noice_section">
		<div style="padding-bottom: 45px;">
			<h2 class="tit">공지사항</h2>
			<span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 공유하세요.</span>
		</div>
		<form action='<c:url value="/board/notice/new"/>' method="post" enctype="multipart/form-data">
			<table class="form_table" >
				<tr style="border-top:2px solid #694384;" >
					<th>글 제목</th>
					<td>
						<div style="margin-left: 10px;">
						<input type="text" name="notice_title" class="th_title">
						</div>
					</td>
				</tr>
				<tr >
					<th>글 내용</th>
					<td><textarea rows="20" cols="130" name="notice_content" class="td_content"></textarea></td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td>
						<div style="margin-left: 10px;">
							<input type="file" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="submit" value="등록" class="btn">
							<input type="reset" value="취소" class="btn" onclick="window.history.back()">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>