
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value="/resources/style.css?after" />">
<link rel="stylesheet" href="<c:url value="/resources/styles.css?after" />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<%
	
%>
</head>
<body>

<%
	String sessionId = (String)session.getAttribute("sessionId");
%>

<div class="wrap" style="position: absolute; margin: 0; padding: 0; margin-left: 5%;">
	<div class="header_main header_logo" style="position: absolute; margin: 0; padding: 0;">
		<a href="/"> <img src="<c:url value="/resources/travler_logo.png" />" style="margin-top: 10px; width: 80px; height: 80px;">	</a>
	</div>
	
	<nav class="header_main" style="width: 100%;">
		<div id="cssmenu">
			<ul>
			<% if(sessionId != null) { %>
				<% if(sessionId.equals("admin")) { %>
			   <li class="active"><a href="/courses/list"><span>Course</span></a></li>
			   <li><a href="/items/list"><span>Item</span></a></li>
			   <li><a href="/festivals/list"><span>Festival</span></a></li>
			   <li class="last"><a href="/admin"><span>Admin Page</span></a></li>
		   		<% } else { %>
		   	   <li class="active"><a href="/travel/all"><span>전체 여행</span></a></li>
			   <li><a href="/travels/bus"><span>버스여행</span></a></li>
			   <li><a href="/travels/train"><span>기차여행</span></a></li>
			   <li><a href="/travels/island"><span>섬여행</span></a></li>
			   <li class="last"><a href="/festival/board"><span>축제 방문록</span></a></li>
		   		<% } %>
			<% } else { %>
			   <li class="active"><a href="/travel/all"><span>전체 여행</span></a></li>
			   <li><a href="/travels/bus"><span>버스여행</span></a></li>
			   <li><a href="/travels/train"><span>기차여행</span></a></li>
			   <li><a href="/travels/island"><span>섬여행</span></a></li>
			   <li class="last"><a href="/festival/board"><span>축제 방문록</span></a></li>
			<% } %>
			</ul>
		</div>
	</nav>
</div>
</body>
</html>