/*실시간 시계*/

const clock = document.querySelector('.work-check-clock');

function getTime(){
    const time = new Date();
    const hour = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds();
    clock.innerHTML = `${hour<10 ? `0${hour}`:hour}:${minutes<10 ? `0${minutes}`:minutes}:${seconds<10 ? `0${seconds}`:seconds}`
}

function init(){
    setInterval(getTime, 1000);
}

init();

$('.select-check').on('click', function(){
	
	var selected = $(this).children().last().text();
	console.log(selected);
	
	switch (selected) {
	case "출근하기":
		console.log("일단 여기는 왔고");
		location.href="/attendance/registerAttendanceStart";
		
		break;
	case "외근하기":
		console.log("일단 여기는 왔고");
		location.href="/attendance/registerAttendanceOut";
		
		break;
	case "퇴근하기":
		console.log("일단 여기는 왔고");
		location.href="/attendance/registerAttendanceEnd";
	break;

	default:
		break;
	}
	
});
