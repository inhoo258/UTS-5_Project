<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/review/form.css'/>" />
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<form action="<c:url value='/board/review/new'/>" method="POST" onsubmit="return reviewFormCheck()" enctype="multipart/form-data">
        <table class="review_write_table">
            <tr>
                <th>
                    <div class="review_write_tlt">후기 쓰기</div>
                </th>
            </tr>
            <tr>
                <td>
                    <div>
                    	<table border="1" style="border-collapse:collapse;">
                    		<tr>
                    			<td>
                    				<img src="/project/product/img/${order.product_id}" style="width:100px; height:100px;">
                    			</td>
                    			<td>
                    				<div>
										${order.product_name}                    					
                    				</div>
                    				<div>
                    					<span>무게 :</span> <span>${order.product_weight}</span>
                    				</div>
									<div>
                    					<span>수량 :</span> <span>${order.order_product_count}</span>
									</div>
                    			</td>
                    		</tr>
                    	</table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                <input type="hidden" name="review_score" id="review_score">
                    <div class="sub_tlt">제품 만족도</div>
                    <div>
                        <p id="star_grade">
                            <a href="#" class="on">★</a>
                            <a href="#">★</a>
                            <a href="#">★</a>
                            <a href="#">★</a>
                            <a href="#">★</a>
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="sub_tlt textarea_tit">제목</div>
                    <input type="text" name="review_title" class="review_title">
            	</td>   
            </tr>	     
            <tr>
                <td>
                    <div class="sub_tlt textarea_tit">구매 후기</div>
                    <div><textarea name="review_content" id="review_content" cols="30" rows="10"
                            placeholder="최소 10자 이상 입력해주세요."></textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="wrpper_file">
                        <input type="file" name="file">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="review_witre_btn">
                        <input type="button" value="취소" class="review_btn cancel_btn">
                        <input type="submit" value="확인" class="review_btn">
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <script>
    function reviewFormCheck(){
    	let review_content = $("#review_content").val();
    	console.log(review_content);
    	if(review_content.trim()==""){
    		alert("구매 후기를 입력하세요.");
    		return false;
    	}else if(review_content.length < 10){
    		alert("구매 후기를 10자 이상 입력하세요.");
    		return false;
    	}else{
    		$("#review_score").val($(".on").length);
    		alert($("#review_score").val());
    		return true;
    	}
    }
        $('#star_grade a').click(function () {
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
    </script>

</body>
</html>