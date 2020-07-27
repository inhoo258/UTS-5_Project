<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header&footer/header.jsp"/>
	<h1>payment.jsp</h1>
	<div>
		무통장입금 <br>
		결제내역  : 무통장 입금 : 신한은행 110-354-543411 (예금주 : 이힘찬)<br>
		(입금확인 후 배송이 됩니다.)<br>
		입금자명 : --회원 NAME이 들어와야함---;<br>
	</div>
	<input type="button" onclick="gotolist()" value = "쇼핑 더 하기"><br>
	<input type="button" onclick="myOrderList()" value = "나의 주문 내역"><br>
    <form action='<c:url value="/product/rest/sendMail.do"/>' method="post">
      <div>
        <input type="text" name="tomail" size="120" style="width: 100%" placeholder="상대의 이메일" class="form-control">
      </div>
      <div align="center">
        <!-- 제목 -->
        <input type="text" name="title" size="120" style="width: 100%" placeholder="제목을 입력해주세요" class="form-control">
      </div>
        <p>
          <div align="center">
          <!-- 내용 -->
            <textarea name="content" cols="120" rows="12" style="width: 100%; resize: none" placeholder="내용#" class="form-control"></textarea>
          </div>
        <p>
      <div align="center">
        <input type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
    </form>

    <jsp:include page="../header&footer/footer.jsp"/>
</body>
<script type="text/javascript">
	function gotolist(){
		location.href = '<c:url value="/product/list"/>'
	}
	
</script>
</html>