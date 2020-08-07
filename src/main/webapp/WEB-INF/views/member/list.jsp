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
	<jsp:include page="../header&footer/header.jsp"></jsp:include>
	
	 <div id=memberlist_div>
        <div>
            <h2>회원 검색</h2>
            <div id=member_option_div>
                <table>
                    <tr>
                        <td>검색어</td>
                        <td>
                            <select>
                                <option value="select_all">-전체검색-</option>
                                <option value="member_name"> 이름 </option>
                                <option value="member_tel"> 전화번호 </option>
                                <option value="member_email"> Email </option>
                            </select>
                            <input type="text">
                        </td>
                        <td>회원 권한</td>
                        <td>
                            <input type="radio" id=auth_all name="auth" checked>
                            <label for="auth_all">All</label>
                            <input type="radio" id=customer name="auth">
                            <label for="customer">Customer</label>
                            <input type="radio" id=seller name="auth">
                            <label for="seller">Seller</label>
                        </td>
                    </tr>
                    <tr>
                        <td>승인 여부</td>
                        <td>
                            <input type="radio" id=enabled_all name="enabled" checked>
                            <label for="enabled_all">전체</label>
                            <input type="radio" id=true name="enabled">
                            <label for="true">승인</label>
                            <input type="radio" id=false name="enabled">
                            <label for="false">미승인</label>
                        </td>
                        <td>회원 등급</td>
                        <td>
                            <p id=member_LV>Silver</p>
                        	<select id=level>
                                <option value="Silver"> Silver </option>
                                <option value="Gold"> Gold </option>
                                <option value="Platinum"> Platinum </option>
                                <option value="VIP"> VIP </option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div>
                    <input type="button" value="Select">
                </div>
            </div>
            
        </div>

        <div>
            <div id=member_table_div>
                <div>
                    <input type="button" value="선택 승인">
                    <input type="button" value="선택 삭제">
                </div>
                <div>
                    <table>
                        <tr>
                            <th>
                            	<label class="checkbox member_label"> 
								<input type="checkbox" class="member_CheckEach"> 
								<span class="member_icon icon"></span> 
								</label>
							</th>
                            <th>ID <br> Name </th>
                            <th>Tel</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Auth</th>
                            <th>Enabled</th>
                            <th>기타</th>
                        </tr>
                        <c:forEach var="member" items="${memberlist}">
                        <tr>
                            <th>
								<label class="checkbox member_label"> 
								<input type="checkbox" class="member_CheckEach"> 
								<span class="member_icon icon"></span> 
								</label>
							</th>
                            <th>${member.member_id} <br> ${member.member_name} </th>
                            <th>${member.member_tel}</th>
                            <th>${member.member_main_addr}</th>
                            <th>${member.member_email}</th>
                            <th>${member.member_auth}</th>
                            <th>${member.member_enabled}</th>
                            <th>
                                <input type="button" value="승인">
                                <input type="button" value="삭제">
                            </th>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	    $(function(){
	        $("#level").change(function(){
	        	if($(this).val() == "Gold"){
		            $("#member_LV").css({"color" : "gold" , "border-color" : "gold"})
	        	}
	        	if($(this).val() == "Silver"){
		            $("#member_LV").css({"color" : "Silver" , "border-color" : "Silver"})
	        	}
	        	if($(this).val() == "Platinum"){
		            $("#member_LV").css({"color" : "mediumpurple" , "border-color" : "mediumpurple"})
	        	}
	        	if($(this).val() == "VIP"){
		            $("#member_LV").css({"color" : "tomato" , "border-color" : "tomato"})
	        	}
	            $("#member_LV").text($(this).val());
	        });
	    });
    </script>
    
    
    
    
	<script type="text/javascript">
	
// 	// 쿠키 스크립트
// 	var setCookie = function(name, value, day) {
//         var date = new Date();
//         date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
//         document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
//     };
	
//     var getCookie = function(name) {
//         var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
//         return value? value[2] : null;
//     };
    
//     var deleteCookie = function(name) {
//         var date = new Date();
//         document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=/";
//     }
    
	</script>
	
	
	<script type="text/javascript">
// 		if(sessionStorage.getItem("message") == "page_2"){
// 			$("ul.tab li a").removeClass("on"); 
// 			$("#permissionlist").addClass("on");
// 			sessionStorage.removeItem("message")
// 		}
		
// 		$("#pagemanager>a").click(function(e) {
// 			e.preventDefault();
// 		});
		
