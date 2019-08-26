<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 코스 목록</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 코스 목록</h2>
  <p>모든 여행 코스를 목록으로 보여줍니다</p> 
</div>

<div class="container">
	<div class="row">
	
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<a href="../courses/register">
				<button type="button" class="btn btn-primary btn-block btn-sm">여행 코스 추가</button>
				</a>
				
				<form class="form-inline" action="../courses/list" method="post">
					<select name="type" class="form-control col-md-3 col-lg-3">
						<option value="title">코스명</option>
						<option value="kind">여행종류</option>
						<option value="startPlace">출발지</option>
						<option value="traffic">교통수단</option>
						<option value="manager">담당자 정보</option> <!-- 두 가지 항목을 이용하여 비교 -->
					</select>
					<input type="text" name="keyword" class="form-control col-md-5 col-lg-5">
					<input type="submit" class="btn btn-success btn-sm col-md-4 col-lg-4" value="검색">
				</form>
			</div>
			 
			<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered table-hover">
				<thead>
					<tr>
						<th>여행코스 번호</th>
						<th>여행코스명</th>
						<th>출발지</th>
						<th>교통수단(여행 종류)</th>
					</tr>
				</thead>
				
				<c:forEach items="${list}" var="course">
				<tr>
					<td>
					<c:out value="${course.tcIdx}"></c:out>
					</td>
					<td>
					<a href="/courses/get?idx=<c:out value="${course.tcIdx}" />">
						<c:out value="${course.title}" />
					</a>
					</td>
					<td><c:out value="${course.startPlace}" /></td>
					<td><c:out value="${course.traffic} (${course.kind})" /></td>
				</tr>
				</c:forEach>
			</table>
	</div>
</div>
</body>
</html>