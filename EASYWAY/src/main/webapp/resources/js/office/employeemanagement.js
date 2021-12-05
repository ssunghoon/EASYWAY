$(document).ready(function () {
  var searchEmailBtn = $("#search-email");
  var addEmployee = $("#add-employee");
  var modal = $(".input-group");
  var modalInputEmail = modal.find("input[name='memberEmail']");
  var emailList={};
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
    emailList[count]=data;
    console.log(emailList);
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
    var data = {
      enteredEmail: modalInputEmail.val(),
    };
    searchEmail(data);
  });

  // 동적 태그에 이벤트 주기
  $(document).on("click", ".clear-btn", function (e) {
	 let thisCount = $(this).data("count");
	 delete emailList[thisCount];
	 $(this).parent().remove();
  });
  
  $(document).on("click", ".all-clear-btn", function (e) {
	    $(".search-member-info").remove();
	    count = 0;
	    emailList = {};
	  });
  
  addEmployee.on("click", function (e) {
	    var space = document.getElementById("employee-list");
	    console.log(space);
	    for ( var key in emailList) {
	    	var receivedBox = document.createElement("tr");
	    	var employee = emailList[key];
	    	console.log(employee);
	    	var positionList = 
	    	receivedBox.innerHTML = `<td>${employee["memberName"]}</td>
				<td>${employee["memberEmail"]}</td>
				<td><select name="class_1">      
						<c:forEach var="position" items="${positionList}">
							<option value="${position}" >${position}</option>
						</c:forEach>
                    </select></td>
				<td><select name="class_1">      
						<c:forEach var="department" items="${departmentList}">
							<option value="${department}" >${department}</option>
						</c:forEach>
                    </select></td>
				<td><input style="width: 80%" type="text" value="계약직"></td>
				<td>${employee["memberPhone"]}</td>`;
	    	space.append(receivedBox);
		}	    
  });
});
