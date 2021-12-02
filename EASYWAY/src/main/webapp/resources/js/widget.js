
// 제일 중요해서 맨 위로 올림
// ----------------------------------------------------------------------------------------
// 페이지 새로고침 혹은 브라우저 창 닫기 시도시 경고 문구 출력 ----------------------------------
// ----------------------------------------------------------------------------------------



window.onbeforeunload = function() {

	event.preventDefault();

	// Chrome 등 브라우저를 위한 설저
	event.returnValue = '';
	
	return "";
};	    	




//----------------------------------------------------------------------------------------
// 썸네일을 클릭하면 해당 위젯 만들기 --------------------------------------------------------
//----------------------------------------------------------------------------------------

function widgetFunction(e) {
	
	// 테스트 : 썸네일 클릭하면 콘솔 창으로 뭔지 알랴줌 
	var selected = e.target.firstChild.nodeValue;
	e.stopPropagation();
	console.log(typeof selected);
	console.log(e.target);
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
		makeWidget("clock", setTime);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-clock').classList.replace('unselected', 'selected');
		
		break;
	case "공지사항 목록":

		console.log("공지사항 다혜꺼");
		makeWidget("notice", getTest2);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-notice').classList.replace('unselected', 'selected');

		break;
	case "출퇴근 체크":

		console.log("출퇴근 언제하냐");
		makeWidget("attendance", getTest3);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-attendance').classList.replace('unselected', 'selected');

		break;
	case "결재함 목록":

		console.log("결재차려 김나현!");
		makeWidget("sign", getTest4);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-sign').classList.replace('unselected', 'selected');

		break;
	case "프로젝트 리스트":

		console.log("프로젝트는 성훈이꺼");
		makeWidget("project", getTest5);
		
		// Class 변경 : unselected -> selected
		document.getElementById('thumb-project').classList.replace('unselected', 'selected');

		break;
	case "캘린더 일정":

		console.log("캘린더는 경안이꺼");
		makeWidget("calendar", getTest6);
		
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

function makeWidget(widgetId, func) {
	
	// clock만 inner 클래스명 다르게 줘서 CSS 다르게 먹이기 위함
	if(widgetId == "clock") {
	
		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget draggable';
		widgetTag.innerHTML = '<div class="widgetClockInner"></div>';
		
		widgetSelectedContainer.append(widgetTag);

	} else {

		let widgetTag = document.createElement('div');
		widgetTag.id = widgetId;
		widgetTag.className = 'widget created-widget draggable';
		widgetTag.innerHTML = '<div class="widgetInner"></div>';
		
		widgetSelectedContainer.append(widgetTag);

	}
	
	var $widgetId = '#' + widgetId;
	
	$($widgetId).offset({
		top: 200,
		left: 400
	}).width(250).height(150);
	
	func();
	
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
// 썸네일 위치 저장하기 ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------------

// 일단 불러나와보자

	//var target = document.getElementById("save-btn");
	//var targetTop = target.getBoundingClientRect().top;
	//var abTop = window.pageYOffset + target.getBoundingClientRect().top;
	

	// 위치값 저장하는 함수
	function saveOffset(){
		
		document.getElementById('save-btn').onclick = function () {
			var saveBtn = document.getElementById("save-btn");
			cosole.log(saveBtn.offsetTop);
		};
		
	//	cosole.log(saveBtn.offsetTop);
		
	}
	
	//document.getElementById("save-btn").addEventListener('click', saveOffset);
	
	
	
	/*
	//pTag.offsetTop;
	//pTag.offsetHeight;
	//pTag.offsetLeft;
	pTag.style.top = 500;
    pTag.style.left = 400;
    
	
	$('.save-btn').on('click', function(e){
		
		alert("클릭했네?");
		
		e.preventDefault();
		
		var createdWidget = $(".created-widget");
		var positionTop;
		var positionLeft;
		

		for(var i = 0; i < createdWidget.length; i++){

			var positionTop = createdWidget[i].offset().top;
			var positionLeft = createdWidget[i].offset().left;

			alert(positionTop);
			//alert(createdWidget[i].firstChild.nodeType);
			
			
			//alert("positionTop : " + positionTop + "positionLeft : " + positionLeft);
			
		}
		
	});
	*/


