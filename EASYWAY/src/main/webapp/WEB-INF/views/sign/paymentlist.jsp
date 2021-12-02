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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">

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
   <%--  <jsp:include page="../public/sidebar.jsp" /> --%>
    
    <div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
	    <div class="easyway-wrapper">
	
	        <div class="easyway-container">
	        
	        	
	        	<!-- sign-draftlist 전용 -->
				<div class="easyway-board-item">
	                <!-- 1번째 easyway-board-item : 게시판 이름 들어갈 자리 -->
	                <div class="easyway-title1">
						결재함
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
	              
	            </div>
                <div class="easyway-board-item">
					<!-- 8번째 easyway-board-item : 게시판 목록 (테이블 태그) 들어갈 자리 -->
	                <!-- 임의의 5열 x 15줄 태그 (th포함하면 16줄) -->
					<table class="board-list">
						<tr>
							<th>No.</th>
							<th>기안양식</th>
	                        <th>제목</th>
	                        <th>완료여부</th>
	                        <th>작성일자</th>
						</tr>
						<c:forEach var="payment" items="${paymentList }">
							<tr>
							<!-- No. 들어갈 자리 -->
							<td></td>
								<c:set var="sf" value="1" />
								<c:choose>
									<c:when test="${payment.signFormId == sf}">
										<td>기본 기안서</td>
									</c:when>
									<c:when test="${payment.signFormId == '2'}">
										<td>지출 결의서</td>
									</c:when>
									<c:when test="${payment.signFormId == '3'}">
										<td>휴가 신청서</td>
									</c:when>
								</c:choose>
							<td>
							<a class='move'
									href='/sign/getpayment?signId=<c:out value="${payment.signId}&signFormId=${payment.signFormId }&signListId=${paymenet.signListId}"/>'>
								<c:out value="${payment.signTitle }" />
								</a>
							</td>
								<c:set var="ch" value="N" />
								<c:choose>
									<c:when test="${payment.signListCheck == ch}">
										<td id="sign_check">결재전</td>
									</c:when>
									<c:otherwise>
										<td id="sign_check">완료된</td>
									</c:otherwise>
								</c:choose>
							<td>
								<fmt:formatDate value="${payment.signDate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						</c:forEach>
					</table>
         	    </div>
          </div>
        </div>
     </div>
        
</body>
</html>