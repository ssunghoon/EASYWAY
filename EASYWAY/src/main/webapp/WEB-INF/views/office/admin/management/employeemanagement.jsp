<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
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

<!-- EASYWAY CSS, JS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/sidebars.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/office/employee_management.css"
	rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
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
					<div class="tab-label-choice">
						<a href="/office/admin/management/employeemanagement">임직원 관리</a>
					</div>
					<div class="tab-label">
						<a href="/office/admin/management/employeemanagement">인사 관리자
							설정</a>
					</div>
				</div>

				<%-- ${sessionScope.nowOfficeInfo} --%>
				<div class="setting-title">
					<div class="easyway-title1">사원 등록</div>
				</div>
				<div class="employee-btns">
					<button type="button" class="employee-add-btn"
						data-bs-toggle="modal" data-bs-target="#employee-resite-model">추가하기</button>
					<button id="save-btn" class="easyway-btn">저장</button>
				</div>
				<div class="employee-table">
					<table id="employee-list" class="employee-list">
						<tr>
							<th>이름</th>
							<th>이메일</th>
							<th>직위명</th>
							<th>소속부서</th>
							<th>입사일</th>
							<th>근로형태</th>
							<th>휴대전화</th>
						</tr>

						<c:forEach var="employee" items="${employeeList}">
							<tr>
								<td>${employee.employeeName}</td>
								<td>${employee.employeeEmail}</td>
								<td>${employee.employeePosition}</td>
								<td>${employee.employeeDepartment}</td>
								<td>${employee.employeeHireDate}</td>
								<td>${employee.employeeWorkType}</td>
								<td>${employee.employeePhone}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="modal fade" id="employee-resite-model" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">새로운 사원 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<input type="search" class="form-control rounded"
								placeholder="초대할 맴버 이메일을 작성해주세요" aria-label="Search"
								aria-describedby="search-addon" name="memberEmail" />
							<button type="button" id="search-email" class="btn easyway-btn">search</button>
						</div>
						<div id="search-email-list" class="mb-3">
							<label for="recipient-name" class="col-form-label">검색결과:</label>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary all-clear-btn"
								data-bs-dismiss="modal">닫기</button>
							<input id="add-employee" type="button" class="btn easyway-btn"
								data-bs-dismiss="modal" value="추가하기">
						</div>
						<input type="hidden" id="token" name="${_csrf.parameterName}"
							data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
	var positionList = new Array();
	var ps = {};
	<c:forEach items="${positionList}" var="position">
	positionList.push({
		"positionId": "${position.positionId}",
		"positionName":"${position.positionName}"
		});
	</c:forEach>
	console.log(positionList);
	var departmentList = new Array();
	<c:forEach items="${departmentList}" var="department">
	departmentList.push({
		"departmentId": "${department.departmentId}",
		"departmentName":"${department.departmentName}"
		});
	</c:forEach>
</script>
<script src="/resources/js/office/employeemanagement.js"></script>

</html>