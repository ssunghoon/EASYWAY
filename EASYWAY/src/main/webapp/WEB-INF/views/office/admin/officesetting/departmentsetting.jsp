<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.84.0">
	<title>편하게 오피스 작업을! EasyWay!</title>

	<!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
	<!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Oxanium:wght@500&display=swap" rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

	<!-- EASYWAY CSS, JS -->
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/sidebars.css" rel="stylesheet">
	<link href="/resources/css/common.css" rel="stylesheet">
	<link href="/resources/css/office/employee_management.css" rel="stylesheet">
	<link href="/resources/css/common_boardlist.css" rel="stylesheet">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	<script src="/resources/js/menu.js"></script>

</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../../../public/sidebar.jsp" />

	<div class="page-divider">
		<div class="sidebar-background"></div>

		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		<div class="easyway-wrapper">

			<div class="easyway-container">
				<div class="tab-header">
					<div class="tab-label">
						<a href="/office/admin/officesetting/vacationsetting">휴가 설정</a>
					</div>
					<div class="tab-label">
						<a href="/office/admin/officesetting/positionsetting">직위 설정</a>
					</div>
					<div class="tab-label-choice">
						<a href="/office/admin/officesetting/departmentsetting">부서 설정</a>
					</div>
				</div>

				<div class="employee-management-table">
					<div class="employee-management-title">
						<h3>부서 설정</h3>
					</div>
				</div>

				<div class="employee-table">
					<div class="easyway-board-item">
						<!-- 8번째 easyway-board-item : 게시판 목록 (테이블 태그) 들어갈 자리 -->
						<!-- 임의의 5열 x 15줄 태그 (th포함하면 16줄) -->
						<table class="board-list">
							<tr>
								<th>등급</th>
								<th>직위명</th>
							</tr>
							<tr>
								<td>223</td>
								<td>전나은</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>

					</div>
				</div>
				<button class="easyway-btn">
					저장
				</button>
			</div>

		</div>
	</div>

</body>


</html>

</body>

</html>