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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   <jsp:include page="../../header&footer/header.jsp" />
   
      <div id=center_div>
        <div>
            <div>
                <h1>고객센터</h1>
                <section id=center_menu_section>
                    <ul>
                        <li><a>&nbsp;&nbsp;공지사항</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;자주하는 질문</a>>&nbsp;&nbsp;</li>
                        <li><a>&nbsp;&nbsp;1:1문의하기</a>>&nbsp;&nbsp;</li>
                    </ul>
                </section>
            </div>

            <div id=contents_div>
                <div>
                    <h2>공지사항</h2>
                    <h4>UTS의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요</h4>
                    <div id=contents_notis_table>
                        <table>
                            <tr>
                                <th>--</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                          	<c:forEach var="list" items="${noticeList}" varStatus="status">
		                  		<tr>
			                    	<th>${list.notice_number}</th>
			                     	<th class="td_title">
		                       			<a href='<c:url value="/board/notice/${list.notice_rn}"/>' class="a_title">${list.notice_title}</a>
		                     		</th>
		                     		<th>Master</th>
				                    <th>${list.notice_date}</th>
				                    <th>${list.notice_views}</th>
		                  		</tr>
		               		</c:forEach>
		               		<tr>
		               			<th colspan="5">
		               			<div>
								<c:if test="${pagingManager.nowPage ne 1}">
				                     <a class="a_paging" href="<c:url value='/board/notice/list?page=1'/>">처음</a>
				                </c:if> 
				                <c:if test="${pagingManager.nowBlock gt 1 }">
				                     <a class="a_paging" href='<c:url value="/board/notice/list?page=${pagingManager.startPage-1}"/>'>이전</a>
				                </c:if> 
				                <c:forEach var="i" begin="${pagingManager.startPage}" end="${pagingManager.endPage}">
				                      <a class="a_paging a_num" href='<c:url value="/board/notice/list?page=${i}"/>' onclick="change_color_pagingBtn()">${i}</a>
				                </c:forEach> 
				                <c:if test="${pagingManager.nowBlock lt pagingManager.totalBlock}">
				                     <a class="a_paging" href="<c:url value='/board/notice/list?page=${pagingManager.endPage+1}'/>">다음</a>
				                </c:if> 
				                <c:if test="${pagingManager.nowPage ne pagingManager.totalPage}">
				                     <a class="a_paging end_paging " href="<c:url value='/board/notice/list?page=${pagingManager.totalPage}'/>">끝</a>
				                </c:if>
				                </div>
				                </th>
		               		</tr>
                        </table>    
                        <sec:authorize access="hasRole('ROLE_MASTER')">
			           		<div id=notice_form><button onclick="location.href='/project/board/notice/form'">글쓰기</button></div>
			        	</sec:authorize>
                    </div>
                </div>
                <div>
                    <h2>자주하는 질문</h2>
                    <h4>고객님들께서 가장 자주하시는 질문을 모두 모았습니다</h4>
                    <div id=frequently_asked_questions>
                        <select name="">
                            <option value="">선택</option>
                            <option value="">회원문의</option>
                            <option value="">주문/결제</option>
                            <option value="">취소문의</option>
                            <option value="">배송문의</option>
                            <option value="">기타</option>
                        </select>
                    </div>
                    <div id=contents_qna_table>
                        <table>
                            <tr>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                            </tr>
                            <tr>
                                <th>1</th>
                                <th>배송문의</th>
                                <td>배송 취소</td>
                            </tr>
                            <tr>
                                <th>2</th>
                                <th>주문문의</th>
                                <td>주문 취소</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <h2>1:1문의하기</h2>
                    <h4></h4>
                </div>
            </div>
        </div>
    </div>
    
   <script>
        $("#center_menu_section>ul li:nth-child(1)").addClass("on");
        $("#contents_div>div:nth-child(1)").css({"display" : "block"})

        $("#center_menu_section>ul li").click(function() {
			$(this).addClass("on");
			$(this).siblings().removeClass("on");
            let contents_div_index = $("#center_menu_section>ul li").index(this) + 1;
            let li_count = $("#center_menu_section>ul li").length + 1;
            for(var i = 1 ; i < li_count ; i++){
                $("#contents_div>div:nth-child("+i+")").css({"display" : "none"})

            }
            $("#contents_div>div:nth-child("+contents_div_index+")").css({"display" : "block"})
        })
    </script>
   
   
<!--    <div class="noice_section"> -->
<!--       <div style="padding-bottom: 45px; "> -->
<!--          <h2 class="tit">공지사항</h2> -->
<!--          <span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span> -->
<!--       </div> -->
<!--       <div align="center"> -->
<!--          <form action="">  -->
<%-- 			<sec:authorize access="hasRole('ROLE_MASTER')"> --%>
<%--            	 <div class="btn_write"><a href="<c:url value='/board/notice/form'/>">글 쓰기</a></div> --%>
<%--         	</sec:authorize> --%>
<!--          <table class="notice_table" > -->
<!--             <thead> -->
<!--                <tr class="tr_notice th_notice"> -->
<!--                   <th style="width: 70px;">글번호</th> -->
<!--                   <th>제 목</th> -->
<!--                   <th style="width: 130px;">작성일</th> -->
<!--                   <th style="width: 70px;">조회</th> -->
<!--                </tr> -->
<!--             </thead> -->
<!--                 varStatus="status" 이용시 idx 가져오기 가능 -->
<!--             <tbody> -->
              
<!--             </tbody> -->
<!--             <tr align="center"> -->
<!--                <td colspan="4" align="center"> -->
<!--                <div class="notice_paging"> -->
<!--                <div style="display: inline-block;"> -->
<!--                <div style="display:flex; border-left:1px solid #ddd;"> -->
                  
<!--                   </div> -->
<!--                   </div> -->
<!--                   </div> -->
<!--                </td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                <td style="width: 130px;">> 검색어 </td>    -->
<!--                <td align="left" style="width: 300px;"> -->
<!--                   <input type="checkbox" name="search_title"> 제목 &nbsp;&nbsp; -->
<!--                   <input type="checkbox" name="search_content"> 내용 -->
<!--                </td>    -->
<!--                <td colspan="2"> -->
<!--                   <div class="notice_search" > -->
<!--                      <input type="text" style="height: 40px; width:270px; border: 1px solid #d3d3d3;"> -->
<!--                      <div class="search_img" align="center"> -->
<!--                      	<a><i class="fas fa-search"></i></a> -->
<!--                      </div> -->
<!--                   </div> -->
<!--                </td>    -->
<!--             </tr> -->
<!--          </table> -->
<!--          </form> -->
<!--       </div> -->
<!--    </div> -->
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