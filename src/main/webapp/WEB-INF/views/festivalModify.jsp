<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>축제 수정</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script>
    window.onload = function() { 
		let message = document.getElementById("failMessage");
		message.innerHTML = "";
	}
	
	function chk_festival(){
		let frm = document.frm_festival_modify;
		let message = document.getElementById("failMessage");
		
		if(!frm.title.value) {
			frm.title.focus();
			message.innerHTML = "축제명을 입력해주세요!";
		} else if(!frm.charge.value) {
			frm.charge.focus();
			message.innerHTML = "이용요금을 입력해주세요!";
		} else if(!frm.host.value) {
			frm.host.focus();
			message.innerHTML = "주최측을 입력해주세요!";
		} else if(!frm.phone.value) {
			frm.phone.focus();
			message.innerHTML = "문의처를 입력해주세요!";
		} else if(!frm.site.value) {
			frm.site.focus();
			message.innerHTML = "축제 공식 사이트를 입력해주세요!";
		} else if(!frm.address.value) {
			frm.address.focus();
			message.innerHTML = "주소를 입력해주세요!";
		} else if(!frm.latitude.value) {
			frm.latitude.focus();
			message.innerHTML = "위치를 입력해주세요!";
		} else if(!frm.longitude.value) {
			frm.longitude.focus();
			message.innerHTML = "위치를 입력해주세요!";
		} else {
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
  <h2>축제 수정</h2>
  <p>축제 정보를 수정합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			
			<div style="margin-bottom: 50px;">
				<a href="/festivals/list">
				<button type="button" class="btn btn-primary btn-md">목록으로</button>
				</a>
			</div>
			
			<form action="/festivals/modify" method="post" name="frm_festival_modify">
			
				<input type="hidden" name="fIdx" value="${festival.fIdx}">
			
				<div class="form-group">
					<label>
						축제 이름
						<input name="title" value="${festival.title}" maxlength="50" class="form-control">
					</label>
				</div>
				
				<div class="form-group">
				<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
                <label>
           			간단한 설명
                	<textarea name="explain" id="editorfestival">${festival.explain}</textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorfestival' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				
				<div class="form-group form-inline" class="form-inline">
					<label>
						축제 기간 &nbsp;
						<input type="date" name="startDay" class="form-control">
						&nbsp;~&nbsp;
						<input type="date" name="endDay" class="form-control">
					</label>
				</div>
				
				<div class="form-group">
				<label>
					이용요금
					<input type="number" name="charge" class="form-control" value="${festival.charge}">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					주최
					<input type="text" name="host" class="form-control" value="${festival.host}" maxlength="25">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					문의처
					<input type="text" name="phone" class="form-control" value="${festival.phone}" maxlength="15" placeholder="'-' 와 함께 입력해주세요">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					축제 공식 사이트
					<input type="text" name="site" class="form-control" value="${festival.site}" maxlength="50">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					주소
					<input type="text" name="address" class="form-control" value="${festival.address}" maxlength="50">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					위치
					<input type="text" name="latitude" class="form-control" maxlength="10" value="${festival.latitude}" >
					<input type="text" name="longitude" class="form-control" maxlength="10" value="${festival.longitude}" >
				</label>
				</div>
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
				<button type="button" onClick="chk_festival()" class="btn btn-success" style="width: 45%">Submit</button>
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>