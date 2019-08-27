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
	
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e794a87025ae465cf1403850435b762e"></script>
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
		
		<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
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
				<td>
				<c:choose>
					<c:when test="${course.latitude eq '0' || course.longitude eq '0'}">없음</c:when>
					<c:otherwise>
						<div id="map" style="width:100%;height:350px;"></div>
						<script>
							var mapContainer = document.getElementById('map'),
							    mapOption = { 
							        center: new kakao.maps.LatLng('${course.latitude}', '${course.longitude}'),
							        level: 3
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption);
					
							var mapTypeControl = new kakao.maps.MapTypeControl();
					
							map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
					
							var zoomControl = new kakao.maps.ZoomControl();
							map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
							
							var markerPosition  = new kakao.maps.LatLng('${course.latitude}', '${course.longitude}'); 
					
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							
							marker.setMap(map);
						</script>
					</c:otherwise>
				</c:choose>
				</td>
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
				<td>
				<c:choose>
					<c:when test="${item.charge == 0}">무료</c:when>
					<c:otherwise>${item.charge}</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td>어린이 요금</td>
				<td>
				<c:choose>
					<c:when test="${item.childCharge == 0}">무료</c:when>
					<c:otherwise>${item.childCharge}</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td>영아 요금</td>
				<td>
				<c:choose>
					<c:when test="${item.infantCharge == 0}">무료</c:when>
					<c:otherwise>${item.infantCharge}</c:otherwise>
				</c:choose>
				</td>
			</tr>
			
			<tr>
				<td>최소 인원</td>
				<td>
				<c:choose>
					<c:when test="${item.minMan == 0}">없음</c:when>
					<c:otherwise>${item.minMan}</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td>최대 인원</td>
				<td>
				<c:choose>
					<c:when test="${item.maxMan == 0}">없음</c:when>
					<c:otherwise>${item.maxMan}</c:otherwise>
				</c:choose>
				</td>
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