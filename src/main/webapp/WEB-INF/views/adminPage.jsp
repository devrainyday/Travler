<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Travler : Admin Page</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e794a87025ae465cf1403850435b762e"></script>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>Admin Page</h2>
</div>

<div class="container">
	<div class="row">
		<ul class="col-md-12 nav nav-tabs">
	    <li><a data-toggle="tab" href="#menu1">여행 예약 조회</a></li>
	    <li><a data-toggle="tab" href="#menu2">회원 조회</a></li>
	    <li><a data-toggle="tab" href="#menu3">탈퇴 회원 조회</a></li>
	    <li><a data-toggle="tab" href="#menu4`">통계</a></li>
		</ul>
		
		  <div class="tab-content">
		  
		    <div id="menu1" class="tab-pane fade">
		      <h3>여행 예약 조회</h3>
		      <c:forEach items="${itemList}" var="item">
				<div class="col-md-12">
					<div class="card">
					    <div class="card-header">
						    <c:forEach items="${courseTitle}" var="ct">
							    <c:if test="${item.tCourseNum eq ct.tcIdx}">
						    		${ct.title}
						    	</c:if>
						    </c:forEach>
						    
					    <br>
					    
					    <fmt:formatDate value="${item.startDay}" pattern="yyyy-MM-dd"/>&nbsp; ~ &nbsp;<fmt:formatDate value="${item.endDay}" pattern="yyyy-MM-dd"/>
					    </div>
					    
					    <div class="card-body">
					    
					    <table class="table table-hover" style="text-align: center;">
					    	<tr>
					    		<th>예약자</th>
					    		<th>예약 금액</th>
					    		<th>예약일</th>
					    		<th>특이사항</th>
					    		<th>예약 상태</th>
					    	</tr>
					    	
			    			<jsp:useBean id="now" class="java.util.Date" />
			    			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
			    			
								<c:forEach items="${bookingList}" var="booking">
									
									<c:if test="${item.tiIdx eq booking.tItemNum}">
									
						    		<tr>
						    			<td>${booking.mName} ( ${booking.mId} )</td>
						    			<td>${booking.totalCharge} 원</td>
						    			<td><fmt:formatDate value="${booking.bookingDate}" pattern="yyyy-MM-dd"/></td>
						    			<td>
						    			<c:if test="${ not empty booking.warning}">
						    				${booking.warning}
						    			</c:if>
						    			<c:if test="${ empty booking.warning}">
						    				없음
						    			</c:if>
						    			</td>
						    			<td>
						    			
										<fmt:formatDate value="${booking.travelStartDay}" pattern="yyyy-MM-dd" var="startDate" />
										<fmt:formatDate value="${booking.travelEndDay}" pattern="yyyy-MM-dd" var="endDate"/>
										
						    			<c:choose>
						    			
											<c:when test="${booking.bState eq 'ongoing' && nowDate ge endDate}">
												<button class="btn btn-outline-success">
													여행 완료
												</button>
											</c:when>
											
											<c:when test="${booking.bState eq 'ongoing' && nowDate ge startDate}">
												<button class="btn btn-outline-success" style="cursor:default">
													여행 중
												</button>
											</c:when>
											
						    				<c:when test="${booking.bState eq 'ongoing' && nowDate le startDate}"> <!-- 예약 취소 연결 -->
												<button type="button" class="btn btn-outline-primary">예약 완료</button>
											</c:when>
											
											<c:when test="${booking.bState eq 'cancel'}">
												<button class="btn btn-outline-warning" style="cursor:default">
													예약 취소
												</button>
											</c:when>
											
										</c:choose>
						    			</td>
						    		</tr>
						    		
							    	</c:if>
							    	
								</c:forEach>
							</table>
					    </div>
					    
					  	</div>
					</div>
				</c:forEach>
		    </div>
		    
		    <div id="menu2" class="tab-pane fade">
		      <h3>회원 조회</h3>
		      
			    <div class="col-md-12 col-sm-12 col-xs-12">
					<table style="width: 100%" class=" table table-bordered table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>성명</th>
								<th>Email</th>
								<th>연락처</th>
								<th>예약 횟수</th>
								<th>가입일</th>
							</tr>
						</thead>
						
						<c:forEach items="${memberInfo}" var="member">
						<tr>
							<td><c:out value="${member.id}" /></td>
							<td><c:out value="${member.name}" /></td>
							<td><c:out value="${member.email}" /></td>
							<td><c:out value="${member.phone}" /></td>
							<td>
								<c:forEach items="${memberBookingNumInfo}" var="bookingNumInfo">
									<c:if test="${member.id eq bookingNumInfo.mId}">
							    		${bookingNumInfo.num} ( ${bookingNumInfo.l} 등급 )
							    	</c:if>
						    	</c:forEach>
					    	</td>
							<td>
							<fmt:formatDate value="${member.joinDate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						</c:forEach>
					</table>
			    </div>
		    </div>
		    
		    <div id="menu3" class="tab-pane fade">
		      <h3>탈퇴 회원 조회</h3>
			    <div class="col-md-12 col-sm-12 col-xs-12">
					<table style="width: 100%" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>탈퇴 아이디</th>
								<th>탈퇴 성명</th>
								<th>탈퇴일</th>
							</tr>
						</thead>
						
						<c:forEach items="${secessionInfo}" var="secession">
						<tr>
							<td><c:out value="${secession.id}" /></td>
							<td><c:out value="${secession.name}" /></td>
							<td>
							<fmt:formatDate value="${secession.secessionDate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						</c:forEach>
					</table>
				
				</div>
		    </div>
		    
		    <div id="menu4" class="tab-pane fade">
		      <h3>통계</h3>
		      
		    </div>
		    
		  </div>
	</div>
</div>
</body>
</html>