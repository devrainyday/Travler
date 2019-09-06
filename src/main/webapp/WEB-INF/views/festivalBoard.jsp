<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Travler : 축제 방명록</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#changeValue").click(function() {
		    var f = $(this).val();
		    console.log(f);
		    $("#festivalNum").val(f);
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
  <h2>축제 방명록</h2>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3>축제 목록</h3>
		</div>
		<c:forEach items="${festivalList}" var="festival">
		<div class="col-md-6">
			<div class="card">
			    <div class="card-header"><c:out value="No.${festival.fIdx}" />&nbsp;&nbsp;&nbsp;<c:out value="${festival.title}" /></div>
			    <div class="card-body">
			    	축제 기간 : <fmt:formatDate value="${festival.startDay}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${festival.endDay}" pattern="yyyy-MM-dd"/>
			    	<br>
			    	이용 요금 : 
			    	<c:choose>
						<c:when test="${festival.charge == 0}">무료</c:when>
						<c:otherwise>${festival.charge}</c:otherwise>
					</c:choose>
					<br>
					연락처 : ${festival.phone}
					
					<div class="col-md-12" style="margin-top: 30px;">
				    <a href="/festivals/get?idx=<c:out value="${festival.fIdx}" />" class="btn btn-info">축제 정보 더 보기</a>
				    <button type="button" id="changeValue" value="<c:out value="${festival.fIdx}" />" class="btn btn-primary" data-toggle="modal" data-target="#registerModal">축제 방명록 작성</button>
			    	</div>
			    </div>
			  </div>
		</div>
		</c:forEach>
		
		<div class="col-md-12" style="margin-top: 50px;">
			<h3>축제 방명록</h3>
		</div>
		
		<c:forEach items="${list}" var="festivalBoard">
		<div class="col-md-4">
			<div class="card">
			    <div class="card-header">
			    <c:forEach items="${festivalList}" var="festival">
				    <c:if test="${festivalBoard.festivalNum eq festival.fIdx}">
			    		${festival.title}
			    	</c:if>
			    </c:forEach>
			    
			    <br>
			    
			    <fmt:formatDate value="${festivalBoard.boardDate}" pattern="yyyy-MM-dd"/>
			    </div>
			    <div class="card-body">
			    	작성자 : ${festivalBoard.memberId} ( ${festivalBoard.memberName} )
					<br>
					${festivalBoard.fComment}
					<br>
					
					<c:set var="userId" value="${festivalBoard.memberId}" />
					<% String userId = (String)pageContext.getAttribute("userId"); %>
					<% if(((String)session.getAttribute("sessionId")).equals(userId)) { %>
						<a href="/festivalBoards/remove?idx=${festivalBoard.fbIdx}">
						<button class="btn btn-danger">방명록 삭제</button>
						</a>
					<% } %>
			    </div>
		  	</div>
		</div>
		</c:forEach>
	</div>
	
	<!-- Register Modal -->
	  <div class="modal fade" id="registerModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h5 class="modal-title">축제 방명록 작성</h5>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <form action="/festivalBoards/register" method="post">
	          	<div class="form-group">
					<label>
						축제 번호
						<input type="text" id="festivalNum" name="festivalNum" class="form-control" readonly>
					</label>
				</div>
			    
				<div class="form-group">
					<label>
						작성자 정보
						<input type="text" value="<%= session.getAttribute("sessionId") %> (<%= session.getAttribute("sessionName") %>)" class="form-control" readonly>
					</label>
					<input type="hidden" name="memberId" value="<%= session.getAttribute("sessionId") %>">
					<input type="hidden" name="memberName" value="<%= session.getAttribute("sessionName") %>">
				</div>
				
				<div class="form-group">
					<textarea name="fComment"></textarea>
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
	  
	  <!-- Modify Modal -->
	  <div class="modal fade" id="modifyModal">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">Modal Heading</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          Modal body..
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
</div>
</body>
</html>