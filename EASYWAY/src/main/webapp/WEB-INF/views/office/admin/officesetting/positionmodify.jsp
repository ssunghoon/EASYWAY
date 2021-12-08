<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
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
<link href="/resources/css/office/position_setting.css" rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<script src="/resources/js/menu.js"></script>

</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
	<jsp:include page="../../../public/sidebar.jsp" />

	<div class="page-divider">
		<div class="sidebar-background"></div>

		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
		<div class="easyway-wrapper">

			<div class="easyway-container">
				<div class="tab-header">
					<div class="tab-label">
						<a href="/office/admin/officesetting/vacationsetting">휴가 설정</a>
					</div>
					<div class="tab-label-choice">
						<a href="/office/admin/officesetting/positionlist">직위 설정</a>
					</div>
					<div class="tab-label">
						<a href="/office/admin/officesetting/departmentsetting">부서 설정</a>
					</div>
				</div>

				<div class="setting-title">
					<div class="easyway-title1">직위 설정</div>
				</div>

				<button class="easyway-btn">저장</button>

				<div class="position-setting-table ">
					<div class="position-level-item">
						<!-- 8번째 easyway-board-item : 게시판 목록 (테이블 태그) 들어갈 자리 -->
						<!-- 임의의 5열 x 15줄 태그 (th포함하면 16줄) -->
							<table class="position-list">
								<tr>
									<th>등급</th>
									<th>직위명</th>
								</tr>
								<c:forEach var="position" items="${positionInfos}">
									<tr>
										<td>${position.positionLevel}등급</td>
										<td class="position-box">
										<input type="hidden" name="positionId" value="${position.positionId}">
										<input type="hidden" name="officeId" value="${sessionScope.nowOfficeInfo.officeId}">										
										<input type="hidden" name="positionLevel" value="${position.positionLevel}">
										<input id="textOnchange" type="text" name="positionName" value="${position.positionName}">
										</td>
									</tr>
								</c:forEach>								
							</table>
							<input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		var positionList = new Array();
		var Listener = function() {
			  alert('Hello!');
			};
		$(document).on("propertychange change keyup paste input","#textOnchange", function() {
			
			window.onbeforeunload = function(e) {
				var dialogText = 'Dialog text here';
				e.returnValue = dialogText;
				return dialogText;
			};	
		});
		
		
		function scanPositionValue() {			
			window.onbeforeunload = null;
			$(".position-box").each(function(idx) {
				
				// 해당 체크박스의 Value 가져오기
				var positionId = $(this).children().eq("0").val();
				var officeId = $(this).children().eq("1").val();
				var positionLevel = $(this).children().eq("2").val();
				var positionName = $(this).children().eq("3").val();

				positionList.push({
					"positionId" : positionId,
					"officeId" : officeId,
					"positionLevel" : positionLevel,
					"positionName" : positionName,
				});
			});
			console.log(positionList);
		}
		function modifiyPosition(positionList) {
			if(confirm("정말 등록하시겠습니까 ?") == true){
		    }
		    else{
		        return;
		    }
		  $.ajax({
		      type: "post",
		      url: "/office/position/modify",
		      data: JSON.stringify(positionList),
		      contentType: "application/json; charset=utf-8",
		      beforeSend: function (xhr) {
		        var $token = $("#token");
		        xhr.setRequestHeader($token.data("token-name"), $token.val());
		      },
		      success: function (result, status, xhr) {
		    	  alert("직위 정보 변경 성공!");
		    	  location.href="/office/admin/officesetting/positionlist";
		      },
		      error: function (xhr, status, er) {
		        alert("실패....");
		      },
		    });	  	
		}
		$(".easyway-btn").on("click", function(e) {
		scanPositionValue();
		modifiyPosition(positionList);
		});
	});
</script>

</html>