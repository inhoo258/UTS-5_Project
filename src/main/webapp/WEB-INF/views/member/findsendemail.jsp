<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<c:url value='/resources/css/member/findsendemail.css'/>" />
<body>
    <section class= "findsendeamilframe">
        <div class = "findsendemail">
            <div class = "findsendform">
                <div class = "findsendtitle">
                    <h3 id= "findsendtitlemsg">비밀번호 찾기</h3>
                </div>
                <form id="findform" action="<c:url value='/member/changepwd'/>" method="post" onsubmit="return checkNum()">
                    <div class="collectionsend">
                        <div class="findtextbox">
                            <input type="text" id="cernum" placeholder="전송된 인증번호를 입력해주세요" >
                        </div>
                        <div class="textframe">
	                       	<p id="fristtxt">인증번호를 못 받았다면? <a href="#">인증번호 재전송 ></a></p>
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
    function checkNum(){
    		let imputusernum = document.getElementById("cernum").value;
    		let emailnum = ${ctfnum};
    		if(imputusernum != emailnum){
    			document.getElementsByClassName("textframe")[0].style.height= '60px';
    			document.getElementById("secondtxt").style.display='block';
    			document.getElementById("secondtxt").style.color = 'red';
    			document.getElementById("secondtxt").innerText = '인증번호를 다시 확인해주세요.';
    			return false;
    		}else{
    			return true;
    		}
    	}
    
    
    
    </script>
</body>
</html>