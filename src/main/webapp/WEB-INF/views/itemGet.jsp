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
	
	<script>
	function course_chk() {
        let courseExplanation = document.getElementById('courseExplanation');
        
        if(courseExplanation.style.display=='none'){
        	courseExplanation.style.display='block';
        	document.getElementById("course").className = "btn btn-success";
        } else {
        	courseExplanation.style.display='none';
        	document.getElementById("course").className = "btn btn-danger";
        }
    }
	</script>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 상품 조회</h2>
  <p>선택한 여행 상품의 설명</p> 
</div>

<div class="container">
	<div class="row">
			
		<div style="margin-bottom: 50px;">
			<a href="/items/modify?idx=${item.tiIdx}">
			<button type="button" class="btn btn-primary btn-md">수정</button>
			</a>
			
			<a href="/items/remove?idx=${item.tiIdx}">
			<button type="button" class="btn btn-danger btn-md">삭제</button>
			</a>
			
			<a href="/items/list">
			<button type="button" class="btn btn-dark btn-md">목록으로</button>
			</a>
			
			<button type="button" id="course" onClick="course_chk()" class="btn btn-danger">여행 코스 정보 확인</button>
		</div>
		
		<div id="courseExplanation" style="display: none;">
			<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered">
			<tr>
				<td colspan="2">${course.title}</td>
			</tr>
			
			<tr>
				<td width="20%;">여행 종류</td>
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
		
		<table style="width: 100%" class="col-md-12 col-sm-12 col-xs-12 table table-bordered">
			<tr>
				<td width="20%;">여행 코스 번호</td>
				<td>${item.tCourseNum}</td>
			</tr>
			<tr>
				<td>여행 상품 번호</td>
				<td>${item.tiIdx}</td>
			</tr>
			
			<tr>
				<td>출발일 & 도착일</td>
				<td><fmt:formatDate value="${item.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item.endDay}" pattern="yyyy-MM-dd"/></td>
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