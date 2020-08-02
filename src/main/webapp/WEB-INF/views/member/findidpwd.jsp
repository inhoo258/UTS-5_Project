<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/member/findidpwd.css'/>" />
<title>Insert title here</title>
</head>
<body>
    <section>
        <div class = "findidpwdmain">
            <div class = "findidpwdform">
                <div class = "findidpwdtitle">
                    <h3 id= "findidpwdtitlemsg">비밀번호 찾기</h3>
                </div>
                <form action="<c:url value='/member/certification'/>" method="post">
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
                            <input type="submit" value="찾기">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>