<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Travler : 여행 예약 내역</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script>
		function chk_bc() {
			if(confirm("여행 예약을 취소하시겠습니까?")) {
				document.frm_bc.submit();
			}
		}
	</script>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 예약 내역</h2>
</div>

<div class="container">
	<div class="row">				
		<div class="col-md-12">
			<div class="card">
			    <div class="card-header"><h5> ${course.title} </h5></div>
			    <div class="card-body">
			    	<table class="table table-hover" style="text-align: center;">
			    	<tr>
			    		<th>여행 상품</th>
			    		<th>여행 기간</th>
			    		<th>예약 금액</th>
			    		<th>예약일</th>
			    		<th>예약 상태</th>
			    	</tr>
			    	
	    			<jsp:useBean id="now" class="java.util.Date" />
	    			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
	    			
						<c:forEach items="${memberBooking}" var="booking">
				    		<tr>
				    			<td width="30%">${booking.tTitle}</td>
				    			<td width="30%">
				    			<fmt:formatDate value="${booking.travelStartDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${booking.travelEndDay}" pattern="yyyy-MM-dd"/>
				    			</td>
				    			<td>${booking.totalCharge} 원</td>
				    			<td>
				    			<fmt:formatDate value="${booking.bookingDate}" pattern="yyyy-MM-dd"/>
				    			</td>
				    			<td>
				    			
								<fmt:formatDate value="${booking.travelStartDay}" pattern="yyyy-MM-dd" var="startDate" />
								<fmt:formatDate value="${booking.travelEndDay}" pattern="yyyy-MM-dd" var="endDate"/>
								
				    			<c:choose>
				    						<c:when test="${booking.bState eq 'ongoing' && nowDate gt endDate}">
												<button class="btn btn-outline-success">
													여행 완료
												</button>
											</c:when>
											
											<c:when test="${booking.bState eq 'ongoing' && nowDate ge startDate}">
												<button class="btn btn-outline-success" style="cursor:default">
													여행 중
												</button>
											</c:when>
											
						    				<c:when test="${booking.bState eq 'ongoing' && nowDate lt startDate}"> <!-- 예약 취소 연결 -->
												<form action="/travels/booking/update?idx=${booking.bIdx}" method="post" name="frm_bc">
													<button type="button" onClick="chk_bc()" class="btn btn-outline-primary">예약 완료</button>
												</form>
											</c:when>
											
											<c:when test="${booking.bState eq 'cancel'}">
												<button class="btn btn-outline-warning" style="cursor:default">
													예약 취소
												</button>
											</c:when>
								</c:choose>
				    			</td>
				    		</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>