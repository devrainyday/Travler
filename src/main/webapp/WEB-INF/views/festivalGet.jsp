<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>축제 조회</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>축제 조회</h2>
  <p>선택한 축제의 설명</p> 
</div>

<div class="container">
	<div class="row">
			
		<div style="margin-bottom: 50px;">
			<a href="/festivals/modify?idx=${festival.fIdx}">
			<button type="button" class="btn btn-primary btn-md">수정</button>
			</a>
			
			<a href="/festivals/remove?idx=${festival.fIdx}">
			<button type="button" class="btn btn-danger btn-md">삭제</button>
			</a>
			
			<a href="/festivals/list">
			<button type="button" class="btn btn-dark btn-md">목록으로</button>
			</a>
		</div>
		
		<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered">
			<tr>
				<td width="20%;">
					<span style="float: left;">${festival.fIdx}</span>
				</td>
				<td>
					<span style="float: right;">${festival.title}</span>
				</td>
			</tr>
			
			<tr>
				<td>간단 설명</td>
				<td>${festival.explain}</td>
			</tr>
			
			<tr>
				<td>축제 기간</td>
				<td><fmt:formatDate value="${festival.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${festival.endDay}" pattern="yyyy-MM-dd"/></td>
			</tr>
			
			<tr>
				<td>이용 요금</td>
				<td>${festival.charge}</td>
			</tr>
			
			<tr>
				<td>연락처</td>
				<td>${festival.phone}</td>
			</tr>
			
			<tr>
				<td>축제 공식 사이트</td>
				<td><a href="${festival.site}" target="_blank">${festival.site}</a></td>
			</tr>
			
			<tr>
				<td>위치</td>
				<td>
				${festival.latitude} & ${festival.longitude}
				<br>
				${festival.address}
				</td>
			</tr>
			
			<tr>
				<td>주최</td>
				<td>${festival.host}</td>
			</tr>
			
		</table>
		
	</div>
</div>
</body>
</html>