// 		//회원 리스트 , 승인대기 리스트용 스크립트
// 		$(function(){
// 			$("ul.panel li:not("+$("ul.tab li a.on").attr("href")+")").hide() //class 속성에 on이 설정되어 있는 a태그의 href 속성을 가져오고 이 이외의 패널은 숨김.
// 			$("ul.tab li a").click(function(){  // ul에 a를 클릭 했을 때 
// 				$("ul.tab li a").removeClass("on"); // a에 있는 모든 클래스 on 삭제
// 			    $(this).addClass("on");  // 그리고 현재 요소에만 on 클래스 추가 
// 			    $("ul.panel li").slideUp("fast"); // 모든 패널 비표시
// 			    $($(this).attr("href")).slideDown("fast"); // 클릭된 a태그의 href의 속성을 가져와 같은 id 속성을 가진 패널 보여줌
// 			    return false; // 탭에 a요소로 되어 있어서 클릭했을 때 발생하는 click 이벤트 설정. 이동하지 못하게 함.
// 			});
// 		});
// 		//permissionpage용
// 		//memberpage용
		
	
// 		//url파라미터 뽑아오는 메서드
// 		function getParameterByName(name) {
// 		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
// 		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
// 			results = regex.exec(location.search);
// 		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
// 		}
	</script> 
	
	<script type="text/javascript">
// 	function sessionCreate() {
// 		sessionStorage.setItem("message" , "page_2");
// 	}
	</script>
	
	<script type="text/javascript">
// 	//단독 삭제 or 승인
	
// 	$(".permissionBtn").click(function() {
// 		let permission_word = getParameterByName('permission_word');
// 		let permission_index = $(".permissionBtn").index(this);
// 		let permissionpage_number = getParameterByName('permissionpage');
// 		let permission_id = $(".permission_id").get(permission_index).value;
// 		sessionStorage.setItem("message" , "page_2");
		
// 		$("body").append("<form id='permission_form'></form>")
// 		$("#permission_form").attr({"action" : "<c:url value='/member/permission'/>"});
// 		$("#permission_form").attr({"method" : "POST"});
// 		$("#permission_form").css({"display" : "hidden"});
// 		$("#permission_form").append("<input type='hidden' name='permission_id' value='"+permission_id+"'>");
// 		if(permissionpage_number!=""){
// 			if($(".permission_id").length == 1){
// 				permissionpage_number--;
// 			}
// 			if(permissionpage_number == 1){
// 				permissionpage_number = 1;
// 			}
//     		$("#permission_form").append("<input type='hidden' name='permissionpage' value='"+permissionpage_number+"'>");
// 		}
// 		if(permission_word != ""){
// 			$("#permission_form").append("<input type='hidden' name='permission_word' value='"+permission_word+"'>");
// 		}
// 	    $("#permission_form").submit();
// 	})
	
	
// 	$(".deleteBtn").click(function() {
// 		let member_word = getParameterByName('member_word');
// 		let member_index = $(".deleteBtn").index(this);
// 		let memberpage_number = getParameterByName('memberpage');
// 		let member_id = $(".member_id").get(member_index).value;
// 		$("body").append("<form id=delete_form></form>")
// 		$("#delete_form").attr({"action" : "<c:url value='/member/delete'/>"});
// 		$("#delete_form").attr({"method" : "POST"});
// 		$("#delete_form").css({"display" : "hidden"});
// 		$("#delete_form").append("<input type='hidden' name=member_id value='"+member_id+"'>");
// 		if(memberpage_number!=""){
// 			if($(".member_id").length == 1){
// 				memberpage_number--;
// 			}
// 			if(memberpage_number == 1){
// 				memberpage_number = 1;
// 			}
//     		$("#delete_form").append("<input type='hidden' name=memberpage value='"+memberpage_number+"'>");
// 		}
// 		if(member_word != ""){
// 			$("#delete_form").append("<input type='hidden' name=member_word value='"+member_word+"'>");
// 		}
// 	    $("#delete_form").submit();
// 	})
	</script>

	<script type="text/javascript">
// 	//checkbox 관련 스크립트
//     let member_cnt = 0;
// 	let member_checkBox_cnt = 0;
// 	$(function () {
//     	$("#member_checkAll_span , #member_checkAll_text , #member_checkAll_label").click(function () {
//         	if(member_cnt == 0){
// 	        $(".member_CheckEach").prop("checked" , true);
// 	        $("#member_checkAll_text").text("선택 해제");
// 	        member_checkBox_cnt = $(".member_CheckEach").length
// 	        member_cnt = 1;
//         	}else{
// 	        	$(".member_CheckEach").prop("checked" , false);
// 	        	$("#member_checkAll_text").text("모두 선택");
// 	        	member_checkBox_cnt = 0;
// 	        	member_cnt = 0;
//         	}
// 		});
// 	});
	
