<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<!--FullCalender CDN  -->
<link href="/resources/css/calendarMain.css" rel="stylesheet">
<script src="/resources/js/calendarMain.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="/resources/js/menu.js"></script>
<script src="/resources/js/sidebars.js"></script>
<script>
//ajax 통신 예제 
/* $.ajax({
	url: '/schedule/schedulemain',
	type: 'GET',
	success: function(res){
		var list = res;
		console.log(list);
		
			var calendarEl = document.getElementById('calendar');
		
		var events = list.map(function(item) {
			return {
				title : item.reservationTitle,
				start : item.reservationDate + "T" + item.reservationTime
			}
		});
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			events : events,
			eventTimeFormat: { // like '14:30:00'
			    hour: '2-digit',
			    minute: '2-digit',
			    hour12: false
			  }
		});
		calendar.render();
	},
}); */

	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek,dayGridDay'
	      },
	      initialDate: '2020-09-12',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: [
	          {
		          title:'test',
		          start:'2020-09-30',
//	 	       2020-09-13T07:00:00
// 		          url: 'http://google.com/',
		          end: '2020-09-30',
// 		          allDay  : true
		        },
	        /* {
	          title: 'All Day Event',
	          start: '2020-09-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2020-09-07',
	          end: '2020-09-10'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-09-09T16:00:00'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-09-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2020-09-11',
	          end: '2020-09-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-09-12T10:30:00',
	          end: '2020-09-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2020-09-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-09-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2020-09-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2020-09-12T20:00:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2020-09-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2020-09-28'
	        }, */
	      ]
	    });

	    calendar.render();
	  });
	  
	  document.addEventListener('DOMContentLoaded', function() {

		    /* initialize the external events
		    -----------------------------------------------------------------*/

		    var containerEl = document.getElementById('external-events-list');
		    new FullCalendar.Draggable(containerEl, {
		      itemSelector: '.fc-event',
		      eventData: function(eventEl) {
		        return {
		          title: eventEl.innerText.trim()
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
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		      },
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		      drop: function(arg) {
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
	  
// 	  function button_click() {
		
// 	}
	</script>
	
	
<style>
body {
	margin-top: 40px;
	margin: 0px;
	padding: 0;
	/*  font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
	position: relative;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

#title { /*캘린더제목수정하기*/
	margin: 0px 0px 50px 0px;
	font-size: 40px;
	text-align: center;
	color: #0D6EFD;
	border-bottom: 1px solid #ccc;
	padding-bottom: 20px;
	padding-top: 20px;
}

p {
	text-align: center;
	color: black;
}

#modalwrapper {
	position: absolute;
	top: 100px;
	right: 50px;
	font-size: 14px;
}
/*-----*/
#external-events {
	position: fixed;
	left: 20px;
	top: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 3px 0;
	cursor: move;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar-wrap {
	margin-left: 300px;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.container {
	margin-top: 50px;
	margin-bottom: 100px;
	padding-bottom: 100px;
}
</style>
<!-- Custom styles for this template -->
<link href="/resources/css/sidebars.css" rel="stylesheet">
</head>
<body>
<%-- 	<jsp:include page="../public/sidebar.jsp" /> --%>

	<p id="title">
		캘린더
	</p>

	<!--일정추가버튼  -->
	<div id="modalwrapper">
		<!-- Button trigger modal -->
		
	<!-- <input type="button"  onclick="button_click('')"  value="버튼1"/> -->
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">일정추가</button>
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

						<!--<form action="scheduleInsertAction.do" method="post">  accept-charset="utf-8" -->
						
						<!--UI마스터-->
						<form action="/schedule/scheduleregister" method="post" >
                     <!--   accept-charset="utf-8"-->
	                     <div class="mb-3">
	                        <label>제목:</label>
	                            <input type="text" class="form-control" name="scheduleTitle">
	                        <label>시작시간</label>
	                            <input type="date" class="form-control" name="scheduleStart">
	                        <label>종료시간</label>
	                            <input type="date" class="form-control" name="scheduleEnd">
	                        <label>내용</label>
	                            <input type="text" class="form-control" name="scheduleContent">
	                        <label>중요도 </label>
	                            <input type="radio" name="scheduleImportance" id="first" value="상">&nbsp;<label for="first">상</label>
	                            <input type="radio" name="scheduleImportance" id="second" value="중">&nbsp;<label for="second">중</label>
	                            <input type="radio" name="scheduleImportance" id="third" value="하">&nbsp;<label for="third">하</label>
	                            <br>
	                        <label>공사구분</label>
	                            <input type="text" class="form-control" name="schedulePrivate">
	                     </div>
	                     <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                        <input type="submit" class="btn btn-primary" value="일정 생성"> 
	                     </div>
                 		 </form>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- <!--일정조회모달창--> 
<!-- 	<div id="modalwrapper"> -->
<!-- 		<!-- Button trigger modal --> 
		
<!-- 	<!-- <input type="button"  onclick="button_click('')"  value="버튼1"/> --> 
<!-- 		<button type="button" class="btn btn-primary" data-bs-toggle="modal" -->
<!-- 			data-bs-target="#exampleModal">일정조회</button> -->
<!-- 		<!-- Modal --> 
<!-- 		<div class="modal fade" id="exampleModal" tabindex="-1" -->
<!-- 			aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 			<div class="modal-dialog"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h5 class="modal-title" id="exampleModalLabel">일정 조회</h5> -->
<!-- 						<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 							aria-label="Close"></button> -->
<!-- 					</div> -->
					
<!-- 					<div class="modal-body"> -->

<!-- 						<form action="scheduleInsertAction.do" method="post">  accept-charset="utf-8" -->
						
<!-- 						UI마스터 -->
<!-- 						<form role=" " action="/schedule/schedulemodify" method="post" > -->
<!--                        accept-charset="utf-8" -->
<!-- 	                     <div class="mb-3"> -->
<!-- 	                       <label>일정번호</label> -->
<!-- 	                            <input type="text" class="form-control" name="scheduleId"  -->
<%-- 	                            			value='<c:out value="${schedule.scheduleId}"/>' readonly="readonly"> --%>
<!-- 	                             <label>직원번호</label> -->
<!-- 	                            <input type="text" class="form-control" name="employeeId"  -->
<%-- 	                            			value='<c:out value="${schedule.employeeId}"/>' readonly="readonly"> --%>
<!-- 	                        <label>제목:</label> -->
<!-- 	                            <input type="text" class="form-control" name="scheduleTitle" -->
<%-- 	                            			value='<c:out value="${schedule.scheduleTitle}"/>' readonly="readonly"> --%>
<!-- 	                        <label>시작시간</label> -->
<!-- 	                            <input type="date" class="form-control" name="scheduleStart" -->
<%-- 	                           				 value='<c:out value="${schedule.scheduleStart}"/>' readonly="readonly"> --%>
<!-- 	                        <label>종료시간</label> -->
<!-- 	                            <input type="date" class="form-control" name="scheduleEnd" -->
<%-- 	                            value='<c:out value="${schedule.scheduleEnd}"/>' readonly="readonly"> --%>
<!-- 	                        <label>내용</label> -->
<!-- 	                            <input type="text" class="form-control" name="scheduleContent" -->
<%-- 	                            value='<c:out value="${schedule.scheduleContent}"/>' readonly="readonly"> --%>
<!-- 	                       <label>중요도 </label> -->
<!-- 	                            <input type="text"class="form-control"  name="scheduleImportance"   -->
<%-- 	                            value='<c:out value="${schedule.scheduleImportance}"/>'readonly="readonly">&nbsp;<label for="first">상</label> --%>
<!-- 	                            <br> -->
<!-- 	                        <label>공사구분</label> -->
<!-- 	                            <input type="text" class="form-control" name="schedulePrivate" -->
<%-- 	                            value='<c:out value="${schedule.scheduleStart}"/>' readonly="readonly"> --%>
<!-- 	                     </div> -->
<!-- 	                     <div class="modal-footer"> -->
<!-- 	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
<!-- 	                        <input type="submit" class="btn btn-primary" value="일정 생성"> -->
<!-- 	                     </div> -->
<!--                  		 </form> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<!-- <div id='wrap'> -->

	<!-- <div id='external-events'>
      <h4>Draggable Events</h4>

      <div id='external-events-list'>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>My Event 1</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>My Event 2</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>My Event 3</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>My Event 4</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>My Event 5</div>
        </div>
      </div>

      <p>
        <input type='checkbox' id='drop-remove' />
        <label for='drop-remove'>체크후 드래그해서 달력에 추가하면 사라집니다</label>
      </p>
    </div> -->

	<!--달력 폼-->
	<div id='calendar-wrap'>
		<div id='calendar'></div>


		<!-- 일정목록 리스트 출력 -->
		<div class="container">
			<div class="row">
				<h3 style="text-align: center; color: #0D6EFD">
					&lt;일정리스트&gt;
				</h3>
				<table style="text-align: center; border: 1px solid #dddddd;">
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

					<c:forEach var="schedule" items="${list}">
						<tr style="background-color: #11111; text-align: center; border: 1px;">
							<td>${schedule.scheduleId}</td>
							<td>${schedule.employeeId}</td>
							<td>${schedule.scheduleTitle}</td>
							<td>${schedule.scheduleStart}</td>
							<td>${schedule.scheduleEnd}</td>
							<td>${schedule.scheduleContent}</td>
							<td>${schedule.scheduleImportance}</td>
							<td>${schedule.schedulePrivate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!--일정추가 모달창-->
	<!-- <div id="modalwrapper">
		Button trigger modal
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">일정추가</button>
		Modal
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

						<form action="scheduleInsertAction.do" method="post">
							  accept-charset="utf-8"
							<div class="mb-3">
								<label>제목:</label> <input type="text" class="form-control"
									name="schedule_title"> <label>시작시간</label> <input
									type="date" class="form-control" name="schedule_start">
								<label>종료시간</label> <input type="date" class="form-control"
									name="schedule_end"> <label>내용시간</label> <input
									type="text" class="form-control" name="schedule_content">
								<label>중요도 </label> <input type="radio"
									name="schedule_importance" id="first" value="상">&nbsp;<label
									for="first">상</label> <input type="radio"
									name="schedule_importance" id="second" value="중">&nbsp;<label
									for="second">중</label> <input type="radio"
									name="schedule_importance" id="third" value="하">&nbsp;<label
									for="third">하</label> <br> <label>공사구분</label> <input
									type="text" class="form-control" name="schedule_private">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<input type="submit" class="btn btn-primary" value="일정 생성">
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div> -->

</body>


</html>