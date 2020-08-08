<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
 <style>
        /* table css */
        .review_write_table {
            border-top: 3px solid #5f0080;
            border-collapse: collapse;
            width: 650px;
        }
        .review_write_table tr {
            border-top: 2px solid #e8e8e8;
        }
        .review_write_table td,
        th {
            padding: 20px;
        }
        .review_write_tlt {
            font-size: 21px;
        }
        .sub_tlt {
            font-size: 18px;
            font-weight: 600;
        }

        /* 별점 css */
        #star_grade a {
            text-decoration: none;
            color: gray;
            font-size: 30px;
        }
        #star_grade a.on {
            color: #f7b904;
        }

        /* 구매후기 textare */
        #review_write_textarea {
            width: 100%;
            background-color: #f3f5f7;
            border: none;
            padding: 10px;
        }
        textarea:focus {
            outline: none;
        }
        .textarea_tit{
            margin-bottom: 20px;
        }

        /* 사진첨부 css */
        .wrpper_file {
            background-image: url(http://e-riverstyle.com/demo/icon.png);
            background-repeat: no-repeat;
            background-size: 70px auto;
            height: 70px;
        }
        input[type="file"] {
            height: 100px;
            -webkit-appearance: none;
            appearance: none;
        }
        input[type="file"]::-webkit-file-upload-button {
            width: 100px;
            
            height: 100px;
            opacity: 0;
            -webkit-appearance: none;
            appearance: none;
        }

        /* 취소/확인 버튼 css */
        .review_witre_btn {
            text-align: center
        }
        .review_btn {
            width: 88px;
            height: 42px;
            margin-right: 10px;
            padding-bottom: 2px;
            border: 1px solid #5f0080;
            background-color:#5f0080 ;
            color: #fff;
            letter-spacing: -.3px;
            text-align: center;
            font-family: noto sans;
            font-weight: 540;
            font-size: 14px;
            cursor: pointer;
        }
        .cancel_btn{
            background-color:#fff;
            color: #5f0080;
        }
        input:focus{
            outline: none;
        }
    </style>
=======
<link rel="stylesheet" href="<c:url value='/resources/css/board/review/form.css'/>" />
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<<<<<<< HEAD
<<<<<<< HEAD
 <form action="" method="POST">
        <table class="review_write_table">
            <tr>
                <th>
                    <div class="review_write_tlt">후기 쓰기</div>
                </th>
            </tr>
            <tr>
                <td>
                    <div>
                    </div>
                    구매한 상품 정보 오는 곳~~=> 상품 여러개 일 경우는 어떻게 할건지</td>
            </tr>
            <tr>
                <td>
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
                    <div class="sub_tlt textarea_tit">구매 후기</div>
                    <div><textarea name="review_write_textarea" id="review_write_textarea" cols="30" rows="10"
                            placeholder="최소 10자 이상 입력해주세요."></textarea></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="wrpper_file">
                        <input type="file">
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
=======
<form action="<c:url value='/board/review/new'/>" method="POST" onsubmit="return reviewFormCheck()" enctype="multipart/form-data">
=======
<form id="reviewUploadForm">
>>>>>>> branch 'seungwoo' of https://github.com/inhoo258/UTS-5_Project.git
        <table class="review_write_table">
            <tr>
                <th>
                    <div class="review_write_tlt">후기 쓰기</div>
                    <input type="hidden" name="order_number" value="${order.order_number}">
                    <input type="hidden" name="member_id" value="${order.member_id}">
                    <input type="hidden" name="purchase_date" value="${order.order_date}">
                </th>
            </tr>
            <tr>
                <td>
                    <div>
                    	<table border="1" style="border-collapse:collapse;">
                    		<tr>
                    			<td>
                    				<img src="/project/product/img/${order.product_id}" style="width:100px; height:100px;">
                    				<input type="hidden" name="product_id" value="${order.product_id}">
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
                    					<input type="hidden" name="order_product_count" value="${order.order_product_count}">
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
                    <input type="text" name="review_title" class="review_title" id="review_title">
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
                        <input type="button" value="확인" class="review_upload_btn" id="review_upload_btn">
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <script>
    $("#review_upload_btn").on("click",function(){
    	let review_title = $("#review_title").val();
    	let review_content = $("#review_content").val();
    	console.log(review_content);
    	if(review_title.trime==""){
    		alert("제목을 입력하세요.");
    	}else if(review_content.trim()==""){
    		alert("구매 후기를 입력하세요.");
    	}else if(review_content.length < 10){
    		alert("구매 후기를 10자 이상 입력하세요.");
    	}else{
    		$("#review_score").val($(".on").length);
    		let form = $("#reviewUploadForm")[0];
    		console.log(form);
    		let formData = new FormData(form);
    		console.log(formData);
    		$.ajax({
    			url:'<c:url value="/board/rest/review/upload"/>',
    			type:'POST',
    			data:formData,
    			contentType:false,
    			processData:false,
    			success:function(){
    				opener.document.location.reload();
    				self.close();
    			}
    		});
    	}
    });
    	
        $('#star_grade a').click(function () {
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
    </script>
>>>>>>> branch 'master' of https://github.com/inhoo258/UTS-5_Project.git

    <script>
        $('#star_grade a').click(function () {
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
        });
    </script>
</body>
</html>