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
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
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
			<tr>
				<td width="23%;">
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
				<td>
				<div id="map" style="width:100%;height:350px;"></div>
				</td>
			</tr>
		</table>
		
	</div>
</div>
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
</body>
</html>