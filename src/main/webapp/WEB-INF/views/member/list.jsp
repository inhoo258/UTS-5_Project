<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/member/list.css'/>" />
<style type="text/css">
</style>

</head>
<body>

	<sec:authorize access="hasRole('ROLE_MASTER')">
		<jsp:include page="../header&footer/header.jsp" />
<!-- 		<h1 align="center">회원 관리 페이지</h1> -->
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
										<form action="<c:url value='/member/delete'/>" method="POST" onsubmit="return checkedDelete()" id="delete_check_form">
											<input type="hidden" name="member_ids" id="member_ids">
											<input type="submit" value="선택 삭제">&nbsp;&nbsp;&nbsp;
										</form>
									</td>
									<td colspan="7" align="right" style="padding-right: 20px">
										<form action="<c:url value='/member/list'/>">
											검색 : <input type="text" name="member_word">
											<input type="submit" value="찾기" >
										</form>
									</td>
								</tr>
								<tr>
									<td>number</td>
									<th>
									<label class="checkbox" id="member_checkAll_label"> 
										<input type="checkbox" id="member_checkAll"> 
										<span class="icon" id="member_checkAll_span"></span>
										<span id="member_checkAll_text">모두 선택</span>
									</label>
									</th>
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
										<th><label class="checkbox member_label"> 
										<input type="checkbox" class="member_CheckEach"> 
										<span class="member_icon icon"></span> 
										<span class="member_text text">선택</span>
										</label></th>
										<td>${member.member_id}<br>${member.member_name}<br>${member.member_auth}</td>
										<td>${member.member_tel}</td>
										<td>${member.member_addr}</td>
										<td>${member.member_email}</td>
										<td>${member.member_enabled eq "1" ? "승인" : "승인대기"}</td>
										<th>
										<input type="button" value="상세 정보"	onclick="location.href='<c:url value='/member/info/${member.member_id}'/>'">
										<input type="hidden" value="${member.member_id}" class="member_id" name="member_id"> 
										<input type="button" value="삭제" class="deleteBtn">
										</th>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div align="center" id=pagemanager>
							<span><a id="member_firstpage" class="member_paging">처음</a></span>
							<c:if test="${memberPage.nowBlock > 1}">
								<span><a id="member_previous" class="member_paging">이전</a></span>
							</c:if> 
							<c:forEach var="member_cnt" begin="${memberPage.startPage}" end="${memberPage.endPage}" step="1" varStatus="member_index">
								<span>
								<a class="member_cnt member_paging">${member_cnt}</a>
								<input type="hidden" value="${member_index.index}" class="member_cnt_index">
								</span>
							</c:forEach>
							<c:if test="${memberPage.nowBlock < memberPage.totalBlock}">
								<span><a id="member_nextpage" class="member_paging">다음</a></span>
							</c:if>
							<span><a id="member_lastpage" class="member_paging">끝</a></span>
						</div>
					</li>
					<li id="tab2">
						<div class="m_tablediv">
							<table>
								<tbody>
								<tr style="border: none;">
									<td>
										<form action="<c:url value='/member/permission'/>" method="POST" onsubmit="return checkPermission()" id="permission_check_form">
										<input type="hidden" name="permission_ids" id="permission_ids">
										<input type="submit" value="선택 승인">&nbsp;&nbsp;&nbsp;
										</form>
									</td>
									<td colspan="7" align="right" style="padding-right: 20px">
										<form action="<c:url value='/member/list'/>" onsubmit="sessionCreate()">
											검색 : <input type="text" name="permission_word">
											<input type="submit" value="찾기" >
										</form>
									</td>
								</tr>

								<tr>
									<td>number</td>
									<th>
									<label class="checkbox" id="permission_checkAll_label"> 
										<input type="checkbox" id="permission_checkAll"> 
										<span class="icon" id="permission_checkAll_span"></span>
										<span id="permission_checkAll_text">모두 선택</span>
									</label>
									</th>
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
										<label class="checkbox permission_label">
											<input type="checkbox" class="permission_CheckEach"> 
											<span class="permission_icon icon"> </span>
											<span class="permission_text text">선택</span>
										</label>
										</th>
										<td>${permission.member_id}<br>${permission.member_name}<br>${permission.member_auth}</td>
										<td>${permission.member_tel}</td>
										<td>${permission.member_addr}</td>
										<td>${permission.member_email}</td>
										<td>${permission.member_enabled eq "1" ? "승인" : "승인대기"}</td>
										<th>
											<input type="hidden" value="${permission.member_id}" class="permission_id" name="permission_id"> 
											<input type="button" value="승인" class="permissionBtn">
										</th>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div align="center" id=pagemanager >
							<a id="permission_firstpage" class="permission_paging">처음</a>
							<c:if test="${permissionPage.nowBlock > 1}">
								<a id="permission_previous" class="permission_paging">이전</a>
							</c:if>
							<c:forEach var="permission_cnt"
								begin="${permissionPage.startPage}"
								end="${permissionPage.endPage}" step="1" varStatus="index">
								<a class="permission_cnt permission_paging">${permission_cnt}</a>
								<input type="hidden" value="${index.index}"
									class="permission_cnt_index">
							</c:forEach>
							<c:if
								test="${permissionPage.nowBlock < permissionPage.totalBlock}">
								<a id="permission_nextpage" class="permission_paging">다음</a>
							</c:if>
							<a id="permission_lastpage" class="permission_paging">끝</a>
						</div>
					</li>
				</ul>  
			</nav>
		</div>
	<jsp:include page="../header&footer/footer.jsp"/>
	
	</sec:authorize>
	<script type="text/javascript">
	
	// 쿠키 스크립트
	var setCookie = function(name, value, day) {
        var date = new Date();
        date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    };
	
    var getCookie = function(name) {
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    };
    
    var deleteCookie = function(name) {
        var date = new Date();
        document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=/";
    }
    
	</script>
	
	
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
		//permissionpage용
		//memberpage용
		
	
		//url파라미터 뽑아오는 메서드
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
	</script>
	
	<script type="text/javascript">
	function sessionCreate() {
		sessionStorage.setItem("message" , "page_2");
	}
	</script>
	
	<script type="text/javascript">
	//단독 삭제 or 승인
	
	$(".permissionBtn").click(function() {
		let permission_word = getParameterByName('permission_word');
		let permission_index = $(".permissionBtn").index(this);
		let permissionpage_number = getParameterByName('permissionpage');
		let permission_id = $(".permission_id").get(permission_index).value;
		sessionStorage.setItem("message" , "page_2");
		
		$("body").append("<form id='permission_form'></form>")
		$("#permission_form").attr({"action" : "<c:url value='/member/permission'/>"});
		$("#permission_form").attr({"method" : "POST"});
		$("#permission_form").css({"display" : "hidden"});
		$("#permission_form").append("<input type='hidden' name='permission_id' value='"+permission_id+"'>");
		if(permissionpage_number!=""){
			if($(".permission_id").length == 1){
				permissionpage_number--;
			}
			if(permissionpage_number == 1){
				permissionpage_number = 1;
			}
    		$("#permission_form").append("<input type='hidden' name='permissionpage' value='"+permissionpage_number+"'>");
		}
		if(permission_word != ""){
			$("#permission_form").append("<input type='hidden' name='permission_word' value='"+permission_word+"'>");
		}
	    $("#permission_form").submit();
	})
	
	
	$(".deleteBtn").click(function() {
		let member_word = getParameterByName('member_word');
		let member_index = $(".deleteBtn").index(this);
		let memberpage_number = getParameterByName('memberpage');
		let member_id = $(".member_id").get(member_index).value;
		$("body").append("<form id=delete_form></form>")
		$("#delete_form").attr({"action" : "<c:url value='/member/delete'/>"});
		$("#delete_form").attr({"method" : "POST"});
		$("#delete_form").css({"display" : "hidden"});
		$("#delete_form").append("<input type='hidden' name=member_id value='"+member_id+"'>");
		if(memberpage_number!=""){
			if($(".member_id").length == 1){
				memberpage_number--;
			}
			if(memberpage_number == 1){
				memberpage_number = 1;
			}
    		$("#delete_form").append("<input type='hidden' name=memberpage value='"+memberpage_number+"'>");
		}
		if(member_word != ""){
			$("#delete_form").append("<input type='hidden' name=member_word value='"+member_word+"'>");
		}
	    $("#delete_form").submit();
	})
	</script>

	<script type="text/javascript">
	//checkbox 관련 스크립트
    let member_cnt = 0;
	let member_checkBox_cnt = 0;
	$(function () {
    	$("#member_checkAll_span , #member_checkAll_text , #member_checkAll_label").click(function () {
        	if(member_cnt == 0){
	        $(".member_CheckEach").prop("checked" , true);
	        $("#member_checkAll_text").text("선택 해제");
	        member_checkBox_cnt = $(".member_CheckEach").length
	        member_cnt = 1;
        	}else{
	        	$(".member_CheckEach").prop("checked" , false);
	        	$("#member_checkAll_text").text("모두 선택");
	        	member_checkBox_cnt = 0;
	        	member_cnt = 0;
        	}
		});
	});
	
	$(".member_text , .member_icon , .member_label").click(function() {
		
		let member_check_index = 0;
		if($(this).html() == "선택"){
			member_check_index = $(".member_text").index(this)
		}else{
			member_check_index = $(".member_icon").index(this)
		}
		
		if(document.getElementsByClassName("member_CheckEach")[member_check_index].checked == false){
			member_checkBox_cnt++;
		}

		if(document.getElementsByClassName("member_CheckEach")[member_check_index].checked == true){
			member_checkBox_cnt--;
		}
		if($(".member_CheckEach").length == member_checkBox_cnt){
			$("#member_checkAll_text").text("선택 해제");
			$("#member_checkAll").prop("checked" , true);
			member_cnt = 1;
		}
		
		if($(".member_CheckEach").length != member_checkBox_cnt){
			$("#member_checkAll_text").text("모두 선택");
			$("#member_checkAll").prop("checked" , false);
			member_cnt = 0;
		}
	})
	
	 
	 let permission_cnt = 0;
	 let permission_checkBox_cnt = 0;
	 $(function () {
     	$("#permission_checkAll_span ,#permission_checkAll_text , #permission_checkAll_label").click(function () {
        	if(permission_cnt == 0){
	        	$(".permission_CheckEach").prop("checked" , true);
	        	$("#permission_checkAll_text").text("선택 해제");
	        	permission_checkBox_cnt = $(".permission_CheckEach").length
	        	permission_cnt = 1;
        	}else{
	       		$(".permission_CheckEach").prop("checked" , false);
	        	$("#permission_checkAll_text").text("모두 선택");
	        	permission_checkBox_cnt = 0
	        	permission_cnt = 0;
        	}
    	});
	});

	$(".permission_text , .permission_icon , .permission_label").click(function() {
		let permission_check_index = 0;
		console.log($(this).typeof())
		if($(this).html() == "선택"){
			permission_check_index = $(".permission_text").index(this)
		}else{
			permission_check_index = $(".permission_icon").index(this)
		}
		
		if(document.getElementsByClassName("permission_CheckEach")[permission_check_index].checked == false){
			permission_checkBox_cnt++;
		}

		if(document.getElementsByClassName("permission_CheckEach")[permission_check_index].checked == true){
			permission_checkBox_cnt--;
		}
		if($(".permission_CheckEach").length == permission_checkBox_cnt){
			$("#permission_checkAll_text").text("선택 해제");
			$("#permission_checkAll").prop("checked" , true);
			permission_cnt = 1;
		}
		
		if($(".permission_CheckEach").length != permission_checkBox_cnt){
			$("#permission_checkAll_text").text("모두 선택");
			$("#permission_checkAll").prop("checked" , false);
			permission_cnt = 0;
		}
	})
	
	 
     
	function checkedDelete() {
		let length = document.getElementsByClassName("member_CheckEach").length;
		let hidden = []; 
		let member_check_true = 0;
		for(var i=0; i<length; i++){
			if(document.getElementsByClassName("member_CheckEach")[i].checked == true){
				hidden.push(document.getElementsByClassName("member_id")[i].value)
				member_check_true++;
			}
		}
		if(hidden.length > 0){
			let delete_memberpage_number = getParameterByName('memberpage');
			let memberlist_lastpage_cnt = (function() {
				if(${memberPage.totalCount} % 10 == 0){
					return 10
				}else{
					return ${memberPage.totalCount} % 10 
				}
			})();
			
			if(member_check_true == memberlist_lastpage_cnt){
				delete_memberpage_number--;
			}
			if(delete_memberpage_number == 0 || delete_memberpage_number == "" || delete_memberpage_number == -1){
				delete_memberpage_number = 1;
			}
			$("#member_ids").attr("value",hidden);
			if(delete_memberpage_number != ""){
				$("#delete_check_form").append("<input type='hidden' name=memberpage value='"+delete_memberpage_number+"'>")
			}
			return true;
		}
		return false;
	}
	
	function checkPermission() {
		let length = document.getElementsByClassName("permission_CheckEach").length;
		let hidden = []; 
		let permission_check_true = 0;
		for(var i=0; i<length; i++){
			if(document.getElementsByClassName("permission_CheckEach")[i].checked == true){
				hidden.push(document.getElementsByClassName("permission_id")[i].value)
				permission_check_true++;
			}
		}
		if(hidden.length > 0){
			let permission_page_number = getParameterByName('permissionpage');
			let permission_lastpage_cnt = (function() {
				if(${permissionPage.totalCount} % 10 == 0){
					return 10
				}else{
					return ${permissionPage.totalCount} % 10 
				}
			})();
			
			if(permission_check_true == permission_lastpage_cnt){
				permission_page_number--;
			}
			if(permission_page_number == 0 || permission_page_number == "" || permission_page_number == -1){
				permission_page_number = 1;
			}
			$("#permission_ids").attr("value",hidden);
			if(permission_page_number != ""){
				$("#permission_check_form").append("<input type='hidden' name=permissionpage value='"+permission_page_number+"'>")
			}
			sessionStorage.setItem("message" , "page_2");
			return true;
		}
		return false;
	}
	</script>

	<script type="text/javascript">
	//permission paging 관련 스크립트
	let paging_member_number = getParameterByName('memberpage');
	let paging_permission_number = getParameterByName('permissionpage');
	let permission_word = getParameterByName('permission_word');
	let member_word = getParameterByName('member_word');
