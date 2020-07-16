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
		<jsp:include page="../header&footer/header.jsp" />

		<div class="p_product_explain2">
			<nav class="container">
				<ul class="tab">
					<li><a href="#tab1" id=memberlist class="on">회원 리스트</a></li>
					<li><a href="#tab2" id=permissionlist>승인대기 리스트</a></li>
				</ul>
				<ul class="panel">
					<li id="tab1">
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
									<td>number</td>
									<th><button type="button" id="member_Checkall">모두 선택</button></th>
									<td>ID<br>Name<br>Auth
									</td>
									<td>Tel</td>
									<td>Address</td>
									<td>Email</td>
									<td>Enabled</td>
									<th>관리</th>
								</tr>
								<c:forEach var="member" items="${memberlist}">
									<tr>
										<td>${member.rn}</td>
										<th><label class="checkbox"> 
										<input type="checkbox" class="member_CheckEach"> 
										<span class="icon"></span> 
										<span class="text">선택</span>
										</label></th>
										<td>${member.member_id}<br>${member.member_name}<br>${member.member_auth}</td>
										<td>${member.member_tel}</td>
										<td>${member.member_addr}</td>
										<td>${member.member_email}</td>
										<td>${member.member_enabled eq "1" ? "승인" : "승인대기"}</td>
										<th>
										<input type="button" value="상세 정보"	onclick="location.href='<c:url value='/member/info/${member.member_id}'/>'">
										<form action="<c:url value='/member/delete'/>" method="POST">
											<input type="hidden" value="${member.member_id}" class="member_id" name="member_id"> 
											<input type="submit" value="삭제">
										</form>
										</th>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div align="center" id=pagemanager>
							<span><a id="member_firstpage">[ 첫 페이지 ]</a></span>
							<c:if test="${memberPage.nowBlock > 1}">
								<span><a id="member_previous">[ 이전 ]</a></span>
							</c:if> 
							<c:forEach var="member_cnt" begin="${memberPage.startPage}" end="${memberPage.endPage}" step="1">
								<span><a class="member_cnt">[ ${member_cnt} ]</a></span>
							</c:forEach>
							<c:if test="${memberPage.nowBlock < memberPage.totalBlock}">
								<span><a id="member_nextpage">[ 다음 ]</a></span>
							</c:if>
							<span><a id="member_lastpage">[ 마지막 페이지 ]</a></span>
						</div>
					</li>
					<li id="tab2">
						<div class="m_tablediv">
							<table>
								<tbody>
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
									<td>number</td>
									<th><button type="button" id="permission_Checkall">모두 선택</button></th>
									<td>ID<br>Name<br>Auth
									</td>
									<td>Tel</td>
									<td>Address</td>
									<td>Email</td>
									<td>Enabled</td>
									<th>관리</th>
								</tr>
								<c:forEach var="permission" items="${permission}" varStatus="status">
									<tr>
										<td>${permission.rn}</td>
										<th>
										<label class="checkbox"> 
											<input type="checkbox" class="permission_CheckEach"> 
											<span class="icon"></span>
											<span class="text">선택</span>
										</label>
										</th>
										<td>${permission.member_id}<br>${permission.member_name}<br>${permission.member_auth}</td>
										<td>${permission.member_tel}</td>
										<td>${permission.member_addr}</td>
										<td>${permission.member_email}</td>
										<td>${permission.member_enabled}</td>
										<th>
											<input type="hidden" value="${permission.member_id}" class="permission_id" name="permission_id"> 
											<input type="button" value="승인" class="permissionBtn">
										</th>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div align="center" id=pagemanager>
							<span><a id="permission_firstpage">[ 첫 페이지 ]</a></span>
							<c:if test="${permissionPage.nowBlock > 1}">
								<span><a id="permission_previous">[ 이전 ]</a></span>
							</c:if> 
							<c:forEach var="permission_cnt" begin="${permissionPage.startPage}" end="${permissionPage.endPage}" step="1">
								<span><a class="permission_cnt">[ ${permission_cnt} ]</a></span>
							</c:forEach>
							<c:if test="${permissionPage.nowBlock < permissionPage.totalBlock}">
								<span><a id="permission_nextpage">[ 다음 ]</a></span>
							</c:if>
							<span><a id="permission_lastpage">[ 마지막 페이지 ]</a></span>
						</div>
					</li>
				</ul>  
			</nav>
		</div>
	<jsp:include page="../header&footer/footer.jsp"/>
	
	</sec:authorize>
	
	<script type="text/javascript">
		if(sessionStorage.getItem("message") == "page_2"){
			$("ul.tab li a").removeClass("on"); 
			$("#permissionlist").addClass("on");
			sessionStorage.removeItem("message")
		}
		
		$("#pagemanager>a").click(function(e) {
			e.preventDefault();
		});
		
		//회원 리스트 , 승인대기 리스트용 스크립트
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
	
		//url파라미터 뽑아오는 메서드
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
	</script>
	
	
	<script type="text/javascript">
	//단독 삭제 or 승인
	$(".permissionBtn").click(function() {
		let index = $(".permissionBtn").index(this);
		let permissionpage = getParameterByName('permissionpage');
		let permission_id = $(".permission_id").get(index).value;
		$("body").append("<form>")
		sessionStorage.setItem("message" , "page_2")
		$("body").append("<form id=permission_form></form>")
		$("#permission_form").attr({"action" : "<c:url value='/member/permission'/>"});
		$("#permission_form").attr({"method" : "POST"});
		$("#permission_form").css({"display" : "hidden"});
		$("#permission_form").append("<input type='hidden' name=permission_id value='"+permission_id+"'>");
		if(permissionpage!=""){
			if($(".permission_id").length == 1){
				permissionpage--;
			}
			if(permissionpage == 1){
				permissionpage = 1
			}
    		$("#permission_form").append("<input type='hidden' name=permissionpage value='"+permissionpage+"'>");
		}
	    $("#permission_form").submit();
	})
	</script>


	<script type="text/javascript">
	//checkbox 관련 스크립트
    let member_cnt = 0;
	$(function () {
    	$("#member_Checkall").click(function () {
        	if(member_cnt == 0){
	        $(".member_CheckEach").prop("checked" , true);
	        $("#member_Checkall").text("선택 해제");
	        member_cnt++;
        	}else{
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
        	}else{
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

	<script type="text/javascript">
	//permission paging 관련 스크립트
		let memberpage_number = getParameterByName('memberpage');
		$("#permission_firstpage").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(memberpage_number == 1 || memberpage_number ==""){
				location.href="<c:url value='/member/list?permissionpage=1&memberpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=1&memberpage="+memberpage_number+"'/>";
			}
		})
		
		$("#permission_previous").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(memberpage_number == 1 || memberpage_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-1}&memberpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-1}&memberpage="+memberpage_number+"'/>";
			}
		})
		
		$(".permission_cnt").click(function() {
			let cnt = $(".permission_cnt").index(this) + 1;
			sessionStorage.setItem("message" , "page_2");
			if(memberpage_number == 1 || memberpage_number ==""){
				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage="+memberpage_number+"'/>";
			}
		})
		
		$("#permission_nextpage").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(memberpage_number == 1 || memberpage_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage="+memberpage_number+"'/>";
			}
		})
		
		$("#permission_lastpage").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(memberpage_number == 1 || memberpage_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage="+memberpage_number+"'/>";
			}
		})
	</script>
	
	<script type="text/javascript">
	//member paging 관련 스크립트
		let permissionpage_number = getParameterByName('permissionpage');
		$("#member_firstpage").click(function() {
			if(permissionpage_number == 1 || permissionpage_number ==""){
				location.href="<c:url value='/member/list?memberpage=1&permissionpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=1&permissionpage="+permissionpage_number+"'/>";
			}
		})
		
		$("#member_previous").click(function() {
			if(permissionpage_number == 1 || permissionpage_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-1}&permissionpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-1}&permissionpage"+permissionpage_number+"'/>";
			}
		})
		
		$(".member_cnt").click(function() {
			let cnt = $(".member_cnt").index(this) + 1;
			if(permissionpage_number == 1 || permissionpage_number ==""){
				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage="+permissionpage_number+"'/>";
			}
		})
		
		$("#member_nextpage").click(function() {
			if(permissionpage_number == 1 || permissionpage_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage="+permissionpage_number+"'/>";
			}
		})
		
		$("#member_lastpage").click(function() {
			if(permissionpage_number == 1 || permissionpage_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage=1'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage="+permissionpage_number+"'/>";
			}
		})
	</script>
</body>
</html>
