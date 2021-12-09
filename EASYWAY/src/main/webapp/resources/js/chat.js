const chatbox = jQuery.noConflict();

chatbox(() => {
  chatbox(".chatbox-open").click(() =>
    chatbox(".chatbox-popup, .chatbox-close").fadeIn()
  );

  chatbox(".chatbox-close").click(() =>
    chatbox(".chatbox-popup, .chatbox-close").fadeOut()
  );

  chatbox(".chatbox-maximize").click(() => {
    chatbox(".chatbox-popup, .chatbox-open, .chatbox-close").fadeOut();
    chatbox(".chatbox-panel").fadeIn();
    chatbox(".chatbox-panel").css({ display: "flex" });
  });

  chatbox(".chatbox-minimize").click(() => {
    chatbox(".chatbox-panel").fadeOut();
    chatbox(".chatbox-popup, .chatbox-open, .chatbox-close").fadeIn();
  });

  chatbox(".chatbox-panel-close").click(() => {
    chatbox(".chatbox-panel").fadeOut();
    chatbox(".chatbox-open").fadeIn();
  });
});

const connect = (departmentId, employeeName) => {
  console.log("sock시작");
  var webSocket = new SockJS("/talk");
  stompClient = Stomp.over(webSocket);
  stompClient.connect({}, function () {
    stompClient.subscribe("/topic/" + departmentId, function (e) {
      if (JSON.parse(e.body).employeeName !== employeeName) {
        showMessageLeft(JSON.parse(e.body));
      }
      console.log("새로운 메세지가 왔습니다.");
    });
  });
};
const onClickPurchase = (values) => {
  stompClient.send("/app/talk/send", {}, JSON.stringify(values));
  showMessageRight(values);
};

function showMessageLeft(e) {
  let space;
  space1 = document.getElementById("small-content-message");
  space2 = document.getElementById("lage-content-message");
  let receivedBox1 = document.createElement("div");
  let receivedBox2 = document.createElement("div");
  receivedBox1.innerHTML = `<span class="o-chat-box">${e.employeeName}</span> <li id="other-message"><span>${e.message}</span></li>`;
  receivedBox2.innerHTML = `<span class="o-chat-box">${e.employeeName}</span> <li id="other-message"><span>${e.message}</span></li>`;
  space1.append(receivedBox1);
  space2.append(receivedBox2);

  space1.scrollTop = space1.scrollHeight;
  space2.scrollTop = space2.scrollHeight;
}

function showMessageRight(e) {
  let space1;
  let space2;
  space1 = document.getElementById("small-content-message");
  space2 = document.getElementById("lage-content-message");
  let receivedBox1 = document.createElement("div");
  let receivedBox2 = document.createElement("div");
  receivedBox1.innerHTML = `<span class="m-chat-box">${e.employeeName}</span> <li id="my-message"><span>${e.message}</span></li>`;
  receivedBox2.innerHTML = `<span class="m-chat-box">${e.employeeName}</span> <li id="my-message"><span>${e.message}</span></li>`;
  space1.append(receivedBox1);
  space2.append(receivedBox2);

  space1.scrollTop = space1.scrollHeight;
  space2.scrollTop = space2.scrollHeight;
}

function disconnect() {
  if (stompClient !== null) {
    stompClient.disconnect();
  }
}

$(document).ready(function () {
  var departmentId = $("input[name='departmentId']").val();
  var employeeName = $("input[name='employeeName']").val();
  var employeeId = $("input[name='employeeId']").val();

  connect(departmentId, employeeName);

  $(".send-message1").on("click", function (e) {
    var message = $(".text-message1").val();
    console.log(message);
    var values = {
      departmentId: departmentId,
      employeeId: employeeId,
      employeeName: employeeName,
      message: message,
    };
    onClickPurchase(values);
    $(".text-message1").val("");
  });
  $(".send-message2").on("click", function (e) {
    var message = $(".text-message2").val();
    console.log(message);
    var values = {
      departmentId: departmentId,
      employeeId: employeeId,
      employeeName: employeeName,
      message: message,
    };
    onClickPurchase(values);
    $(".text-message1").val("");
  });

  $.ajax({
    type: "get",
    url: "/chat/messagelist/" + departmentId,
    success: function (result, status, xhr) {
      result.forEach((messageInfo) => {
    	  console.log(employeeId);
        if (messageInfo.employeeId === parseInt(employeeId)) {
          showMessageRight(messageInfo);
        } else {
          showMessageLeft(messageInfo);
        }
      });
      console.log(result);
    },
    error: function (xhr, status, er) {
    },
  });
});
