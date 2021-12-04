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
    <link href="/resources/css/sign.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
    <script src="/resources/js/menu.js"></script>

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
	                <!-- 임시저장 버튼 -->
	                <button id="signLine" class="easyway-btn ls-modal" data-toggle="modal" data-target="#modal">결재선</button>
	            </div>
	            
	            <div class="easyway-boardapply-form">
	            
		            <form class="form-container" action="/sign/applybasic" action="/sign/signFilePath" method="post">
		            
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
			                <div class="form-writer-name">전나은</div>
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
								<input type="radio" name="signImportance" id="third" value="하">&nbsp;<label for="third">하</label>
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
								<h5>결재선 설정</h5>
								<c:forEach var="employee" items="${employeeList }">
									<input type="radio" value="${employee.employeeId }" name="employeeId" id="${employee.employeeId }">
									<label for="${employee.employeeId }">
										<c:out value="${employee.employeeName}" />
									</label><br>
									<input type="hidden" value="${employee.employeeName }" id="employeeId">
								</c:forEach>
							</div>
							<div class="col-lg-1">
								<div class="in-out-box">
									<a id="firstIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
									<a><i class="fas fa-caret-square-left fa-2x"></i></a>
								</div>
								<div class="in-out-box">
									<a id="secondIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
									<a><i class="fas fa-caret-square-left fa-2x"></i></a>
								</div>
								<div class="in-out-box">
									<a id="thirdIn"><i class="fas fa-caret-square-right fa-2x"></i></a>
									<a><i class="fas fa-caret-square-left fa-2x"></i></a>
								</div>
								<div class="in-out-box">
									<a id=""><i class="fas fa-caret-square-right fa-2x"></i></a>
									<a><i class="fas fa-caret-square-left fa-2x"></i></a>
								</div>
							</div>
							<div class="col-lg-5">
								<div class="sign-box" >
									<p id="firstResult" align="center"></p>
								</div>
								<div class="sign-box">
									<p id="secondResult" align="center"></p>
								</div>
								<div class="sign-box">
									<p id="thirdResult" align="center"></p>
								</div>
								<div class="sign-box">
									<p id="fourthResult" align="center"></p>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-gray"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">저장</button>
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
			
</body>

<script type="text/javascript">

	var employeeData = null;
	$("#signLine").on("click", function() {
		$("#myModal").modal("show");
	});
	
	// 첫번째 결재선 등록
	/* $('#firstIn').on("click",function() {
		// firstResult 자리
		const firstResult = document.getElementById('firstResult').value;
		// 선택된 값
		var firstVal = $('input[name="employeeId"]:checked').val();
		//var firstVal = $('input[type="hidden"]').val();
		alert("firstVal : " + firstVal);
		// firstResult자리에 선택된 값을 넣음
		document.getElementById("firstResult").innerHTML = firstVal;
	}); */

/*
	$('#secondIn').click(function() {
		val secondVal = $('input[name="employeeId"]:checked').val();
		alert("secondVal" + secondVal);
	});

	$('#thirdIn').click(function() {
		val thirdVal = $('input[name="employeeId"]:checked').val();
		alert("thirdVal" + thirdVal);
	});
	$('#fourthIn').click(function() {
		val fourthVal = $('input[name="employeeId"]:checked').val();
		alert("fourthVal" +fourthVal);
	});
	 */
	 
	// 첫번째 결재선 등록
	$('#firstIn').click(function() {
		var radioVal = $('input[name="employeeId"]:checked').val();
		alert(radioVal);
		$.ajax({
	        url:"/sign/applylinefirst",
	        type:"post",
	        data: radioVal,
	        dataType: "text",
	        success:function(data){
	        	//employeeData = data;//{id, name ....}
	        	alert(radioVal);
	        },
	        error: function (error){
	            alert("에러");
	        }
	    });
	}); 
	
	
	
</script>
 
</html>