// 	$(".member_text , .member_icon , .member_label").click(function() {
		
// 		let member_check_index = 0;
// 		if($(this).html() == "선택"){
// 			member_check_index = $(".member_text").index(this)
// 		}else{
// 			member_check_index = $(".member_icon").index(this)
// 		}
		
// 		if(document.getElementsByClassName("member_CheckEach")[member_check_index].checked == false){
// 			member_checkBox_cnt++;
// 		}

// 		if(document.getElementsByClassName("member_CheckEach")[member_check_index].checked == true){
// 			member_checkBox_cnt--;
// 		}
// 		if($(".member_CheckEach").length == member_checkBox_cnt){
// 			$("#member_checkAll_text").text("선택 해제");
// 			$("#member_checkAll").prop("checked" , true);
// 			member_cnt = 1;
// 		}
		
// 		if($(".member_CheckEach").length != member_checkBox_cnt){
// 			$("#member_checkAll_text").text("모두 선택");
// 			$("#member_checkAll").prop("checked" , false);
// 			member_cnt = 0;
// 		}
// 	})
	
	 
// 	 let permission_cnt = 0;
// 	 let permission_checkBox_cnt = 0;
// 	 $(function () {
//      	$("#permission_checkAll_span ,#permission_checkAll_text , #permission_checkAll_label").click(function () {
//         	if(permission_cnt == 0){
// 	        	$(".permission_CheckEach").prop("checked" , true);
// 	        	$("#permission_checkAll_text").text("선택 해제");
// 	        	permission_checkBox_cnt = $(".permission_CheckEach").length
// 	        	permission_cnt = 1;
//         	}else{
// 	       		$(".permission_CheckEach").prop("checked" , false);
// 	        	$("#permission_checkAll_text").text("모두 선택");
// 	        	permission_checkBox_cnt = 0
// 	        	permission_cnt = 0;
//         	}
//     	});
// 	});

// 	$(".permission_text , .permission_icon , .permission_label").click(function() {
// 		let permission_check_index = 0;
// 		console.log($(this).typeof())
// 		if($(this).html() == "선택"){
// 			permission_check_index = $(".permission_text").index(this)
// 		}else{
// 			permission_check_index = $(".permission_icon").index(this)
// 		}
		
// 		if(document.getElementsByClassName("permission_CheckEach")[permission_check_index].checked == false){
// 			permission_checkBox_cnt++;
// 		}

// 		if(document.getElementsByClassName("permission_CheckEach")[permission_check_index].checked == true){
// 			permission_checkBox_cnt--;
// 		}
// 		if($(".permission_CheckEach").length == permission_checkBox_cnt){
// 			$("#permission_checkAll_text").text("선택 해제");
// 			$("#permission_checkAll").prop("checked" , true);
// 			permission_cnt = 1;
// 		}
		
// 		if($(".permission_CheckEach").length != permission_checkBox_cnt){
// 			$("#permission_checkAll_text").text("모두 선택");
// 			$("#permission_checkAll").prop("checked" , false);
// 			permission_cnt = 0;
// 		}
// 	})
	
	 
     
// 	function checkedDelete() {
// 		let length = document.getElementsByClassName("member_CheckEach").length;
// 		let hidden = []; 
// 		let member_check_true = 0;
// 		for(var i=0; i<length; i++){
// 			if(document.getElementsByClassName("member_CheckEach")[i].checked == true){
// 				hidden.push(document.getElementsByClassName("member_id")[i].value)
// 				member_check_true++;
// 			}
// 		}
// 		if(hidden.length > 0){
// 			let delete_memberpage_number = getParameterByName('memberpage');
// 			let memberlist_lastpage_cnt = (function() {
// 				if(${memberPage.totalCount} % 10 == 0){
// 					return 10
// 				}else{
// 					return ${memberPage.totalCount} % 10 
// 				}
// 			})();
			
// 			if(member_check_true == memberlist_lastpage_cnt){
// 				delete_memberpage_number--;
// 			}
// 			if(delete_memberpage_number == 0 || delete_memberpage_number == "" || delete_memberpage_number == -1){
// 				delete_memberpage_number = 1;
// 			}
// 			$("#member_ids").attr("value",hidden);
// 			if(delete_memberpage_number != ""){
// 				$("#delete_check_form").append("<input type='hidden' name=memberpage value='"+delete_memberpage_number+"'>")
// 			}
// 			return true;
// 		}
// 		return false;
// 	}
	
