<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/reset.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/slick/slick-theme.css" />
<style>
body {
	background: #0397ed !important;
	display: grid;
	height: 100vh;
}

.item {
	justify-self: center;
	align-self: center;
	width: 65rem;
}

.main-title {
	display: flex;
	margin-bottom: 60px;
}

.main-title>h1 {
	flex: 9 1 0;
}

.main-title>button {
	flex: 1 1 0;
	align-items: flex-end;
	margin-right: -20px;
	letter-spacing: 1.8px;
}

.card {
	margin-right: 10px;
	height: 149px;
}

.btn {
	background: #0397ed;
	color: white;
}

.card-title {
	font-weight: 600;
	color: #444;
}

.card-text {
	color: #666;
}

.card-body a {
	float: right;
}
</style>

</head>

<body>
	<c:if test="${insertResult != null }">
		<c:choose>
			<c:when test="${insertResult > 0}">
				<script type="text/javascript">
					alert("오피스 등록 성공!");
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					alert("오피스 등록 실패!");
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>
	<div class="item">
		<div class="main-title">
			<h1 style="color: white;">
				<i class="far fa-building"></i> 오 피 스 리 스 트
			</h1>
			<form action="/member/logout" method="post" accept-charset="utf-8">
				<button type="submit" class="btn">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
		<sec:authentication property="principal" var="principal" />
		<sec:authorize access="isAuthenticated()">
			<c:set var="auth" value="ROLE_ADMIN" />
			<c:choose>
				<c:when test="${principal.member.memberAuth == auth}">
					<div class="responsive">
						<c:forEach var="officeCard" items="${ofiiceList}">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">${officeCard.officeName}</h4>
									<p class="card-text">${officeCard.officeName}입니다.</p>
									<a href="/office/main/${officeCard.officeId}" class="btn">입장하기</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#officeCreateModal">
						오피스 생성 <i class="fas fa-plus-circle"></i>
					</button>
				</c:when>
				<c:otherwise>
					<div class="responsive">
						<c:forEach var="officeCard" items="${ofiiceList}">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">${officeCard.officeName}</h4>
									<p class="card-text">${officeCard.officeName}입니다.</p>
									<button id="enter-btn-office-id" type="button" class="btn" data-officeid="${officeCard.officeId}" data-bs-toggle="modal"
										data-bs-target="#officeEnterModal">오피스 입장</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</sec:authorize>

	</div>
	<div class="modal fade" id="officeCreateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">새 오피스 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/office/create" method="post">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">새로 생성할
								오피스 이름:</label> <input type="text" class="form-control"
								name="officeName">
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<input type="submit" class="btn" value="오피스 생성">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="officeEnterModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이메일로 받은 오피스 코드를
						입력해주세요!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="code-div" class="mb-3">
						<label for="recipient-name" class="col-form-label">오피스 고유
							코드:</label> <input type="text" class="form-control" name="officeCode">
					</div>
					<input type="hidden" id="token" name="${_csrf.parameterName}"
						data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<input id="enter-btn" type="button" class="btn" value="입장하기">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
<script src="/resources/js/office/office_carousel.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	var modal = $("#code-div");
	var inputOfficeCode = modal.find("input[name='officeCode']");
	var officeId;
	
	$("#enter-btn").on("click", function (e) {
		console.log(inputOfficeCode.val());
		enterOffice(inputOfficeCode.val());
	});
	
	$(document).on("click", "#enter-btn-office-id", function (e) {
		 officeId = $(this).data("officeid");
		 console.log(officeId);
	  });
	
	function enterOffice(data, error) {
	    console.log("enterOffice...............");

	    $.ajax({
	      type: "post",
	      url: "/office/enter/"+officeId,
	      data: JSON.stringify(data),
	      contentType: "application/json; charset=utf-8",
	      beforeSend: function (xhr) {
	        var $token = $("#token");
	        xhr.setRequestHeader($token.data("token-name"), $token.val());
	      },
	      success: function (result, status, xhr) {
	        console.log(result);
	        location.href="/office/main/"+officeId;
	      },
	      error: function (xhr, status, er) {
	        alert("코드가 일치하지 않습니다....");
	      },
	    });
	  }
	
	
	
	
});
	
</script>
</html>