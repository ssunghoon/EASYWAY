(function() {
	//전체주소
	console.log("url : " + $(location).attr('href'));
	var url = $(location).attr('href');
	var urlArray = url.split('/');
	var urlMapping = urlArray[4];

	switch (urlMapping) {
	case "notice":
		$(function () {
			$('.nav>li:nth-child(1)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "attendance":
		$(function () {
			$('.nav>li:nth-child(2)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "sign":
		$(function () {
			$('.nav>li:nth-child(3)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	case "project":
		$(function () {
			$('.nav>li:nth-child(4)').find('a').removeClass('link-dark').addClass('active');	
		});
		break;
	case "schedule":
		$(function () {
			$('.nav>li:nth-child(5)').find('a').removeClass('link-dark').addClass('active');
		});
		break;
	default:
		break;
	}
		

})()
