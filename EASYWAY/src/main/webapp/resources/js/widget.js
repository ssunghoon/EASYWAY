
// 제일 중요해서 맨 위로 올림
// ----------------------------------------------------------------------------------------
// 페이지 새로고침 혹은 브라우저 창 닫기 시도시 경고 문구 출력 ----------------------------------
// ----------------------------------------------------------------------------------------

/* 주의! 귀찮아서 주석!!!!

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
	
	// 테스트 : 썸네일 클릭하면 콘솔 창으로 뭔지 알랴줌 
	var selected = e.target.firstChild.nodeValue;
	e.stopPropagation();
	console.log(e.target.parentNode.classList.item(2));
	
	// 선택한 값이 null이면 빠이
	if ((selected == '') || (selected == null)) {
		console.log("null이란다");
		return;
	}
	
	// 한 번 생성된 위젯은 삭제하기 전까지는 다시 생성할 수 없음
	if (e.target.parentNode.classList.item(2) == "selected") {
		console.log("이미 선택된 위젯입니다.");
		return;
	}
	

	// 선택한 썸네일에 관한 동작들 ---------------------------------------------------------
	switch (selected) {
	case "실시간 시계":
		
		console.log("우왕시계당");
		makeWidget("clock", 200, 400, setTime);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-clock').classList.replace('unselected', 'selected');
		
		break;
	case "공지사항 목록":

		console.log("공지사항 다혜꺼");
		makeWidget("notice", 200, 400, getTest2);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-notice').classList.replace('unselected', 'selected');

		break;
	case "출퇴근 체크":

		console.log("출퇴근 언제하냐");
		makeWidget("attendance", 200, 400, getTest3);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-attendance').classList.replace('unselected', 'selected');

		break;
	case "결재함 목록":

		console.log("결재차려 김나현!");
		makeWidget("sign", 200, 400, getTest4);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-sign').classList.replace('unselected', 'selected');

		break;
	case "프로젝트 리스트":

		console.log("프로젝트는 성훈이꺼");
		makeWidget("project", 200, 400, getTest5);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-project').classList.replace('unselected', 'selected');

		break;
	case "캘린더 일정":

		console.log("캘린더는 경안이꺼");
		makeWidget("calendar", 200, 400, getTest6);
		
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
	
		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget created-widget draggable';
		widgetTag.innerHTML = '<div class="widgetClockInner"></div>';
		
		widgetSelectedContainer.append(widgetTag);

	} else {

		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget created-widget draggable';
		widgetTag.innerHTML = '<div class="widgetInner"></div>';
		
		widgetSelectedContainer.append(widgetTag);

	}
	
	
	// 주의! 우선 테스트로 넣어둔 위치값과 너비, 높이 부분임. js로 변경도 하고 싶음.
	var $widgetId = '#' + widgetId;
	
	console.log("widgetTop: " +widgetTop + "widgetLeft: " + widgetLeft);
	
	if((widgetTop == null || widgetTop == 0) || (widgetLeft == null || widgetLeft == 0)){
		$($widgetId).offset({
			top: 200,
			left: 400
		}).width(250).height(150);
	}
	
	$($widgetId).offset({
		top: widgetTop,
		left: widgetLeft
	}).width(250).height(150);
	
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

function getTest2(){
	const notice = document.getElementById('notice').firstChild;
	
	notice.innerHTML = '여기 들어갈 공지사항 리스트는 <br> 다혜가 예쁘게 만들어주겠지? ^^';
}


// ----------------------------------------------------------------------------------------
// attendance 위젯
// ----------------------------------------------------------------------------------------

function getTest3(){
	const attendance = document.getElementById('attendance').firstChild;
	
	attendance.innerHTML = '출퉤퉤퉤퉤퉤퉤퉤퉤근 <br> 퉤퉤퉤퉤퉤레루레뤠퉤루테ㅜ렡ㄹ';
}


// ----------------------------------------------------------------------------------------
// sign 위젯
// ----------------------------------------------------------------------------------------

function getTest4(){
	const sign = document.getElementById('sign').firstChild;
	
	sign.innerHTML = '결재차려 김나현!!!!!!!';
}


// ----------------------------------------------------------------------------------------
// project 위젯
// ----------------------------------------------------------------------------------------

function getTest5(){
	const project = document.getElementById('project').firstChild;
	
	project.innerHTML = 'js의 신 이성훈님이 예약하신 자리입니다.';
}


// ----------------------------------------------------------------------------------------
// calendar 위젯
// ----------------------------------------------------------------------------------------

function getTest6(){
	const calendar = document.getElementById('calendar').firstChild;
	
	calendar.innerHTML = '아 캘린더 생각만 해도 빡쳐';
}





// ----------------------------------------------------------------------------------------
// 위젯 위치 저장하기 -----------------------------------------------------------------------
// ----------------------------------------------------------------------------------------

// 저장버튼과 저장할 위젯 변수들
var saveBtn = document.getElementById("save-btn");
var createdWidget = document.getElementsByClassName("created-widget");

// 위치 및 너비, 높이를 담는 변수들
var positionTop;
var positionLeft;
var positionWidth;
var positionHeight;

// 위치 및 너비, 높이를 저장하는 함수
$('.custom-save').on('click', function(){
	
	// 저장버튼 태그의 "커스텀 1" 중 1만 숫자로 가져오기
	var str = $(this).children().first().text();
	var customNumber = parseInt(str.substr(str.length-1, 1));
	alert(customNumber);
	
	saveOffset(customNumber);
	
})//end click custom-save


function saveOffset(customNumber){
	
	var positionArr = new Array();
	
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
//위젯 위치 불러오기 -----------------------------------------------------------------------
//----------------------------------------------------------------------------------------

$('.custom-import').on('click', function(){
	
	// 저장버튼 태그의 "커스텀 1" 중 1만 숫자로 가져오기
	var str = $(this).children().first().text();
	var customNumber = parseInt(str.substr(str.length-1, 1));
	alert(customNumber);
	
	importOffset(customNumber);
	
})//end click custom-import

function importOffset(customNumber){
	
	var data = {
			"customNumber": customNumber
	};
	
	var jsonData = JSON.stringify(data);
	
	// ajax를 통한 위치 및 너비, 높이 데이터 저장
	$.ajax({
		  type: 'POST',
		  url: '/office/importOffset',
		  data: jsonData,
		  dataType: 'json',
          contentType: 'application/json; charset=utf-8',
          beforeSend: function (xhr) {
        	  var $token = $("#token");
        	  xhr.setRequestHeader($token.data("token-name"), $token.val());
          },
		  success: successHandler
	  }); //end ajax
	
	function successHandler(data) {
		
		var parseData = JSON.parse(data)
		
		$(parseData).each(function(index, item) {
			console.log("짜잔이게뭘까" + item);
		});
		
	}
	
}

//----------------------------------------------------------------------------------------
//위젯 처음화면 열 때 기본값으로 불러오기 ----------------------------------------------------
//----------------------------------------------------------------------------------------

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

			if(index % 5 == 0) { // 0, 5, 10, 15, 20, 25
				nameIdx = item; // 1, 2, 3, 4, 5, 6
				console.log("nameIdx: " + nameIdx);
			}
			
			if(index % 5 == 1) {
				valTop = item;
				console.log("valTop: " + valTop);
			}
			
			if(index % 5 == 2) {
				valLeft = item;
				nameIdxCount++;
				console.log("valLeft: " + valLeft);
			}
			
			
			if(nameIdxCount > 0){
				nameIdxCount--;
				console.log("왜이러지 : " + nameIdxCount);
				widgetSwitch(nameIdx, valTop, valLeft);
			}
	});
	
}


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
		makeWidget("notice", valTop, valLeft, getTest2);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-notice').classList.replace('unselected', 'selected');

		break;
	case 3:

		console.log("출퇴근 언제하냐");
		makeWidget("attendance", valTop, valLeft, getTest3);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-attendance').classList.replace('unselected', 'selected');

		break;
	case 4:

		console.log("결재차려 김나현!");
		makeWidget("sign", valTop, valLeft, getTest4);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-sign').classList.replace('unselected', 'selected');

		break;
	case 5:

		console.log("프로젝트는 성훈이꺼");
		makeWidget("project", valTop, valLeft, getTest5);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-project').classList.replace('unselected', 'selected');

		break;
	case 6:

		console.log("캘린더는 경안이꺼");
		makeWidget("calendar", valTop, valLeft, getTest6);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-calendar').classList.replace('unselected', 'selected');

		break;
	default:
		break;
	}
}

