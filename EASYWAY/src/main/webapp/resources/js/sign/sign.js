/**
 * 결재
 */
  
 
	$(document).ready(function() {
		$('.summernote').summernote({
			  // 에디터 높이
			  height: 300,
			  // 에디터 한글 설정
			  lang: "ko-KR",
			  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
			  focus : true,
			  toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ],
				  // 추가한 글꼴
				  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				  // 추가한 폰트사이즈
				  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				  placeholder: '최대 2048자까지 쓸 수 있습니다',
				  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);
						},
						onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}
						}
					}
			});
		
		});


/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, editor) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data : data,
        type : "POST",
        url : "/sign/uploadSummernoteImageFile",
        contentType : false,
        processData : false,
        success : function(data) {
            //항상 업로드된 파일의 url이 있어야 한다.
            $(editor).summernote('insertImage', data.url);
        }
    });
}

	
 /*
 	$('#thirdIn').click(function() {
 		val thirdVal = $('input[name="employeeId"]:checked').val();
 		alert("thirdVal" + thirdVal);
 	});
 	$('#fourthIn').click(function() {
 		val fourthVal = $('input[name="employeeId"]:checked').val();
 		alert("fourthVal" +fourthVal);
 	});
 	 */
 	 
 	// 첫번째 결재선 등록
 	/* $('#firstIn').click(function() {
 		var radioVal = $('input[name="employeeId"]:checked').val();
 		alert(radioVal);
 		$.ajax({
 	        url:"/sign/applylinefirst",
 	        type:"post",
 	        data: radioVal,
 	        dataType: "text",
 	        success:function(data){
 	        	//employeeData = data;//{id, name ....}
 	        	alert(radioVal);
 	        },
 	        error: function (error){
 	            alert("에러");
 	        }
 	    });
 	});  */
 	
 	
 	