<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행 코스 작성</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
	
	<script>
	window.onload = function() { 
		let message = document.getElementById("failMessage");
		message.innerHTML = "";
	}
	
	function chk_course(){
		let frm = document.frm_course_register;
		let message = document.getElementById("failMessage");
		
		if(!frm.title.value) {
			frm.title.focus();
			message.innerHTML = "여행 코스명을 입력해주세요!";
		} else if(!frm.startPlace.value) {
			frm.startPlace.focus();
			message.innerHTML = "출발지를 입력해주세요!";
		} else if(!frm.travelTerm.value) {
			frm.travelTerm.focus();
			message.innerHTML = "여행기간을 입력해주세요!";
		} else if(!frm.latitude.value || isNaN(frm.latitude.value)===true) {
			frm.latitude.focus();
			message.innerHTML = "좌표를 입력해주세요!";
		} else if(!frm.longitude.value || isNaN(frm.longitude.value)===true) {
			frm.longitude.focus();
			message.innerHTML = "좌표를 입력해주세요!";
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
  <h2>여행 코스 작성</h2>
  <p>여행 코스 정보를 작성합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			
			<form action="/courses/register" method="post" name="frm_course_register">
				<div class="form-group">
					<label>
						여행코스 이름
						<input type="text" name="title" class="form-control" maxlength="50">
					</label>
				</div>
				<div class="form-group">
				<label>
					여행 종류
					<select name="kind" class="form-control">
						<option value="당일 버스">당일 버스여행</option>
						<option value="숙박 버스">숙박 버스여행</option>
						<option value="당일 기차">당일 기차여행</option>
						<option value="숙박 기차">숙박 기차여행</option>
						<option value="제주도">제주도</option>
						<option value="울릉도·독도">울릉도·독도</option>
						<option value="홍도·흑산도">홍도·흑산도</option>
						<option value="백령도·대청도">백령도·대청도</option>
					</select>
				</label>
				</div>
				<div class="form-group">
				<label>
					출발지
					<input type="text" name="startPlace" class="form-control" maxlength="25">
				</label>
				</div>
				<div class="form-group">
				<label>
					교통수단
					<select name="traffic" class="form-control">
						<option value="버스">버스</option>
						<option value="항공">항공</option>
						<option value="열차">열차</option>
					</select>
				</label>
				</div>
				<div class="form-group">
				<label>
					여행기간
					<input type="text" name="travelTerm" class="form-control" maxlength="5">
				</label>
				</div>
				<div class="form-group">
			   
                <label>
           			상세 일정
                	<textarea name="tCourse" id="editorCourse"></textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorCourse' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
                <label>
           			여행지 및 호텔정보
                	<textarea name="tTravelPlace" id="editorTravelPlace"></textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorTravelPlace' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
                <label>
           			환불규정 및 주의사항
                	<textarea name="tWarning" id="editorWarning"></textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorWarning' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
				<label>
					위치
					<input type="text" name="latitude" class="form-control" maxlength="10">
					<input type="text" name="longitude" class="form-control" maxlength="10">
				</label>
				</div>
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
				<button type="button" onClick="chk_course()" class="btn btn-success" style="width: 45%">Submit</button>
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>