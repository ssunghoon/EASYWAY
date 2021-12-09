<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script type="text/javascript"src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="description" content="">
<meta name="author"content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
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
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
	
    <!-- EASYWAY CSS, JS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/schedule.css" rel="stylesheet">
    <script src="/resources/js/menu.js"></script>
    
    
    <!-- CALENDAR CSS, JS -->
	<link href="/resources/css/calendarMain.css" rel="stylesheet">
	<script src="/resources/js/calendarMain.js"></script>

<script>

	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek,dayGridDay'
	      },
	      initialDate: '2021-12-22',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: [
	          {
		          title:'go to Google',
		          start:'2021-12-01',
//	 	     	  2020-09-13T07:00:00
 		          url: 'http://google.com/',
		          end: '2021-12-05',
		          color: 'green',
 		          allDay  : true
		     },
	   
			{
				title : 'kosta223기 국비지원교육',
				start : '2021-12-05',
				end : '2021-12-11',
				color : 'red',
				allDay : true
			}, {
				title : '내 생일',
				start : '2021-12-22',
				end : '2021-12-22',
				allDay : true
			}, {
				groupId : 999,
				title : '운동가기',
				start : '2021-12-13T16:00:00'
			}, {
				groupId : 999,
				title : '운동가기',
				start : '2021-12-16T16:00:00'
			}, {
				groupId : 999,
				title : '운동가기',
				start : '2021-12-18T16:00:00'
			}, {
				groupId : 999,
				title : '운동가기',
				start : '2021-12-21T16:00:00'
			}, {
				title : 'Merry christmas',
				start : '2021-12-25',
				end : '2021-12-26',
				color : 'red',
			}, {
				title : '신정',
				start : '2022-01-01',
				color : 'green',
			}, {
				title : '연차',
				start : '2021-12-27',
				end : '2021-12-31',
			},

			]
		});

		calendar.render();
	});

	document.addEventListener('DOMContentLoaded', function() {

		/* initialize the external events
		-----------------------------------------------------------------*/

		var containerEl = document.getElementById('external-events-list');
		new FullCalendar.Draggable(containerEl, {
			itemSelector : '.fc-event',
			eventData : function(eventEl) {
				return {
					title : eventEl.innerText.trim()
				}
			}
		});

		//// the individual way to do it
		// var containerEl = document.getElementById('external-events-list');
		// var eventEls = Array.prototype.slice.call(
		//   containerEl.querySelectorAll('.fc-event')
		// );
		// eventEls.forEach(function(eventEl) {
		//   new FullCalendar.Draggable(eventEl, {
		//     eventData: {
		//       title: eventEl.innerText.trim(),
		//     }
		//   });
		// });

		/* initialize the calendar
		-----------------------------------------------------------------*/

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			editable : true,
			droppable : true, // this allows things to be dropped onto the calendar
			drop : function(arg) {
				// is the "remove after drop" checkbox checked?
				if (document.getElementById('drop-remove').checked) {
					// if so, remove the element from the "Draggable Events" list
					arg.draggedEl.parentNode.removeChild(arg.draggedEl);
				}
			}
		});
		calendar.render();

	});

	Calendar.addEvent()
</script>
	
	
<style>
<!--schedule.css로 옮김 -->

</style>
</head>
<body>

	<!-- sidebar ----------------------------------------------------------------------------- -->
    <jsp:include page="../public/sidebar.jsp" />
    
    <div class= "page-divider">
	<div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 ------------------------------------------------------------------------ -->
	    <div class="easyway-wrapper">

			<h1 class="easyway-title1" height = "10px">
				캘린더
			</h1>
			<!-- Button trigger modal -->				
			<button type="button" class="easyway-btn" data-bs-toggle="modal"
				data-bs-target="#exampleModal">일정추가</button>
			<!--풀캘린더 달력 폼-->
			<div id='calendar-wrap'>
			<div id='calendar'></div>
		
			<!--일정추가버튼  -->
			<div id="modalwrapper">
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							
							<div class="modal-body">
								<!--UI마스터-->
								<form action="/schedule/scheduleregister" method="post">
								<input type="hidden" id="token" name="${_csrf.parameterName}"
                  data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
		                     <!--   accept-charset="utf-8"-->
			                     <div class="mb-3">
			                     	<label>사원번호</label>
	                            	<input type="text" class="form-control" name="employeeId" readonly="readonly"
	                            		value='${sessionScope.nowEmployeeInfo.employeeId}'>
			                        <label>제목</label>
	                            		<input type="text" class="form-control" name="scheduleTitle">
	                        		<label>시작시간</label>
	                            		<input type="date" class="form-control" name="scheduleStart">
	                        		<label>종료시간</label>
	                            		<input type="date" class="form-control" name="scheduleEnd">
	                        		<label>내용</label>
	                            		<input type="text" class="form-control" name="scheduleContent">
								<%--value='<fmt:formatDate pattern="yyyy-MM-dd" value ="${scheduleData.scheduleStart}"/>'> --%>
									<label>중요도 </label>