// 	window.onload=function(){
//         if(getCookie("pageIndex") != null){
//         	document.getElementsByClassName("permission_cnt")[0].st
//         	$(".permission_cnt").get(0).css({"background-color" : "red"})
//         }
//     }
	
		$("#permission_firstpage").click(function() {
			alert(document.getElementsByClassName("permission_cnt")[0].value)
			sessionStorage.setItem("message" , "page_2");
			setCookie("pageIndex" , "1" , 1)
			if(paging_member_number == 1 || paging_member_number ==""){
				location.href="<c:url value='/member/list?permissionpage=1&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=1&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#permission_previous").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(paging_member_number == 1 || paging_member_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-10}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-10}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$(".permission_cnt").click(function() {
			let permission_cnt_index = $(".permission_cnt").index(this);
			let cnt = $(".permission_cnt_index").get(permission_cnt_index).value;
			sessionStorage.setItem("message" , "page_2");
			if(paging_member_number == 1 || paging_member_number ==""){
				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#permission_nextpage").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(paging_member_number == 1 || paging_member_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#permission_lastpage").click(function() {
			sessionStorage.setItem("message" , "page_2");
			if(paging_member_number == 1 || paging_member_number ==""){
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
	//member paging 관련 스크립트

		$("#member_firstpage").click(function() {
		alert(member_word);
			if(paging_permission_number == 1 || paging_permission_number ==""){
				location.href="<c:url value='/member/list?memberpage=1&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=1&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#member_previous").click(function() {
			if(paging_permission_number == 1 || paging_permission_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-10}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-10}&permissionpage"+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$(".member_cnt").click(function() {
			let member_cnt_index = $(".member_cnt").index(this);
			let cnt = $(".member_cnt_index").get(member_cnt_index).value;
			if(paging_permission_number == 1 || paging_permission_number ==""){
				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#member_nextpage").click(function() {
			if(paging_permission_number == 1 || paging_permission_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
		
		$("#member_lastpage").click(function() {
			if(paging_permission_number == 1 || paging_permission_number ==""){
				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}else{
				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
			}
		})
	</script>
</body>
</html>
