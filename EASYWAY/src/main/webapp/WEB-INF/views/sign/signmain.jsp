<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
<link href="/resources/css/sign/sign.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<script src="/resources/js/menu.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="/resources/css/sidebars.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../public/sidebar.jsp" />

		<div id="wrap">
			<div class="sign">
				<div class="btn-group btn-group-lg col-lg-11">
					<button type="button" class="btn btn-sign"
						onclick="location.href='/sign/signmain'">기안 작성</button>
					<button type="button" class="btn btn-sign"
						onclick="location.href='/sign/draftlist'">기안함</button>
					<button type="button" class="btn btn-sign"
						onclick="location.href='/sign/paymentlist'">결재함</button>
				</div>
				<div id="btn-group btn-group-lg white-box-group" style="padding: 10px 80px 10px 80px">
					<button class="btn btnGray" onclick="location.href='/sign/applybasic'" >기본기안서</button>
					<button class="btn btnGray" onclick="location.href='/sign/applyspend'" >지출결의서</button>
					<button class="btn btnGray" onclick="location.href='/sign/applyvacation'" >휴가신청서</button>
				</div>
		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/menu.js"></script>
<script src="/resources/js/sidebars.js"></script>
</html>