<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/member/findidpwd.css'/>" />
<title>Insert title here</title>
</head>
<body onload="changePage()">
    <section id="findid">
        <div class = "findidpwdmain">
            <div class = "findidpwdform">
                <div class = "findidpwdtitle">
                    <h3 id= "findidpwdtitlemsg"></h3>
                </div>
                <div class = "selectfind">
    				<input type="radio" id="id" name="findidpw" value="1" onclick="changePage2()"><label for="id"> 아이디 찾기</label>
    				<input type="radio" id="pwd" name="findidpw" value="2" onclick="changePage2()"><label for="pwd"> 비밀번호 찾기</label>
                </div>
                <form action="<c:url value='/member/certification'/>" method="post"f>
                    <div class="collectionfinder">
                        <div class="namefind">
                            <input type="text" name="member_name" placeholder="이름을 입력해주세요." autofocus="autofocus" autocomplete="off">
                        </div>
                        <div class="idfind">
                            <input type="text" name="member_id" placeholder="가입하신 아이디를 입력하세요." autocomplete="off">
                        </div>
                        <div class="emailfind">
                            <input type="text" name="member_email" placeholder="가입하신 이메일을 입력하세요."  autocomplete="off">
                        </div>
                        <div class="findbtn">
                        	<input type="hidden" name="choice" value="${chocie }">
                            <input type="submit" value="찾기">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
		let whatpage = "${chocie}";
   		let radioFindId = document.getElementById("id");
   		let radioFindPwd = document.getElementById("pwd");
  		let titletext = document.getElementById("findidpwdtitlemsg");
  		let idframe = document.getElementsByClassName("idfind")[0];
   		let findIdPwd = document.getElementsByName("findidpw");
   		let findform = document.getElementsByClassName("findidpwdform")[0];
  		let choicepage = document.getElementsByName("choice")[0];
  		let message = "${message}";
   		function changePage(){
   			console.log(message);
   			if(message === "reloadpage"){ 
   				alert('일치하는 이메일이 없습니다.') 
   				};
   			if(message === "nonemessage"){
   				alert('일치하는 이메일이 없습니다.') 
   				};
    		if(whatpage == 'id' ){
   				findIdPwd[0].checked = true;
   				findIdPwd[1].checked = false;
   				titletext.innerText = "아이디 찾기";
   				idframe.style.display = "none";
   				findform.style.height = "350px";
   				choicepage.value = 'id';
    		}else{
   				findIdPwd[0].checked = false;
   				findIdPwd[1].checked = true;
   				titletext.innerText = "비밀번호 찾기";
   				idframe.style.display = "";
   				findform.style.height = "400px";
   				choicepage.value = 'pwd';
	    	}
		}
	   		
    	function changePage2(){
    		if(findIdPwd[0].checked){
   				titletext.innerText = "아이디 찾기";
   				idframe.style.display = "none";
   				findform.style.height = "350px";
   				choicepage.value = 'id';
    		}
    		else{
   				titletext.innerText = "비밀번호 찾기";
   				idframe.style.display = "block";
   				findform.style.height = "400px";
   				choicepage.value = 'pwd';
    		}
    	}
    	
    </script>
</body>
</html>