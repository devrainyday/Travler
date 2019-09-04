<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
   	<title>Travler : 시작 페이지</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script>
    function chk_signin() {
    	let frm = document.frm_signin;
    	let message = document.getElementById("failMessage");
    	
    	if(!frm.id.value) {
    		frm.id.focus();
    		message.innerHTML = "아이디를 입력해주세요!";
    	} else if(!frm.pwd.value) {
    		frm.pwd.focus();
    		message.innerHTML = "비밀번호를 입력해주세요!";
    	} else {
    		frm.submit();
    	}
    }
    
    <% if((String)session.getAttribute("message") != null) { %>
    		alert(<%=(String)session.getAttribute("message") %>);
    		<% session.removeAttribute("message"); %>
    <% } %>
    </script>
</head>

<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>


<div class="sign_box">
	<% if((String)session.getAttribute("sessionId") == null) { %>
	<form class="frm_sign" class="form-control" action="/signin" method="post" name="frm_signin">
		<div class="form-group">
			<label>
				ID 
				<input type="text" name="id" class="form-control">
			</label>
			
			<label>
				비밀번호
				<input type="password" name="pwd" class="form-control">
			</label>
			
			<div>
				<span id="failMessage" style="color: red;"></span>
			</div>
			
			<button type="button" onClick="chk_signin()" onClick="chk_signin()" class="form-control btn_main">로그인</button>
			
			<a href="/signup" style="text-decoration: none;">
				<button type="button" class="form-control btn_sub">회원가입</button>
			</a>
		</div>
	</form>
	<% } else { %>
	<form class="frm_sign" action="/signout" method="post">
		<%= session.getAttribute("sessionName") %> 님 환영합니다
		<input type="submit" class="btn btn_sub" value="로그아웃">
	</form>
	<% } %>
</div>

</body>
</html>
<%@ include file="footer.jsp" %>