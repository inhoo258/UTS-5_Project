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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>" />
</head>
<body>

	<!--로딩화면 -->
	<div id="mask"></div>
	<div class="loader"></div>
	<img alt="" src="<c:url value='/resources/test.jpg'/>" id="bg-img">
	<header>
		<div class="se_div">
			<section align="center" class="section header-section1">
				<h1>
					<a href="<c:url value='/'/>"><font id="H-font">Home</font></a>
				</h1>
			</section>
			<section align="center" class="section header-section2">
				<nav class="nav-meun1 h_menu">
					<h3>
						<a href="#"><font id="H-font">메뉴1</font></a>
					</h3>
				</nav>
				<nav class="nav-meun2 h_menu">
					<h3>
						<a href="#"><font id="H-font">메뉴2</font></a>
					</h3>
				</nav>
				<nav class="nav-meun3 h_menu">
					<h3>
						<a href="#"><font id="H-font">메뉴3</font></a>
					</h3>
				</nav>
				<nav class="nav-meun4 h_menu">
					<h3>
						<a href="#"><font id="H-font">메뉴4</font></a>
					</h3>
				</nav>
			</section>
			<section class="section header-section3">
				<input type="checkbox" id="menuicon"> <label for=menuicon
					id="H-label" class="h_label"> <span></span> <span></span> <span></span>
				</label>

				<div class="sidebar">
					<sec:authorize access="isAnonymous()">
						<div class="sidebar-container1">
							<h2>로그인을 해주세요.</h2>
							<a id="sidebar-login" href="<c:url value='/login'/>">LOGIN ></a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class="sidebar-container1">
							<i id="user-icon" class="fas fa-user-circle"></i> <b
								id="label-id"> <sec:authentication
									property="principal.username" /></b>&nbsp;&nbsp;<font>님</font> <br>
							<br>

						</div>
					</sec:authorize>
					<hr id="H_hr">
					<div id="sidebar-container2"> 
<!-- 					style=height 제거 (힘찬) -->
						<ul>
							<sec:authorize access="isAnonymous()">
								<li class="animated-button thar-four"><a id="H_a"
									href='<c:url value="/member/form"/>'>회원가입</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<c:set var="userId">
									<sec:authentication property="principal.username" />
								</c:set>
								<li class="animated-button thar-four"><a id="H_a"
									href='<c:url value="/member/info/${userId}"/>'>나의정보</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_SELLER','ROLE_MASTER')">
								<li class="animated-button thar-four"><a id="H_a" href=>나의상품목록</a></li>
								<li class="animated-button thar-four"><a id="H_a" href="#">상품추가</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_CUSTOMER','ROLE_MASTER')">
								<li class="animated-button thar-four"><a id="H_a" href="#">나의정보</a></li>
								<li class="animated-button thar-four"><a id="H_a" href="#">장바구니</a></li>
								<li class="animated-button thar-four"><a id="H_a" href="#">주문내역</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MASTER')">
								<li class="animated-button thar-four"><a id="H_a"
									href='<c:url value="/member/list"/>'>회원관리</a></li>
								<li class="animated-button thar-four"><a id="H_a"
									href='<c:url value="/product/list"/>'>상품관리</a></li>
							</sec:authorize>
						<sec:authorize access="isAuthenticated()">
								<li class="animated-button thar-four"><a id="H_a" style="position: absolute; top: 90%; left: 10%;" sidebar-logout" 
								href="<c:url value='/logout'/>">LOGOUT >></a></li>
						</sec:authorize>
						<!-- 로그아웃 위치 변경 이유 : 겹쳐보여서 안에다가 넣었습니다. -->
						</ul>
					</div>
				</div>
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




</body>
</html>