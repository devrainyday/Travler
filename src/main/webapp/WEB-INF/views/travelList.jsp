<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<title>Travler : 여행 상품 둘러보기</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	$(document).ready(function() {
		
		<% if((String)session.getAttribute("message") != null) { %>
			alert('<%=(String)session.getAttribute("message") %>');
			<% session.removeAttribute("message"); %>
		<% } %>
		
		var charge = 0;
		var childCharge = 0;
		var infantCharge = 0;
		var total = 0;
		
		$("#changeValue").click(function() {
			var tItemNum = $(this).val();
		    $("#tItemNum").val(tItemNum);
		    
			$.ajax({
				url : '${pageContext.request.contextPath}/travels/getBookingInfo?itemNum='+ tItemNum,
				type : 'get',
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
				success : function(data) {
						charge = data[Object.keys(data)[1]];
					    childCharge = data[Object.keys(data)[2]];
					    infantCharge = data[Object.keys(data)[3]];
					    
					    $("#tTitle").val(data[Object.keys(data)[0]]);
					    $("#tTitleResult").text(data[Object.keys(data)[0]]);
					    
					    function getFormatDate(date){ 
					    	var year = date.getFullYear(); //yyyy 
					    	var month = (1 + date.getMonth()); //M 
						    month = month >= 10 ? month : '0' + month; //month 두자리로 저장 
						    var day = date.getDate(); //d 
						    day = day >= 10 ? day : '0' + day; //day 두자리로 저장
						    return year + '-' + month + '-' + day; 
						}

					    var s = new Date(data[Object.keys(data)[4]]);
					    var e = new Date(data[Object.keys(data)[5]]);
					    s = getFormatDate(s);
					    e = getFormatDate(e);
					    console.log('s : '+s);
					    console.log('e : '+e);
					    
					    $("#travelStartDay").val(s);
					    $("#travelEndDay").val(e);
					    
					    $("#travelDayResult").text(s + " ~ " + e);
					}, error : function(request, error) {
							console.log("실패");
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
					}
			});
			
			total = 0;
		    $("#charge").val("");
		    $("#childCharge").val("");
		    $("#infantCharge").val("");
		    $("#totalCharge").val("");
		    $("#totalChargeResult").text(total + " 원");
		});
		
		$(".c").change(function() {
		    total = (charge * $("#charge").val()) + (childCharge * $("#childCharge").val()) + (infantCharge * $("#infantCharge").val());
		    $("#totalCharge").val(total);
		    $("#totalChargeResult").text(total + " 원");
		});
	});
	</script>
	
	<style>
	.modal-backdrop {
     background-color: rgba(0,0,0, 0.1) !important;
	}
	</style>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 상품 둘러보기</h2>
</div>

<div class="container">
	<div class="row">				
		<c:forEach items="${courseList}" var="course">
		<div class="col-md-12">
			<div class="card">
			    <div class="card-header"><h5> ${course.title} </h5></div>
			    <div class="card-body">
			    	<table class="table table-hover" style="text-align: center;">
			    	<tr>
			    		<th>여행 기간</th>
			    		<th>상품가</th>
			    		<th>출발인원 범위</th>
			    		<th>현재예약인원</th>
			    		<th>여행상품 정보</th>
			    		<th>예약</th>
			    	</tr>
					<c:forEach items="${itemList}" var="item">
						<c:if test="${item.tCourseNum eq course.tcIdx}">
				    		<tr>
								<td><fmt:formatDate value="${item.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item.endDay}" pattern="yyyy-MM-dd"/></td>
								<td><span style="color: #6DC1FF;">${item.charge} 원</span></td>
								<td>최소 ${item.minMan}명 ~ 최대 ${item.maxMan}명</td>
								<td>
									<c:choose>
										<c:when test="${fn:length(itemNumList) == 0}">
											없음
										</c:when>
										<c:otherwise>
											<c:forEach items="${itemNumList}" var="itemNum">
												<c:if test="${item.tiIdx eq itemNum.tItemNum}">
										    		${itemNum.num} 명
										    	</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
								<a class="btn btn-info" href="/items/get?idx=<c:out value="${item.tiIdx}" />">
									자세한 정보 보기
								</a>
								</td>
								<td>
								<button class="btn btn-success" id="changeValue" value="<c:out value="${item.tiIdx}" />" data-toggle="modal" data-target="#bookingModal">
									예약하기
								</button>
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
	
	<!-- Register Modal -->
	  <div class="modal fade" id="bookingModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title">예약 정보</h5>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	
	        <!-- Modal body -->
	        <div class="modal-body">
	          <form action="/travels/booking/register" method="post">
	          	<div class="form-group">
					<label>
						<input type="hidden" id="tItemNum" name="tItemNum" class="form-control" readonly>
						<span id="tTitleResult"></span>
						<input type="hidden" id="tTitle" name="tTitle" class="form-control" readonly>
					</label>
				</div>
			    
				<div class="form-group">
					여행 기간 :&nbsp;<span id="travelDayResult"></span>
					
					<div style="display: none;">
						<input type="Date" class="form-control" id="travelStartDay" name="travelStartDay" readonly>&nbsp;~&nbsp;<input type="Date" class="form-control" id="travelEndDay" name="travelEndDay" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label>
						예약 회원 정보
						<input type="text" value="<%= session.getAttribute("sessionId") %> (<%= session.getAttribute("sessionName") %>)" class="form-control" disabled>
					</label>
					<input type="hidden" name="mId" value="<%= session.getAttribute("sessionId") %>">
					<input type="hidden" name="mName" value="<%= session.getAttribute("sessionName") %>">
				</div>
				
				<div class="form-inline">
					성인 수<input type="number" placeholder="최대 10명 예약 가능합니다" min="0" max="10" id="charge" name="charge" class="c">
					어린이 수<input type="number" placeholder="최대 10명 예약 가능합니다" min="0" max="10" id="childCharge" name="childCharge" class="c">
					영유아 수<input type="number" placeholder="최대 10명 예약 가능합니다" min="0" max="10" id="infantCharge" name="infantCharge" class="c">
				</div>
				
				<div class="form-group">
					총 결제 금액
					<span style="color: #6DC1FF; font-size: 1.5rem;" id="totalChargeResult"></span>
					<div style="display: none;">
						<input type="number" id="totalCharge" name="totalCharge">
					</div>
				</div>
				
				<div class="form-group">
					특이사항 · 주의사항
					<textarea name="warning"></textarea>
				</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <div class="form-group">
					<button type="submit" class="btn btn-primary">제출</button>
	          		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			  </div>
	          </form>
	        </div>
	        
	      </div>
	    </div>
	  </div>
</div>
</body>
</html>