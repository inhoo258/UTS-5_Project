<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/member/form.css'/>" />
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header&footer/header.jsp" />
	<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<form action='<c:url value="/member/${message}"/>' method="post"
		onsubmit="return inputCheck()">
		<!-- -------------- formtag  -->
		<table id="logintable">
			<tr>
				<td colspan="2"><h2 style="color: #ff3366;">회 원 ${message eq 'insert' ? '가 입' : '수 정'}</h2></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text" value="${member.member_id}"
					class="id" name="member_id" id="member_id"
					${not empty member ? "readonly":"placeholder='아이디를 입력하세요' autocomplete='off'"}></th>
			</tr>
			<tr >
				<td colspan="2" class="id_check"><font id="id_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="password" class="password"
					name="member_pw" id="member_pw" placeholder='비밀번호를 입력하세요'></th>
			</tr>
			<tr class="input_check" style="display:none;">
				<td colspan="2"><font id="pw_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="password" class="password"
					id="member_pw_ok" placeholder='비밀번호 확인'></th>
			</tr>
			<tr class="input_check" style="display:none;">
				<td colspan="2"><font id="pw_check_msg"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_name}" class="id" name="member_name"
					id="member_name" autocomplete="off" placeholder='이름을 입력하세요'></th>
			</tr>
			<tr class="input_check" style="display:none;">
				<td colspan="2"><font id="name_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text" value="${member.member_tel}"
					class="id" name="member_tel" id="member_tel" autocomplete="off"
					placeholder='전화번호를 입력하세요. (예 : 01012345678)'></th>
			</tr>
			<tr class="input_check" style="display:none;">
				<td colspan="2"><font id="tel_check"></font></td>
			</tr>
			<c:choose>
				<c:when test="${empty member }">
					<tr>
						<th colspan='2'><input type="button" value="주소찾기" onclick="execPostCode();">
					</tr>
					<tr style="display:none;" class="hidden_addr_tr">
						<th colspan='2'>
							<input type="text" name="member_main_addr" readonly class="member_addr1">	
						</th>
					</tr>
					<tr style="display:none;" class="hidden_addr_tr">
						<th>
							<input type="text" name="member_sub_addr" placeholder="상세 주소를 입력하세요" id="member_addr">	
						</th>
					</tr>
					<tr class="input_check" style="display:none">
						<td colspan="2"><font id="addr_check"></font></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan='2'><input type="button" value="주소찾기" onclick="execPostCode();">
					</tr>
					<tr class="hidden_addr_tr">
						<th colspan='2'>
							<input type="text" name="member_main_addr" readonly id="member_addr" value="${member.member_main_addr}">	
						</th>
					</tr>
					<tr class="hidden_addr_tr">
						<th>
							<input type="text" name="member_sub_addr" placeholder="상세 주소를 입력하세요" value="${member.member_sub_addr}">	
						</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_email}" class="id" name="member_email"
					id="member_email" autocomplete="off"
					placeholder='이메일을 입력하세요. (예 : huh_say@uts.com)'></th>
			</tr>
			<tr class="input_check" style="display:none;">
				<td colspan="2"><font id="email_check"></font></td>
			</tr>
			<c:if test="${empty member}">
			<sec:authorize access="isAnonymous()">
				<tr>
					<th colspan="2">
							<input type="radio" name="member_auth" id="role_cus" value="ROLE_CUSTOMER"
								checked><label for="role_cus">구매자</label>
						<input type="radio" name="member_auth" id="role_sell" value="ROLE_SELLER"><label for="role_sell">판매자</label>
                  	</th>
				</tr>
			</sec:authorize>
			</c:if>
			<tr style="display:none;" class="forSeller">
				<td colspan="2">
					<div style="border:1px solid black;">
						<input type="text" placeholder="사업자 등록번호를 입력하세요" name="seller_reg_num"><br>
						<input type="text" placeholder="사업장 명을 입력하세요" name="seller_com_name">
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" id="okbutton"
					value="${message eq 'insert' ? '가입완료' : '수정완료'}"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="canbutton" value="취소"
					onclick="window.history.back()"></th>
			</tr>
		</table>
	</form>
	
	<!--============================================================================== 아직 미흡한 부분 -->
