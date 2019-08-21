<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 상품 목록</title>
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
  <h2>여행 상품 목록</h2>
  <p>모든 여행 상품을 목록으로 보여줍니다</p> 
</div>

<div class="container">
	<div class="row">
	
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<a href="../items/register">
				<button type="button" class="btn btn-primary btn-block btn-sm">여행 상품 추가</button>
				</a>
				
				<form action="../items/list" method="post">
					<select name="type">
						<option value="title">상품명</option>
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
						<th>여행 상품 번호</th>
						<th>여행 상품 번호</th>
						<th>출발일&도착일</th>
						<th>요금</th>
					</tr>
				</thead>
				
				<c:forEach items="${list}" var="item">
				<tr>
					<td>
					<c:out value="${item.tCourseNum}"></c:out>
					</td>
					<td>
					<a href="/items/get?idx=<c:out value="${item.tiIdx}" />">
						<c:out value="${item.tiIdx}" />
					</a>
					</td>
					<td><c:out value="${item.startDay} ~ ${item.endDay}" /></td>
					<td><c:out value="${item.charge}" /></td>
				</tr>
				</c:forEach>
			</table>
	</div>
</div>
</body>
</html>