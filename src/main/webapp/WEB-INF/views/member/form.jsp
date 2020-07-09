<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/form.css'/>" />
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<form action='<c:url value="/member/${message}"/>' method="post">
		<!-- -------------- formtag  -->
		<table id="logintable">
			<tr>
				<td colspan="2"><h2 style="color: #ff3366;">회 원 ${message eq 'insert' ? '가 입' : '수 정'}</h2></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text" value="${member.member_id}"
					class="id" name="member_id" id="member_id"
					${not empty member ? "readonly":"placeholder='아이디를 입력하세요'"}><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="id_check"></label></td>				
			</tr>
			<tr>
				<th colspan="2"><input type="password" class="password"
					name="member_pw" id="member_pw" required placeholder='비밀번호를 입력하세요'><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="pw_check"></label></td>				
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_name}" class="id" name="member_name"
					id="member_name" autocomplete="off" placeholder='이름을 입력하세요'><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="name_check"></label></td>				
			</tr>
			<tr>
				<th colspan="2"><input type="text" value="${member.member_tel}"
					class="id" name="member_tel" id="member_tel" autocomplete="off"
					placeholder='전화번호를 입력하세요'><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="tel_check"></label></td>				
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_addr}" class="id" name="member_addr"
					id="member_addr" autocomplete="off" placeholder='주소를 입력하세요'><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="addr_check"></label></td>				
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_email}" class="id" name="member_email"
					id="member_email" autocomplete="off" placeholder='이메일을 입력하세요'><br></th>
			</tr>
			<tr>
				<td colspan="2"><label id="email_check"></label></td>				
			</tr>
			<c:if test="${empty member}">
				<tr>
					<th colspan="2"><sec:authorize access="isAnonymous()">
							<input type="radio" name="member_auth" value="ROLE_CUSTOMER"
								checked>구매자
						<input type="radio" name="member_auth" value="ROLE_SELLER">판매자
                  	</sec:authorize></th>
				</tr>
			</c:if>
			<tr>
				<th colspan="2"><input type="submit" id="okbutton"
					value="${message eq 'insert' ? '가입완료' : '수정완료'}"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="canbutton" value="취소"
					onclick="location.href='<c:url value='/'/>'"></th>
			</tr>

		</table>
	</form>
	<script type="text/javascript">
$(document).ready(function(){
	$("#member_id").blur(function(){
		if( ${empty member} ){
			let member_id = document.getElementById("member_id").value
			if(member_id.length==0){
				document.getElementById("id_check").innerText="아이디를 입력해주세요";
			}else{
				$.ajax({
					
				})
			}
		}
	});
	$("#member_pw").blur(function(){
		let member_pw = document.getElementById("member_pw").value
	});
	$("#member_name").blur(function(){
		let member_name = document.getElementById("member_name").value
	});
	$("#member_tel").blur(function(){
		let member_tel= document.getElementById("member_tel").value
	});
	$("#member_addr").blur(function(){
		let member_addr = document.getElementById("member_addr").value
	});
	$("#member_email").blur(function(){
		let member_email = document.getElementById("member_email").value
	});
});
</script>
</body>
</html>