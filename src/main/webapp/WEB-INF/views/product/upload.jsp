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

<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="/project/resources/js/summernote-ko-KR.js"></script>

</head>
<body>
	<div style="position: relative; width: 1920; height: 1500px; background-color: green">
 		<!-- <jsp:include page="../header&footer/header.jsp"/>  -->
	<div style="position: absolute; width: 80%; height: 80%; background-color: red ; top: 50%; left: 50%; transform: translate(-50% , -50%) ; ">
        <div id="upload">

        <div id="upload_tit">상품 등록</div>
		<c:set var="member_id">
			<sec:authentication property="principal.username"/>
		</c:set>
        <form action='<c:url value="/product/upload"/>' method="post" enctype="multipart/form-data">
         <table id="upload_table" >
            <tr>
                <th>상품 이미지</th>
                <td><input type="file" name="file"></td>   <label>~~~~~~이미지 파일 올릴 때 이미지 미리 보기 만들어야함~~~~</label>
                <input type="hidden" name="member_id" value="${member_id}">     
            </tr>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="product_name" class="input_text"></td>        
            </tr>
            <tr>
                <th>판매가</th>
                <td><input type="text" name="product_price" class="input_text"></td>        
            </tr>
            <tr>
                <th>상품 무게(kg)</th>
                <td><input type="text" name="product_weight" class="input_text"></td>        
            </tr>
            <tr>
                <th>상품 수량</th>
                <td><input type="text" name="product_count" class="input_text"></td>        
            </tr>
            <tr>
                <th>상세 설명</th>
                <td class="td_detail"><textarea name="product_info" id="product_info"></textarea></td>        
            </tr>
            <tr>
                <th colspan="2">
                    <div id="div_btn" >
                        <input type="button" value="등록" id="submitBtn" onclick="productUpload(this.form)">
                        <input type="reset" value="취소" id="resetBtn">
                    </div>
                </th>
            </tr>
            </table>
        </form>
        </div>
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
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
  });
});

// function productUpload(form) {
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
// 	form.submit();
// }
</script>
</body>
</html>