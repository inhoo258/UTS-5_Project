<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/changepwd.css'/>" />
</head>
<body>
<section class= "findsendeamilframe">
       <div class = "findsendemail">
           <div class = "findsendform">
               <div class = "findsendtitle">
                   <h3 id= "findsendtitlemsg">비밀번호 찾기</h3>
               </div>
               <form id="findform" action="<c:url value='/member/changepwd'/>" method="post" onsubmit="return checkUpdatePw()">
                   <div class="collectionfind">
                       <div class="findkey">
                           <input type="password" id="password" placeholder="바꿀 비밀번호를 입력하세요" >
                       </div>
                       <div class="findvalue">
	                       <font id="pw_check"></font>
	                   </div>
                       <div class="findkey">
                           <input type="password" id="passwordOK" placeholder="바꿀 비밀번호를 다시 한번 입력하세요" >
                       </div>
                    	<div class="findvalue">
                            <font id="pw_check_msg"></font>
                        </div>
                       <div class="findsendbtn">
                           <input type="submit" value="확인">
                       </div>
                   </div>
               </form>
           </div>
       </div>
   </section>
   <script type="text/javascript">
   		let pw_check = false;
   		let pw_ok_check = false;
   		let member_pw = document.getElementById("password");
   		let member_pwOK = document.getElementById("passwordOK");
   		let pw_msg = document.getElementById("pw_check");
   		let pw_msgOK = document.getElementById("pw_check_msg");
   		member_pw.onblur = function() { passwordcheck() };
   		member_pwOK.onblur = function() { passwordcheckOK() };
   		function passwordcheck(){
			if(member_pw.value.length == 0){
				pw_msg.style.color = "red";
				pw_msg.innerText = "필수 항목입니다.";
   				pw_check = false;
			}else if(!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#]).{10,15}$/.test(member_pw.value)){
				pw_msg.style.color = "red";
				pw_msg.innerText = "글자수 10-15, 영어 대/소문자, 특수문자, 숫자로 입력해주세요.";
   				pw_check = false;
			}else{
				pw_msg.style.color = "#2a365c";
				pw_msg.innerText = "사용가능한 비밀번호 입니다.";
   				pw_check = true;
			}
   		}
   		function passwordcheckOK(){
   			if(member_pwOK.value.length == 0){
   				pw_msgOK.style.color = "red";
   				pw_msgOK.innerText = "비밀번호를 일치 시켜 주세요.";
   				pw_ok_check = false;
			}else if(member_pw.value != member_pwOK.value){
				pw_msgOK.style.color = "red";
				pw_msgOK.innerText = "비밀번호를 일치 시켜 주세요.";
   				pw_ok_check = false;
			}else{
				pw_msgOK.style.color = "#2a365c";
				pw_msgOK.innerText = "비밀번호가 일치합니다.";
   				pw_ok_check = true;
			}
   		}
   		function checkUpdatePw(){
   			console.log(pw_check);
   			console.log(pw_ok_check);
   			if(pw_check&&pw_ok_check ){
   				return true;
   			}else{
   				console.log("false1");
   				return false;
   			}
   		}
   
   
   </script>
</body>
</html>