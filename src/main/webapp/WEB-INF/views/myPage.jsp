<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Travler : My Page</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e794a87025ae465cf1403850435b762e"></script>

<script>
$(document).ready(function() {
	$("#oldPwd").blur(function() {
		var pwd = $('#oldPwd').val();
		console.log(pwd);
		$.ajax({
			url : '${pageContext.request.contextPath}/mypage/pwdCheck?id=<%= (String)session.getAttribute("sessionId") %>&oldPwd='+ pwd,
			type : 'get',
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
			success : function(data) {
					const cnt = data[Object.keys(data)[0]];
					console.log('1 = 중복o / 0 = 중복x :' + typeof cnt + ' ' + cnt);
					if (cnt == 0) {
						// 0 : 일치하지 않을
						// 1 : 일치할
						$("#pwdMessage").text("현재 비밀번호가 일치하지 않습니다");
						$("#changePwdSubmit").attr("disabled", true);
						$("#changePwdSubmit").attr("opacity", "0.5");
					} else {
						$("#pwdMessage").text("변경할 비밀번호를 입력해주세요");
						$("#changePwdSubmit").attr("disabled", false);
						$("#changePwdSubmit").attr("opacity", "1");
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
function chk_mypage() {
	let frm = document.frm_mypage;
	let message = document.getElementById("failMessage");
	
	if(!frm.name.value) {
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

</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>My Page</h2>
</div>

<div class="container">
	<div class="row">
	
		<ul class="col-md-12 nav nav-tabs">
	    <li><a data-toggle="tab" href="#menu1">개인정보 변경</a></li>
	    <li><a data-toggle="tab" href="#menu2">비밀번호 변경</a></li>
	    <li><a data-toggle="tab" href="#menu3">회원 탈퇴</a></li>
		</ul>
		
		  <div class="tab-content" style="padding: 50px;">
		  
		    <div id="menu1" class="tab-pane fade">
		      <h3>개인정보 변경</h3>
		      
		      <form action="/mypage/modify" method="post" name="frm_mypage">
			
				<div class="form-group">
					<label>
						ID 
						<input class="form-control" type="text" name="id" maxlength="20" readonly value="${memberInfo.id}">
					</label>
				</div>
	
				<div class="form-group">
					<label>
						이름
						<input class="form-control" type="text" name="name" maxlength="10" value="${memberInfo.name}">
					</label>
				</div>
					
				<div class="form-group">
					<label>
						이메일
						<input class="form-control" type="email" name="email" maxlength="50" value="${memberInfo.email}">
					</label>
				</div>
					
				<div class="form-group">
					<label>
						연락처
						<input class="form-control" type="text" name="phone" placeholder="'-' 를 포함하여 입력해주세요" maxlength="15" value="${memberInfo.phone}">
					</label>
				</div>
				
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
	
				<button type="button" onClick="chk_mypage()" class="btn btn-outline-success btn-md btn-block">개인정보 수정</button>
				
			  </form>
		      
		    </div>
		    
		    <div id="menu2" class="tab-pane fade">
		      <h3>비밀번호 변경</h3>
		       <form action="/mypage/pwdModify" method="post">
			
				<input type="hidden" name="id" maxlength="20" readonly value="${memberInfo.id}">
				
				<div class="form-group">
					<label>
						현재 비밀번호
						<input class="form-control" type="password" id="oldPwd" maxlength="20">
						<span id="pwdMessage" style="color: red;"></span>
					</label>
				</div>
				
				<div class="form-group">
					<label>
						새로운 비밀번호
						<input class="form-control" type="password" name="pwd" maxlength="20">
					</label>
				</div>
				
				<button type="submit" id="changePwdSubmit" class="btn btn-outline-success btn-md btn-block">비밀번호 변경</button>
				
				</form>
		    </div>
		    
		    <div id="menu3" class="tab-pane fade">
		      <h3>회원 탈퇴</h3>
		      
		      <form action="/mypage/secession" method="post">
				<button type="submit" class="btn btn-outline-danger btn-md btn-block">탈퇴</button>
			  </form>
		      
		    </div>
		    
		  </div>
	</div>
</div>
</body>
</html>