<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Oxanium:wght@500&display=swap"
		rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	
    <!-- EASYWAY 전용 공통부 CSS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
	<link href="/resources/css/attendance.css" rel="stylesheet">
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
				
					<div class="easyway-attendance-item">
	                <!-- 1번째 easyway-attendance-item : 근태 현황 타이틀 -->
	                	<div class="easyway-title2">
	                    	근태 현황
	                	</div>
		            </div>
		            <div class="easyway-attendance-item">
		                <!-- 2번째 easyway-attendance-item : 근태 현황 내용 -->
						<ul class="attendance-status">
							<li class="attendance-status-late">
								<span>지각</span> <span>00	회</span>
							</li>
							<li class="attendance-status-leave">
								<span>조기퇴근</span> <span>00 회</span>
							</li>
							<li class="attendance-status-absence">
								<span>결근</span> <span>00	회</span>
							</li>
						</ul>
		            </div> <!-- end 근태 현황 -->
		            
		            <div class="easyway-attendance-item">
		                <!-- 3번째 easyway-attendance-item : 근무 체크 타이틀 -->
		                <div class="easyway-title2">
	                    	근무 체크
	                	</div>
		            </div>
		            <div class="easyway-attendance-item">
		                <!-- 4번째 easyway-attendance-item : 근무 체크 내용 -->
		                <div class="work-check-clock"></div>
						<ul class="work-check">
							<li id="work-check-start" class="select-check">
								<div>
									<i class="far fa-play-circle"></i>
								</div>
								<span>출근하기</span>
							</li>
							<li id="work-check-out" class="select-check">
								<div>
									<i class="far fa-pause-circle"></i>
								</div>
								<span>외근하기</span>
							</li>
							<li id="work-check-end" class="select-check">
								<div>
									<i class="far fa-stop-circle"></i>
								</div>
								<span>퇴근하기</span>
							</li>
						</ul>
		            </div><!-- end 근무 체크 -->
		            
		            <div class="easyway-attendance-item">
		                <!-- 5번째 easyway-attendance-item : 근무 현황 타이틀 -->
		                <div class="easyway-title2">
	                    	근무 현황
	                	</div>
		            </div>
		            <div class="easyway-attendance-item">
		                <!-- 6번째 easyway-attendance-item : 근무 현황 내용 -->
		                <ul class="work-status">
							<li class="work-status-start">
								<i class="far fa-clock"></i>
								<span class="work-status-time">${attendance.attendanceStart}</span>
								<span>출근</span>
							</li>
							<li class="work-status-out">
								<i class="far fa-clock"></i>
								<span class="work-status-time">${attendance.attendanceOut}</span>
								<span>외근</span>
							</li>
							<li class="work-status-end">
								<i class="fas fa-clock"></i>
								<span class="work-status-time">${attendance.attendanceEnd}</span>
								<span>퇴근</span>
							</li>
						</ul>
		            </div><!-- end 근무 현황 -->
		            
		            <div class="easyway-attendance-item">
		                <!-- 7번째 easyway-attendance-item : 휴가 현황 타이틀 -->
		                <div class="easyway-title2">
	                    	휴가 현황
	                	</div>
		            </div>
		            <div class="easyway-attendance-item">
		                <!-- 8번째 easyway-attendance-item : 휴가 현황 내용 -->
		                <ul class="vacation-status">
							<li class="vacation-status-total">
							<span>총 휴가</span> <span>00 일</span>
							</li>
							<li class="vacation-status-available"><span>잔여휴가</span> <span>00 일</span>
							</li>
							<li class="vacation-status-register">
								<button type="button" class="easyway-btn">휴가신청</button>
							</li>
						</ul>
		            </div><!-- end 휴가 현황 -->
		            
			</div> <!-- end easyway-container -->
		</div> <!-- easyway-wrapper -->
	</div> <!-- end page-divider -->


</body>

	<!-- body 아래에 있어야하는 script -->
	<script src="/resources/js/attendance.js"></script>

</html>