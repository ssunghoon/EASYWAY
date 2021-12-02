<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>

<!-- 	<script type="text/javascript"> -->
<!-- 	$(document).ready(function () { -->
<!-- 		var formObj = $("form"); -->

<!-- 		$('button').on("click", function (e) { -->
<!-- 		e.preventDefault(); -->
<!-- 		var operation = $(this).date("oper"); -->
<!-- 			if(operation === 'remove'){ -->
<!--			confirm("삭제"); -->
<!-- 				document.formObj.action = "/notice/noticeremove"; -->
<!-- 				document.formObj.method = "P"; -->
<!-- 			} -->
<!-- 			}); -->
<!-- 		}); -->
<!-- 	</script> -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

		<div class="row" style="margin-left: 300px;">

			<div style="margin-top: 50px;">
				<form action="/notice/noticeremove" method="post">

					<label>글번호</label> <input class="form-control" name='obId'
						value='<c:out value="${of_board.obId }"/>' readonly="readonly">



					<label>제목</label> <input class="form-control" name='obTitle'
						value='<c:out value="${of_board.obTitle}"/>' readonly="readonly">



					<label>내용</label>
					<textarea class="form-control" rows="3" name='obContent'
						readonly="readonly"><c:out
							value="${of_board.obContent}" /></textarea>



					<label>작성날짜</label>
					<p>
						<fmt:formatDate var="setObDate" value="${of_board.obDate }"
							pattern="yyyy-MM-dd" />${setObDate }
					<p>
						<!-- 				<input class="form-control" name='obDate' -->
						<%-- 					value='<c:out value="${of_board.obDate }"/>' readonly="readonly"> --%>

						<!--수정페이지로 이동 버튼 -->
						<a href="/notice/noticemodify?obId=${of_board.obId }"> <input
							type="button" value="수정" class="btn btn-default"></a>
						<!-- form태그에서 경로 넣고포스트로 삭제 실행하고 리스트로 돌아감(컨트롤러) -->
						<input type="submit" value="삭제" class="btn btn-default">
						<!-- 리스트로 이동 -->
						<a href="/notice/noticelist"> <input type="button"
							value="목록으로 돌아가기" class="btn btn-info"></a>
				</form>
			</div>
		</div>
	</div>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/menu.js"></script>
<script src="/resources/js/sidebars.js"></script>
</html>