<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/c2524284bc.js"	crossorigin="anonymous"></script>
    <link rel="stylesheet" href="cart.css" />
</head>

<body>
    <div class="section">
        <div id="ordersheet">
            <h1>주 문 서</h1>
            <label class="label">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</label>
        </div>
        <div>
            <div>
                <h3 class="title_section">상품정보</h3>
                <div class="order_goodslist">
                    <div class="show_tbl">
                        <!--style="display:none;" 상세보기 버튼 클릭 시 변경-->
                        <div class="inner_show">
                            <div class="name">[맛의 고수] 양념차돌박이 200g 짭쪼롬감칠맛 외 1개 상품을 주문합니다.</div>
                            <!--상세보기 클릭 시 hidden으로 변경됨-->
                            <a class="show_btn" href="#none">
                                <span class="txt">상세보기&nbsp; <i class="fas fa-chevron-down"></i></span>
                            </a>
                        </div>
                    </div>
                    <div id="orderGoodsList">
                        <!--상세보기 클릭 시 display:block으로 변경-->
                        <table class="detail_table">
                            <!-- 상품 정보 상세보기 -->
                            <tr class="th">
                                <th style="width: 130px;"><!--상품 이미지--></th>
                                <th style="width: auto;">상품 정보</th>
                                <th style="width: 186px;">상품 금액</th>
                            </tr>
                            <tr>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                            </tr>
                            <tr>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                                <td>ㅇ</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <form action="">
                <div class="order_info">
                    <h3 class="title_section">주문자 정보</h3>
                    <div class="inner_show2">
                        <table class="order_info_table" style="padding-left: 20px;">
                            <tr>
                                <th>보내는 분 *
                                    <!-- ${orderSheet.member_name }-->
                                </th>
                                <th><input type="text" name="name" required style="width: 162px;"> </th>
                            </tr>
                            <tr>
                                <th>휴대폰 *
                                    <!--${orderSheet.member_tel }-->
                                </th>
                                <th><input type="text" name="tel" required style="width: 162px;"> </th>
                            </tr>
                            <tr>
                                <th>이메일 *
                                    <!--${orderSheet.member_email }-->
                                </th>
                                <th><input type="text" name="email" required style="width: 360px;"> </th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>
                                    <p class="txt_guide">
                                        <span>이메일을 통해 주문처리과정을 보내드립니다.</span>
                                        <span>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</span>
                                    </p>
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="delivery_info">
                    <h3 class="title_section">배송정보</h3>
                    <div class="inner_show2">
                        <!-- ${orderSheet.member_addr } -->
                    </div>
                </div>
                <div class="payment">
                    <h3 class="title_section">배송정보 결제수단</h3>
                    <div class="inner_show2"></div>
                </div>
                <div class="agree">
                    <h3 class="title_section">개인정보 수집/제공*</h3>
                    <div class="inner_show2"></div>
                </div>
                <div>
                    <input type="submit" value="결제하기" 
                    style="width: 200px; height: 48px;
                    background-color: #5f0080; color: white; border: none; display : block; margin : 40px auto;" >
                </div>
            </form>
        </div>
        <ul>
            <li>* 직접 주문취소는 <strong style="color: #5f0080;">‘입금확인’</strong> 상태일 경우에만 가능합니다.</li>
            <li>* 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
        </ul>
    </div>
</body>

</html>