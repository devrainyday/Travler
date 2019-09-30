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
		  <ul class="nav nav-tabs col-md-12">
		    <li><a data-toggle="tab" href="#menu1">여행 예약 조회</a></li>
		    <li><a data-toggle="tab" href="#menu2">회원 조회</a></li>
		    <li><a data-toggle="tab" href="#menu3">탈퇴 회원 조회</a></li>
		    <li><a data-toggle="tab" href="#menu4">통계</a></li>
		  </ul>
		
		  <div class="tab-content">
		    <div id="menu1" class="tab-pane fade" style="margin: 50px;">
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
					    	<thead>
					    	<tr>
					    		<th>예약자</th>
					    		<th>예약 금액</th>
					    		<th>예약일</th>
					    		<th>특이사항</th>
					    		<th>예약 상태</th>
					    	</tr>
					    	</thead>
					    	
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
		    <div id="menu2" class="tab-pane fade" style="margin: 50px;">
		      <h3>회원 조회</h3>
		      <div class="col-md-12 col-sm-12 col-xs-12">
					<table style="width: 100%" class=" table table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>성명</th>
								<th>Email</th>
								<th>연락처</th>
								<th>예약 횟수</th>
								<th>가입일</th>
								<th>비밀번호 초기화</th>
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
							<td>
								<form action="/admin/setMemberPwd/" method="post">
									<input name="id" type="hidden" value="${member.id}">
									<button class="btn btn-outline-primary">초기화</button>
								</form>
							</td>
						</tr>
						</c:forEach>
					</table>
			    </div>
		    </div>
		    <div id="menu3" class="tab-pane fade" style="margin: 50px;">
		      <h3>탈퇴 회원 조회</h3>
		      <div class="col-md-12 col-sm-12 col-xs-12">
					<table style="width: 100%" class="table table-bordered table-hover">
						<thead class="thead-dark">
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
		    <div id="menu4" class="tab-pane fade" style="margin: 50px;">
		      <h3>통계</h3>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
		      	<c:forEach items="${tableCnt}" var="tableC">
		      		${tableC.tableName} : <span class="money">${tableC.cnt}</span><br>
		      	</c:forEach>
		      </div>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
		      	<span class="nonHighlight">Travler에 저장된 여행 코스 데이터는 <span class="money">총 ${courseCnt[0]} 개</span> 이며,</span><br>
	      		<span class="nonHighlight"><span class="money">${courseCnt[1]} 개</span>는 버스 여행, <span class="money">${courseCnt[2]} 개</span>는 기차 여행, <span class="money">${courseCnt[3]} 개</span>는 섬 여행 코스입니다.</span><br>
		      </div>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
	      	     <span class="nonHighlight">Travler에 저장된 여행 상품 데이터는 <span class="money">총 ${itemCnt[0]} 개</span> 이며, <br>
	      	           그 중 <span class="money"> ${itemCnt[1]} 개</span>의 상품이 현재 판매되고 있습니다.</span><br>
		      </div>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
		      	<span class="nonHighlight">여행 통계</span>
			      <table class="table table-hover" style="text-align: center;">
			      <thead class="thead-dark">
			      <tr>
			    		<th>여행코스 (번호)</th>
			    		<th>코스 - 예약 수</th>
			    		<th>코스 - 총 예약 금액 (원) </th>
		    	  </tr>
		    	  </thead>
			      <c:forEach items="${cIBCnt}" var="cIBCnt">
			      <tr>
			      	<td>${cIBCnt.title} ( ${cIBCnt.tcIdx} )</td>
			      	<td class="nonHighlight">${cIBCnt.cnt}</td>
			      	<td class="nonHighlight">${cIBCnt.sum}</td>
			      </tr>
			      </c:forEach>
			      </table>
		      </div>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
			      <span class="nonHighlight">회원 통계</span>
			      <table class="table table-hover" style="text-align: center;">
			      <thead class="thead-dark">
			      <tr>
			    		<th>회원</th>
			    		<th>예약 수</th>
			    		<th>완료 상태 예약 수</th>
			    		<th>여행 방명록 작성 횟수</th>
		    	  </tr>
		    	  </thead>
			      <c:forEach items="${memberBookingCnt}" var="memberBookingCnt">
			      	<tr>
			      		<td>${memberBookingCnt.id} ( ${memberBookingCnt.name} )</td>
			      		<td>${memberBookingCnt.cnt}</td>
			      		<td>
			      		<c:forEach items="${memberOnGoingBookingCnt}" var="memberOnGoingBookingCnt">
				      		<c:if test="${memberOnGoingBookingCnt.id eq memberBookingCnt.id}">
				      			${memberOnGoingBookingCnt.cnt}
				      		</c:if>
			      		</c:forEach>
			      		</td>
			      		<td>
			      		<c:forEach items="${memberFestivalBoardCnt}" var="memberFestivalBoardCnt">
				      		<c:if test="${memberFestivalBoardCnt.id eq memberBookingCnt.id}">
				      			${memberFestivalBoardCnt.cnt}
				      		</c:if>
			      		</c:forEach>
			      		</td>
			      	</tr>
			      	</c:forEach>
			      </table>
		      </div>
		      
		      <div class="col-md-12" style="margin: 25px 50px;">
			      <span class="nonHighlight">축제 통계</span>
			      <table class="table table-hover" style="text-align: center;">
			      <thead class="thead-dark">
			    		<th>축제명</th>
			    		<th>축제 방명록 수</th>
		    	  </tr>
			      <c:forEach items="${fFestivalBoardCnt}" var="fFestivalBoardCnt">
			      	<tr>
			    		<td>${fFestivalBoardCnt.title} ( ${fFestivalBoardCnt.fIdx} ) </td>
			    		<td>${fFestivalBoardCnt.cnt}</td>
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
