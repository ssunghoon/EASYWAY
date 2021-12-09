<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!doctype html>
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
	                    게시판 이름 들어갈 자리
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
	                <button type="button" class="easyway-btn">글쓰기</button>
	            </div>
	            <div class="easyway-board-item">
	                <!-- 8번째 easyway-board-item : 게시판 목록 (테이블 태그) 들어갈 자리 -->
	                <!-- 임의의 5열 x 15줄 태그 (th포함하면 16줄) -->
	                <table class="board-list">
	                    <tr>
	                        <th>No.</th>
	                        <th>작성자</th>
	                        <th>제목</th>
	                        <th>게시일</th>
	                        <th>조회수</th>
	                    </tr>
	                    <tr>
	                        <td>223</td>
	                        <td>전나은</td>
	                        <td><a href="http://www.google.com">다음 주 나오실 분 나오세요</a></td>
	                        <td>2021. 11. 26.</td>
	                        <td>1</td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                </table>
	
	            </div>
	            <div class="easyway-board-item">
	                <!-- 9번째 easyway-board-item : 페이징 들어갈 자리 -->
	                <ul class="pagination pagination-sm">
	                    <!-- 페이징 임시 데이터 -->
	                    <!-- 이전 버튼은 page-prev, 이후 버튼은 page-next, 번호는 page-num 클래스를 넣어주면 됩니다 -->
	                    <li class="page-prev"><a class="page-click" href="#">Prev</a></li>
	                    <li class="page-num"><a class="page-click" href="#">1</a></li>
	                    <li class="page-num page-selected"><a class="page-click" href="#">2</a></li>
	                    <li class="page-num"><a class="page-click" href="#">3</a></li>
	                    <li class="page-num"><a class="page-click" href="#">4</a></li>
	                    <li class="page-num"><a class="page-click" href="#">5</a></li>
	                    <li class="page-next"><a class="page-click" href="#">Next</a></li>
	                  </ul>
	            </div>
	            <div class="easyway-board-item">
	                <!-- 10번째 easyway-board-item : 검색 들어갈 자리 -->
	                <form class="search-form" action="" method="get">
	                	<input type="hidden" id="token" name="${_csrf.parameterName}"
                  		data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
	                    <select name="type" class="dropdown-toggle" data-toggle="dropdown">
	                        <option value="" class="dropdown-menu">검색 옵션</option>
	                            <option value="title" class="dropdown-item">제목</option>
	                            <option value="writer" class="dropdown-item">작성자</option>
	                            <option value="content" class="dropdown-item">내용</option>
	                    </select>
	                    <input type="search" class="search-keyword" name="keyword">
	                    <input type="submit" class="easyway-btn" value="검색">
	                </form>
	                
	            </div>
	
	        </div>
	
	    </div>
    </div>

</body>

</html>