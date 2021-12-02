<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}
</style>


<!-- Custom styles for this template -->
<link href="/resources/css/sidebars.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../public/sidebar.jsp" />

	<div class="container">
		<div class="row">
			<form action="/notice/noticeregister" method="post">
				<table class="table_table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-left: 300px; margin-top: 100px; width: 80%;">
					<thead>
						<tr>
							<th
								style="background-color: #eeeeee; text-align: center; width: 100%;">글쓰기
							</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>공지글<input type="checkbox" placeholder="상단고정여부1" id="ch1" name="obFixedCheck" value="Y" onclick="checkOnlyOne(this)">
									일반글<input type="checkbox" placeholder="상단고정여부2" id="ch2" name="obFixedCheck" value="N" onclick="checkOnlyOne(this)">
							</td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="사원번호" name="employeeId"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글제목" name="obTitle"></td>
						</tr>

						<tr>
							<td><textarea class="form-control" placeholder="글내용"
									name="obContent" style="height: 400px;">
									</textarea></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="파일첨부" name="obFilePath"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td><input type="text" class="form-control" placeholder="날짜" -->
<!-- 								name="ob_date"></td> -->
<!-- 						</tr> -->
						<tr>
							<td><input type="text" class="form-control"
								placeholder="부서번호" name="departmentId"></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn btn-primary pull-right"
								value="글쓰기버튼"></td>
					</tbody>
				</table>

			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("obFixedCheck");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/menu.js"></script>
<script src="/resources/js/sidebars.js"></script>
</html>