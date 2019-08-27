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
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e794a87025ae465cf1403850435b762e"></script>
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
				<td>
				<c:choose>
					<c:when test="${festival.charge == 0}">무료</c:when>
					<c:otherwise>${festival.charge}</c:otherwise>
				</c:choose>
				</td>
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
				<c:choose>
					<c:when test="${festival.latitude eq '0' || festival.longitude eq '0'}">
						없음.
					</c:when>
					<c:otherwise>
						<div id="map" style="width:100%;height:350px;"></div>
						
						<script>
							var mapContainer = document.getElementById('map'),
							    mapOption = { 
							        center: new kakao.maps.LatLng('${festival.latitude}', '${festival.longitude}'),
							        level: 3
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption);
							
							var mapTypeControl = new kakao.maps.MapTypeControl();
					
							map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
					
							var zoomControl = new kakao.maps.ZoomControl();
							map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
							
							var markerPosition  = new kakao.maps.LatLng('${festival.latitude}', '${festival.longitude}'); 
							
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							
							marker.setMap(map);
						</script>
					</c:otherwise>
				</c:choose>
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