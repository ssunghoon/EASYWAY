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
.btn-group{
	width: 15px;
}

.project-board-td{
	display: flex;
	justify-content: space-between;
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
						<form action="projectboardregister" method="post">
							<input type="hidden" id="token" name="${_csrf.parameterName}"
								data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
							<input type="hidden" name="projectId" value="${projectId}" />
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

			<!-- Example split danger button -->

			<table>
				<!-- 게시판 목록 -->
				<c:forEach var="projectBoard" items="${projectBoard}">
					<tr>
						<td class="project-board-td" class="project-board${projectId}">
							<a class="projectBoard" href="projectpostlist?projectId=${projectId}&&projectBoardId=${projectBoard.projectBoardId}">${projectBoard.projectBoardName}
								<input type="hidden" class="projectid" value="${projectId}" >
								<input type="hidden" class="projectboard" value="${projectBoard.projectBoardId}" >
							</a>

							<div class="btn-group">
								<button type="button"
									class="btn btn-info dropdown-toggle dropdown-toggle-split"
									data-bs-toggle="dropdown" aria-expanded="false">
									<span class="visually-hidden">Toggle Dropdown</span>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="" class="project-board-modify">수정</a></li>
									<li><a class="dropdown-item" href="" class="project-board-del">삭제</a></li>
								</ul>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br>

		</div>

		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@게시물 목록@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->

	</div>
	<script type="text/javascript">
	$(document).ready(function () {
// 	  $('.project-board-del').on("click",function() {
// 		  var aProjectBoard = $(this);
// 		  console.log(aProjectBoard);
// 		  console.log('asdfasfasfasf');
		  
// 		  $.ajax({
// 			  type: "post",
// 			  url: "/project/projectpostremove",
// 			  data: JSON.stringify(data),
// 		      contentType: "application/json; charset=utf-8",
// 		      beforeSend: function (xhr) {
// 		        var $token = $("#token");
// 		        xhr.setRequestHeader($token.data("token-name"), $token.val());
// 		      },
// 		      success: function (result, status, xhr) {
// // 		          console.log(result);
// 		      },
// 		      error: function (xhr, status, er) {
// 		    	  alert("해당 이름을 가진 게시판이 존재하지 않습니다.");
// 		      },
// 		  });
// 	  })
	  $(document).on("click", ".project-board-del", function (e) {
		  
		  var aProjectBoard = $(this);
		  console.log(aProjectBoard);
		  console.log('asdfasfasfasf');
// 	  }
	})
  });
	</script>
</body>

</html>