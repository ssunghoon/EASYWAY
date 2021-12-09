/**
 *  휴가 신청서 결재선 모달
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
	      beforeSend: function (xhr) {
	        var $token = $("#token");
	        xhr.setRequestHeader($token.data("token-name"), $token.val());
	      },
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
	    receivedBox.innerHTML = `<br><div><input type="radio" value="${data.employeeId }" name="employeeId" id="employeeId${data.employeeId }">
    							 <label for="employeeId${data.employeeId }">${data.employeeName}</label><br></div>`;
	    space.append(receivedBox);
	    count++;
   } 
  searchNameBtn.on("click", function (e) {
	  if(nameList[0]){
		  //alert(nameList[0].employeeName);
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
  
 /* $(document).on("click", ".all-clear-btn", function (e) {
	    $(".search-employee-info").remove();
	    count = 0;
	    nameList = {};
	  });
  */
  $('#firstIn').on("click",function() {
	  var firstVal = $('input[name="employeeId"]:checked').val();
	  var output = $("label[for='employeeId"+firstVal+"']").text();
	  //alert("firstVal : " + firstVal);
	  //alert("label값 : " +output);
	  document.getElementById("firstResult").innerHTML = `<input type="hidden" id="employee1"  value="`+firstVal+`"/><p align="center">`+output+`</p>`;
	  document.getElementById("firstEmployee").innerHTML = `<input type="hidden"  name="employeeId1" value="`+firstVal+`"/>`;
	  
  });
  
  $('#secondIn').on("click", function() {
	  var secondVal = $('input[name="employeeId"]:checked').val();
	  var output = $("label[for='employeeId"+secondVal+"']").text();
	  //alert("firstVal : " + secondVal);
	  //alert("label값 : " +output);
	  document.getElementById("secondResult").innerHTML =  `<input type="hidden" id="employee2" value="`+secondVal+`"/><p align="center">`+output+`</p>`;
	  document.getElementById("secondEmployee").innerHTML = `<input type="hidden" name="employeeId2" value="`+secondVal+`"/>`;
  });
  
  $('#thirdIn').on("click", function() {
	  var thirdVal = $('input[name="employeeId"]:checked').val();
	  var output = $("label[for='employeeId"+thirdVal+"']").text();
	  //alert("firstVal : " + thirdVal);
	  //alert("label값 : " +output);
	  document.getElementById("thirdResult").innerHTML =  `<input type="hidden"  id="employee3" value="`+thirdVal+`"/><p align="center">`+output+`</p>`;
	  document.getElementById("thirdEmployee").innerHTML = `<input type="hidden" name="employeeId3" value="`+secondVal+`"/>`;

  });
  $(document).on("click","#fourthIn", function() {
	  var fourthVal = $('input[name="employeeId"]:checked').val();
	  var output = $("label[for='employeeId"+fourthVal+"']").text();
	  //alert("firstVal : " + fourthVal);
	  //alert("label값 : " +output);
	  document.getElementById("fourthResult").innerHTML =  `<input type="hidden"  id="employee4" value="`+fourthVal+`"/><p align="center">`+output+`</p>`;
	  document.getElementById("fourthEmployee").innerHTML = `<input type="hidden" name="employeeId4" value="`+secondVal+`"/>`;

  });
  
  $(".clear-btn").pm("click", function () {
	  document.getElementById("firstResult").innerHTML = "";
	  document.getElementById("secondResult").innerHTML = "";
	  document.getElementById("thridResult").innerHTML = "";
	  document.getElementById("fourthResult").innerHTML = "";
	  });
  
  $('#firstOut').on("click", function() {
		// firstResult 자리
		document.getElementById("firstResult").innerHTML = "";
	});
  $('#secondOut').on("click", function() {
		document.getElementById("secondResult").innerHTML = "";
	});
  $('#thirdOut').on("click", function() {
		document.getElementById("thirdResult").innerHTML = "";
	});
  $('#fourthOut').on("click", function() {
		document.getElementById("fourthResult").innerHTML = "";
	});
});
