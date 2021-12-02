$(document).ready(function () {
  var checkEmailBtn = $("#check-email");
  var modal = $(".mb-3");
  var modalInputEmail = modal.find("input[name='memberEmail']");
  var checkResult;

  function checkEmail(data, error) {
    console.log("check email...............");

    $.ajax({
      type: "post",
      url: "/member/register/checkemail",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      beforeSend: function (xhr) {
        console.log(data);
        var $token = $("#token");
        xhr.setRequestHeader($token.data("token-name"), $token.val());
      },
      success: function (result, status, xhr) {
    	  checkResult = result;
        if (result == "ok") {
          alert("사용 가능한 이메일입니다!");
        } else {
          alert("이미 사용중인 이메일입니다!");
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

  checkEmailBtn.on("click", function (e) {
    if (modalInputEmail.val() === "") {
      alert("메일을 작성해주세요!");
      return;
    }
    var data = {
      tempEmail: modalInputEmail.val(),
    };
    checkEmail(data);
  });
});
