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
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idMessage").text("사용중인 아이디입니다");
						$("#signupSubmit").attr("disabled", true);
					} else {
						if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#idMessage").text("");
							$("#signupSubmit").attr("disabled", false);
				
						} else if(id == ""){
							$('#idMessage').text('아이디를 입력해주세요');
							$("#signupSubmit").attr("disabled", true);				
							
						} else {
							$('#idMessage').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$("#signupSubmit").attr("disabled", true);
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
});
</script>

<form action="/signup" method="post" style="width: 50%; margin: auto; margin-top: 8em;">
	<div class="form-group">
		<label>
			ID 
			<input type="text" id="id" name="id">
		</label>
		<div>
			<span id="idMessage" style="color: red;"></span>
		</div>
		
		<label>
			비밀번호 
			<input type="password" name="pwd">
		</label>
		
		<label>
			이름
			<input type="text" name="name">
		</label>
		
		<label>
			이메일
			<input type="email" name="email">
		</label>
		
		<label>
			전화번호
			<input type="text" name="phone" placeholder="'-' 를 포함하여 입력해주세요">
		</label>
		
		<input type="submit" id="signupSubmit" class="btn btn-primary" value="회원가입">
	</div>
</form>
</body>
</html>