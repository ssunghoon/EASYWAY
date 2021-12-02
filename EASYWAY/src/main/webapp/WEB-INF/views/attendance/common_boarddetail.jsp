<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>편하게 오피스 작업을! EasyWay!</title>

    <!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
    <!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Oxanium:wght@500&display=swap"
		rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	
    <!-- EASYWAY CSS, JS -->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="/resources/css/common_boarddetail.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
    <script src="/resources/js/menu.js"></script>

</head>

<body>

	<!-- sidebar ------------------------------------------------------------------------------->
    <jsp:include page="../public/sidebar.jsp" />
    
    <div class= "page-divider">
	    <div class="sidebar-background"></div>
	
	
		<!-- 페이지 표현 부분 -------------------------------------------------------------------------->
	    <div class="easyway-wrapper">
	
	        <div class="easyway-container">
	
	            <div class="easyway-boarddetail-pagetitle">
	                 <!-- 게시물 작성 타이틀 -->
	                <div class="easyway-title1">
	                    게시판 이름 들어갈 자리
	                </div>
	            </div>
	            <div class="easyway-boarddetail-title">
	            	<!-- 게시물 타이틀 -->
	            	<div class="post-title">
	                    회식 장소
	                </div>
	            </div>
	            <div class="easyway-boarddetail-writer">
	            	<!-- 게시물 작성자 / 소속부서 / 수정 / 삭제 / 리스트로 돌아가기 -->

	            	<!-- 작성자 정보 -->
	            	<div class="writer-info">
		            	<div class="writer-name">
		            		<i class="writer-icon fas fa-user-circle"></i>
		            		임동혁
		            	</div>
		            	<div class="writer-department">
		            		개발부
		            	</div>
	            	</div>

	            	
	            	<!-- 수정 / 삭제 / 돌아가기 버튼 -->
	            	<div class="buttons">
		            	<button type="button" class="modify-btn easyway-btn">
		            		수정하기
		            	</button>
		            	<button type="button" class="delete-btn easyway-btn">
		            		삭제하기
		            	</button>
		            	<button type="button" class="list-btn easyway-btn">
		            		돌아가기
		            	</button>
	            	</div>
	            </div>
	            <div class="easyway-boarddetail-info">
	            	<!-- 게시물 세부 정보 : 작성 시간, 날짜 / 조회수 등 -->
	            	<div class="info-time">
	            		<i class="time-icon far fa-clock"></i>
	            		2021-10-30
	            	</div>
	            	<div class="info-view">
	            		<span class="info-view-label">조회수</span>
	            		<span class="info-view-count">17</span>
	            	</div>
	            </div>
	            <div class="easyway-boarddetail-content">
	            	<!-- 게시물 내용 -->
	            	<p>대법원장의 임기는 6년으로 하며, 중임할 수 없다. 이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다. 대한민국은 국제평화의 유지에 노력하고 침략적 전쟁을 부인한다. 헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다.</p>
					<p>대통령은 국가의 안위에 관계되는 중대한 교전상태에 있어서 국가를 보위하기 위하여 긴급한 조치가 필요하고 국회의 집회가 불가능한 때에 한하여 법률의 효력을 가지는 명령을 발할 수 있다. 대통령은 내우·외환·천재·지변 또는 중대한 재정·경제상의 위기에 있어서 국가의 안전보장 또는 공공의 안녕질서를 유지하기 위하여 긴급한 조치가 필요하고 국회의 집회를 기다릴 여유가 없을 때에 한하여 최소한으로 필요한 재정·경제상의 처분을 하거나 이에 관하여 법률의 효력을 가지는 명령을 발할 수 있다.</p>
					<p>제1항의 지시를 받은 당해 행정기관은 이에 응하여야 한다. 국가는 여자의 복지와 권익의 향상을 위하여 노력하여야 한다. 헌법개정안이 제2항의 찬성을 얻은 때에는 헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 이 헌법에 의한 최초의 대통령의 임기는 이 헌법시행일로부터 개시한다.</p>
					<p>대법관의 임기는 6년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 위원은 정당에 가입하거나 정치에 관여할 수 없다. 대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다. 모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다.</p>
					<p>대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다. 국회의 정기회는 법률이 정하는 바에 의하여 매년 1회 집회되며, 국회의 임시회는 대통령 또는 국회재적의원 4분의 1 이상의 요구에 의하여 집회된다. 원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다.</p>
					<p>비상계엄이 선포된 때에는 법률이 정하는 바에 의하여 영장제도, 언론·출판·집회·결사의 자유, 정부나 법원의 권한에 관하여 특별한 조치를 할 수 있다. 공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다. 군인은 현역을 면한 후가 아니면 국무총리로 임명될 수 없다. 헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다.</p>
					<p>재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다. 모든 국민은 그 보호하는 자녀에게 적어도 초등교육과 법률이 정하는 교육을 받게 할 의무를 진다. 근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. 헌법개정안은 국회가 의결한 후 30일 이내에 국민투표에 붙여 국회의원선거권자 과반수의 투표와 투표자 과반수의 찬성을 얻어야 한다.</p>
					<p>대통령은 내란 또는 외환의 죄를 범한 경우를 제외하고는 재직중 형사상의 소추를 받지 아니한다. 이 헌법시행 당시의 대법원장과 대법원판사가 아닌 법관은 제1항 단서의 규정에 불구하고 이 헌법에 의하여 임명된 것으로 본다. 국회의원은 법률이 정하는 직을 겸할 수 없다. 제1항의 탄핵소추는 국회재적의원 3분의 1 이상의 발의가 있어야 하며, 그 의결은 국회재적의원 과반수의 찬성이 있어야 한다. 다만, 대통령에 대한 탄핵소추는 국회재적의원 과반수의 발의와 국회재적의원 3분의 2 이상의 찬성이 있어야 한다.</p>
					<p>지방의회의 조직·권한·의원선거와 지방자치단체의 장의 선임방법 기타 지방자치단체의 조직과 운영에 관한 사항은 법률로 정한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다.</p>
					<p>지방자치단체는 주민의 복리에 관한 사무를 처리하고 재산을 관리하며, 법령의 범위안에서 자치에 관한 규정을 제정할 수 있다. 이 헌법시행 당시에 이 헌법에 의하여 새로 설치될 기관의 권한에 속하는 직무를 행하고 있는 기관은 이 헌법에 의하여 새로운 기관이 설치될 때까지 존속하며 그 직무를 행한다.</p>
					<p>저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회는 헌법 또는 법률에 특별한 규정이 없는 한 재적의원 과반수의 출석과 출석의원 과반수의 찬성으로 의결한다. 가부동수인 때에는 부결된 것으로 본다. 광물 기타 중요한 지하자원·수산자원·수력과 경제상 이용할 수 있는 자연력은 법률이 정하는 바에 의하여 일정한 기간 그 채취·개발 또는 이용을 특허할 수 있다.</p>
					<p>국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다. 정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 대통령의 선거에 관한 사항은 법률로 정한다.</p>
					<p>외국인은 국제법과 조약이 정하는 바에 의하여 그 지위가 보장된다. 모든 국민은 거주·이전의 자유를 가진다. 헌법재판소는 법률에 저촉되지 아니하는 범위안에서 심판에 관한 절차, 내부규율과 사무처리에 관한 규칙을 제정할 수 있다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다.</p>
					<p>대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 국회는 헌법개정안이 공고된 날로부터 60일 이내에 의결하여야 하며, 국회의 의결은 재적의원 3분의 2 이상의 찬성을 얻어야 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.</p>
					<p>행정권은 대통령을 수반으로 하는 정부에 속한다. 대법원장과 대법관이 아닌 법관은 대법관회의의 동의를 얻어 대법원장이 임명한다. 국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.</p>
					<p>대통령은 조약을 체결·비준하고, 외교사절을 신임·접수 또는 파견하며, 선전포고와 강화를 한다. 국회의원과 정부는 법률안을 제출할 수 있다. 모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을 박탈당하지 아니한다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다.</p>
					<p>국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 행정각부의 설치·조직과 직무범위는 법률로 정한다. 사면·감형 및 복권에 관한 사항은 법률로 정한다. 대통령은 헌법과 법률이 정하는 바에 의하여 공무원을 임면한다.</p>
					<p>선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다. 언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 법관은 헌법과 법률에 의하여 그 양심에 따라 독립하여 심판한다. 국가안전보장회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다.</p>
					<p>국무총리는 국무위원의 해임을 대통령에게 건의할 수 있다. 국회의원의 선거구와 비례대표제 기타 선거에 관한 사항은 법률로 정한다. 국가는 과학기술의 혁신과 정보 및 인력의 개발을 통하여 국민경제의 발전에 노력하여야 한다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다.</p>
	            </div>
	        </div>
	
	    </div>
    </div>

</body>


</html>

</body>
</html>