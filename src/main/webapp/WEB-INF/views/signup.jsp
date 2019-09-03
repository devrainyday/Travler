
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travler: 회원가입</title>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function() {
	$("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var id = $('#id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/signup/idCheck?userId='+ id,
			type : 'get',
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
			success : function(data) {
					const cnt = data[Object.keys(data)[0]];
					console.log('1 = 중복o / 0 = 중복x :' + typeof cnt + ' ' + cnt);
					if (cnt == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idMessage").text("사용중인 아이디입니다");
						$("#signupSubmit").attr("disabled", true);
						$("#signupSubmit").attr("opacity", "0.5");
					} else {
						if(cnt < 1){
							// 0 : 아이디 길이 / 문자열 검사
							$("#idMessage").text("사용 가능 아이디");
							$("#signupSubmit").attr("disabled", false);
							$("#signupSubmit").attr("opacity", "1");
						} else if(id == ""){
							$('#idMessage').text('아이디를 입력해주세요');
							$("#signupSubmit").attr("disabled", true);
						} else {
							$('#idMessage').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$("#signupSubmit").attr("disabled", true);
						}
					}
				}, error : function(request, error) {
						console.log("실패");
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
				}
			});
		});
});
</script>
<script>
function chk_signup() {
	let frm = document.frm_signup;
	let message = document.getElementById("failMessage");
	
	if(!frm.id.value) {
		frm.id.focus();
		message.innerHTML = "아이디를 입력해주세요!";
	} else if(!frm.pwd.value) {
		frm.pwd.focus();
		message.innerHTML = "비밀번호를 입력해주세요!";
	} else if(!frm.name.value) {
		frm.name.focus();
		message.innerHTML = "이름을 입력해주세요!";
	} else if(!frm.email.value) {
		frm.email.focus();
		message.innerHTML = "이메일을 입력해주세요!";
	} else if(!frm.phone.value) {
		frm.phone.focus();
		message.innerHTML = "연락처를 입력해주세요!";
	} else {
		frm.submit();
	}
}
</script>

<form action="/signup" method="post"  name="frm_signup" style="width: 50%; margin: auto; margin-top: 8em;">
	<div class="form-group">
		<label>
			ID 
			<input type="text" id="id" name="id" maxlength="20">
		</label>
		<div>
			<span id="idMessage" style="color: red;"></span>
		</div>
		
		<label>
			비밀번호 
			<input type="password" name="pwd" maxlength="20">
		</label>
		
		<label>
			이름
			<input type="text" name="name" maxlength="10">
		</label>
		
		<label>
			이메일
			<input type="email" name="email" maxlength="50">
		</label>
		
		<label>
			연락처
			<input type="text" name="phone" placeholder="'-' 를 포함하여 입력해주세요" maxlength="15">
		</label>
		
		<div>
			<span id="failMessage" style="color: red;"></span>
		</div>
		
		<button type="button" onClick="chk_signup()" id="signupSubmit" class="btn btn-primary">회원가입</button>
	</div>
</form>
</body>
</html>