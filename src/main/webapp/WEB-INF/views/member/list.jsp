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

		<div class="p_product_explain2">
			<nav class="container">
				<ul class="tab">
					<li><a href="#tab1" class="on">회원 리스트</a></li>
					<li><a href="#tab2">승인대기 리스트</a></li>
				</ul>
				<ul class="panel">
					<li id="tab1">
						<div class="m_background"></div>
						<div class="m_tablediv">
							<table>
								<tr style="border: none;">
									<td>
										<form action="<c:url value='/member/delete'/>" method="POST"
											onsubmit="return checkedDelete()">
											<input type="hidden" name="member_ids" id="member_ids">
											<input type="submit" value="선택 삭제">&nbsp;&nbsp;&nbsp;
										</form>
									</td>
									<td colspan="7" align="right" style="padding-right: 20px">
										검색 : <input type="text"> <input type="button"
										value="찾기" onclick="">
									</td>
								</tr>
								<tr>
									<th><button type="button" id="member_Checkall">모두
											선택</button></th>
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
										<th><label class="checkbox"> <input
												type="checkbox" class="member_CheckEach"> <span
												class="icon"></span> <span class="text">선택</span>
										</label></th>
										<td>${member.member_id}<br>${member.member_name}<br>${member.member_auth}</td>
										<td>**********</td>
										<td>${member.member_tel}</td>
										<td>${member.member_addr}</td>
										<td>${member.member_email}</td>
										<td>${member.member_enabled eq "1" ? "승인" : "승인대기"}</td>
										<th><input type="button" value="상세 정보"
											onclick="location.href='<c:url value='/member/info/${member.member_id}'/>'">
											<form action="<c:url value='/member/delete'/>" method="POST">
												<input type="hidden" value="${member.member_id}"
													class="member_id" name="member_id"> <input
													type="submit" value="삭제">
											</form></th>
									</tr>
								</c:forEach>
							</table>
						</div>

						<hr> [<a href="list?page=1">처음</a>] <c:if
							test="${pageManager.nowBlock > 1}">
				[<a href="list?page=${pageManager.startPage-1}">이전</a>]
			</c:if> <c:forEach var="cnt" begin="${pageManager.startPage}"
							end="${pageManager.endPage}" step="1">
				[<a href="list?page=${cnt}">${cnt}</a>]
			</c:forEach> <c:if test="${pageManager.nowBlock < pageManager.totalBlock}">
				[<a href="list?page=${pageManager.endPage+1}">다음</a>]
			</c:if>

					</li>
					<li id="tab2">
						<div class="m_background"></div>
						<div class="m_tablediv">
							<table>
								<tr style="border: none;">
									<td>
										<form action="<c:url value='/member/permission'/>"
											method="POST" onsubmit="return checkPermission()">
											<input type="hidden" name="permission_ids"
												id="permission_ids"> <input type="submit"
												value="선택 승인">&nbsp;&nbsp;&nbsp;
										</form>
									</td>
									<td colspan="7" align="right" style="padding-right: 20px">검색
										: <input type="text"> <input type="button" value="찾기"
										onclick="">
									</td>
								</tr>

								<tr>
									<th><button type="button" id="permission_Checkall">모두
											선택</button></th>
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
										<th><label class="checkbox"> <input
												type="checkbox" class="permission_CheckEach"> <span
												class="icon"></span> <span class="text">선택</span>
										</label></th>
										<td>${permission.member_id}<br>${permission.member_name}<br>${permission.member_auth}</td>
										<td>**********</td>
										<td>${permission.member_tel}</td>
										<td>${permission.member_addr}</td>
										<td>${permission.member_email}</td>
										<td>${permission.member_enabled}</td>
										<th>
											<form action="<c:url value='/member/permission'/>"
												method="POST">
												<input type="hidden" value="${permission.member_id}"
													class="permission_id" name="permission_id"> <input
													type="submit" value="승인">
											</form>
										</th>
									</tr>
								</c:forEach>
							</table>
						</div>
					</li>
				</ul>
			</nav>
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
	
	$(function(){
		   $("ul.panel li:not("+$("ul.tab li a.on").attr("href")+")").hide() //class 속성에 on이 설정되어 있는 a태그의 href 속성을 가져오고 이 이외의 패널은 숨김.
		   $("ul.tab li a").click(function(){  // ul에 a를 클릭 했을 때 
		      $("ul.tab li a").removeClass("on"); // a에 있는 모든 클래스 on 삭제
		      $(this).addClass("on");  // 그리고 현재 요소에만 on 클래스 추가 
		      $("ul.panel li").slideUp("fast"); // 모든 패널 비표시
		      $($(this).attr("href")).slideDown("fast"); // 클릭된 a태그의 href의 속성을 가져와 같은 id 속성을 가진 패널 보여줌
		      return false; // 탭에 a요소로 되어 있어서 클릭했을 때 발생하는 click 이벤트 설정. 이동하지 못하게 함.
		   });
		});
	
	</script>
</body>
</html>