// 	function checkPermission() {
// 		let length = document.getElementsByClassName("permission_CheckEach").length;
// 		let hidden = []; 
// 		let permission_check_true = 0;
// 		for(var i=0; i<length; i++){
// 			if(document.getElementsByClassName("permission_CheckEach")[i].checked == true){
// 				hidden.push(document.getElementsByClassName("permission_id")[i].value)
// 				permission_check_true++;
// 			}
// 		}
// 		if(hidden.length > 0){
// 			let permission_page_number = getParameterByName('permissionpage');
// 			let permission_lastpage_cnt = (function() {
// 				if(${permissionPage.totalCount} % 10 == 0){
// 					return 10
// 				}else{
// 					return ${permissionPage.totalCount} % 10 
// 				}
// 			})();
			
// 			if(permission_check_true == permission_lastpage_cnt){
// 				permission_page_number--;
// 			}
// 			if(permission_page_number == 0 || permission_page_number == "" || permission_page_number == -1){
// 				permission_page_number = 1;
// 			}
// 			$("#permission_ids").attr("value",hidden);
// 			if(permission_page_number != ""){
// 				$("#permission_check_form").append("<input type='hidden' name=permissionpage value='"+permission_page_number+"'>")
// 			}
// 			sessionStorage.setItem("message" , "page_2");
// 			return true;
// 		}
// 		return false;
// 	}
	</script>

	<script type="text/javascript">
// 	//permission paging 관련 스크립트
// 	let paging_member_number = getParameterByName('memberpage');
// 	let paging_permission_number = getParameterByName('permissionpage');
// 	let permission_word = getParameterByName('permission_word');
// 	let member_word = getParameterByName('member_word');
// // 	window.onload=function(){
// //         if(getCookie("pageIndex") != null){
// //         	document.getElementsByClassName("permission_cnt")[0].st
// //         	$(".permission_cnt").get(0).css({"background-color" : "red"})
// //         }
// //     }
	
// 		$("#permission_firstpage").click(function() {
// 			alert(document.getElementsByClassName("permission_cnt")[0].value)
// 			sessionStorage.setItem("message" , "page_2");
// 			setCookie("pageIndex" , "1" , 1)
// 			if(paging_member_number == 1 || paging_member_number ==""){
// 				location.href="<c:url value='/member/list?permissionpage=1&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?permissionpage=1&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#permission_previous").click(function() {
// 			sessionStorage.setItem("message" , "page_2");
// 			if(paging_member_number == 1 || paging_member_number ==""){
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-10}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.startPage-10}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$(".permission_cnt").click(function() {
// 			let permission_cnt_index = $(".permission_cnt").index(this);
// 			let cnt = $(".permission_cnt_index").get(permission_cnt_index).value;
// 			sessionStorage.setItem("message" , "page_2");
// 			console.log(paging_member_number);
// 			console.log(cnt);
// 			if(paging_member_number == 1 || paging_member_number ==""){
// 				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?permissionpage="+cnt+"&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#permission_nextpage").click(function() {
// 			sessionStorage.setItem("message" , "page_2");
// 			if(paging_member_number == 1 || paging_member_number ==""){
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.endPage+1}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#permission_lastpage").click(function() {
// 			sessionStorage.setItem("message" , "page_2");
// 			if(paging_member_number == 1 || paging_member_number ==""){
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?permissionpage=${permissionPage.totalPage}&memberpage="+paging_member_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 	//member paging 관련 스크립트

// 		$("#member_firstpage").click(function() {
// 		alert(member_word);
// 			if(paging_permission_number == 1 || paging_permission_number ==""){
// 				location.href="<c:url value='/member/list?memberpage=1&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?memberpage=1&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#member_previous").click(function() {
// 			if(paging_permission_number == 1 || paging_permission_number ==""){
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-10}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.startPage-10}&permissionpage"+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$(".member_cnt").click(function() {
// 			let member_cnt_index = $(".member_cnt").index(this);
// 			let cnt = $(".member_cnt_index").get(member_cnt_index).value;
// 			if(paging_permission_number == 1 || paging_permission_number ==""){
// 				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?memberpage="+cnt+"&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#member_nextpage").click(function() {
// 			if(paging_permission_number == 1 || paging_permission_number ==""){
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.endPage+1}&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
		
// 		$("#member_lastpage").click(function() {
// 			if(paging_permission_number == 1 || paging_permission_number ==""){
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage=1&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}else{
// 				location.href="<c:url value='/member/list?memberpage=${memberPage.totalPage}&permissionpage="+paging_permission_number+"&permission_word="+permission_word+"&member_word="+member_word+"'/>";
// 			}
// 		})
	</script>
</body>
</html>
