<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/form.css'/>"/>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	     <form action='<c:url value="/member/${message}"/>' method="post">
               <!-- -------------- formtag  -->
               <table id="logintable">
                  <tr>
                     <td colspan="2"><h2 style="color: #ff3366;">회 원 ${message eq 'insert' ? '가 입' : '수 정'}</h2></td>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="text" value="${member.member_id}"
                        id="id" name="member_id"  ${not empty member ? "readonly":"placeholder='아이디를 입력하세요'"}><br></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="password"
                        id="password" name="member_pw" required placeholder='비밀번호를 입력하세요'><br></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="text" value="${member.member_name}"
                        id="id" name="member_name" autocomplete="off" placeholder='이름을 입력하세요'><br></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="text" value="${member.member_tel}"
                        id="id" name="member_tel" autocomplete="off" placeholder='전화번호를 입력하세요'><br></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="text" value="${member.member_addr}"
                        id="id" name="member_addr" autocomplete="off" placeholder='주소를 입력하세요'><br></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="text" value="${member.member_email}"
                        id="id" name="member_email" autocomplete="off" placeholder='이메일을 입력하세요'><br></th>
                  </tr>
                   <c:if test="${empty member}">
                  <tr>
                  	<th colspan="2">
                  	<sec:authorize access="isAnonymous()">
						<input type="radio" name="member_auth" value="ROLE_CUSTOMER" checked>구매자
						<input type="radio" name="member_auth" value="ROLE_SELLER">판매자
                  	</sec:authorize>
					</th>
                  </tr>
                  </c:if>
                  <tr>
                     <th colspan="2"><input type="submit" id="okbutton"
                        value="${message eq 'insert' ? '가입완료' : '수정완료'}"></th>
                  </tr>
                  <tr>
                     <th colspan="2"><input type="button" id="canbutton"
                        value="취소" onclick="location.href='<c:url value='/'/>'"></th>
                  </tr>
                 
               </table>
            </form>

</body>
</html>