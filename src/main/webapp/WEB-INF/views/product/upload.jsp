<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/product/upload.css'/>" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/project/resources/js/summernote-ko-KR.js"></script>
</head>
<body>
	<div style="position: relative; width: 1920; height: 1500px; background-color: green">
		<jsp:include page="../header&footer/header.jsp"/>
	<div style="position: absolute; width: 80%; height: 80%; background-color: red ; z-index: 20; top: 50%; left: 50%; transform: translate(-50% , -50%) ;">
		<h1>UPLOAD.JSP</h1>
		<h1>업로드</h1>
		<c:set var="member_id">
<%-- 			<sec:authentication property="principal.username"/> --%>
		</c:set>
		<form action='<c:url value="/product/upload"/>' method="post" enctype="multipart/form-data">
			<input type="hidden" name="member_id" value="${member_id}">
			메인사진선택<input type="file" name="file" value="메인사진"><br>
			<input type="text" name="product_name" placeholder="상품명"><br>
			<input type="text" name="product_count" placeholder="상품갯수"><br>
			<input type="text" name="product_price" placeholder="상품가격"><br>
			<input type="text" name="product_weight" placeholder="상품무게"><br>
			<textarea name="product_info" id="product_info"></textarea>
			<input type="button" value="업로드" id="submitBtn" onclick="productUpload(this.form)">
		</form>
	</div>
	</div>
	<jsp:include page="../header&footer/footer.jsp"/>
<script>
$(document).ready(function() {
  $('#product_info').summernote({
	    	placeholder: '글 내용을 입력해주세요.(최대 2048자)',
        minHeight: 370,
        maxHeight: null,
        width:1050,
        focus: true, 
        lang : 'ko-KR',
        toolbar: [
             // [groupName, [list of button]]
             ['fontname', ['fontname']],
             ['fontsize', ['fontsize']],
             ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
             ['color', ['forecolor','color']],
             ['table', ['table']],
             ['para', ['ul', 'ol', 'paragraph']],
             ['height', ['height']],
             ['insert',['picture','link','video']],
             ['view', ['fullscreen', 'help','codeview']]
           ],
         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
//          callbacks: {
// 	         onImageUpload: function(files, editor, welEditable) {
// 	           for (var i = files.length - 1; i >= 0; i--) {
// 	             sendFile(files[i], this);
// 	           }
// 	         }
// 	     }
  });
});
// function sendFile(file, el) {
// 	  var form_data = new FormData();
// 	  form_data.append('file', file);
// 	  $.ajax({
// 	    data: form_data,
// 	    type: "POST",
// 	    url: '<c:url value="/product/rest/image"/>',
// 	    cache: false,
// 	    contentType: false,
// 	    enctype: 'multipart/form-data',
// 	    processData: false,
// 	    success: function(url) {
// 	      $(el).summernote('editor.insertImage', url);
// 	      $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
// 	    }
// 	  });
// 	}


function productUpload(form) {
// 	var product_name = form.product_name.value;
// 	var product_count = form.product_count.value;
// 	var product_price = form.product_price.value;
// 	var product_weight = form.product_weight.value;
// 	var product_info = form.product_info.value;
	
// 	if (product_name.trim() == ''){
// 		return false;
// 	}
// 	if (product_count.trim() == ''){
// 		return false;
// 	}
// 	if (product_price.trim() == ''){
// 		return false;
// 	}
// 	if (product_weight.trim() == ''){
// 		return false;
// 	}
// 	if (product_info.trim() == ''){
// 		return false;
// 	}
	form.submit();
}
</script>
</body>
</html>