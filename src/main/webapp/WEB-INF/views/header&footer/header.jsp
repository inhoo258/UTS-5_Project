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
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" />

</head>
<body>
	<!--로딩화면 -->
<!-- 	<div id="mask"></div> -->
<!-- 	<div class="loader"></div> -->
 	<header>
        <div id=header_div>
            <div id="header_img">
                <img src="/project/resources/img/main_logo.png">
            </div>
            <span id=header_search_span>
                <input type="text" id="header_search">
                <div id="header_search_img">
                    <img src="/project/resources/img/search.png">
                </div>
            </span>
            <!-- 익명사용자 -->
            <div id="header_menu_div">
                <div id="login_img" title="로그인"><img src="/project/resources/img/login.png"></div>
                <div id="information_img" title="내 정보"><img src="/project/resources/img/information.png"></div>
                <div id="lastproduct_img" title="장바구니"><img src="/project/resources/img/cart.png"></div>
                <div id="header_icon">
                    <div>
                        <span id=sidebar_span1 class="sidebar_span"></span>
                        <span id=sidebar_span2 class="sidebar_span"></span>
                        <span id=sidebar_span3 class="sidebar_span"></span>
                    </div>
                </div>
            </div>
            <!-- 로그인 사용자 -->
            <!-- <div id="header_menu_div">
            <div id="information_img" title="내 정보"><img src="information.png"></div>
            <div id="lastproduct_img" title="최근 본 상품"><img src="lastproduct.png"></div>
            <div id="logout_img" title="로그아웃"><img src="logout.png"></div>
        </div> -->
        </div>

        <div id="sidebar_back">
            <div id="sidebar_main">
                <div id="sidebar_logo">
                    <img src="/project/resources/img/header_logo.png">
                </div>
            </div>
            <div id=sidebar_icon>
                <input type="checkbox" hidden class=sidebar_check>
                <span id=sidebar_span1 class="sidebar_span"></span>
                <input type="checkbox" hidden class=sidebar_check>
                <span id=sidebar_span2 class="sidebar_span"></span>
                <input type="checkbox" hidden class=sidebar_check>
                <span id=sidebar_span3 class="sidebar_span"></span>
            </div>
            <div id="sidebar">
                <div id="sidebar_main_logo">
                    <img src="/project/resources/img/sidebar_logo.png">
                </div>
                <div id="sidebar_menu_div">
                    <div>
                        <a href="#">Login</a>
                        <a href="#">information</a>
                        <a href="#">my_cart</a>
                    </div>
                    <div>
                        <h3>information</h3>
                        <h3>board</h3>
                        <h3>customer center</h3>
                    </div>
                    <div>
                        <ul>
                            <li><a href="#">회원정보</a></li>
                            <li><a href="#">회원정보</a></li>
                            <li><a href="#">회원정보</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">판매자 게시판</a></li>
                            <li><a href="#">리뷰 게시판</a></li>
                            <li><a href="#">QNA 게시판</a></li>
                            <li><a href="#">자유 게시판</a></li>
                            <li><a href="#">이벤트 게시판</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">1:1 문의</a></li>
                            <li><a href="#">온라인 문의</a></li>
                            <li><a href="#">이메일 문의</a></li>
                        </ul>
                    </div>
                </div>
                <div id="header_icon_box">
                    <span id="header_side_icon1" class="header_side_icon"></span>
                    <span id="header_side_icon2" class="header_side_icon"></span>
                </div>
            </div>
        </div>
    </header>



    <script>
        let Scroll_sangtae;
        $(window).scroll(function (event) {
            Scroll_sangtae = true;
        });

        let save_scroll;
        setInterval(function () {
            if (Scroll_sangtae) {
                Scrolled();
                Scroll_sangtae = false;
            }
        }, 250);



        function Scrolled() {
            let scrolltop = $(this).scrollTop();
            if (scrolltop >= 200) {
                document.getElementById("sidebar_back").style.animationDuration = "1s"
                document.getElementById("sidebar_back").style.animationName = "sidebar_down"
                document.getElementById("sidebar_back").style.animationFillMode = "forwards"
            } else if (scrolltop <= 200 && save_scroll >= 200) {
                document.getElementById("sidebar_back").style.animationDuration = "1s"
                document.getElementById("sidebar_back").style.animationName = "sidebar_up"
                document.getElementById("sidebar_back").style.animationFillMode = "forwards"
            }
            save_scroll = scrolltop;
        }

    </script>

    <script>
        $("#header_icon").click(function () {
            document.getElementById("sidebar").style.animationDuration = "1s";
            document.getElementById("sidebar").style.animationName = "header_sidebar_on";
            document.getElementById("sidebar").style.animationFillMode = "forwards";
            document.getElementById("header_icon_box").style.display = "block"
            $(".sidebar_check").prop("checked", true);
        })

        $("#header_icon_box").click(function () {
            document.getElementById("sidebar").style.animationDuration = "1s";
            document.getElementById("sidebar").style.animationName = "header_sidebar_off";
            document.getElementById("sidebar").style.animationFillMode = "forwards";
            document.getElementById("header_icon_box").style.display = "none"
            $(".sidebar_check").prop("checked", false);
        })


        $("#sidebar_icon").click(function () {
            if ($(".sidebar_check").prop("checked")) {
                $(".sidebar_check").prop("checked", false);
                document.getElementById("sidebar").style.animationDuration = "1s";
                document.getElementById("sidebar").style.animationName = "sidebar_off";
                document.getElementById("sidebar").style.animationFillMode = "forwards";

                document.getElementById("sidebar_icon").style.animationDuration = "1s";
                document.getElementById("sidebar_icon").style.animationName = "sidebar_icon_off";
                document.getElementById("sidebar_icon").style.animationFillMode = "forwards";

            } else {
                $(".sidebar_check").prop("checked", true);
                document.getElementById("sidebar").style.animationDuration = "1s";
                document.getElementById("sidebar").style.animationName = "sidebar_on";
                document.getElementById("sidebar").style.animationFillMode = "forwards";
                document.getElementById("header_icon_box").style.display = "none"

                document.getElementById("sidebar_icon").style.animationDuration = "1s";
                document.getElementById("sidebar_icon").style.animationName = "sidebar_icon_on";
                document.getElementById("sidebar_icon").style.animationFillMode = "forwards";
            }
        })

        $(window).on("scroll", function () {
            if ($(".sidebar_check").prop("checked")) {
                $(".sidebar_check").prop("checked", false);
                document.getElementById("sidebar").style.animationDuration = "1s";
                document.getElementById("sidebar").style.animationName = "sidebar_off";
                document.getElementById("sidebar").style.animationFillMode = "forwards";

                document.getElementById("sidebar_icon").style.animationDuration = "1s";
                document.getElementById("sidebar_icon").style.animationName = "sidebar_icon_off";
                document.getElementById("sidebar_icon").style.animationFillMode = "forwards";
                document.getElementById("sidebar_icon").style.zIndex = "none";
            }
        })
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
</body>
</html>