<!-- 										<form action="/schedule/scheduleregister" method="post"> -->
<%-- 										<input type="hidden" id="token" name="${_csrf.parameterName}" --%>
<%--                   						data-token-name="${_csrf.headerName}" value="${_csrf.token}" /> --%>
<!-- 										<select autofocus name="scheduleImportance"> -->
<!-- 											<option name="scheduleImportance" id="first" value="상">상</option> -->
<!-- 											<option name="scheduleImportance" id="second" value="중">중</option> -->
<!-- 											<option name="scheduleImportance" id="third" value="하">하</option> -->
<!-- 										</select> -->
<!-- 										</form> -->
<!-- 										<br> -->
			                            <input type="radio" name="scheduleImportance" id="first" value="상">&nbsp;<label for="first">상</label>
			                            <input type="radio" name="scheduleImportance" id="second" value="중">&nbsp;<label for="second">중</label>
			                            <input type="radio" name="scheduleImportance" id="third" value="하">&nbsp;<label for="third">하</label>
			                            <br>
			                        <label>공사구분</label>
			                            <input type="text" class="form-control" name="schedulePrivate">
<!-- 			                            <input type="radio" name="schedulePrivate" value="Y">&nbsp;<label for="Y">Y</label> -->
<!-- 			                            <input type="radio" name="schedulePrivate" value="N">&nbsp;<label for="N">N</label> -->
			                     </div>
			                     <div class="modal-footer">
			                        <button id='regBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                        <input type="submit" class="btn btn-primary" value="일정 생성"> 
			                     </div>
		                 		 </form>
							</div>
						</div>
					</div>
				</div><!--일정등록 Modal end-->
			</div><!--일정추가 div end-->
			
			
		<!--일정조회모달창+수정+삭제 저장 버튼 포함 -->
		<div id="modalwrapperdetail">
		<!-- Button trigger modal  -->
		<!--Modal  -->
		<div class="modal fade" id="modal-detail" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">일정 조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
		
					<form role="form" method="post" action="/schedule/schedulemodify">
					<input type="hidden" id="token" name="${_csrf.parameterName}"
                  data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
	                     <div id="scheduleInfo">
	                       <label>일정번호</label>
							<input type="text" class="form-control" name="scheduleId"
								value='scheduleData.scheduleId' readonly="readonly">
	                        <label>사원번호</label>
	                        <input type="text" class="form-control" name="employeeId"
	                        	value='${sessionScope.nowEmployeeInfo.employeeId}' readonly="readonly">
	                        <label>제목:</label>
	                        <input type="text" class="form-control" name="scheduleTitle"
	                            	value='scheduleData.scheduleTitle'>
	                        <!--기간 형식 바꾸기 value='<fmt:formatDate pattern="yyyy-MM-dd" value ="${scheduleData.scheduleStart}"/>'> -->
	                        <label>시작시간</label>
							 <input id="detail-start" type="text" class="form-control" name="scheduleStart"
							 	value="scheduleData.scheduleStart"/>
	                        <label>종료시간</label>
	                        <input id="detail-end" type="text" class="form-control" name="scheduleEnd"
	                            value="scheduleData.scheduleEnd">
	                            
	                        <label>내용</label>
	                        <input type="text" class="form-control" name="scheduleContent"
	                            value="scheduleData.scheduleContent">
	                       	<label>중요도 </label>
<!-- 	                       	<form> -->
<!-- 								<select autofocus name="scheduleImportance" value ='scheduleData.scheduleImportance' > -->
<!-- 									<option name="scheduleImportance" id="first" value="상">상</option> -->
<!-- 									<option name="scheduleImportance" id="second" value="중">중</option> -->
<!-- 									<option name="scheduleImportance" id="third" value="하">하</option> -->
<!-- 								</select> -->
<!-- 							</form> -->
	                       	<input type="text"class="form-control"  name="scheduleImportance"  
	                            value="scheduleData.scheduleImportance">
	                            
	                        <label>공사구분</label>
	                        <input type="text" class="form-control" name="schedulePrivate"
	                            value="scheduleData.schedulePrivate" placeholder="Y or N">
