<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value='/resources/style.css?after' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <style>
	input, textarea {
		padding: 5px;
		border-radius: 5px;
		border-style: solid;
		border-color: darkgray;
		width: 100%;
	}
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		text-decoration: none;
	}
	</style>
</head>
<body>

<div class="header_main header_logo" style="position: absolute; margin: 0; padding: 0;">
	<a href="index.jsp">
	<img src="<c:url value="/resources/travler_logo.png" />" style="margin-top: 10px; width: 80px; height: 80px;">	
	</a>
</div>

<div class="wrap">

<nav class="header_main">
<ul> 
	<li class="topMenuLi" id="menu1">
	<span>버스여행 <span style="font-size: 2px; margin: 7px; vertical-align: middle;">▼</span></span>
		<ul id="sub1" class="submenu">
			<li><a href="#">당일 버스여행</a></li>
			<li><a href="#">숙박 버스여행</a></li>
		</ul>
	</li>
	
	<li class="topMenuLi" id="menu2">
	<span>기차여행 <span style="font-size: 2px; margin: 7px;  vertical-align: middle;">▼</span></span>
		<ul id="sub2" class="submenu">
			<li><a href="#">당일 기차여행</a></li>
			<li><a href="#">숙박 기차여행</a></li>
		</ul>
	</li>
	
	<li class="topMenuLi" id="menu3">
	<span>섬여행 <span style="font-size: 2px; margin: 7px;  vertical-align: middle;">▼</span></span>
		<ul id="sub3" class="submenu">
			<li><a href="#">제주도</a></li>
			<li><a href="#">울릉도·독도</a></li>
			<li><a href="#">홍도·흑산도</a></li>
			<li><a href="#">백령도·대청도</a></li>
		</ul>
	</li>
	
	<li class="topMenuLi">
	<a href="#"><span>방문록</span></a>
	</li>
	
	<li class="topMenuLi">
	<a href="#"><span>문의게시판</span></a>
	</li>
</ul>
</nav>
</div>
</body>
</html>