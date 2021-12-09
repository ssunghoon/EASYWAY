
// 제일 중요해서 맨 위로 올림
// ----------------------------------------------------------------------------------------
// 페이지 새로고침 혹은 브라우저 창 닫기 시도시 경고 문구 출력 ----------------------------------
// ----------------------------------------------------------------------------------------

/* 
window.onbeforeunload = function() {

	event.preventDefault();

	// Chrome 등 브라우저를 위한 설저
	event.returnValue = '';
	
	return "";
};	    	

*/


//----------------------------------------------------------------------------------------
// 썸네일을 클릭하면 해당 위젯 만들기 --------------------------------------------------------
//----------------------------------------------------------------------------------------

function widgetFunction(e) {
	
	// 테스트 : 클릭한 썸네일과 썸네일의 클릭 상태 보고
	var selected = e.target.firstChild.nodeValue;
	e.stopPropagation();
	console.log(e.target.parentNode.classList.item(2));
	
	// 썸네일이 아닌 요소를 클릭했을 경우
	if ((selected == '') || (selected == null)) {
		console.log("null이란다");
		return;
	}
	
	// 만들어진 위젯 썸네일을 클릭하면 회수됨. 썸네일이 여러개 생성되지 않도록 함. 
	if (e.target.parentNode.classList.item(1) == "selected") {
		console.log("이게뭘까 : " + selected);
		
		removeWidget(selected);
		
		return;
	}
	

	// 선택한 썸네일에 관한 동작들 ---------------------------------------------------------
	switch (selected) {
	case "실시간 시계":
		
		console.log("시계 : 1초마다 시간 출력");
		makeWidget("clock", 200, 400, setTime);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-clock').classList.replace('unselected', 'selected');
		
		break;
	case "공지사항 목록":

		console.log("공지사항 위젯 만들기");
		makeWidget("notice", 200, 400, makeNoticeWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-notice').classList.replace('unselected', 'selected');

		break;
	case "출퇴근 체크":

		console.log("출퇴근 위젯 만들기");
		makeWidget("attendance", 200, 400, makeAttendanceWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-attendance').classList.replace('unselected', 'selected');

		break;
	case "결재함 건수":

		console.log("결재 위젯 만들기");
		makeWidget("sign", 200, 400, makeSignWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-sign').classList.replace('unselected', 'selected');

		break;
	case "프로젝트 리스트":

		console.log("프로젝트 위젯 만들기");
		makeWidget("project", 200, 400, makeProjectWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-project').classList.replace('unselected', 'selected');

		break;
	case "캘린더 일정":

		console.log("캘린더 위젯 만들기");
		makeWidget("calendar", 200, 400, makeCalendarWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-calendar').classList.replace('unselected', 'selected');

		break;
	default:
		break;
	}

}



// ----------------------------------------------------------------------------------------
// 위젯 공통
// 위젯 동적 태그 생성 및 기능 부여
// ---------------------------------------------------------------------------------------- 

const widgetSelectedContainer = document.getElementById('widget-selected-container');

function makeWidget(widgetId, widgetTop, widgetLeft, func) {
	
	// clock만 inner 클래스명 다르게 줘서 CSS 다르게 먹이기 위함
	if(widgetId == "clock") {
	
		console.log("시계 만들어지나 : " + widgetId + "/" + widgetTop + "/" + widgetLeft + "/" + func );
		
		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget created-widget draggable';
		
		var str = "";
		
		str += '<div class="widgetClockInner"></div>';
		
		widgetTag.innerHTML = str;
		
		widgetSelectedContainer.append(widgetTag);

	}else if(widgetId == "notice" || widgetId == "attendance" || widgetId == "sign" || widgetId == "project" || widgetId == "calendar") {

		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget created-widget draggable';
		
		var str = '';
		
		str += '<div class="widgetInner"></div>';
		
		widgetTag.innerHTML = str;
		
		widgetSelectedContainer.append(widgetTag);
		console.log(widgetTag);

	}else{
		return;
	}
	
	
	// 처음 생성할 때에는 X:200, Y:400 위치로 생성 (시계 250*60 사이즈, 나머지 400*280 사이즈)
	// 저장된 값을 불러올 때는 저장된 변수 값대로 생성
	var $widgetId = '#' + widgetId;
	
	console.log("widgetTop: " +widgetTop + " widgetLeft: " + widgetLeft);
	
	if(widgetId == "clock") {
		if((widgetTop == null || widgetTop == 0) || (widgetLeft == null || widgetLeft == 0)){
			$($widgetId).offset({
				top: 200,
				left: 400
			}).width(250).height(60);
		}else{
			$($widgetId).offset({
				top: widgetTop,
				left: widgetLeft
			}).width(250).height(60);
		}
	}else{
		if((widgetTop == null || widgetTop == 0) || (widgetLeft == null || widgetLeft == 0)){
			$($widgetId).offset({
				top: 200,
				left: 400
			}).width(400).height(280);
		}else{
			$($widgetId).offset({
				top: widgetTop,
				left: widgetLeft
			}).width(400).height(280);
		}
	}
	
	func();
	
	
	// 드래그 가능하게 하는 jQuery 부분
	$('.draggable').draggable({
        stack: ".draggable",
        containment: ".widget-area",
        scroll: false
    });
		
	
}



// ----------------------------------------------------------------------------------------
// 개별 위젯 함수
// ---------------------------------------------------------------------------------------- 
// clock 위젯
// ---------------------------------------------------------------------------------------- 

// 시간을 구해서 innerHTML로 넣는 함수
function getTime(){
	const clock = document.getElementById('clock').firstChild;
	
    const time = new Date();
    const hour = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds();
    clock.innerHTML = `${hour<10 ? `0${hour}`:hour}:${minutes<10 ? `0${minutes}`:minutes}:${seconds<10 ? `0${seconds}`:seconds}`;
}

// 초당 시간 불러오는 함수
function setTime(){
    setInterval(getTime, 1000);
}



// ----------------------------------------------------------------------------------------
// notice 위젯
// ----------------------------------------------------------------------------------------

function makeNoticeWidget(){
	const notice = document.getElementById('notice').firstChild;
	var noticeList = new Array();
	var count = 0;
	
	 $.ajax({
		 type: 'GET',
         url:"/office/widget/noticelist",
         data: {},
	     contentType: "application/json; charset=utf-8",
         beforeSend: function (xhr) {
          	  var $token = $("#token");
          	  xhr.setRequestHeader($token.data("token-name"), $token.val());
            },
         dataType:"json",
         success: function (data) {
        	 
			 var str=``;
			 
				str += `<div class="widget-title">`;
				str += `		공지사항 목록`;
				str += `	</div>`;
				str += `	<div id="notice-content" class="widget-content">`;
				str += `		<table id="notice-table">`;
				str += `			<tr>`;
				str += `				<th>제목</th>`;
				str += `				<th>내용</th>`;
				str += `			</tr>`;
				
				data.forEach((noticeList) => {
					
					if(count <3) {
						
						str += `			<tr>`;
						str += `				<td>${noticeList.obTitle}</td>`;
						str += `				<td>${noticeList.obContent}</td>`;
						str += `			</tr>`;
						
						count++;
				
					}
				});
				
				str += `		</table>`;
				str += `	</div>`;
				
				notice.innerHTML = str;
				
        }
     });
}


// ----------------------------------------------------------------------------------------
// attendance 위젯
// ----------------------------------------------------------------------------------------

function makeAttendanceWidget(){
	const attendance = document.getElementById('attendance').firstChild;
	
	var str=``;
	
	str += `<div class="widget-title">`;
	str += `		출 / 퇴근 체크`;
	str += `	</div>`;
	str += `	<div id="attendance-content" class="widget-content">`;
	str += `		<div id="attendance-start" class="attendance-check">`;
	str += `			<a class="attendance-icons" href="/attendance/registerAttendanceStart">`;
	str += `				<i class="far fa-play-circle"></i>`;
	str += `			</a>`;
	str += `			<div id="attendance-start-time" class="attendance-time">`;
	str += `				`;
	str += `			</div>`;
	str += `		</div>`;
	str += `		<div id="attendance-out" class="attendance-check">`;
	str += `			<a class="attendance-icons" href="/attendance/registerAttendanceOut">`;
	str += `				<i class="far fa-pause-circle"></i>`;
	str += `			</a>`;
	str += `			<div id="attendance-pause-time" class="attendance-time">`;
	str += `				`;
	str += `			</div>`;
	str += `		</div>`;
	str += `		<div id="attendance-end" class="attendance-check">`;
	str += `			<a class="attendance-icons" href="/attendance/registerAttendanceEnd">`;
	str += `				<i class="far fa-stop-circle"></i>`;
	str += `			</a>`;
	str += `			<div id="attendance-end-time" class="attendance-time">`;
	str += `				`;
	str += `			</div>`;
	str += `		</div>`;
	str += `</div>`;
					
		attendance.innerHTML = str;
	
}


// ----------------------------------------------------------------------------------------
// sign 위젯
// ----------------------------------------------------------------------------------------

function makeSignWidget(){
	const sign = document.getElementById('sign').firstChild;
	var signList = new Array();
	var count = 0;
	
	 $.ajax({
		 type: 'GET',
         url:"/office/widget/paymentlist",
         data: {},
	     contentType: "application/json; charset=utf-8",
         beforeSend: function (xhr) {
          	  var $token = $("#token");
          	  xhr.setRequestHeader($token.data("token-name"), $token.val());
            },
         dataType:"json",
         success: function (data) {
        	 
			 var str=``;
			 
			 	str += `<div class="widget-title">`;
				str += `		결재함 건수`;
				str += `	</div>`;
				str += `	<div id="sign-content" class="widget-content">`;
				str += `		<table id="sign-table">`;
				str += `			<tr>`;
				str += `				<th>중요도</th>`;
				str += `				<th>제목</th>`;
				str += `				<th>완료여부</th>`;
				str += `			</tr>`;
				
				data.forEach((signList) => {
					
					if(count <3) {
						
						str += `			<tr>`;
						str += `				<td>${signList.signImportance}</td>`;
						str += `				<td>${signList.signTitle}</td>`;
						str += `				<td>${signList.signListCheck}</td>`;
						str += `			</tr>`;
					
						count++;
				
					}
				});
				
				str += `		</table>`;
				str += `	</div>`;
				
				sign.innerHTML = str;
				
        }
     });
	
}


// ----------------------------------------------------------------------------------------
// project 위젯
// ----------------------------------------------------------------------------------------

function makeProjectWidget(){
	const project = document.getElementById('project').firstChild;
	var projectList = new Array();
	var count = 0;
	
	 $.ajax({
		 type: 'GET',
         url:"/office/widget/projectlist",
         data: {},
	     contentType: "application/json; charset=utf-8",
         beforeSend: function (xhr) {
          	  var $token = $("#token");
          	  xhr.setRequestHeader($token.data("token-name"), $token.val());
            },
         dataType:"json",
         success: function (data) {
        	 
			 var str=``;
			 
				str += `<div class="widget-title">`;
				str += `		프로젝트 리스트`;
				str += `	</div>`;
				str += `	<div id="project-content" class="widget-content">`;
				str += `	<table id="project-table">`;
				str += `		<tr>`;
				str += `			<th>프로젝트명</th>`;
				str += `			<th>시작일</th>`;
				str += `			<th>종료일</th>`;
				str += `		</tr>`;
				
				data.forEach((projectList) => {
					console.log("projects : " + projectList);
					
					if(count <3) {
						
						var projectStartLong = `${projectList.projectStart}`;
						var projectStart = projectStartLong.substr(0, 10);
					
						var projectEndLong = `${projectList.projectEnd}`;
						var projectEnd = projectEndLong.substr(0, 10);
						
						str += `			<tr>`;
						str += `				<td>`;
						str += `					<a href="projectboardlist?projectId=${projectList.projectId }">${projectList.projectName}</a>`;
						str += `				</td>`;
						str += `				<td>` + projectStart + `</td>`;
						str += `				<td>` + projectEnd + `</td>`;
						str += `			</tr>`;
						
						count++;
				
					}
				});
				
				str += `		</table>`;
				str += `	</div>`;
				
				project.innerHTML = str;
				
        }
     });
	
}


// ----------------------------------------------------------------------------------------
// calendar 위젯
// ----------------------------------------------------------------------------------------

function makeCalendarWidget(){
	const calendar = document.getElementById('calendar').firstChild;
	var todoList = new Array();
	var count = 0;
	
	 $.ajax({
		 type: 'GET',
         url:"/office/widget/schedulemain",
         data: {},
	     contentType: "application/json; charset=utf-8",
         beforeSend: function (xhr) {
          	  var $token = $("#token");
          	  xhr.setRequestHeader($token.data("token-name"), $token.val());
            },
         dataType:"json",
         success: function (data) {
        	 
			 var str=``;
			 
				str += `<div class="widget-title">`;
				str += `		캘린더 일정`;
				str += `	</div>`;
				str += `	<div id="calendar-content" class="widget-content">`;
				str += `		<table id="calendar-table">`;
				str += `			<tr>`;
				str += `				<th>제목</th>`;
				str += `				<th>시작시간</th>`;
				str += `				<th>마감시간</th>`;
				str += `			</tr>`;
				
				data.forEach((todoList) => {
					console.log("todoList : " + todoList);
					
					if(count <3) {
						
						var todoStartLong = `${todoList.scheduleStart}`;
						var todoStart = todoStartLong.substr(0, 10);
					
						var todoEndLong = `${todoList.scheduleEnd}`;
						var todoEnd = todoEndLong.substr(0, 10);
						
						str += `			<tr>`;
						str += `				<td>${todoList.scheduleTitle}</td>`;
						str += `				<td>` + todoStart + `</td>`;
						str += `				<td>` + todoEnd + `</td>`;
						str += `			</tr>`;
						
						count++;
				
					}
				});
				
				str += `		</table>`;
				str += `	</div>`;
				
				calendar.innerHTML = str;
				
        }
     });
	
}



//----------------------------------------------------------------------------------------
// DB에서 기본으로 설정된 위젯 커스텀 불러오기 ----------------------------------------------
//----------------------------------------------------------------------------------------

// 컨트롤러에서 객체 리스트를 main.jsp로 받아와 이곳에서 분할 작업
window.onload = function(){

	// 배열 분할 작업
	var widgetInfo = new Array();
	var nameIdx;
	var nameIdxCount = 0;
	var valTop;
	var valLeft;
	
	if(widgetArr == null || widgetArr == []){
		return;
	}
	
	$(widgetArr).each(function(index, item) {
		console.log("불러온 위젯 정보" + item);

			// 위젯명 뽑기
			if(index % 5 == 0) { // 0, 5, 10, 15, 20, 25
				nameIdx = parseInt(item); // 1, 2, 3, 4, 5, 6
			}
			// 위젯 Y축 위치 뽑기
			if(index % 5 == 1) {
				valTop = parseInt(item);
			}
			// 위젯 X축 위치 뽑기
			if(index % 5 == 2) {
				valLeft = parseInt(item);
				nameIdxCount++;
			}
			// 한 바퀴 돌때마다 위젯 만들기 실행
			if(nameIdxCount > 0){
				nameIdxCount--;
				widgetSwitch(nameIdx, valTop, valLeft);
			}
	});
	
}

// 분할 작업을 토대로 저장했던 위젯 세팅 불러오기
function widgetSwitch(valName, valTop, valLeft){
	switch (valName) {
	case 1:
		
		console.log("우왕시계당");
		makeWidget("clock", valTop, valLeft, setTime);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-clock').classList.replace('unselected', 'selected');
		
		break;
	case 2:

		console.log("공지사항 다혜꺼");
		makeWidget("notice", valTop, valLeft, makeNoticeWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-notice').classList.replace('unselected', 'selected');

		break;
	case 3:

		console.log("출퇴근 언제하냐");
		makeWidget("attendance", valTop, valLeft, makeAttendanceWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-attendance').classList.replace('unselected', 'selected');

		break;
	case 4:

		console.log("결재차려 김나현!");
		makeWidget("sign", valTop, valLeft, makeSignWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-sign').classList.replace('unselected', 'selected');

		break;
	case 5:

		console.log("프로젝트는 성훈이꺼");
		makeWidget("project", valTop, valLeft, makeProjectWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-project').classList.replace('unselected', 'selected');

		break;
	case 6:

		console.log("캘린더는 경안이꺼");
		makeWidget("calendar", valTop, valLeft, makeCalendarWidget);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-calendar').classList.replace('unselected', 'selected');

		break;
	default:
		break;
	}
}



// ----------------------------------------------------------------------------------------
// 위젯 위치 저장하기 -----------------------------------------------------------------------
// ----------------------------------------------------------------------------------------

// 저장버튼과 저장할 위젯 변수들
var saveBtn = document.getElementById("save-btn");
var createdWidget = "";

// 위치 및 너비, 높이를 저장하는 함수
$('.custom-save').on('click', function(){
	
	// 저장버튼 태그의 "커스텀 1" 중 1만 숫자로 가져오기
	var str = $(this).children().first().text();
	var customNumber = parseInt(str.substr(str.length-1, 1));
	
	saveOffset(customNumber);
	alert("저장이 완료되었습니다.");
	$('.custom-save').modal('hide');
	
})//end click custom-save


function saveOffset(customNumber){
	
	// 위치 및 너비, 높이를 담는 변수들
	var positionTop = 0;
	var positionLeft = 0;
	var positionWidth = 0;
	var positionHeight = 0;
	
	var positionArr = new Array();
	
	createdWidget = document.getElementsByClassName("created-widget");
	
	for(var i = 0; i < createdWidget.length; i++){

		var positionTop = createdWidget[i].offsetTop;
		var positionLeft = createdWidget[i].offsetLeft;
		var positionWidth = createdWidget[i].offsetWidth;
		var positionHeight = createdWidget[i].offsetHeight;
		
		var data = new Object();
		var widgetName;
        
		// 위젯명 숫자로 매칭시켜주는 switch
		
		switch (createdWidget[i].getAttribute('id')) {
		case "clock":
			widgetName = "1";
			break;
		case "notice":
			widgetName = "2";
			break;
		case "attendance":
			widgetName = "3";
			break;
		case "sign":
			widgetName = "4";
			break;
		case "project":
			widgetName = "5";
			break;
		case "calendar":
			widgetName = "6";
			break;

		default:
			break;
		}
		
		data.widgetName = widgetName + "";
        data.widgetPositionX = positionTop + "";
        data.widgetPositionY = positionLeft + "";
        data.widgetWidth = positionWidth + "";
        data.widgetHeight = positionHeight + "";
         
        positionArr.push(data);
        
	} // end for

	console.log(positionArr);
	
	// 다중 데이터 ajax로 전달하기
	var formData = new FormData();
	var data = {
			"customNumber": customNumber
	};
	
	// data 1 : 클릭한 커스텀 저장 번호
	formData.append(
		"customNumber", 
		new Blob([JSON.stringify(data)], { type: 'application/json' })
	);
	// data 2 : 위젯 정보들
	formData.append(
		"WidgetVO",
		new Blob([JSON.stringify(positionArr)], { type: 'application/json' })
	);
	
	console.log(formData);
	
	// ajax를 통한 위치 및 너비, 높이 데이터 저장
	$.ajax({
		  type: 'POST',
		  url: '/office/saveOffset',
		  data: formData,
		  contentType: false,
		  processData: false,
          beforeSend: function (xhr) {
        	  var $token = $("#token");
        	  xhr.setRequestHeader($token.data("token-name"), $token.val());
          },
		  success: function(result){
			 console.log("위젯 저장 성공");
		  },
		  error: function(err){
			 console.log(err);
		  }
	  }); //end ajax
		
} //end saveOffset()


//----------------------------------------------------------------------------------------
//위젯 불러오기 ---------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

$('.custom-default-save').on('click', function(){
	
	if (confirm("저장된 위젯을 불러오시겠습니까?")) {
		var str = $(this).children().first().text();
		var customNumber = parseInt(str.substr(str.length-1, 1));
		customNow = customNumber;
		
		modifyDefault(customNumber);
		
		$('.custom-default-save').modal('hide');
	}
	
})//end click custom-default-save

function modifyDefault(customNumber){
	
	var data;
	
	// ajax를 통한 위치 및 너비, 높이 데이터 저장
	$.ajax({
		  type: 'POST',
		  url: '/office/modifyDefault',
		  data: JSON.stringify(data = {
					"customNumber": customNumber
			}),
		  dataType: 'json',
          contentType: 'application/json; charset=utf-8',
          beforeSend: function (xhr) {
        	  var $token = $("#token");
        	  xhr.setRequestHeader($token.data("token-name"), $token.val());
          },
          success: function(result){
 			 console.log("위젯 기본값 변경 성공");
 		  },
 		  error: function(err){
 			 console.log(err);
 		  }
	  }); //end ajax
	
}

//----------------------------------------------------------------------------------------
//위젯 삭제하기 ---------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

function removeWidget(selected) {
	
	var widgetName;
	
	switch (selected) {
	case "실시간 시계":
		
		var widget = document.getElementById('clock');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-clock').classList.replace('selected', 'unselected');
		
		break;
	case "공지사항 목록":

		var widget = document.getElementById('notice');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-notice').classList.replace('selected', 'unselected');

		break;
	case "출퇴근 체크":

		var widget = document.getElementById('attendance');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-attendance').classList.replace('selected', 'unselected');

		break;
	case "결재함 건수":

		var widget = document.getElementById('sign');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-sign').classList.replace('selected', 'unselected');

		break;
	case "프로젝트 리스트":

		var widget = document.getElementById('project');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-project').classList.replace('selected', 'unselected');

		break;
	case "캘린더 일정":

		var widget = document.getElementById('calendar');
		widget.remove();
		// Class 변경 : selected -> unselected
		document.getElementById('thumb-calendar').classList.replace('selected', 'unselected');

		break;
	default:
		break;
	}
	console.log(customNow);
	
}

