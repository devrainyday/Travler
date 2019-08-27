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
	
	<script>
    window.onload = function() { 
		let message = document.getElementById("failMessage");
		message.innerHTML = "";
	}
	
	function chk_item(){
		let frm = document.frm_course_modify;
		let message = document.getElementById("failMessage");
		
		if(!frm.charge.value) {
			frm.charge.focus();
			message.innerHTML = "일반 회원가를 입력해주세요!";
		} else if(!frm.childCharge.value) {
			frm.childCharge.focus();
			message.innerHTML = "어린이 요금을 입력해주세요!";
		} else if(!frm.infantCharge.value) {
			frm.infantCharge.focus();
			message.innerHTML = "영아 요금을 입력해주세요!";
		} else if(!frm.minMan.value) {
			frm.minMan.focus();
			message.innerHTML = "최소 인원을 입력해주세요!";
		} else if(!frm.maxMan.value) {
			frm.maxMan.focus();
			message.innerHTML = "최대 인원을 입력해주세요!";
		} else if(!frm.managerMan.value) {
			frm.managerMan.focus();
			message.innerHTML = "담당자 성명을 입력해주세요!";
		} else if(!frm.managerCall.value) {
			frm.managerCall.focus();
			message.innerHTML = "담당자 연락처를 입력해주세요!";
		} else {
			let s = document.getElementById("tCourseNumNot");
			let selectValue = Number(s.options[s.selectedIndex].value);
			document.getElementById("tCourseNum").value = selectValue;
			frm.submit();
		}
	}
	</script>

</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
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
				</a>
			</div>
			
			<form action="/items/modify" method="post"  name="frm_item_modify">
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
					<input id="tCourseNum" name="tCourseNum" value="${item.tCourseNum}" type="number">
				</div>
				
				<input type="hidden" name="tiIdx" value="${item.tiIdx}">
				
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
						<input type="text" name="managerMan"  value="${item.managerMan}" class="form-control" maxlength="10">
					</label>
					<label>
						담당자 연락처
						<input type="text" name="managerCall"  value="${item.managerCall}" class="form-control" maxlength="15" placeholder="'-' 와 함께 입력해주세요">
					</label>
				</div>
				<div>
					<span id="failMessage" style="color: red;"></span>
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