<!-- 	20200713 : 아이디 한글로도 가입이 됨 ->해결(승우)
					css 미흡


-->

	<script type="text/javascript">
		
	
	</script>
	
	<script type="text/javascript">
	let member = '${member}';
	console.log("member : " + member);
    let id_check=false;
    let pw_check=false;
    let pw_ok_check=false;
    let name_check=false;
    let tel_check=false;
    let addr_check=false;
    let email_check=false;
    //컴트롤러로부터 넘겨받는 member가 비어있지 않은 경우 아래의 값들을 true로 초기화하여 수정을 하지 않고 수정완료를 누르더라도 수정될 수 있도록.
    if(member!=""){
    	id_check=true;
    	name_check=true;
    	tel_check=true;
    	addr_check=true;
    	email_check=true;
    }
    $(document).ready(function(){
        //inputCheck : 모든 필수입력 확인 및 데이터 형식 확인 후 if(inputCheck){회원가입버튼활성화}else{회원가입버튼 비활성화유지}
        let member_pw="";
        let member_pw_ok="";
        $("#member_id").blur(function(){
                let member_id = document.getElementById("member_id").value;
                if(member==""){
	                if(member_id.length==0){
	                    document.getElementById("id_check").innerText="필수 항목입니다.";
	                    id_check=false;
	                }else if(!/^[a-z0-9]{4,12}$/.test(member_id)){
	                    document.getElementById("id_check").innerText="영문 소문자 ,숫자  4~12 자리로 입력해 주세요.";
	                    id_check=false;
	                }else{
	                    $.ajax({
	                        url:'<c:url value="/member/rest/memberCheck?member_id="/>'+member_id,
	                        type:'POST',
	                        success:function(result){
	                            if(result==1){
	                                document.getElementById("id_check").innerText="이미 가입된 아이디 입니다.";
	                                id_check=false;
	                            }else{
	                                document.getElementById("id_check").innerText="사용 가능한 아이디 입니다.";
	                                id_check=true;
	                            }
	                        }
	                    });
	                }
                }
        });
        $("#member_pw").blur(function(){
            member_pw = document.getElementById("member_pw").value;
            if(member_pw.length==0){
            	document.getElementsByClassName("input_check")[0].style.display='';
                document.getElementById("pw_check").innerText="필수 항목입니다.";
                pw_check=false;
            }else if(!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#]).{10,15}$/.test(member_pw)){
    // 			alert("fail")
    			document.getElementsByClassName("input_check")[0].style.display='';
                document.getElementById("pw_check").innerText="10~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
                pw_check=false;
            }else{
    // 			alert("pass")
                document.getElementById("pw_check").innerText="";
                document.getElementsByClassName("input_check")[0].style.display='none';
                pw_check=true;
            }
            $("#member_pw_ok").trigger("blur");
        });
        $("#member_pw_ok").blur(function(){
            member_pw_ok = document.getElementById("member_pw_ok").value;
                if(member_pw_ok.length==0){
                	document.getElementsByClassName("input_check")[1].style.display='';
                    document.getElementById("pw_check_msg").innerText="비밀번호를 일치시켜주세요.";
                    pw_ok_check=false;
                }
                else if(member_pw != member_pw_ok){
                	document.getElementsByClassName("input_check")[1].style.display='';
                    document.getElementById("pw_check_msg").innerText="비밀번호가 일치하지 않습니다.";
                    pw_ok_check=false;
                }else{
                    document.getElementById("pw_check_msg").innerText="";
                    document.getElementsByClassName("input_check")[1].style.display='none';
                    pw_ok_check=true;
                }
        });
        
        $("#member_name").blur(function(){
            let member_name = document.getElementById("member_name").value
            if(member_name.length==0){
            	document.getElementsByClassName("input_check")[2].style.display='';
                document.getElementById("name_check").innerText="필수 항목입니다.";
                name_check=false;
                
            }else if(!/^[가-힣]+$/.test(member_name)){
            	document.getElementsByClassName("input_check")[2].style.display='';
                document.getElementById("name_check").innerText="가 나 다 형식으로 입력해주세요.";
            }
            else{
                document.getElementById("name_check").innerText="";
                document.getElementsByClassName("input_check")[2].style.display='none';
                name_check=true;
            }
        });
        $("#member_tel").blur(function(){
            let member_tel= document.getElementById("member_tel").value
            if(member_tel.length==0){
            	document.getElementsByClassName("input_check")[3].style.display='';
                document.getElementById("tel_check").innerText="필수 항목입니다.";
                tel_check=false;
            }else if(!/^[0][1]\d{1}\d{3,4}\d{4}$/.test(member_tel)){ //------------------------------------------------**
            	document.getElementsByClassName("input_check")[3].style.display='';
                document.getElementById("tel_check").innerText="잘못된 형식입니다.";
                tel_check=false;
            }else{
                document.getElementById("tel_check").innerText="";
                document.getElementsByClassName("input_check")[3].style.display='none';
                tel_check=true;
            }
        });
       
        $("#member_email").blur(function(){
            let member_email = document.getElementById("member_email").value
            if(member_email.length==0){
            	document.getElementsByClassName("input_check")[4].style.display='';
                document.getElementById("email_check").innerText="필수 항목입니다.";
                email_check=false;
            }else if(!/^[a-z0-9._%+-]+@[a-z]+\.[a-z]{2,3}$/.test(member_email)){//------------------------------------------------**
            	document.getElementsByClassName("input_check")[4].style.display='';
                document.getElementById("email_check").innerText="잘못된 이메일 형식입니다.";
                email_check=false;
            }else{
                document.getElementById("email_check").innerText="";
                document.getElementsByClassName("input_check")[4].style.display='none';
                email_check=true;
            }
        });
    });
    function inputCheck(){
        if(id_check&&pw_check&&pw_ok_check&&name_check&&tel_check&&addr_check&&email_check){
        	$("#okbutton").attr("disabled",true);
            return true;
        }else {
        	console.log("id_check : "+id_check);
        	console.log("pw_check : "+pw_check);
        	console.log("pw_ok_check : "+pw_ok_check);
        	console.log("name_check : "+name_check);
        	console.log("tel_check : "+tel_check);
        	console.log("addr_check : "+addr_check);
        	console.log("email_check : "+email_check);
			$("input").each(function(){
				$(this).trigger("blur");
			})
        	//내용이 입력되어 있지 않은 위치로 focus
        	if(!email_check){$("#member_email").focus();}
        	if(!addr_check){alert("주소를 입력해주세요")}
        	if(!tel_check){$("#member_tel").focus();}
        	if(!name_check){$("#member_name").focus();}
        	if(!pw_ok_check){$("#member_pw_ok").focus();}
        	if(!pw_check){$("#member_pw").focus();}
        	if(!id_check){$("#member_id").focus();}
        	return false;
        }
    }
    $("input:radio").on("click",function(){
    	if($(this).val()=="ROLE_SELLER"){
	    	$(".forSeller").show();
    	}else{
	    	$(".forSeller").hide();
    	}
    });
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }
				document.getElementsByClassName("hidden_addr_tr")[0].style.display='block';
				document.getElementsByClassName("hidden_addr_tr")[1].style.display='block';
                document.getElementById('member_addr').value = fullRoadAddr;
                addr_check=true;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // $("[name=addr1]").val(data.zonecode);
                // $("[name=addr2]").val(fullRoadAddr);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                // document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress;
            }
        }).open();
    }
    </script>
    <jsp:include page="../header&footer/footer.jsp"/>
</body>
</html>