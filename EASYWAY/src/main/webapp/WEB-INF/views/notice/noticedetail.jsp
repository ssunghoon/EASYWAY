<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
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
    <script src="/resources/js/menu.js"></script>

</head>
<body>

	<!-- sidebar ------------------------------------------------------------------------------->
    <jsp:include page="../public/sidebar.jsp" />
    
    <div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
	    <div class="easyway-wrapper">
	
	        <div class="easyway-container">
	
	            <div class="easyway-boarddetail-pagetitle">
	                 <!-- 게시물 작성 타이틀 -->
	                <div class="easyway-title1">
	                    공지사항 게시글 보기
	                </div>
	            </div>
	            <div class="easyway-boarddetail-writer">
	            	<!-- 게시물 작성자 / 소속부서 / 수정 / 삭제 / 리스트로 돌아가기 -->
	            	
	            	<!-- 작성자 정보 -->
	            	<div class="writer-info">
		            	<div class="writer-name">
		            		<i class="writer-icon fas fa-user-circle"></i>
		            		임동혁
		            	</div>
	            	</div>
	            	
	            	<div class="buttons">
						<!--수정페이지로 이동 버튼 -->
						<a href="/notice/noticemodify?obId=${of_board.obId }"> <input
							type="button" value="수정" class="modify-btn easyway-btn"></a>
						<!-- form태그에서 경로 넣고포스트로 삭제 실행하고 리스트로 돌아감(컨트롤러) -->
						<input type="submit" value="삭제" class="delete-btn easyway-btn">
						<!-- 리스트로 이동 -->
						<a href="/notice/noticelist"> <input type="button"
							value="목록" class="list-btn easyway-btn"></a>
					</div>
	            </div>
	            
	            <div class="easyway-boarddetail-content">
	            	<form action="/notice/noticeremove" method="post">
	            	
	            	<label>작성날짜</label>
					<p>
						<fmt:formatDate var="setObDate" value="${of_board.obDate }"
							pattern="yyyy-MM-dd" />${setObDate }
					<p>

					<label>글번호</label> <input class="form-control" name='obId'
						value='<c:out value="${of_board.obId }"/>' readonly="readonly">



					<label>제목</label> <input class="form-control" name='obTitle'
						value='<c:out value="${of_board.obTitle}"/>' readonly="readonly">



					<label>내용</label>
					<textarea class="form-control" rows="3" name='obContent'
						readonly="readonly"><c:out
							value="${of_board.obContent}" /></textarea>


				</form>
	            </div>
	        </div>
	
	    </div>
    </div>

</body>
</html>