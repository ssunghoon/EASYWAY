<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link href="/resources/css/common_boarddetail.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
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
    
    <div class= "page-divider">
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
							<input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
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
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
	    <div class="easyway-wrapper">
	    
	        <div class="easyway-container">
	
	            <div class="easyway-boarddetail-pagetitle">
	                 <!-- 게시물 작성 타이틀 -->
	                <div class="easyway-title1">
 						${pb.projectBoardName}
	                </div>
	            </div>
	            <div class="easyway-boarddetail-title">
	            	<!-- 게시물 타이틀 -->
	            	<div class="post-title">
	                    ${projectPost.projectPostTitle}
	                </div>
	            </div>
	            <div class="easyway-boarddetail-writer">
	            	<!-- 게시물 작성자 / 소속부서 / 수정 / 삭제 / 리스트로 돌아가기 -->

	            	<!-- 작성자 정보 -->
	            	<div class="writer-info">
		            	<div class="writer-name">
		            		<i class="writer-icon fas fa-user-circle"></i>
		            		${projectPost.employeeName}
		            	</div>
		            	<div class="writer-department">
		            		개발팀
		            	</div>
	            	</div>

	            	
	            	<!-- 수정 / 삭제 / 돌아가기 버튼 -->
	            	<div class="buttons">
		            	<button type="button" class="modify-btn easyway-btn" onclick="location.href='projectpostmodify?projectId=${projectId}&&projectBoardId=${projectBoardId}&&projectPostId=${projectPost.projectPostId}'">
		            		수정
		            	</button>
		            	<form action="projectpostremove" method="post" onsubmit="return delbtn()">
		            		<input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
		            		<input type="hidden" name="projectId" value="${projectId} "/>
		            		<input type="hidden" name="projectBoardId" value="${projectBoardId}"/>
		            		<input type="hidden" name="projectPostId" value="${projectPost.projectPostId}"/>
		            		<input type="submit" id="delete-btn" class="delete-btn easyway-btn" value="삭제"/>
		            	</form>
<!-- 		            	<button type="button" class="delete-btn easyway-btn"> -->
<!-- 		            		삭제하기 -->
<!-- 		            	</button> -->
		            	<button type="button" class="list-btn easyway-btn" onclick="location.href='projectpostlist?projectId=${projectId}&&projectBoardId=${projectBoardId}'">
		            		목록
		            	</button>
	            	</div>
	            </div>
	            <div class="easyway-boarddetail-info">
	            	<!-- 게시물 세부 정보 : 작성 시간, 날짜 / 조회수 등 -->
	            	<div class="info-time">
	            		<i class="time-icon far fa-clock"></i>
	            		2021-10-30
	            	</div>
	            	<div class="info-view">
	            		<span class="info-view-label">조회수</span>
	            		<span class="info-view-count">17</span>
	            	</div>
	            </div>
	            <div class="easyway-boarddetail-content">
	            	<!-- 게시물 내용 -->
	            	${projectPost.projectPostContent }
	            </div>
	        </div>
	
	    </div>
    </div>
	<script type="text/javascript">
		function delbtn(){
			if(!confirm('선택한 글을 삭제하시겠습니까?')){
				return false
			}
		}
		
	</script>
</body>


</html>

</body>
</html>