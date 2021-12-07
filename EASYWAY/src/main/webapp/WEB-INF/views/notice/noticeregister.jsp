<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="/resources/js/menu.js"></script>

<style>

.easyway-container {
  grid-template-rows: 18px auto;
}

.form-container {
	grid-template-rows: 70px 70px 70px auto 70px;
}

.form-file {
  /* 첨부 파일 */
  grid-column: 1 / 3;
  grid-row: 4 / 5;
}

.form-file-input {
  /* 첨부 파일 : 작성칸 */
  grid-column: 2 / 13;
  grid-row: 4 / 5;
}

.form-option1-input {
    display: flex;
}

.form-content {
  /* 내용 */
  grid-column: 1 / 13;
  grid-row: 5 / 6;
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
	                    글쓰기
	                </div>
	            </div>
	            
	         
	            <div class="easyway-boardapply-form">
	            
		            <form class="form-container" action="/notice/noticeregister" method="post">
		           		 <input type="hidden" id="token" name="${_csrf.parameterName}"
                 		 data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
			        	<div class="form-title">
			                <!-- 제목 -->
			                	<div class="option-name">제목</div>
			            </div>
			            <div class="form-title-input">
			                <!-- 제목 : 작성칸 -->
			                <input type="text" class="form-control" placeholder="글제목" name="obTitle">
			            </div>
			            <div class="form-writer">
			                <!-- 작성자 : 작성칸 -->			                
			            <div class="option-name"  >작성자</div>
			            </div>
						<div class="form-writer-input">
							<!-- 작성자 : 작성칸 -->
							<!-- class는 input이라고 이름붙였지만, read-only로 해주세요 -->
							<input type="hidden" class="form-writer-name" placeholder="" name="employeeId" value="4">
						전나은</div>
						<div class="form-dep-input">
							<!-- 제목 : 작성칸 -->
							<input type="hidden" class="form-control" placeholder="" name="departmentId" value="3">
						</div>
			            
			            <!-- 이하 옵션 필요한만큼 가져다 쓰고 안 쓰면 지우세요 ----------------------------------->
			            <div class="form-option1">
			                <!-- 상단 고정 여부 -->
			                <div class="option-name">상단 고정 여부</div>
			            </div>
			            <div class="form-option1-input">
							<!-- 상단 고정 여부 : 작성칸 -->
							<div class="radio-wrapper">
								<input type="radio" name="obFixedCheck" id="ch1" value="Y">&nbsp;<label for="ch1">상단 고정</label>
				            </div>
							<div class="radio-wrapper">
					            <input type="radio" name="obFixedCheck" id="ch2" value="N" checked="checked">&nbsp;<label for="ch2">일반 공지</label>
				            </div>
			            </div>
			             <div class="form-option2">
			                <!-- 상단 고정 여부 -->
			                <div class="option-name">접근 여부</div>
			            </div>
			            <div class="form-option2-input">
							<!-- 상단 고정 여부 : 작성칸 -->
							<div class="radio-wrapper">
								<input type="radio" name="obAccess" id="ch3" value="Y">&nbsp;<label for="ch3">부서글 이동</label>
				            </div>
							<div class="radio-wrapper">
					            <input type="radio" name="obAccess" id="ch4" value="N" checked="checked">&nbsp;<label for="ch4">전체글 이동</label>
				            </div>
			            </div>
			            <div class="form-file">
			            	<!-- 첨부 파일 -->
			            	<div class="option-name">첨부 파일</div>
			            </div>
			            <div class="form-file-input">
			            	<!-- 첨부 파일 -->
			            	<input type="text" class="form-control" placeholder="파일첨부" name="obFilePath">
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
							<textarea class="summernote" placeholder="글내용" name="obContent"></textarea>
			            </div>
			            <!-- end content -->
			            <div class="form-submit">
			            	<!-- 등록 버튼 -->
			            	<input type="submit" class="easyway-btn" value="글쓰기">
			            </div>
			            
			    	</form>
			    	
	            </div> <!-- end easyway-boardapply-form -->
	            
	        </div> <!-- end easyway-container -->
	    </div> <!-- end easyway-wrapper -->
	    
    </div> <!-- end page-divider -->


<script type="text/javascript">
$(document).ready(function(){
	$(".easyway-btn").click(function () {
		var obfixedcheck = $("#ch1").val();
		var obfixedcheck2 = $("#ch2").val();
		 if(obfixedcheck == ""){
             alert("상단 고정 여부를 선택하세요");
             return;
         }
         if(obfixedcheck2 == ""){
             alert("상단 고정 여부를 선택하세요");
             return;
         }
         document.form.submit();
     });
 });
</script>
</body>
</html>