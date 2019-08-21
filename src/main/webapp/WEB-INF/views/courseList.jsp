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
<div class="jumbotron text-center">
  <h2>여행 코스 목록</h2>
  <p>모든 여행 코스를 목록으로 보여줍니다</p> 
</div>

<div class="container">
	<div class="row">
	
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<a href="../courses/register">
				<button type="button" class="btn btn-primary btn-block btn-sm">여행 코스 추가</button>
				</a>
				
				<form action="../courses/list" method="post">
					<select name="type">
						<option value="title">코스명</option>
						<option value="kind">여행종류</option>
						<option value="startPlace">출발지</option>
						<option value="traffic">교통수단</option>
						<option value="manager">담당자 정보</option> <!-- 두 가지 항목을 이용하여 비교 -->
					</select>
					<input type="text" name="keyword" style="width: 60%;">
					<input type="submit" class="btn btn-success btn-sm" value="검색" style="width: 20%;">
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