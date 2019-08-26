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
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 상품 목록</h2>
  <p>모든 여행 상품을 목록으로 보여줍니다</p> 
</div>

<div class="container">
	<div class="row">
	
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<a href="../items/register">
				<button type="button" class="btn btn-primary btn-block btn-sm">여행 상품 추가</button>
				</a>
				
				<form class="form-inline" action="../items/list" method="post">
					<select name="type" class="form-control col-md-3 col-lg-3">
						<option value="title">상품명</option>
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
						<th>여행 코스 번호</th>
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
					<td><fmt:formatDate value="${item.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item.endDay}" pattern="yyyy-MM-dd"/></td>
					<td><c:out value="${item.charge}" /></td>
				</tr>
				</c:forEach>
			</table>
	</div>
</div>
</body>
</html>