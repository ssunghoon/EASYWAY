<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">

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
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	
    <!-- EASYWAY CSS, JS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/sign/sign.css" rel="stylesheet">
    <link href="/resources/css/sign/getSign.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/common_boardlist.css" rel="stylesheet">
    <script src="/resources/js/menu.js"></script>
</head>
<body>
	<jsp:include page="../public/sidebar.jsp" />

	<div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
			<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		    <div class="easyway-wrapper">
		
		        <div class="easyway-container">
				<c:choose>
					<c:when test="${basicSign.signFormId == '1'}">
					<div class="easyway-boarddetail-pagetitle">
		                <!-- 게시물 작성 타이틀 -->
		                <div class="easyway-title1">
							기본 기안서
		                </div>
	            	</div>
					<table class="table table-bordered easyway-boarddetail-content">
					<tr>
						<th class="col-lg-3 sign-th">제목</th>
						<td>${basicSign.signTitle }</td>
					</tr>
					<tr class="sign-content">
						<th class="content-box sign-th">내용</th>
						<td><c:out value="${basicSign.signContent }" escapeXml="false" /></td>
					</tr>
					<tr>
						<th class="sign-th">공개범위</th>
						<c:choose>
							<c:when test="${basicSign.signBasicRange == '1'}">
								<td>전체공개</td>
							</c:when>
							<c:when test="${basicSign.signBasicRange == '2'}">
								<td>부서공개</td>
							</c:when>
							<c:when test="${basicSign.signBasicRange == '3'}">
								<td>비공개</td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<th class="sign-th">기간</th>
						<td>
							<c:out value="${basicSign.signBasicStart}" /> ~ 
							<c:out value="${basicSign.signBasicEnd }" />
						</td>
					</tr>
					<tr>
						<th class="sign-th">중요도</th>
						<td>${basicSign.signImportance }</td>
					</tr>
					</table>
					</c:when>
					<c:when test="${spendSign.signFormId == '2'}">
					<div class="easyway-boarddetail-pagetitle">
		                <!-- 게시물 작성 타이틀 -->
		                <div class="easyway-title1">
							지출 결의서
		                </div>
	            	</div>
					<table class="table table-bordered easyway-boarddetail-content">
					<tr >
						<th class="col-lg-3 sign-th">제목</th>
						<td>${spendSign.signTitle }</td>
					</tr>
					<tr class="sign-content">
						<th class="content-box sign-th">내용</th>
						<td><c:out value="${spendSign.signContent }" escapeXml="false" /></td>
					</tr>
					<tr>
						<th class="sign-th">공개범위</th>
						<c:choose>
							<c:when test="${spendSign.signSpendRange == '1'}">
								<td>전체공개</td>
							</c:when>
							<c:when test="${spendSign.signSpendRange == '2'}">
								<td>부서공개</td>
							</c:when>
							<c:when test="${spendSign.signSpendRange == '3'}">
								<td>비공개</td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<th class="sign-th">중요도</th>
						<td>${spendSign.signImportance }</td>
					</tr>
					</table>
					</c:when>
					<c:when test="${vacationSign.signFormId == '3'}">
					<div class="easyway-boarddetail-pagetitle">
		                <!-- 게시물 작성 타이틀 -->
		                <div class="easyway-title1">
							휴가 신청서
		                </div>
	            	</div>
					<table class="table table-bordered easyway-boarddetail-content">
						<tr>
							<th class="col-lg-3 sign-th">제목</th>
							<td>${vacationSign.signTitle }</td>
						</tr>
						<tr class="sign-content">
							<th class="content-box sign-th">내용</th>
							<td><c:out value="${vacationSign.signContent }" escapeXml="false" /></td>
						</tr>
						<tr>
							<th class="sign-th">공개범위</th>
							<td>${vacationSign.signVacationType}</td>
						</tr>
						<tr>
						<th class="sign-th">기간</th>
						<td>
							
							<c:out value="${vacationSign.signVacationStart }"/> ~ 
							<c:out value="${vacationSign.signVacationEnd }" />
						</td>
					</tr>
					<tr>
						<th class="sign-th">중요도</th>
						<td>${vacationSign.signImportance }</td>
					</tr>
					</table>
					</c:when>
				</c:choose>
		
			</div>
		</div>
	</div>
</body>
</html>