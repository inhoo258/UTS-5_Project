<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/project/resources/js/summernote-ko-KR.js"></script>
<style>
	*{
	text-decoration: none;
	}
</style>
</head>
<body>
	<!--로딩화면 -->
	<div id="mask"></div>
	<div class="loader"></div>
	  <header>
            <div id="header_menu1">
                <a href="#"><img src="resources/main_logo.png"></a>
            </div>
            <div id=sidebar_icon>
                <div id="sidebar_div">
                    <input type="checkbox" hidden class=sidebar_check>
                    <span id=sidebar_span1 class="sidebar_span"></span>
                    <input type="checkbox" hidden class=sidebar_check>
                    <span id=sidebar_span2 class="sidebar_span"></span>
                    <input type="checkbox" hidden class=sidebar_check>
                    <span id=sidebar_span3 class="sidebar_span"></span>
                </div>
            </div>
            <div id=sidebar>
                <section id="login_section">
                    <span>
                        <h1>로그인을 해주세요</h1>
                        <a href=""><h3>LogIn >></h3></a>
                        <div><img src="resources/anonymous.png" alt=""></div>
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
        </header>
	<script type="text/javascript">
		$(window).on("load", function() {
			$(".loader").fadeOut();
			$("#mask").fadeOut();
		});
	</script>

	<script type="text/javascript">
		$(function() {
			// 화면의 높이와 너비 
			var maskHeight = $(window).height();
			var maskWidth = $(window).width();

			// 전체화면을 채운다
			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight
			});
		});
	</script>
	
	<script>
    $("#sidebar_div").click(function () {
        if ($(".sidebar_check").prop("checked")) {
            $(".sidebar_check").prop("checked", false);
            $("#sidebar").animate({ "right": "-350px" })
            $("#sidebar_icon").animate({ "top": "40px", "right": "40px" })
            $(".sidebar_span").css({ "background": "white" })
        } else {
            $(".sidebar_check").prop("checked", true)
            $("#sidebar").animate({ "right": "0px" })
            $("#sidebar_icon").animate({ "top": "10px", "right": "10px" })
            $(".sidebar_span").css({ "background": "#2a365c" })
        }
    })  
</script>
	
    

</body>
</html>