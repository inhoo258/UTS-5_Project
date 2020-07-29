<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="container">
    <section id=menubar class=item>
        <img src=resources/main_logo.png>
        <ul>
            <li><a href="#" class="main_explain">회사소개</a></li>
            <li><a href="#" class="main_explain">인사말</a></li>
            <li><a href="#" class="main_explain">양식과정</a></li>
            <li><a href="#" class="main_explain">오시는길</a></li>
            <li><a href="#" class="main_explain">배달과정</a></li>
        </ul>
        <div id=next>
            <span id=next_page>NEXT</span>
            <span id=next_span1 class="next_span"></span>
            <span id=next_span2 class="next_span"></span>
            <span id=next_span3 class="next_span"></span>
            <span id=next_span4 class="next_span"></span>
            <span id=next_span5 class="next_span"></span>
            <span id=next_span6 class="next_span"></span>
        </div>
        <div id="section_commonse0" class="section_commonse">
            <div id=exit class="exit">
                <span id=exit_span1></span>
                <span id=exit_span2></span>
            </div>
            <div id="aaa">
                asdfasdfsadfsadf
            </div>
        </div>
        <div id="section_commonse1" class="section_commonse">
            <div id=exit class="exit">
                <span id=exit_span1></span>
                <span id=exit_span2></span>
            </div>
            <div>
                bbbbbb
            </div>
        </div>
        <div id="section_commonse2" class="section_commonse">
            <div id=exit class="exit">
                <span id=exit_span1></span>
                <span id=exit_span2></span>
            </div>
        </div>
        <div id="section_commonse3" class="section_commonse">
            <div id=exit class="exit">
                <span id=exit_span1></span>
                <span id=exit_span2></span>
            </div>
        </div>
        <div id="section_commonse4" class="section_commonse">
            <div id=exit class="exit">
                <span id=exit_span1></span>
                <span id=exit_span2></span>
            </div>
        </div>
        <div class="section_div1"></div>
        <video src=resources/배경.mp4 loop muted autoplay id="video"></video>
    </section>

    <section id=menu_collection>
    	<jsp:include page="header&footer/header.jsp"></jsp:include>
    </section>
</div>
	<script>
	    let index_save;
	    $(".main_explain").click(function () {
	        if (index_save != undefined) {
	            $("#section_commonse" + index_save).css({ "width": "0", "height": "0", "overflow": "hidden" })
	            $("#section_commonse" + index_save).css({ "border": "none" })
	        }
	        let index = $(".main_explain").index(this);
	        index_save = index
	        let cnt = $(".section_commonse").length;
	        $("#section_commonse" + index).animate({ "width": "1500px", "height": "840px", "overflow": "none" })
	        $("#section_commonse" + index).css({ "border": "2px solid yellow" })
	    })
	
	    $(".exit").click(function () {
	        let exit_index = $(".exit").index(this)
	        $("#section_commonse" + exit_index).animate({ "width": "0", "height": "0", "overflow": "hidden" })
	        $("#section_commonse" + exit_index).css({ "border": "none" })
	    })
	</script>
	
	<script>
	    $("#next").click(function () {
	        $("#menubar").animate({ "top": "-100%", "overflow": "hidden" }, 2000)
	        $("#menu_collection").animate({ "top": "0%" }, 2000)
	    })
	
	</script>
</body>
</html>