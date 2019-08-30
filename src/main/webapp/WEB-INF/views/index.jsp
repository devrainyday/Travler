<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
   	<title>Travler : 시작 페이지</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<%
	String title = "메인 페이지";
%>

<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div>
	<form class="frm_sign" action="/signout" method="post">
		<input type="submit" class="btn btn-default" value="로그아웃">
	</form>
</div>

<div class="sign_box">
	<form class="frm_sign" class="form-control" action="/signin" method="post">
		<div class="form-group">
			<label>
				ID 
				<input type="text" name="signinId" class="form-control">
			</label>
			
			<label>
				비밀번호 
				<input type="password" name="signinPwd" class="form-control">
			</label>
			
			<input type="submit" class="form-control btn btn_main" value="로그인">
			
			<a href="/signup" style="display:block;">
				<input type="button" class="form-control btn btn_sub" value="회원가입" style="border: none;">
			</a>
		</div>
	</form>
</div>

</body>
</html>
<%@ include file="footer.jsp" %>