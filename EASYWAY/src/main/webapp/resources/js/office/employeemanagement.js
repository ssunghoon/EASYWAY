$(document).ready(function () {
  var searchEmailBtn = $("#search-email");
  var modal = $(".input-group");
  var modalInputEmail = modal.find("input[name='memberEmail']");
  var emailList;

  function searchEmail(data, error) {
    console.log("search email...............");

    $.ajax({
      type: "post",
      url: "/member/search",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      beforeSend: function (xhr) {
        console.log(data);
        var $token = $("#token");
        xhr.setRequestHeader($token.data("token-name"), $token.val());
      },
      success: function (result, status, xhr) {
        console.log(result);
        addEmail(result);
      },
      error: function (xhr, status, er) {
        console.log(status);
        alert("해당 이메일을 가진 맴버가 존재하지 않습니다.");
      },
    });
  }

  function addEmail(data) {
    emailList = data;
    
    let space = document.getElementById("email-list");
    let receivedBox = document.createElement("div");
    receivedBox.className = "search-member-info";
    receivedBox.innerHTML = `<div style="display: flex;"><p>${data.memberName}</p>
									<p>${data.memberEmail}</p>
									<input type="checkbox"  value="1"></div>
                  <button class="clear-btn x-btn" value="X">X</button>`;
    space.append(receivedBox);
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

  //동적 태그에 이벤트 주기
  $(document).on("click", ".clear-btn", function (e) {
    $(this).parent().remove();
    emailList = {};
  });
  
  $(document).on("click", ".all-clear-btn", function (e) {
	    $(".search-member-info").remove();
	    emailList = {};
	  });
});
