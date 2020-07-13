<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/member/list.css'/>" />

<style type="text/css">
</style>

</head>
<body>
	
<sec:authorize access="hasRole('ROLE_MASTER')">
	<jsp:include page="../header/header.jsp" />
	<div class="container">
		<div>
			<h1 id="memberlist_h1" style="font-family: italic">회원리스트</h1>
		</div>
		<input type="radio" name="tabmenu" id="tab01" checked> <label
			for="tab01">회원 리스트</label> <input type="radio" name="tabmenu"
			id="tab02"> <label for="tab02">가입 대기 회원 리스트</label>

		<hr class="m_hr">


		<div class="conbox con1" align="center">
			<div class="m_background"></div>
			<div class="m_tablediv">
				<table>
					<tr style="border: none;">
						<td>
							<form action="<c:url value='/member/delete'/>" method="POST" onsubmit="return checkedDelete()">
								<input type="hidden" name="member_ids" id="member_ids">
								<input type="submit" value="선택 삭제">&nbsp;&nbsp;&nbsp;
							</form>
						</td>
						<td colspan="7" align="right" style="padding-right: 20px">
							검색	: <input type="text"> <input type="button" value="찾기" onclick="">
						</td>
					</tr>
					<tr>
						<th><button type="button" id="member_Checkall">모두 선택</button></th>
						<td>ID<br>Name<br>Auth
						</td>
						<td>Password</td>
						<td>Tel</td>
						<td>Address</td>
						<td>Email</td>
						<td>Enabled</td>
						<th>관리</th>
					</tr>
					<c:forEach var="member" items="${memberlist}">
						<tr>
							<th>
								<label class="checkbox"> 
									<input type="checkbox" class="member_CheckEach"> 
									<span class="icon"></span> 
									<span class="text">선택</span>
								</label>
							</th>
							<td>${member.member_id}<br>${member.member_name}<br>${member.member_auth}</td>
							<td>**********</td>
							<td>${member.member_tel}</td>
							<td>${member.member_addr}</td>
							<td>${member.member_email}</td>
							<td>${member.member_enabled eq "1" ? "승인" : "승인대기"}</td>
							<th>
								<input type="button" value="상세 정보" onclick="location.href='<c:url value='/member/info/${member.member_id}'/>'">
								<form action="<c:url value='/member/delete'/>" method="POST">
									<input type="hidden" value="${member.member_id}" class="member_id"	name="member_id"> 
									<input type="submit" value="삭제">
								</form>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<hr>
			[<a href="list?page=1">처음</a>]
			<c:if test="${pageManager.nowBlock > 1}">
				[<a href="list?page=${pageManager.startPage-1}">이전</a>]
			</c:if>
			
			<c:forEach var="cnt" begin="${pageManager.startPage}" end="${pageManager.endPage}" step="1">
				[<a href="list?page=${cnt}">${cnt}</a>]
			</c:forEach>
			
			<c:if test="${pageManager.nowBlock < pageManager.totalBlock}">
				[<a href="list?page=${pageManager.endPage+1}">다음</a>]
			</c:if>
			
		</div>
		
		<div class="conbox con2" align="center" id = "con2">
			<div class="m_background"></div>
			<div class="m_tablediv">
				<table>
					<tr style="border: none;">
						<td>
							<form action="<c:url value='/member/permission'/>" method="POST" onsubmit="return checkPermission()">
								<input type="hidden" name="permission_ids" id="permission_ids">
								<input type="submit" value="선택 승인">&nbsp;&nbsp;&nbsp;
							</form>
						</td>
						<td colspan="7" align="right" style="padding-right: 20px">검색
							: <input type="text"> <input type="button" value="찾기"
							onclick="">
						</td>
					</tr>

					<tr>
						<th><button type="button" id="permission_Checkall">모두 선택</button></th>
						<td>ID<br>Name<br>Auth
						</td>
						<td>Password</td>
						<td>Tel</td>
						<td>Address</td>
						<td>Email</td>
						<td>Enabled</td>
						<th>관리</th>
					</tr>
					<c:forEach var="permission" items="${permission}">
						<tr>
							<th><label class="checkbox">
							 <input type="checkbox"	class="permission_CheckEach">
							  <span class="icon"></span>
							  <span	class="text">선택</span>
							</label></th>
							<td>${permission.member_id}<br>${permission.member_name}<br>${permission.member_auth}</td>
							<td>**********</td>
							<td>${permission.member_tel}</td>
							<td>${permission.member_addr}</td>
							<td>${permission.member_email}</td>
							<td>${permission.member_enabled}</td>
							<th>
								<form action="<c:url value='/member/permission'/>" method="POST">
									<input type="hidden" value="${permission.member_id}" class="permission_id"
										name="permission_id"> <input type="submit" value="승인">
								</form></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	
</sec:authorize>
	<script type="text/javascript">
     let member_cnt = 0;
	 $(function () {
         $("#member_Checkall").click(function () {
        	 if(member_cnt == 0){
	        	 $(".member_CheckEach").prop("checked" , true);
	        	 $("#member_Checkall").text("선택 해제");
	        	 member_cnt++;
        	 } else{
	        	 $(".member_CheckEach").prop("checked" , false);
	        	 $("#member_Checkall").text("모두 선택");
	        	 member_cnt--;
        	 }
         });
     });
	 
	 let permission_cnt = 0;
	 $(function () {
         $("#permission_Checkall").click(function () {
        	 if(permission_cnt == 0){
	        	 $(".permission_CheckEach").prop("checked" , true);
	        	 $("#permission_Checkall").text("선택 해제");
	        	 permission_cnt++;
        	 } else{
	        	 $(".permission_CheckEach").prop("checked" , false);
	        	 $("#permission_Checkall").text("모두 선택");
	        	 permission_cnt--;
        	 }
         });
     });
	 
     
	function checkedDelete() {
		let length = document.getElementsByClassName("member_CheckEach").length;
		let hidden = []; 
		for(var i=0; i<length; i++){
			if(document.getElementsByClassName("member_CheckEach")[i].checked == true){
			hidden.push(document.getElementsByClassName("member_id")[i].value)
		}
		}
		if(hidden.length > 0){
			$("#member_ids").attr("value",hidden);
			return true;
		}
		return false;
	}
	
	function checkPermission() {
		let length = document.getElementsByClassName("permission_CheckEach").length;
		let hidden = []; 
		for(var i=0; i<length; i++){
			if(document.getElementsByClassName("permission_CheckEach")[i].checked == true){
			hidden.push(document.getElementsByClassName("permission_id")[i].value)
		}
		}
		if(hidden.length > 0){
			$("#permission_ids").attr("value",hidden);
			return true;
		}
		return false;
	}
	
	
	
	</script>
</body>
</html>
