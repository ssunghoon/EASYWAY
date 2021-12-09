$(document).ready(function () {
  var searchEmailBtn = $("#search-email");
  var addEmployee = $("#add-employee");
  var modal = $(".input-group");
  var modalInputEmail = modal.find("input[name='memberEmail']");
  var memberList={};
  var count = 0;

  function searchEmail(data, error) {
    console.log("search email...............");

    $.ajax({
      type: "post",
      url: "/member/search",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      beforeSend: function (xhr) {
        var $token = $("#token");
        xhr.setRequestHeader($token.data("token-name"), $token.val());
      },
      success: function (result, status, xhr) {
        console.log(result);
        addEmail(result);
      },
      error: function (xhr, status, er) {
        alert("해당 이메일을 가진 맴버가 존재하지 않습니다.");
      },
    });
  }
  
  function resisterEmployees(data, error) {
	    console.log("search email...............");

	    $.ajax({
	      type: "post",
	      url: "/member/search",
	      data: JSON.stringify(data),
	      contentType: "application/json; charset=utf-8",
	      beforeSend: function (xhr) {
	        var $token = $("#token");
	        xhr.setRequestHeader($token.data("token-name"), $token.val());
	      },
	      success: function (result, status, xhr) {
	        console.log(result);
	        addEmail(result);
	      },
	      error: function (xhr, status, er) {
	        alert("해당 이메일을 가진 맴버가 존재하지 않습니다.");
	      },
	    });
	  }

  function addEmail(data) {
	memberList[count]=data;
    console.log(memberList);
    let space = document.getElementById("search-email-list");
    let receivedBox = document.createElement("div");
    receivedBox.className = "search-member-info";
    receivedBox.innerHTML = `<div style="display: flex;"><p>${data.memberName}</p>
									<p>${data.memberEmail}</p></div>
                  <button class="clear-btn x-btn" data-count="${count}" value="X">X</button>`;
    space.append(receivedBox);
    count++;
  }

  searchEmailBtn.on("click", function (e) {
	  
	 if (modalInputEmail.val() === "") {
	      alert("메일을 작성해주세요!");
	      return;
	    }
	 if(modalInputEmail.val() === nowMemberEmail){
	      alert("본인 이메일은 추가 할 수 없습니다.");
	      return;
	    }	  
	 if(Object.keys(memberList).length != 0){//memberList가 빈객체가 아니면
		 for (let key in memberList) {
			var test =  memberList[key].memberEmail;
			if(modalInputEmail.val() === test){
				alert("이미 추가리스트에 올라온 이메일 입니다.")
				return;
			}
		}
	  }
	 for (let email of employeeEmails) {
		if(email === modalInputEmail.val()){
			alert("이미 사원으로 존재하는 이메일입니다.");
			return;
		}
	}
    var data = {
      enteredEmail: modalInputEmail.val(),
    };
    searchEmail(data);
  });

  // / / 동적 태그에 이벤트 추가
 $(document).on("click", ".clear-btn", function (e) {
	 let thisCount = $(this).data("count");
	 delete memberList[thisCount];
	 $(this).parent().remove();
  });
  
  
  addEmployee.on("click", function (e) {
	    var space = document.getElementById("employee-list");
	    console.log(space);
	    let count = 0;
	    for ( var key in memberList) {
	    	var receivedBox = document.createElement("tr");
	    	receivedBox.className = "new-employees" + count++;
	    	
	    	var employee = memberList[key];
	    	var optionPosition;
	    	var optionDepartment;

	    	positionList.forEach((position) => {
	    			console.log(position);
	    			optionPosition += `<option value="${position.positionId}" >${position.positionName}</option>`
	    	 });
	    	 departmentList.forEach((department) => {
	    		 optionDepartment += `<option value="${department.departmentId}" >${department.departmentName}</option>`
	    	 });
	    	receivedBox.innerHTML = `<td>${employee["memberName"]}</td>
				<td>${employee["memberEmail"]}</td>
				<td style="width: 10%"><select name="select_position">
				${optionPosition}
				 </select></td>
				<td style="width: 10%"><select name="select_department">
				${optionDepartment}
				</select></td>
				<td><input style="width: 100%; text-" type="Date"></td>
				<td><input style="width: 40%; text-" type="text" value="계약직"></td>				
				<td>${employee["memberPhone"]}</td>`;
	    	space.append(receivedBox);
	    	optionPosition="";
	    	optionDepartment=""; //중복 입력 방지를 위한 삭제
		}
  });
  
  $(document).on("click", "#save-btn", function (e) {
	   	var saveEmployees = [];
	   	
	   	// json 키값 변경을 위해 새로 만듬
	   	let count = 0;
	   	for (var key in memberList) {
	   		var json = memberList[key];
	   		var tmp = {};
	   		var keys = Object.keys(json);
	   		tmp.memberId = json.memberId;
	   		for (var j=1; j < keys.length; j++) {
	   		   kee = keys[j].replace("member", "employee");
	   		   switch(kee) {
	   		   default :
	   		      tmp[kee] = json[keys[j]];
	   		      break;
	   		   }
	   		}
	   		var $selectPosition =  $(".new-employees"+count).children().eq("2").children().val();
	   		var $selectDepartment =  $(".new-employees" + count).children().eq("3").children().val();
	   		var $inputHireDate =  $(".new-employees" + count).children().eq("4").children().val();
	   		var $inputWorkType =  $(".new-employees"+count).children().eq("5").children().val();
	   		tmp.employeePosition = $selectPosition;
	   		tmp.employeeDepartment = $selectDepartment;
	   		tmp.employeeHireDate = $inputHireDate;
	   		tmp.employeeWorkType = $inputWorkType;
	   		console.log(tmp);
	   		saveEmployees.push(tmp);
	   		count++;
		}
	   	
	   	$.ajax({
		      type: "post",
		      url: "/office/employee/register",
		      data: JSON.stringify(saveEmployees),
		      contentType: "application/json; charset=utf-8",
		      beforeSend: function (xhr) {
		        var $token = $("#token");
		        xhr.setRequestHeader($token.data("token-name"), $token.val());
		      },
		      success: function (result, status, xhr) {
		    	  alert("사원 등록 성공!");
		    	  window.location.reload();
		      },
		      error: function (xhr, status, er) {
		        alert("해당 이메일을 가진 맴버가 존재하지 않습니다.");
		      },
		    });
	   	
	  });
});
