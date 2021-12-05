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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	el="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">

<!-- EASYWAY CSS, JS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/sidebars.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/common_boardlist.css" rel="stylesheet">
<script src="/resources/js/menu.js"></script>

</head>
<style>
.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
/* 	border: solid 1px black; /* 테두리를 설정 */ */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 93px;
} /* 높이를 93px로 설정 */
.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px; /* 넓이는 190px로 설정 */
}
</style>
<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../public/sidebar.jsp" />

	<div class="page-divider">
		<div class="sidebar-background"></div>


		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		<div class="easyway-wrapper">

			<div class="easyway-container">

				<div class="easyway-board-item">
					<!-- 1번째 easyway-board-item : 게시판 이름 들어갈 자리 -->

					<ul>
						<li class="topMenuLi">
							<div class="easyway-title1">
								<a class="menuLink" href="noticelist"> 전체 공지사항 </a>
							</div>
							<ul class="submenu">
								<li><a href="noticelist" class="submenuLink longLink">전체
										공지사항</a></li>
								<li><a href="noticelist" class="submenuLink longLink">부서
										공지사항</a></li>
							</ul>
						</li>
					</ul>


				</div>
				<div class="easyway-board-item">
					<!-- 2번째 easyway-board-item : 필터 들어갈 자리 1 -->
<!-- 			<div class="menu"> -->
<!-- 					<a href="/notice/noticelist"> <input type="button" -->
<!-- 						class="btn btn-primary pull-right" -->
<!-- 						style="margin-left: 145px; margin-top: 30px; width: 30%; position: absolute; height: 45px; font-size: 150%;" -->
<!-- 						value="전체 공지사항"></a> <a href="*"> <input type="button" -->
<!-- 						class="btn btn-primary pull-right" -->
<!-- 						style="margin-left: 650px; margin-top: 30px; width: 40%; height: 45px; font-size: 150%;" -->
<!-- 						value="부서 공지사항"></a> -->
<!-- 				</div> -->
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
					<!-- 					<a href="/notice/noticeregister"> -->
					<button id="regBtn" type="button" class="easyway-btn">글쓰기</button>
					<!-- 					</a> -->
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
								<td><c:out value="${of_board.obId }" /></td>
								<td><c:out value="${of_board.obFilePath }" /></td>
								<!-- 중요한 공지 연필 모양 표시 -->
								<td><a class="move"
									href='<c:out value="${of_board.obId}"/>'> <c:out
											value="${of_board.obTitle}" /> <c:if
											test="${of_board.obFixedCheck == 'Y' }">
											<img
												src="//t1.daumcdn.net/editor/deco/contents/emoticon/things_14.gif?v=2"
												border="0" class="txc-emo">
										</c:if></a></td>
								<td><fmt:formatDate var="setObDate"
										value="${of_board.obDate }" pattern="yyyy-MM-dd" />${setObDate }
								</td>
								<td><c:out value="${of_board.obView }" /></td>
							</tr>
						</c:forEach>

					</table>

				</div>

				<div class="easyway-board-item">
					<!-- 9번째 easyway-board-item : 페이징 들어갈 자리 -->
					<ul class="pagination pagination-sm">
						<c:if test="${pageMaker.prev}">
							<li class="page-prev"><a class="page-click"
								href="${pageMaker.startPage -1}">Prev</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="page-num  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a class="page-click" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-next"><a class="page-click"
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>


					<form id="actionForm" action="/notice/noticelist" method="get">
						<input type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum}"/>'> <input
							type="hidden" name="amount"
							value='<c:out value="${pageMaker.cri.amount}"/>'>
											<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
											<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
					</form>


					<!-- 임시 Modal  추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">게시판</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">게시글이 등록되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
									<!-- 							<button type="button" class="btn btn-primary">Save changes</button> -->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
				<!--  paging end-->


				<div class="easyway-board-item">
					<!-- 10번째 easyway-board-item : 검색 들어갈 자리 -->
					<form class="search-form" action="/notice/noticelist" method="get">
						<select name="type" class="dropdown-toggle" data-toggle="dropdown">
							<option class="dropdown-menu" value="" 
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>검색 옵션
							</option>
							<option class="dropdown-item" value="TCN" 
							<c:out value="${pageMaker.cri.type eq 'TCN' ? 'selected':''}"/>>전체
							</option>							
							<option class="dropdown-item" value="T" 
							<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목
							</option>
							<option class="dropdown-item" value="C" 
							<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용
							</option>
							<option class="dropdown-item" value="TC" 
							<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목+내용
							</option>
							<option class="dropdown-item" value="N"  
							<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>작성자
							</option>
						</select> 
						<input type='text' class="search-keyword" name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum'
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' /> 
							
							<button class="easyway-btn" value="검색">검색</button>
					</form>

				</div>

				<!-- easyway-board-item end -->


				

				<!-- easyway-container end  -->
			</div>
			<!-- easyway-wrapper end  -->
		</div>
		<!-- page-divider end  -->
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var result = '<c:out value="${result}"/>';

							checkModal(result);

							history.replaceState({}, null, null);

							function checkModal(result) {

								if (result === '' || history.state) {
									return;
								}

								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"성공적으로 게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}

								$("#myModal").modal("show");
							}

							//리스트에서 글쓰기 눌렀을때 글쓰기폼으로 가는 제이쿼리
							$("#regBtn").on("click", function() {

								self.location = "/notice/noticeregister";

							});
							
							//페이지 번호 누르면 해당 페이지로 가는 제이쿼리
							var actionForm = $("#actionForm");

							$(".page-click").on(
									"click",
									function(e) {

										e.preventDefault();

										console.log('click');

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});
							
							//제목 누르면 조회로 가는 제이쿼리(해당 페이지번호를 가지고 간다)
							$(".move")
									.on(
											"click",
											function(e) {

												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='obId' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/notice/noticedetail");
												actionForm.submit();
											});
							
							//검색 조건에 안맞을시 경고창 뜨는 제이쿼리
								var searchForm = $(".search-form");
	
								$(".search-form button").on(
										"click",
										function(e) {
	
											if (!searchForm.find("option:selected")
													.val()) {
												alert("검색종류를 선택하세요");
												return false;
											}
	
											if (!searchForm.find(
													"input[name='keyword']").val()) {
												alert("검색어를 입력해 주세요");
												return false;
											}
	
											searchForm.find("input[name='pageNum']")
													.val("1");
											e.preventDefault();
	
											searchForm.submit();
					
		});
						});
	</script>
</body>
</html>