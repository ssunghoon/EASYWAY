<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>편하게 오피스 작업을! EasyWay!</title>

	<!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
    <!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="/resources/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	
    <!-- EASYWAY CSS, JS -->
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
	<link href="/resources/css/widget.css" rel="stylesheet"/>
    <script src="/resources/js/menu.js"></script>
    
</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../public/sidebar.jsp" />
    
    <div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		<div class="easyway-wrapper">
			<div class="widget-area">
				
				<!-- 선택된 위젯들 -->
				<div id="widget-selected-container">
					<!-- --------------------------------------------------------- -->
					<!-- 클릭한 위젯이 생성될 자리---------------------------------- -->
					<!-- --------------------------------------------------------- -->
				</div>
				
			</div>
			
			<div class="save-btn">
				<div>저장하기</div>
				<i class="fas fa-save"></i>
			</div>
			
			<!-- 썸네일 컨테이너 (draggable) -->
			<ul class="widget-thumb-container" onclick="widgetFunction(event)">
			
				<!-- 위젯 썸네일들 -->
				<li id="thumb-clock" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">실시간 시계</div>
				</li>
				<li id="thumb-notice" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">공지사항 목록</div>
				</li>
				<li id="thumb-attendance" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">출퇴근 체크</div>
				</li>
				<li id="thumb-sign" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">결재함 목록</div>
				</li>
				<li id="thumb-project" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">프로젝트 리스트</div>
				</li>
				<li id="thumb-calendar" class="widget-thumb shadow unselected">
					<div class="widget-thumb-label">캘린더 일정</div>
				</li><!-- end 위젯 썸네일들 -->
				
			</ul> <!-- end widget-thumb-container -->
				
			
		</div>
	</div>
</body>

<script src="/resources/js/widget.js"></script>

</html>