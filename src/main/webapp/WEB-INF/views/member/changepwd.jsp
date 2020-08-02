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
               <form id="findform" action="<c:url value='/member/changepwd'/>" method="post" onsubmit="return checkpassword()">
                   <div class="collectionsend">
                       <div class="findtextbox">
                           <input type="password" id="password" placeholder="바꿀 비밀번호를 입력하세요" >
                       </div>
                       <div class="findtextbox">
                           <input type="password" id="passwordOK" placeholder="바꿀 비밀번호를 다시 한번 입력하세요" >
                       </div>
                       <div class="textframe">
                           <p id="secondtxt"></p>
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
   		
   
   
   
   
   </script>
</body>
</html>