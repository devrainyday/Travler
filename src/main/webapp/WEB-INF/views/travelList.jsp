<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		$("#changeValue").click(function() {
		    var f = $(this).val();
		    console.log(f);
		    $("#tItemNum").val(f);
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
								<td>0</td>
								<td>
								<a class="btn btn-info" href="/items/get?idx=<c:out value="${item.tiIdx}" />">
									자세한 정보 보기
								</a>
								</td>
								<td>
								<a class="btn btn-success" value="<c:out value="${item.tiIdx}" />" id="changeValue" data-toggle="modal" data-target="#bookingModal" style="color: white;">
									예약하기
								</a>
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
	          <h5 class="modal-title">예약</h5>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	
	        <!-- Modal body -->
	        <div class="modal-body">
	          <form action="/travels/booking/register" method="post">
	          	<div class="form-group">
					<label>
						<input type="text" id="tItemNum" name="tItemNum" class="form-control" readonly>
					</label>
				</div>
				
				<div class="form-group">
					<label>
						<input type="text" name="tTitle" class="form-control" readonly>
					</label>
				</div>
			    
				<div class="form-group">
					<label>
						작성자 정보
						<input type="text" value="<%= session.getAttribute("sessionId") %> (<%= session.getAttribute("sessionName") %>)" class="form-control" readonly>
					</label>
					<input type="hidden" name="mId" value="<%= session.getAttribute("sessionId") %>">
					<input type="hidden" name="mName" value="<%= session.getAttribute("sessionName") %>">
				</div>
				
				<div class="form-inline form-group">
					성인 수<input type="number" name="charge">
					어린이 수<input type="number" name="childCharge">
					영유아 수<input type="number" name="infantCharge">
				</div>
				
				<div class="form-group">
					<input type="number" name="totalCharge">
				</div>
				
				<div class="form-group">
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