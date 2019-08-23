<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 코스 수정</title>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   	<link rel="stylesheet" href="<c:url value='/resources/style.css?after' />">

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <style>
	input, textarea {
		padding: 5px;
		border-radius: 5px;
		border-style: solid;
		border-color: darkgray;
		width: 100%;
	}
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		text-decoration: none;
	}
	</style>

</head>
<body>
<div class="jumbotron text-center">
  <h2>여행 상품 수정</h2>
  <p>여행 상품 정보를 수정합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			
			<div style="margin-bottom: 50px;">
				<a href="/items/list">
				<button type="button" class="btn btn-primary btn-md">목록으로</button>
				목록으로
				</a>
			</div>
			
			<form action="/items/modify" method="post">
			
				<input type="hidden" name="tiIdx" value="${item.tiIdx}">
			
				<div class="form-group">
				<label>
					여행 종류
					<select name="titemNum">
						<c:forEach items="${itemTitleList}" var="numItem">
							<option value="<c:out value="${numItem.tcIdx}" />"><c:out value="(${numItem.tcIdx}) ${numItem.title}" /></option>
						</c:forEach>
					</select>
				</label>
				</div>
				<div class="form-group">
					<label>
						출발일
						<input type="date" name="startDay" value="<fmt:formatDate value="${item.startDay}" type="date" pattern="yyyy-MM-dd"/>" class="form-control">
					</label>
					<label>
						도착일
						<input type="date" name="endDay"  value="<fmt:formatDate value="${item.endDay}" type="date" pattern="yyyy-MM-dd"/>"class="form-control">
					</label>
				</div>
				<div class="form-group">
					<label>
						일반 회원가
						<input type="number" name="charge"  value="${item.charge}"class="form-control" step="1000">
					</label>
					<label>
						어린이 요금
						<input type="number" name="childCharge"  value="${item.childCharge}"class="form-control" step="1000">
					</label>
					<label>
						영아 요금
						<input type="number" name="infantCharge"  value="${item.infantCharge}"class="form-control" step="1000">
					</label>
				</div>
				<div>
					<label>
						최소 인원
						<input type="number" name="minMan"  value="${item.minMan}" class="form-control">
					</label>
					<label>
						최대 인원
						<input type="number" name="maxMan"  value="${item.maxMan}" class="form-control">
					</label>
				</div>
				<div>
					<label>
						담당자 성명
						<input type="text" name="managerMan"  value="${item.managerMan}" class="form-control">
					</label>
					<label>
						담당자 연락처
						<input type="text" name="managerCall"  value="${item.managerCall}" class="form-control">
					</label>
				</div>
				
				<input type="submit" class="btn btn-success" value="Submit" style="width: 45%">
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>