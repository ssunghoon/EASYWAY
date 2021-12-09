<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>편하게 오피스 작업을! EasyWay!</title>

	<!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
    <!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Oxanium:wght@500&display=swap"
		rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	 
	<!-- summernote -->
	<script src="/resources/js/summernote.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
    <!-- EASYWAY CSS, JS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/common_boardapply.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
    <script src="/resources/js/menu.js"></script>

<style>

.easyway-container {
  grid-template-rows: 18px auto;
}

.form-container {
	grid-template-rows: 70px 70px auto 70px;
}

input {
	width: 100%;
}

.form-file {
  grid-row: 3 / 4;
}

.form-file-input {
  grid-row: 3 / 4;
  grid-column: 3 / 13;
}

.form-content {
  grid-row: 4 / 5;
}

input.easy-btn {
	width: 78px !important;
}

.form-submit {
    display: flex;
    padding: 10px 0 !important;
    justify-content: flex-end;
}

.buttons {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.buttons>input:NTH-CHILD(1) {
	margin-right: 10px;
}

</style>

</head>
<body>
<!-- sidebar ------------------------------------------------------------------------------->
    <jsp:include page="../public/sidebar.jsp" />
    
    <div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
	    <div class="easyway-wrapper">
	
	        <div class="easyway-container">
	
	            <div class="easyway-boardapply-pagetitle">
	                <!-- 게시물 작성 타이틀 -->
	                <div class="easyway-title1">
	                    게시글 작성
	                </div>
	            </div>
	            
	            <!-- form -->
	            <div class="easyway-boardapply-form">
	            
		            <form class="form-container" action="projectpostregister" method="post">
		            	<input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
		            	<input type="hidden" name="projectId" value="${projectId}">
		            	<input type="hidden" name="projectBoardId" value="${projectBoardId }">
			        	<div class="form-title">
			                <!-- 제목 -->
			                <div class="option-name">제목</div>
			            </div>
			            <div class="form-title-input">
			                <!-- 제목 : 작성칸 -->
			                <input type="text" name="projectPostTitle">
			            </div>
			            <div class="form-writer">
			                <!-- 작성자 -->
			                <div class="option-name">작성자</div>
			            </div>
			            <div class="form-writer-input">
			                <!-- 작성자 : 작성칸 -->
			                <!-- class는 input이라고 이름붙였지만, read-only로 해주세요 -->
			                <div class="form-writer-name">전나은</div>
			            </div>
			            
     
			            <div class="form-file">
			            	<!-- 첨부 파일 -->
			            	<div class="option-name">첨부 파일</div>
			            </div>
			            <div class="form-file-input">
			            	<!-- 첨부 파일 -->
			            	<input type="text" name="projectPostFilePath">
			            </div>
			            
			            <div class="form-content">
			            	<!-- 내용 -->
			            	<div class="option-name">내용</div>
			            </div>
			            <div class="form-content-input">
			            	<!-- 내용 작성칸 -->
							<!------------------------------------------------------------------------------------------------->
							<!-- summernote 넣은 부분 ---------------------------------------------------------------------->
							<!------------------------------------------------------------------------------------------------->
							<textarea class="summernote" name="projectPostContent"></textarea>
			            </div><!-- end content -->
			            <div class="form-submit">
			            	<!-- 등록 버튼 -->
			            	<div class="buttons">
			            		<input type="submit" class="easyway-btn" value="등록">
			            		<input type="button" class="easyway-btn" value="취소">
			            	</div>
			            	
			            </div>
			            
			    	</form>
			    	
	            </div> <!-- end easyway-boardapply-form -->
	            
	        </div> <!-- end easyway-container -->
	    </div> <!-- end easyway-wrapper -->
	    
    </div> <!-- end page-divider -->

</body>


</html>