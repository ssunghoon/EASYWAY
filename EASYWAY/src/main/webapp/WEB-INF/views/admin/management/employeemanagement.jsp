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
	<link href="/resources/css/employee_management.css" rel="stylesheet">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	<script src="/resources/js/menu.js"></script>

</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../public/sidebar.jsp" />

	<div class="page-divider">
		<div class="sidebar-background"></div>

		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		<div class="easyway-wrapper">

			<div class="easyway-container">
				<div class="tab-header">
					<div class="tab-label-choice">
						<p>임직원 관리</p>
					</div>
					<div class="tab-label">
						<p>인사 관리자 설정</p>
					</div>
				</div>

				<div class="setting-title">
					<div class="easyway-title1">사원 등록</div>
				</div>
				<button class="employee-add-btn">추가하기</button>


				<div class="employee-table">
					<table class="employee-list">
						<tr>
							<th>이름</th>
							<th>이메일</th>
							<th>직위명</th>
							<th>소속부서</th>
							<th>근로형태</th>
							<th>휴대전화</th>
						</tr>
						<tr>
							<td>임동혁</td>
							<td>as0387@naver.com</td>
							<td>대표이사</td>
							<td>개발</td>
							<td>임원</td>
							<td>010-6352-2135</td>
						</tr>
						<tr>
							<td>전나은</td>
							<td>jne8181@naver.com</td>
							<td>사원</td>
							<td>개발</td>
							<td>정규직</td>
							<td>010-1234-1234</td>
						</tr>
						<tr>
							<td>김나현</td>
							<td>steamNa@naver.com</td>
							<td>과장</td>
							<td>영업</td>
							<td>정규직</td>
							<td>010-5678-5678</td>
						</tr>
					</table>
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