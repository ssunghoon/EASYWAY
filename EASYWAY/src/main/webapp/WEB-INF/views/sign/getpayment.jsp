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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">


<!-- Bootstrap core CSS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- css -->
<link href="/resources/css/sign.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="/resources/css/sidebars.css" rel="stylesheet">
</head>
<body>
<%-- <jsp:include page="../public/sidebar.jsp" />
 --%>
	<div id="wrap">
		<div class="sign">
	
	<c:choose>
		<c:when test="${basicSign.signFormId == '1'}">
		<h4>기본 기안서</h4>
		<table class="table table-bordered">
		<tr>
			<th class="col-lg-3">제목</th>
			<td>${basicSign.signTitle }</td>
		</tr>
		<tr>
			<th class="content-box">내용</th>
			<td><c:out value="${basicSign.signContent }" escapeXml="false" /></td>
		</tr>
		<tr>
			<th>공개범위</th>
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
			<th>기간</th>
			<td>
				<c:out value="${basicSign.signBasicStart }"/> ~ 
				<c:out value="${basicSign.signBasicEnd }" />
			</td>
		</tr>
		<tr>
			<th>중요도</th>
			<td>${basicSign.signBasicImportance }</td>
		</tr>
		</table>
		</c:when>
		<c:when test="${spendSign.signFormId == '2'}">
		<h4>지출 결의서</h4>
		<table class="table table-bordered">
		<tr>
			<th class="col-lg-3">제목</th>
			<td>${spendSign.signTitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><c:out value="${spendSign.signContent }" escapeXml="false" /></td>
		</tr>
		<tr>
			<th>공개범위</th>
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
			<th>중요도</th>
			<td>${spendSign.signSpendImportance }</td>
		</tr>
		</table>
		</c:when>
		<c:when test="${vacationSign.signFormId == '3'}">
		<h4>휴가 신청서</h4>
		<table class="table table-bordered">		
			<tr>
				<th class="col-lg-3">제목</th>
				<td>${vacationSign.signTitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><c:out value="${vacationSign.signContent }" escapeXml="false" /></td>
			</tr>
			<tr>
				<th>공개범위</th>
				<td>${vacationSign.signVacationType}</td>
			</tr>
			<tr>
			<th>기간</th>
			<td>
				<c:out value="${vacationSign.signVacationStart }"/> ~ 
				<c:out value="${vacationSign.signVacationEnd }" />
			</td>
		</tr>
		<tr>
			<th>중요도</th>
			<td>${vacationSign.signVacationImportance }</td>
		</tr>
		</table>
		</c:when>
	</c:choose>
	
</div>
	</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/menu.js"></script>
</html>