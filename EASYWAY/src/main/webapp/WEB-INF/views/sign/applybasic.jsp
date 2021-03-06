<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
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
    <link href="/resources/css/sign/applySignBasic.css" rel="stylesheet">
    <link href="/resources/css/sign/sign.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
    <script src="/resources/js/menu.js"></script>
    <script src="/resources/js/sign/sign.js"></script>
    <script src="/resources/js/sign/applyBasic.js"></script>

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
						기본 기안서
	                </div>
	            </div>
	            <div class="easyway-boardapply-whitespace">
	            	<!-- 여백 -->
	            </div>
	            <div class="easyway-boardapply-save">
	                <!-- 결재선 버튼 -->
	                <button id="signLine" class="easyway-btn ls-modal sign-line" data-toggle="modal" data-target="#modal">결재선</button>
	            </div>
	            
	            <div class="easyway-boardapply-form">
	            
		            <form class="form-container" action="/sign/applybasic" action="/sign/signFilePath" method="post" enctype="multipart/form-data">
		            
			        	<div class="form-title">
			                <!-- 제목 -->
			                <div class="option-name">제목</div>
			            </div>
			            <div class="form-title-input">
			                <!-- 제목 : 작성칸 -->
			                <input type="text" name="signTitle">
			            </div>
			            <div class="form-writer">
			                <!-- 작성자 -->
			                <div class="option-name">작성자</div>
			            </div>
			            <div class="form-writer-input">
			                <!-- 작성자 : 작성칸 -->
			                <!-- class는 input이라고 이름붙였지만, read-only로 해주세요 -->
			                <div class="form-writer-name">${sessionScope.nowEmployeeInfo.employeeName}</div>
			            </div>
			            
			            <!-- 이하 옵션 필요한만큼 가져다 쓰고 안 쓰면 지우세요 ----------------------------------->
			            <div class="form-option1">
			                <!-- 공개범위 -->
			                <div class="option-name">공개 범위</div>
			            </div>
			            <div class="form-option1-input">
							<!-- 공개범위 : 작성칸 -->
							<select name="signBasicRange"  class="form-select">
							 	<option value="1">전체공개</option>
							 	<option value="2">부서공개</option>
							 	<option value="3">비공개</option>
						 	</select>	
			            </div>

			            <div class="form-option2">
			            	<!-- 중요도 -->
			            	<div class="option-name">중요도</div>
			            </div>
			            <div class="form-option2-input">
			            	<!-- 중요도 : 작성칸 -->
							<div class="radio-wrapper">
				            	<input type="radio" name="signImportance" id="first" value="상">&nbsp;<label for="first">상</label>
				            </div>
							<div class="radio-wrapper">
								<input type="radio" name="signImportance" id="second" value="중">&nbsp;<label for="second">중</label>
				            </div>
							<div class="radio-wrapper">
								<input type="radio" name="signImportance" id="third" value="하" checked="checked">&nbsp;<label for="third">하</label>
				            </div>
			            </div>

			            <div class="form-option3">
			                <!-- 기안 기간 -->
			                <div class="option-name">기간</div>
			            </div>
			            <div class="form-option3-input">
							<!-- 기안 기간 : 작성칸 -->
							<input type="date" name="signBasicStart">
							<input type="date" name="signBasicEnd">
			            </div>
			            <!-- 여기까지 추가 옵션이었습니다. 감사합니다. --------------------------------------------->
			            
			            <div class="form-file">
			            	<!-- 첨부 파일 -->
			            	<div class="option-name">첨부 파일</div>
			            </div>
			            <div class="form-file-input">
			            	<!-- 첨부 파일 -->
			            	<div><input type="file" name="signFilePath"/></div>
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
							<textarea class="summernote" name="signContent"></textarea>
			            </div><!-- end content -->
			            <div class="form-submit">
			            	<!-- 등록 버튼 -->
							<!--  기안 양식번호 -->
							<input type="hidden" name="signFormId" value="1">
							<input type="submit" class="easyway-btn" value="등록">
			            </div>
			            <div class="hidden-box">
				            <div id="firstEmployee"></div>
				            <div id="secondEmployee"></div>
				            <div id="thirdEmployee"></div>
				            <div id="fourthEmployee"></div>
			            </div>
			            <input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
			    	</form>
			    </div> <!-- end easyway-boardapply-form -->
	            
				<!-- 결재선 모달 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×</button>
								<h4 class="modal-title" id="myModalLabel">결재선</h4>
							</div>
							<div class="modal-body">
								<div class="col-lg-6 sign-list-box">
									<div class="input-group">
										<input type="search" class="form-control rounded"
											placeholder="이름을 입력해주세요" aria-label="Search"
											aria-describedby="search-addon" name="employeeName"/>
										<button type="button" id="search-name" class="btn easyway-btn">검색</button>
									</div>
									<div id="search-name-list" class="mb-3">
									
									</div>
								</div>
								<div class="col-lg-1">
									<div class="in-out-box">
										<a id="firstIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
										<a id="firstOut"><i class="fas fa-caret-square-left fa-2x"></i></a>
									</div>
									<div class="in-out-box">
										<a id="secondIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
										<a id="secondOut"><i class="fas fa-caret-square-left fa-2x"></i></a>
									</div>
									<div class="in-out-box">
										<a id="thirdIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
										<a id="thirdOut"><i class="fas fa-caret-square-left fa-2x"></i></a>
									</div>
									<div class="in-out-box">
										<a id="fourthIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
										<a id="fourthOut"><i class="fas fa-caret-square-left fa-2x"></i></a>
									</div>
								</div>
								<div class="col-lg-5">
									<div class="sign-box" id="firstResult">
									
									</div>
									<div class="sign-box" id="secondResult">
										
									</div>
									<div class="sign-box" id="thirdResult">
										
									</div>
									<div class="sign-box" id="fourthResult">
										
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-gray btn-clear">초기화</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">저장</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#signLine").on("click", function() {
		$("#myModal").modal("show");
	});	
		
	</script>
</body>
 
</html>