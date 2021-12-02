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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">


<!-- Bootstrap core CSS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

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
	.wrapper {
		height: 100vh;
		margin-left: 370px;
		margin-right: 5%;
	}
}
</style>

<!-- Custom styles for this template -->
<link href="/resources/css/sidebars.css" rel="stylesheet">
</head>
<body>
<%-- 	<jsp:include page="../public/sidebar.jsp" /> --%>
	<!-- 	<div style="height: 300px; width: 200px; background: yellow; margin-left: 500px; display:none;"> -->
	<!-- 	</div> -->
	<div class="wrapper">
		<!-- 		<a href="projectInsertForm.do">프로젝트 생성</a> -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">프로젝트 생성</button>

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="projectcreate" method="post">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">프로젝트 생성</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div>
								프로젝트 이름 : <input type="text" name="projectName"><br>
								시작일 : <input type="date" name="projectStart"><br>
								종료일 : <input type="date" name="projectEnd"><br>
								프로젝트 설명 <br>
								<textarea rows="6" cols="70" name="projectContent"></textarea>
								<br>
								<!-- 								<input type="submit" class="btn btn-primary mb-3" -->
								<!-- 									value="등록"> -->
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<input type="submit" class="btn btn-primary" value="등록">
							<!-- 							<button type="button" class="btn btn-primary">생성</button> -->
						</div>
					</form>
				</div>
			</div>
		</div>


		<table border="1">
			<tr>
				<td>프로젝트 번호&nbsp;&nbsp;</td>
				<td>프로젝트 명&nbsp;&nbsp;</td>
				<td>시작일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>종료일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>프로젝트 내용</td>
			</tr>
			<c:forEach var="project" items="${list}">
				<tr>
					<td>${project.projectId}</td>
					<td><a
						href="projectboardlist?projectId=${project.projectId }">${project.projectName}</a></td>
					<td><fmt:parseDate var="dt" value="${project.projectStart}"
							pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${dt }"
							pattern="yyyy/MM/dd" /></td>
					<td><fmt:parseDate var="de" value="${project.projectEnd}"
							pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${de }"
							pattern="yyyy/MM/dd" /></td>
					<td>${project.projectContent }</td>
				</tr>
			</c:forEach>
		</table>
		<br> <br>

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

<script type="text/javascript">
	
</script>
</html>