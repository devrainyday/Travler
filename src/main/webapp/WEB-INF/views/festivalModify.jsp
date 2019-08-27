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
			
			<form action="/festivals/modify" method="post">
			
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
						<input type="date" name="startDay" value="<fmt:formatDate value="${festival.startDay}" type="date" pattern="yyyy-MM-dd"/>" class="form-control">
						&nbsp;~&nbsp;
						<input type="date" name="endDay"  value="<fmt:formatDate value="${festival.endDay}" type="date" pattern="yyyy-MM-dd"/>"class="form-control">
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
					연락처
					<input type="text" name="phone" class="form-control" value="${festival.phone}" maxlength="15">
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

				<input type="submit" class="btn btn-success" value="Submit" style="width: 45%">
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>