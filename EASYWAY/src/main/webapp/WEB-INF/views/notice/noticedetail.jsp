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
	            <div class="easyway-boarddetail-title">
	            	<!-- 게시물 타이틀 -->
	            	<div class="post-title">
	                   NO: <c:out value="${of_board.obId }"/>
	                   <c:out value="${of_board.obTitle}"/>
	                </div>
	            </div>
	            <div class="easyway-boarddetail-writer">
	            	<!-- 게시물 작성자 / 소속부서 / 수정 / 삭제 / 리스트로 돌아가기 -->
	            	
	            	<!-- 작성자 정보 -->
	            	<div class="writer-info">
		            	<div class="writer-name">
		            		<i class="writer-icon fas fa-user-circle"></i>
							홍길동
		            	</div>
						<div class="writer-department">
						개발부<c:out value="${of_board.departmentId }"/>
						</div>
					</div>
	            	
	            	<form action="/notice/noticeremove" method="post">
	            	<input type="hidden" id="token" name="${_csrf.parameterName}"
              		    data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
	            	<div class="buttons">
	            	<input type="hidden" name="obId" value='<c:out value="${of_board.obId}"/>' >
						<!--수정페이지로 이동 버튼 -->
						<a href="/notice/noticemodify?obId=${of_board.obId }"> <input
							type="button" value="수정" class="modify-btn easyway-btn"></a>
						<!-- form태그에서 경로 넣고포스트로 삭제 실행하고 리스트로 돌아감(컨트롤러) -->
						<input type="submit" value="삭제" class="delete-btn easyway-btn">
						<!-- 리스트로 이동 -->
						<a href="/notice/noticelist"> <input type="button"
							value="목록" class="list-btn easyway-btn"></a>
					</div>
	            </form>
	            </div>
	            	
	            	
	            <div class="easyway-boarddetail-info">
	            	<!-- 게시물 세부 정보 : 작성 시간, 날짜 / 조회수 등 -->
	            	
						<div class="info-time">
	            		<i class="time-icon far fa-clock"></i>
						<fmt:formatDate var="setObDate" 
						value="${of_board.obDate }" pattern="yyyy-MM-dd HH:mm:ss" />
						${setObDate }
	            	</div>
	
					<form id='operForm' action="/notice/noticedetail" method="get">
						<input type="hidden" id="token" name="${_csrf.parameterName}"
                 		 data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
						<input type="hidden" id='obId' name="obId" value='<c:out value="${of_board.obId}"/>'> 
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> 
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

					</form>

				</div>
				
				<div class="easyway-boarddetail-content">
						 ${of_board.obContent}
				</div>
	        </div>
	
	    </div>
    </div>


</body>
</html>