<!-- 								<input type="radio" name="schedulePrivate" value="Y" id="yes">&nbsp;<label for="yes">Y</label> -->
<!-- 			                    <input type="radio" name="schedulePrivate" value="N" id="no">&nbsp;<label for="no">N</label> -->
	                     </div>
	                     <div class="modal-footer">
	                  	<!-- 책254p에는 버튼형식으로 되어있음 확인해보기 기존 버튼코드는 노션 kosta 최종프로젝트에있음-->
	                    <input type="button" class="schedule-btn schedule-btn-save" value="확인">
						<input type="submit" class="schedule-btn schedule-btn-modify" value="수정"> 
						<input type="submit" class="schedule-btn schedule-btn-delete"
						onclick="javascript: form.action='/schedule/scheduleremove/';"value="삭제">
	                     </div>
<%--                  	data-scheduleId="${schedule.scheduleId}" --%>
                   	</form><!--end modify -->
					</div>
				</div>
			</div>
		</div><!-- end detail -->
		
	</div>
		
			<!-- 일정목록 출력 코드 -->
				<div id="todo-list" class="easyway-title1">
					일정리스트
				</div>
					
				<div class="table-container">
				
					<table class="board-list" style="text-align: center; border: 2px solid #dddddd;">
						<!--style="-->
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">일정번호
							</th>
							<th style="background-color: #eeeeee; text-align: center;">사원번호
							</th>
							<th style="background-color: #eeeeee; text-align: center;">제목
							</th>
							<th style="background-color: #eeeeee; text-align: center;">시작시간
							</th>
							<th style="background-color: #eeeeee; text-align: center;">마감시간
							</th>
							<th style="background-color: #eeeeee; text-align: center;">내용
							</th>
							<th style="background-color: #eeeeee; text-align: center;">중요도
							</th>
							<th style="background-color: #eeeeee; text-align: center;">공사구분
							</th>
						</tr>
						<!-- 추후에 수정할 부분 필요없는 표기들 빼기-->
						<c:forEach var="schedule" items="${list}">
							<tr style="background-color: #11111; text-align: center; border: 1px;">
								<td>${schedule.scheduleId}</td>
								<td>${schedule.employeeId}</td>
								<td><a class="save-btn" class="custom-btn" data-scheduleId="${schedule.scheduleId}"
 								data-bs-toggle="modal" data-bs-target="#modal-detail">
 								${schedule.scheduleTitle}</a></td>
 								<td>${schedule.scheduleStart}</td>
	                            <td>${schedule.scheduleEnd}</td>
<%--  								<p><fmt:parseDate value="${schedule.scheduleStart}" var="schedule" pattern="yyyy-MM-dd"/></p> --%>
<%--  								<p><fmt:parseDate value="${schedule.scheduleEnd}" var="schedule" pattern="yyyy-MM-dd"/></p> --%>
								<!-- Date타입으로변경했을경우 -->
<%-- 							<td><fmt:formatDate pattern="yyyy-MM-dd"value="${schedule.scheduleEnd}"/> </td> --%>
								<td>${schedule.scheduleContent}</td>
								<td>${schedule.scheduleImportance}</td>
								<td>${schedule.schedulePrivate}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
	    </div> <!-- end easyway-wrapper -->
	    
    </div> <!-- end page-divider -->
</body>
<script type="text/javascript">
<!--제목클릭시처리하는부분-->
var scheduleData;
$(document)
	.on(
			"click",".save-btn",
			function(e) {
				var id = $(this).data("scheduleid");
				
				console.log(id);
				 
				$.ajax({
				      type: "get",
				      url: "/schedule/scheduledetail/" +id,
				      /*post 요청시 사용
 				      beforeSend: function (xhr) {
				          var $token = $("#token");
				          xhr.setRequestHeader($token.data("token-name"), $token.val());
				        }, */
				      success: function (result, status, xhr) {
				        console.log(result);
				        console.log(result.scheduleTitle);
				      
				        scheduleData = result;
				      //조회모달창에 넘어가기
				      
						$('input[name=scheduleId]').attr('value',scheduleData.scheduleId);
						$('input[name=employeeId]').attr('value',scheduleData.employeeId);
						$('input[name=scheduleTitle]').attr('value',scheduleData.scheduleTitle);
						
						$('input[name=scheduleStart]').attr('value',(scheduleData.scheduleStart).substr(0,10));
						$('input[name=scheduleEnd]').attr('value',(scheduleData.scheduleEnd).substr(0,10));
// 						Date startdate = sdFormat.parse("2014-12-22");
						$('input[name=scheduleContent]').attr('value',scheduleData.scheduleContent);
						$('input[name=scheduleImportance]').attr('value',scheduleData.scheduleImportance);
						$('input[name=schedulePrivate]').attr('value',scheduleData.schedulePrivate);
				      },
				      error: function (xhr, status, er) {
				        alert("실패!");
				      },
				    });
				});
	
</script>

</html>