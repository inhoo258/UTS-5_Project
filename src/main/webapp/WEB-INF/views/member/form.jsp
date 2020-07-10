<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<jsp:include page="../header/header.jsp" />
	<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
	<form action='<c:url value="/member/${message}"/>' method="post" onsubmit="return inputCheck()">
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
			<tr>
				<td colspan="2"><font id="id_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="password" class="password"
					name="member_pw" id="member_pw" placeholder='비밀번호를 입력하세요'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="pw_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="password" class="password"
					id="member_pw_ok" placeholder='비밀번호 확인'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="pw_check_msg"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_name}" class="id" name="member_name"
					id="member_name" autocomplete="off" placeholder='이름을 입력하세요'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="name_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text" value="${member.member_tel}"
					class="id" name="member_tel" id="member_tel" autocomplete="off"
					placeholder='전화번호를 입력하세요. (예 : 01012345678)'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="tel_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_addr}" class="id" name="member_addr"
					id="member_addr" autocomplete="off" placeholder='주소를 입력하세요'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="addr_check"></font></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text"
					value="${member.member_email}" class="id" name="member_email"
					id="member_email" autocomplete="off" placeholder='이메일을 입력하세요. (예 : huh_say@uts.com)'></th>
			</tr>
			<tr>
				<td colspan="2"><font id="email_check"></font></td>
			</tr>
			<c:if test="${empty member}">
				<tr>
					<th colspan="2"><sec:authorize access="isAnonymous()">
							<input type="radio" name="member_auth" value="ROLE_CUSTOMER"
								checked>구매자
						<input type="radio" name="member_auth" value="ROLE_SELLER">판매자
                  	</sec:authorize></th>
				</tr>
			</c:if>
			<tr>
				<th colspan="2">
				<input type="submit" id="okbutton" value="${message eq 'insert' ? '가입완료' : '수정완료'}"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="button" id="canbutton" value="취소"	onclick="location.href='<c:url value='/'/>'"></th>
			</tr>

		</table>
	</form>
	<script type="text/javascript">
    let id_check=false;
    let pw_check=false;
    let pw_ok_check=false;
    let name_check=false;
    let tel_check=false;
    let addr_check=false;
    let email_check=false;
    $(document).ready(function(){
        //inputCheck : 모든 필수입력 확인 및 데이터 형식 확인 후 if(inputCheck){회원가입버튼활성화}else{회원가입버튼 비활성화유지}
        let member_pw="";
        let member_pw_ok="";
        let member_id='${member.member_id}';
        console.log(member_id);
        $("#member_id").blur(function(){
            if(member_id.length==0){
                let member_id = document.getElementById("member_id").value;
                if(member_id.length==0){
                    document.getElementById("id_check").innerText="필수 항목입니다.";
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
            }else{
                id_check=true;
            }
        });
        $("#member_pw").blur(function(){
            member_pw = document.getElementById("member_pw").value;
            if(member_pw.length==0){
                document.getElementById("pw_check").innerText="필수 항목입니다.";
                pw_check=false;
            }else if(!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#]).{10,15}$/.test(member_pw)){
    // 			alert("fail")
                document.getElementById("pw_check").innerText="10~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
                pw_check=false;
            }else{
    // 			alert("pass")
                document.getElementById("pw_check").innerText="";
                pw_check=true;
            }
        });
        $("#member_pw_ok").blur(function(){
            member_pw_ok = document.getElementById("member_pw_ok").value
                if(member_pw_ok.length==0){
                    document.getElementById("pw_check_msg").innerText="비밀번호를 일치시켜주세요.";
                    pw_ok_check=false;
                }
                else if(member_pw != member_pw_ok){
                    document.getElementById("pw_check_msg").innerText="비밀번호가 일치하지 않습니다.";
                    pw_ok_check=false;
                }else{
                    document.getElementById("pw_check_msg").innerText="";
                    pw_ok_check=true;
                }
        });
        
        $("#member_name").blur(function(){
            let member_name = document.getElementById("member_name").value
            if(member_name.length==0){
                document.getElementById("name_check").innerText="필수 항목입니다.";
                name_check=false;
            }else{
                document.getElementById("name_check").innerText="";
                name_check=true;
            }
        });
        $("#member_tel").blur(function(){
            let member_tel= document.getElementById("member_tel").value
            if(member_tel.length==0){
                document.getElementById("tel_check").innerText="필수 항목입니다.";
                tel_check=false;
            }else if(!/^[0][1]\d{1}\d{3,4}\d{4}$/.test(member_tel)){ //------------------------------------------------**
                document.getElementById("tel_check").innerText="잘못된 형식입니다.";
                tel_check=false;
            }else{
                document.getElementById("tel_check").innerText="";
                tel_check=true;
            }
        });
        $("#member_addr").blur(function(){
            let member_addr = document.getElementById("member_addr").value
            if(member_addr.length==0){
                document.getElementById("addr_check").innerText="필수 항목입니다.";
                addr_check=false;
            }else{
                document.getElementById("addr_check").innerText="";
                addr_check=true;
            }
        });
        $("#member_email").blur(function(){
            let member_email = document.getElementById("member_email").value
            if(member_email.length==0){
                document.getElementById("email_check").innerText="필수 항목입니다.";
                email_check=false;
            }else if(!/^[a-z0-9._%+-]+@[a-z]+\.[a-z]{2,}$/.test(member_email)){//------------------------------------------------**
                document.getElementById("email_check").innerText="잘못된 이메일 형식입니다.";
                email_check=false;
            }else{
                document.getElementById("email_check").innerText="";
                email_check=true;
            }
        });
    });
    function inputCheck(){
        if(id_check&&pw_check&&pw_ok_check&&name_check&&tel_check&&addr_check&&email_check){
            console.log(id_check);
            console.log(pw_check);
            console.log(pw_ok_check);
            console.log(name_check);
            console.log(name_check);
            console.log(addr_check);
            console.log(email_check);
            return true;
        }else return false;
    }
    </script>
</body>
</html>