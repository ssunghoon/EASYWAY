$(document).ready(function () {
	

var vacationList = new Array();
function scanVacationValue() {
	$(".vacation-items").each(function(idx){   
	        // 해당 체크박스의 Value 가져오기
	var annualVacationId = $(this).children().eq("1").val();
	var officeId = $(this).children().eq("2").val();
	var annual = $(this).children().eq("3").val();
	var vacations = $(this).children().eq("4").val();
	
	vacationList.push({
 		"annualVacationId":annualVacationId,
 		"officeId": officeId,
 		"annual":annual,
 		"vacations":vacations,		
 		});	
	});
}

  var saveVacationBtn = $("#save-vacation-btn");

  saveVacationBtn.on("click", function (e) {
	scanVacationValue();
	modifiyVacation(vacationList);
  });
  
  function modifiyVacation(vacationList) {
	  
	  $.ajax({
	      type: "post",
	      url: "/office/vacation/modify",
	      data: JSON.stringify(vacationList),
	      contentType: "application/json; charset=utf-8",
	      beforeSend: function (xhr) {
	        var $token = $("#token");
	        xhr.setRequestHeader($token.data("token-name"), $token.val());
	      },
	      success: function (result, status, xhr) {
	    	  alert("휴가 정보 변경 성공!");
	    	  window.location.reload();
	      },
	      error: function (xhr, status, er) {
	        alert("실패....");
	      },
	    });	  	
}	 
});
