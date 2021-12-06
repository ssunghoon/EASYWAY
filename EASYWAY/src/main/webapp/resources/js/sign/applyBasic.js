/**
 *  기본 기안서 결재선 모달
 */
$(document).ready(function () {
  var searchNameBtn = $("#search-name");
  var addEmployee = $("#add-employee");
  var modal = $(".input-group");
  var modalInputName = modal.find("input[name='employeeName']");
  var nameList={};
  var count = 0;
  
  function searchName(data, error) {
	  console.log("search name........");
	  
	  $.ajax({
		  type: "post",
		  url: "/sign/search",
		  data: JSON.stringify(data),
	      contentType: "application/json; charset=utf-8",
//	      beforeSend: function (xhr) {
//	        var $token = $("#token");
//	        xhr.setRequestHeader($token.data("token-name"), $token.val());
//	      },
	      success: function (result, status, xhr) {
	          console.log(result);
	          addName(result);
	      },
	      error: function (xhr, status, er) {
	    	  alert("해당 이름을 가진 직원이 존재하지 않습니다.");
	      },
	  });
  }
  function addName(data) {
	  	nameList[count]=data;
	    let space = document.getElementById("search-name-list");
	    let receivedBox = document.createElement("div");
	    receivedBox.className = "search-employee-info";
	    receivedBox.innerHTML = `<div style="display: flex;"><input type="radio" value="${data.employeeName }" name="employeeId" id="${data.employeeName }">
    							 <label for="${data.employeeName }">${data.employeeName}</label><br></div>`;
	    space.append(receivedBox);
	    count++;
   } 
  searchNameBtn.on("click", function (e) {
	  if(nameList[0]){
		  alert(nameList[0].employeeName);
		  document.getElementById("search-name-list").innerHTML = "";
	  }
	    if (modalInputName.val() === "") {
	      alert("이름을 작성해주세요!");
	      return;
	    }
	    var data = {
	      enteredName: modalInputName.val(),
	    };
	    searchName(data);
	  });
  
  // 동적 태그에 이벤트 주가
  $(document).on("click", ".clear-btn", function (e) {
	 let thisCount = $(this).data("count");
	 delete nameList[thisCount];
	  delete name;
	 $(this).parent().remove();
  });
  
  $(document).on("click", ".all-clear-btn", function (e) {
	    $(".search-employee-info").remove();
	    count = 0;
	    nameList = {};
	  });
  
  $('#firstIn').on("click",function() {
	  var firstVal = $('input[name="employeeId"]:checked').val();
	  alert("firstVal : " + firstVal);
	  document.getElementById("firstResult").innerHTML = firstVal;
		
	});
  $('#secondIn').on("click", function() {
		var secondVal = $('input[name="employeeId"]:checked').val();
		alert("secondVal : " + secondVal);
		document.getElementById("secondResult").innerHTML = secondVal;
	});
  $('#thirdIn').on("click", function() {
		var thirdVal = $('input[name="employeeId"]:checked').val();
		alert("thirdVal : " + thirdVal);
		document.getElementById("thirdResult").innerHTML = thirdVal;
	});
  $('#fourthIn').on("click", function() {
		var fourthVal = $('input[name="employeeId"]:checked').val();
		alert("fourthVal : " + fourthVal);
		document.getElementById("fourthResult").innerHTML = fourthVal;
	});
  
  $('#firstOut').on("click", function() {
		// firstResult 자리
		document.getElementById("firstResult").innerHTML = "";
	});
  $('#secondOut').on("click", function() {
		document.getElementById("secondResult").innerHTML = "";
	});
  $('#thridOut').on("click", function() {
		document.getElementById("thridResult").innerHTML = "";
	});
  $('#fourthOut').on("click", function() {
		document.getElementById("fourthResult").innerHTML = "";
		alert(document.getElementById("firstResult").innerHTML);
	});
});