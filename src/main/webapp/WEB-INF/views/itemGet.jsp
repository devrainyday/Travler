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
  <h2>여행 상품 조회</h2>
  <p>선택한 여행 상품의 설명</p> 
</div>

<div class="container">
	<div class="row">
			
		<div style="margin-bottom: 50px;">
			<a href="/items/modify?idx=${item.tiIdx}">
			<button type="button" class="btn btn-primary btn-md">수정</button>
			수정
			</a>
			
			<a href="/items/remove?idx=${item.tiIdx}">
			<button type="button" class="btn btn-danger btn-md">삭제</button>
			삭제
			</a>
			
			<a href="/items/list">
			<button type="button" class="btn btn-dark btn-md">목록으로</button>
			목록으로
			</a>
		</div>
		
		<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered">
			<tr>
				<td>여행 코스 번호</td>
				<td>${item.tCourseNum}</td>
			</tr>
			<tr>
				<td>여행 상품 번호</td>
				<td>${item.tiIdx}</td>
			</tr>
			
			<tr>
				<td>출발일</td>
				<td>${item.startDay}</td>
			</tr>
			<tr>
				<td>도착일</td>
				<td>${item.endDay}</td>
			</tr>
			
			<tr>
				<td>일반 회원가</td>
				<td>${item.charge}</td>
			</tr>
			<tr>
				<td>어린이 요금</td>
				<td>${item.childCharge}</td>
			</tr>
			<tr>
				<td>영아 요금</td>
				<td>${item.infantCharge}</td>
			</tr>
			
			<tr>
				<td>최소 인원</td>
				<td>${item.minMan}</td>
			</tr>
			<tr>
				<td>최대 인원</td>
				<td>${item.maxMan}</td>
			</tr>
			
			<tr>
				<td>담당자 성명</td>
				<td>${item.managerMan}</td>
			</tr>
			<tr>
				<td>담당자 연락처</td>
				<td>${item.managerCall}</td>
			</tr>
			
			<tr>
				<td>조회수</td>
				<td>${item.hit}</td>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>