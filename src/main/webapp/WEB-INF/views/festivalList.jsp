<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Travler : 축제 목록</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>축제 목록</h2>
  <p>모든 축제를 목록으로 보여줍니다</p> 
</div>

<div class="container">
	<div class="row">
	
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<a href="../festivals/register">
				<button type="button" class="btn btn-primary btn-block btn-sm">축제 추가</button>
				</a>
			</div>
			<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered table-hover">
				<thead>
					<tr>
						<th>축제 번호</th>
						<th>축제명</th>
						<th>위치</th>
						<th>문의처</th>
					</tr>
				</thead>
				
				<c:forEach items="${list}" var="festival">
				<tr>
					<td>
					<c:out value="${festival.fIdx}"></c:out>
					</td>
					<td>
					<a href="/festivals/get?idx=<c:out value="${festival.fIdx}" />">
						<c:out value="${festival.title}" />
					</a>
					</td>
					<td><c:out value="${festival.address}" /></td>
					<td><c:out value="${festival.phone}" /></td>
				</tr>
				</c:forEach>
			</table>
	</div>
</div>
</body>
</html>