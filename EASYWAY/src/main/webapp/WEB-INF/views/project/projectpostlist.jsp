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

<!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
<!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- EASYWAY CSS, JS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/sidebars.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/common_boardlist.css" rel="stylesheet">
<script src="/resources/js/menu.js"></script>

<style>
.wrapper {
	width: 180px;
	background: #eee;
	border-right: 1px solid #ccc;
	display: flex;
	align-items: center;
	text-align: center;
	padding: 15px;
	flex-direction: column;
}
</style>

</head>
<body>
	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../public/sidebar.jsp" />

	<div class="page-divider">
		<div class="sidebar-background"></div>

		<div class="wrapper">
			<button type="button" class="easyway-btn" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">게시판 생성</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="projectboardregister?projectId=${projectId}"
							method="post">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">게시판 생성</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div>
									게시판 이름 : <input type="text" name="projectBoardName"><br>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<input type="submit" class="btn btn-primary" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
			<br>


			<table>
				<!-- 게시판 목록 -->
				<c:forEach var="projectBoard" items="${projectBoard}">
					<tr>
						<td><a
							href="projectpostlist?projectId=${projectId}&&projectBoardId=${projectBoard.projectBoardId}">${projectBoard.projectBoardName}</a></td>
					</tr>
				</c:forEach>
			</table>	
			<br>

		</div>

		<button class="easyway-btn"
			onclick="location.href='projectpostregister?projectId=${projectId}&&projectBoardId=${projectBoardId}'">글쓰기</button>

		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@게시물 목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
		<table>
			<c:forEach var="projectPost" items="${projectPost}">
				<tr>
					<td><a href="projectpostdetail?projectId=${projectId}&&projectBoardId=${projectBoardId}&&projectPostId=${projectPost.projectPostId}">${projectPost.projectPostTitle}</a></td>
				</tr>
			</c:forEach>
		</table>

	</div>

</body>

</html>