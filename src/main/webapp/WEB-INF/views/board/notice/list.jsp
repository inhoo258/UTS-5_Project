<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/notice/list.css'/>" />
<script src="https://kit.fontawesome.com/c2524284bc.js" crossorigin="anonymous"></script>
</head>
<body>
   <jsp:include page="../../header&footer/header.jsp" />
   <div class="noice_section">
      <div style="padding-bottom: 45px; ">
         <h2 class="tit">공지사항</h2>
         <span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
      </div>
      <div align="center">
         <form action=""> 
			<sec:authorize access="hasRole('ROLE_MASTER')">
           	 <div class="btn_write"><a href="<c:url value='/board/notice/form'/>">글 쓰기</a></div>
        	</sec:authorize>
         <table class="notice_table" >
            <thead>
               <tr class="tr_notice th_notice">
                  <th style="width: 70px;">글번호</th>
                  <th>제 목</th>
                  <th style="width: 130px;">작성일</th>
                  <th style="width: 70px;">조회</th>
               </tr>
            </thead>
            <!--     varStatus="status" 이용시 idx 가져오기 가능-->
            <tbody>
               <c:forEach var="list" items="${noticeList}" varStatus="status">
                  <tr class="tr_notice">
                     <td>${list.notice_number}</td>
                     <td class="td_title">
                        <a href='<c:url value="/board/notice/${list.notice_rn}"/>' class="a_title">${list.notice_title}</a>
                     </td>
                     <td>${list.notice_date}</td>
                     <td>${list.notice_views}</td>
                  </tr>
               </c:forEach>
            </tbody>
            <tr align="center">
               <td colspan="4" align="center">
               <div class="notice_paging">
               <div style="display: inline-block;">
               <div style="display:flex; border-left:1px solid #ddd;">
                  <c:if test="${pagingManager.nowPage ne 1}">
                     <a class="a_paging" href="<c:url value='/board/notice/list?page=1'/>">
                    	 <i class="fas fa-angle-double-left" style="vertical-align: middle; font-weight: 700; font-size: 15px;"></i>
                     </a>
                  </c:if> 
                  <c:if test="${pagingManager.nowBlock gt 1 }">
                     <a class="a_paging" href='<c:url value="/board/notice/list?page=${pagingManager.startPage-1}"/>'>
                    	 <i class="fas fa-angle-left" style="vertical-align: middle; font-weight: 700; font-size: 15px;"></i>
                     </a>
                  </c:if> 
                  <c:forEach var="i" begin="${pagingManager.startPage}" end="${pagingManager.endPage}">
                      <a class="a_paging a_num" href='<c:url value="/board/notice/list?page=${i}"/>' onclick="change_color_pagingBtn()">
                      	${i}
                      </a>
                  </c:forEach> 
                  <c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
                     <a class="a_paging" href="<c:url value='/board/notice/list?page=${pagingManager.endPage+1}'/>">
                     	<i class="fas fa-angle-right" style="vertical-align: middle; font-weight: 700; font-size: 15px;"></i>
                     </a>
                  </c:if> 
                  <c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
                     <a class="a_paging end_paging " href="<c:url value='/board/notice/list?page=${pagingManager.totalPage}'/>">
                     	<i class="fas fa-angle-double-right" style="vertical-align: middle; font-weight: 700; font-size: 15px;"></i>
                     </a>
                  </c:if>
                  </div>
                  </div>
                  </div>
               </td>
            </tr>
            <tr>
               <td style="width: 130px;">> 검색어 </td>   
               <td align="left" style="width: 300px;">
                  <input type="checkbox" name="search_title"> 제목 &nbsp;&nbsp;
                  <input type="checkbox" name="search_content"> 내용
               </td>   
               <td colspan="2">
                  <div class="notice_search" >
                     <input type="text" style="height: 40px; width:270px; border: 1px solid #d3d3d3;">
                     <div class="search_img" align="center">
                     	<a><i class="fas fa-search"></i></a>
                     </div>
                  </div>
               </td>   
            </tr>
         </table>
         </form>
      </div>
   </div>
	<div> 글 하나도 없을 때 끝으로 가기 페이지 안보이게 해야함!!!!!!!!!!!!!!!!!!!!!1</div>
   <jsp:include page="../../header&footer/footer.jsp"/>
	<script type="text/javascript">
	let index = 0;
		$(".a_num").click(function() {
			index = $(this).index()
			$.cookie("change_color", index);
		});
// 		$.cookie("change_color")
		
// 		if($.cookie("change_color"))
		function change_color_pagingBtn() {
		$(".a_num").get(index).css({"background-color" : "#f7f7f7"})
		}
	</script>
</body>
</html>