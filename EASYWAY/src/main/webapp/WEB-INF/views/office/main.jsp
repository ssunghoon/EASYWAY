<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 위와 버전만 다른가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>	

<!-- EASYWAY CSS, JS -->
<link rel="stylesheet" href="/resources/css/chat.css">
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/sidebars.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/widget.css" rel="stylesheet" />
<link href="/resources/css/chat.css" rel="stylesheet">
<script src="/resources/js/menu.js"></script>


</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../public/sidebar.jsp" />

	<div class="page-divider">
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


			<!---------------------------------------------------------------------------------------->
			<!-- 모달창 ------------------------------------------------------------------------------->
			<!---------------------------------------------------------------------------------------->

			<!-- 저장하기 / 불러오기-->
			<div class="custom">
				<div id="custom-title">위젯 커스텀</div>
				<div id="save-btn" class="custom-btn" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-save">
					<i id="save-btn-icon" class="fas fa-save"></i> <span>저장하기</span>
				</div>
				<div id="import-btn" class="custom-btn" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop-default">
					<i id="import-btn-icon" class="fas fa-cog"></i> <span>기본설정</span>
				</div>
			</div>
			<input type="hidden" id="token" name="${_csrf.parameterName}"
				data-token-name="${_csrf.headerName}" value="${_csrf.token}" />

			<!-- 커스텀 저장 모달창 -->
			<div class="modal fade" id="staticBackdrop-save"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">위젯 상태 저장하기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="custom-save">
								<div id="custom-save1">커스텀 1</div>
								<div class="custom-unselected"></div>
							</div>
							<div class="custom-save">
								<div id="custom-save2">커스텀 2</div>
								<div class="custom-unselected"></div>
							</div>
							<div class="custom-save">
								<div id="custom-save3">커스텀 3</div>
								<div class="custom-unselected"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 기본 커스텀 설정 모달창 -->
			<div class="modal fade" id="staticBackdrop-default"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdrop2Label">해당 오피스의 기본
								커스텀을 변경하고 새로고침해주세요</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="custom-default-save">
								<div id="custom-saved1">커스텀 1</div>
							</div>
							<div class="custom-default-save">
								<div id="custom-saved2">커스텀 2</div>
							</div>
							<div class="custom-default-save">
								<div id="custom-saved3">커스텀 3</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 썸네일 컨테이너 (draggable) -->
			<ul class="widget-thumb-container" onclick="widgetFunction(event)">

				<!-- 위젯 썸네일들 -->
				<li id="thumb-clock" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">실시간 시계</div>
				</li>
				<li id="thumb-notice" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">공지사항 목록</div>
				</li>
				<li id="thumb-attendance" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">출퇴근 체크</div>
				</li>
				<li id="thumb-sign" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">결재함 목록</div>
				</li>
				<li id="thumb-project" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">프로젝트 리스트</div>
				</li>
				<li id="thumb-calendar" class="widget-thumb unselected">
					<div class="custom-delete"></div>
					<div class="widget-thumb-label">캘린더 일정</div>
				</li>
				<!-- end 위젯 썸네일들 -->

			</ul>
			<!-- end widget-thumb-container -->

		</div>
	</div>

	<!-- 채팅 부분 -->
	<jsp:include page="../public/chat.jsp" />
</body>

<script src="/resources/js/widget.js"></script>

<script type="text/javascript">

var customNow = ${customNow};

var widgetArr = new Array();

<c:forEach var="widgetList" items="${widgetList}">

	widgetArr.push("${widgetList.widgetName}");
	widgetArr.push("${widgetList.widgetPositionX}");
	widgetArr.push("${widgetList.widgetPositionY}");
	widgetArr.push("${widgetList.widgetWidth}");
	widgetArr.push("${widgetList.widgetHeight}");

</c:forEach>
	
</script>
<script src="/resources/js/chat.js"></script>
</html>