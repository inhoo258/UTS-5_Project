<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page='../../header&footer/header.jsp' />
<form action='<c:url value="/board/notice/new"/>' method="post" enctype="multipart/form-data">
	<table>
    <tr>
        <th>글제목</th>
        <td><input type="text" name="notice_title" style="width:99.5%;"></td>
    </tr>
    <tr>
        <th>글내용</th>
        <td><textarea rows="50" cols="100" name="notice_content">
                
            </textarea>
        </td>
    </tr>
    <tr>
        <th>파일첨부</th>
        <td><input type="file" name="file"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="등록"><input type="reset" value="취소" onclick="window.history.back()"></td>
    </tr>
</table>
</form>
</body>
</html>