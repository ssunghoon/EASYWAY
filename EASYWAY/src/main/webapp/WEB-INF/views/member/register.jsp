<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>편하게 오피스 작업을! EasyWay!</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background-color: #f5f5f5;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#email-check {
	display: flex;
	flex-wrap: wrap;
}

.item:nth-child(1) {
	flex: 4 1 0;
	margin-right: 10px;
}

.item:nth-child(2) {
	background-color: #666;
	color: #fff;
	flex: 1 1 0;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>

				<form class="validation-form" novalidate action="/member/register"
					method="post" accept-charset="utf-8">
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="memberName" placeholder=""
							value="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label>
						<div id="email-check">
							<input type="email" class="form-control item" id="email"
								name="memberEmail" placeholder="you@example.com" required>
							<input type="button" class="btn item" id="check-email"
								value="중복확인" />
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" name="memberPassword" id="password" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="passwordCheck">비밀번호 확인</label> <input type="password"
							class="form-control" name="member_pw_check" id="passwordCheck"
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="passwordCheck">휴대전화 번호</label> <input type="text"
							class="form-control" name="memberPhone" id="phone-number"
							required>
						<div class="invalid-feedback">전화번호를 입력해 주세요.</div>
					</div>

					<div class="mb-3">
						<label for="adminCheck">관리자 계정 선택</label> <input type="checkbox"
							style="margin-left: 10px; width: 15px; height: 15px"
							name="memberAuth" id="admin-check" value="ROLE_ADMIN">
					</div>
					<hr class="mb-4">

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>

					<input type="hidden" id="token" name="${_csrf.parameterName}"
						data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	window.addEventListener('load', () => {
		const forms = document.getElementsByClassName('validation-form');
		Array.prototype.filter.call(forms, (form) => {
				form.addEventListener('submit', function (event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}

					form.classList.add('was-validated');
				}, false);
			});
		}, false);
</script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/member/member.js"></script>

</html>