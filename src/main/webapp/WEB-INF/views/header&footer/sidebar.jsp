<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/sidebar.css'/>" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="sidebar">
        <section id="login_section">
            <span>
                <h1>로그인을 해주세요</h1>
                <a href="">
                    LogIn >>
                </a>
                <div><img src="/project/resources/anonymous.png"></div>
            </span>
        </section>
        <section id="sidebar_menu_section">
            <ul>
                <li><a href="">상품 보기</a></li>
                <li><a href="">22</a></li>
                <li><a href="">33</a></li>
                <li><a href="">44</a></li>
                <li><a href="">55</a></li>
                <li><a href="">66</a></li>
                <li><a href="">77</a></li>
                <li><a href="">88</a></li>
            </ul>
        </section>
        <section id="logout_section">
            <a href="">Logout >></a>

        </section>
    </div>
    <div id=sidebar_icon>
        <input type="checkbox" hidden class=sidebar_check>
        <span id=sidebar_span1 class="sidebar_span"></span>
        <input type="checkbox" hidden class=sidebar_check>
        <span id=sidebar_span2 class="sidebar_span"></span>
        <input type="checkbox" hidden class=sidebar_check>
        <span id=sidebar_span3 class="sidebar_span"></span>
    </div>
    
    <script>
        $("#sidebar_icon").click(function () {
            if ($(".sidebar_check").prop("checked")) {
                $(".sidebar_check").prop("checked", false);
                $("#sidebar").animate({ "opacity": "0" },1000)
                $("#main_menu").delay(1000).animate({ "left": "50%" },1000);
                $("#sidebar_icon").delay(1000).animate({"right" : "240px"},1000)
                $("#sidebar").css({ "z-index": "-1" })
            } else {
                $(".sidebar_check").prop("checked", true)
                $("#sidebar_icon").animate({"right" : "10px"},1000)
                $("#main_menu").animate({ "left": "760px" }, 1000);
                $("#sidebar").css({ "z-index": "1" })
                $("#sidebar").delay(1000).animate({ "opacity": "1" })
            }
        })  
    </script>
    
</body>
</html>