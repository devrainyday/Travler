<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 코스 조회</title>
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
  <h2>여행 코스 조회</h2>
  <p>선택한 여행 코스의 설명</p> 
</div>

<div class="container">
	<div class="row">
			
		<div style="margin-bottom: 50px;">
			<a href="/courses/modify?idx=${course.tcIdx}">
			<button type="button" class="btn btn-primary btn-md">수정</button>
			</a>
			
			<a href="/courses/remove?idx=${course.tcIdx}">
			<button type="button" class="btn btn-danger btn-md">삭제</button>
			</a>
			
			<a href="/courses/list">
			<button type="button" class="btn btn-dark btn-md">목록으로</button>
			</a>
		</div>
		
		<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered">
			<tr colspan="2">
				<td>
					<span style="float: left;">${course.tcIdx}</span>
				</td>
				<td>
					<span style="float: right;">${course.title}</span>
				</td>
			</tr>
			
			<tr>
				<td>여행 종류</td>
				<td>${course.kind}</td>
			</tr>
			
			<tr>
				<td>출발지</td>
				<td>${course.startPlace}</td>
			</tr>
			
			<tr>
				<td>교통수단</td>
				<td>${course.traffic}</td>
			</tr>
			
			<tr>
				<td>여행기간</td>
				<td>${course.travelTerm}</td>
			</tr>
			
			<tr>
				<td>상세 일정</td>
				<td>${course.tCourse}</td>
			</tr>
			
			<tr>
				<td>여행지 및 호텔정보</td>
				<td>${course.tTravelPlace}</td>
			</tr>
			
			<tr>
				<td>환불규정 및 주의사항</td>
				<td>${course.tWarning}</td>
			</tr>
			
			<tr>
				<td>위치</td>
				<td>${course.latitude} & ${course.longitude}</td>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>