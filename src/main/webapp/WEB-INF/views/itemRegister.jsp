<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 상품 작성</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script>
	function chk_item(){
		let frm = document.frm_item_register;
		let s = document.getElementById("tCourseNumNot");
		let selectValue = Number(s.options[s.selectedIndex].value);
		document.getElementById("tCourseNum").value = selectValue;
		frm.submit();
	}
	</script>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>여행 상품 작성</h2>
  <p>여행 상품 정보를 작성합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			<form action="/items/register" method="post" name="frm_item_register">
				<div class="form-group">
				<label>
					여행 종류
					<select id="tCourseNumNot" class="form-control">
						<c:forEach items="${courseTitleList}" var="numItem">
							<option value="<c:out value="${numItem.tcIdx}" />"><c:out value="${numItem.title}" /></option>
						</c:forEach>
					</select>
				</label>
				</div>
				
				<div style="display: none;">
					<input id="tCourseNum" name="tCourseNum" type="number">
				</div>
				
				<div class="form-group">
					<label>
						출발일
						<input type="date" name="startDay" class="form-control">
					</label>
					<label>
						도착일
						<input type="date" name="endDay" class="form-control">
					</label>
				</div>
				<div class="form-group">
					<label>
						일반 회원가
						<input type="number" name="charge" class="form-control" step="1000">
					</label>
					<label>
						어린이 요금
						<input type="number" name="childCharge" class="form-control" step="1000">
					</label>
					<label>
						영아 요금
						<input type="number" name="infantCharge" class="form-control" step="1000">
					</label>
				</div>
				<div>
					<label>
						최소 인원
						<input type="number" name="minMan" class="form-control">
					</label>
					<label>
						최대 인원
						<input type="number" name="maxMan" class="form-control">
					</label>
				</div>
				<div>
					<label>
						담당자 성명
						<input type="text" name="managerMan" class="form-control" maxlength="10">
					</label>
					<label>
						담당자 연락처
						<input type="text" name="managerCall" class="form-control" maxlength="15" placeholder="'-' 와 함께 입력해주세요">
					</label>
				</div>
				
				<button type="button" onClick="chk_item()" class="btn btn-success" style="width: 45%">Submit</button>
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>