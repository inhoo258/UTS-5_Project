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
<!-- <script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" />

</head>
<body>
	<!--로딩화면 -->
	<div id="mask"></div>
	<div class="loader"></div>
 	<header>
            <div id="header_main">
            	<div>
<!-- 	                <div> -->
	                    <img src="/project/resources/main_logo.png">
<!-- 	                </div> -->
                </div>
                <div>
                    <div id=header_muenbar1 class="header_muenbar">
                        <div><a href="">menu1</a></div>
                    </div>
                    <div id=header_muenbar2 class="header_muenbar">
                        <div><a href="">menu2</a></div>
                    </div>
                    <div id=header_muenbar3 class="header_muenbar">
                        <div><a href="">menu3</a></div>
                    </div>
                    <div id=header_muenbar4 class="header_muenbar">
                        <div><a href="">menu4</a></div>
                    </div>
                </div>
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
            $("#sidebar_icon").animate({ "top": "15px", "right": "15px" })
            $(".sidebar_span").css({ "background": "#2a365c" })
        }
    })  
	</script> 
	
    

</body>
</html>