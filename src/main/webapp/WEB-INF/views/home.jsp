<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>" />
</head>
<body onload="changeImg()">
    <section>
        <div class="main-box">
            <div class="manubar">
                <div class="manubar-logo">
                    <div class="logoimg-frame"><img src='<c:url value = "/resources/flatfish1.jpg"/>'></div>
                </div>
                <div class="manubar-collection">
                    <ul>
                        <li><a href="#">회사소개</a></li>
                        <li><a href="#">인사말</a></li>
                        <li><a href="#">양식과정</a></li>
                        <li><a href="#">오시는길</a></li>
                        <li><a href="#">배달과정</a></li>
                        <li><a href="#">중도매인 문의</a></li>
                    </ul>
                </div>
                <div>
                    facebook
                    instagram
                    twiter
                    ???
                </div>
            </div>
            <div class="imgbar">
                <img class = "imgleftbtn" id="mainimgleft" src="https://cdn0.iconfinder.com/data/icons/zondicons/20/arrow-outline-left-512.png" onclick="changeleftImg()">
                <img class = "imgrightbtn" id="mainimgleft" src="https://cdn0.iconfinder.com/data/icons/zondicons/20/arrow-outline-right-256.png" onclick="changerightImg()">
                <img id="mainimg" src='<c:url value = "/resources/flatfish1.jpg"/>'>
            </div>
        </div>
    </section>
</body>
<script >
    var mainImg = document.getElementById("mainimg");
    var collectionImg = ['<c:url value = "/resources/flatfish1.jpg"/>','<c:url value = "/resources/flatfish2.jpg"/>','<c:url value = "/resources/flatfish3.jpg"/>','<c:url value = "/resources/flatfish4.jpg"/>'];
    var imageIndex = 0;
    function changeImg() {
        if (imageIndex >= collectionImg.length-1) {
            imageIndex = 0;
        }
        mainImg.setAttribute("src", collectionImg[imageIndex]);
        imageIndex++;
        setTimeout(changeImg,2000);
    }

    function changeleftImg(){
        if(imageIndex <= 0){
            mainImg.setAttribute("src", collectionImg[imageIndex]);
            imageIndex = collectionImg.length-1;
        }else{
            mainImg.setAttribute("src", collectionImg[imageIndex--])
        }
    }
    function changerightImg(){
        if(imageIndex >= collectionImg.length-1){
            mainImg.setAttribute("src", collectionImg[imageIndex]);
            imageIndex=0;
        }else{
            mainImg.setAttribute("src", collectionImg[imageIndex++]);
        }
    }

</script>
</html>