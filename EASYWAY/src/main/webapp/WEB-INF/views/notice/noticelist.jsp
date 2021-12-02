<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
	
    <!-- EASYWAY CSS, JS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/common_boardlist.css" rel="stylesheet">
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
	        
	        	<div class="easyway-board-item">
	                <!-- 1번째 easyway-board-item : 게시판 이름 들어갈 자리 -->
	                <div class="easyway-title1">
					전체 공지사항
	                </div>
	            </div>
	            <div class="easyway-board-item">
	                <!-- 2번째 easyway-board-item : 필터 들어갈 자리 1 -->
	            </div>
	            <div class="easyway-board-item">
	                <!-- 3번째 easyway-board-item : 필터 들어갈 자리 2 -->
	            </div>
	            <div class="easyway-board-item">
	                <!-- 4번째 easyway-board-item : 이 자리는 가급적 여백으로 두세요 -->
	            </div>
	            <div class="easyway-board-item">
	                <!-- 5번째 easyway-board-item : 버튼 자리 1 -->
	            </div>
	            <div class="easyway-board-item">
	                <!-- 6번째 easyway-board-item : 버튼 자리 2 -->
	            </div>
	            <div class="easyway-board-item">
	                <!-- 7번째 easyway-board-item : 글쓰기 버튼 들어갈 자리 -->
	                <a href="/notice/noticeregister">
	                <button type="button" class="easyway-btn">글쓰기</button>
	                </a>
	            </div>
	            
	            <div class="easyway-board-item">
	                <!-- 8번째 easyway-board-item : 게시판 목록 (테이블 태그) 들어갈 자리 -->
	                <table class="board-list">
	                	<tr>
							<th>글번호</th>
							<th>파일첨부</th>
							<th>글제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="of_board" items="${noticelist }">
							<tr>
								<td>
									<c:out value="${of_board.obId }" />
								</td>
								<td>
									<c:out value="${of_board.obFilePath }" />
								</td>
								<!-- 중요한 공지 연필 모양 표시 -->	
								<td>
									<a href="/notice/noticedetail?obId=${of_board.obId}">
										<c:out value="${of_board.obTitle}" />
										<c:if test="${of_board.obFixedCheck == 'Y' }">
											<img src="//t1.daumcdn.net/editor/deco/contents/emoticon/things_14.gif?v=2" border="0" class="txc-emo">
										</c:if>
									</a>
								</td>
								<td>
									<fmt:formatDate var="setObDate" value="${of_board.obDate }" pattern="yyyy-MM-dd" />${setObDate }
								</td>
								<td>
									<c:out value="${of_board.obView }" />
								</td>
							</tr>
						</c:forEach>
	                	
	                </table>
	
	            </div>

				<!-- <div class="menu">
					<a href="/notice/noticelist"> <input type="button"
						class="btn btn-primary pull-right"
						style="margin-left: 145px; margin-top: 30px; width: 30%; position: absolute; height: 45px; font-size: 150%;"
						value="전체 공지사항"></a> <a href="*"> <input type="button"
						class="btn btn-primary pull-right"
						style="margin-left: 650px; margin-top: 30px; width: 40%; height: 45px; font-size: 150%;"
						value="부서 공지사항"></a>
				</div> -->

			</div>
		</div>
	</div>
</body>
</html>