(function() {
	//전체주소
	console.log("url : " + $(location).attr('href'));
	var url = $(location).attr('href');
	var urlArray = url.split('/');
	var urlMapping = urlArray[3];
	var urlAdmin = urlArray[5];
	console.log("urlAdmin : " + urlAdmin );

	switch (urlMapping) {
	case "notice":
		$(function () {
			$('.nav-all>li:nth-child(1)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "attendance":
		$(function () {
			$('.nav-all>li:nth-child(2)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "sign":
		$(function () {
			$('.nav-all>li:nth-child(3)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "project":
		$(function () {
			$('.nav-all>li:nth-child(4)').find('a').removeClass('link-dark').addClass('active');	
		});
		break;
	case "schedule":
		$(function () {
			$('.nav-all>li:nth-child(5)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	}
	
	
	// 관리자 메뉴
	if(urlMapping == "office"){
		
		if (urlAdmin == "officesetting"){
			$(function () {
				$('.nav-manager>li:nth-child(1)').find('a').removeClass('link-dark').addClass('active');
			})
		} else if (urlAdmin == "management"){
			$(function () {
				$('.nav-manager>li:nth-child(2)').find('a').removeClass('link-dark').addClass('active');
			});
		}
		
	}
	

})()
