<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>SOPMS</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
	#sp_list{
		height:80px;
	}
	#add_sp_btn{
		display:inline-block;
		border:2px solid gray;
		border-radius:5px;
		width:60px;
		height:100%;
		background-color:white;
	}
	#case_left{
		display:inline-block;
		float:left;
		width:15px;
		height:100%;
		border:2px solid black;
		border-radius:2px;
		margin-right:10px;
	}
	#case_right{
		display:inline-block;
		float:right;
		width:15px;
		height:100%;
		border:2px solid black;
		border-radius:2px;
		margin-left:10px;
	}
</style>

<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	
	<div class="row h4 font-weight-bold ml-4 my-2 text-primary">프로젝트 등록
		정보</div>
	<hr class="mx-3">
	<div id="sp_list" class="mx-3">
		<div id="case_left">
			<i class="bi bi-caret-left text-dark align-middle"></i>
		</div>
		<button id="add_sp_btn">
			<i class="bi bi-plus-circle fa-2x align-middle"></i>
		</button>
		<div id="case_right">
			<i class="bi bi-caret-right text-dark align-middle"></i>
		</div>
	</div>
	<br>
	<div class="row mx-2 mb-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 제목</div>
		<div class="col text-dark">SL솔루션 homepage</div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 분류</div>
		<div class="col-4 text-dark">웹페이지</div>
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 상태</div>
		<div class="col-4 text-dark">진행중</div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">부서</div>
		<div class="col-4 text-dark">개발 1팀<br>개발 2팀</div>
		<div class="col-2 font-weight-bold text-right text-dark">PM</div>
		<div class="col-4 text-dark">홍길동</div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">시작일</div>
		<div class="col-4 text-dark">2021-09-01</div>
		<div class="col-2 font-weight-bold text-right text-dark">종료일</div>
		<div class="col-4 text-dark">2021-10-31</div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">팀원수</div>
		<div class="col-4 text-dark">10</div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 설명</div>
		<br>
		<p class="col-8 text-dark">
			프로젝트 개요<br> Workspace 프로젝트를 사용하면 데이터 구성 요소, 테이블 및 시각화를 결합하여 분석을
			작성하고 조직의 모든 사람과 공유할 수 있습니다. 첫 번째 프로젝트를 시작하기 전에 프로젝트에 액세스, 탐색 및 관리하는
			방법에 대해 살펴보십시오.<br>
			<br> 새로 만들기, 열기, 저장, 다른 이름으로 저장, 템플릿으로 저장 등 프로젝트 관리를 위한 일반적인 작업이
			포함됩니다. 프로젝트 새로 고침을 클릭하여 전체 프로젝트를 새로 고쳐 최신 데이터 및 정의를 검색할 수도 있습니다. CSV
			및 PDF 다운로드 옵션을 사용하면 Workspace에서 데이터를 내보낼 수 있습니다. 프로젝트 정보 및 설정은 프로젝트
			관리를 위한 다양한 옵션을 제공합니다.
		</p>
	</div>
	<div class="row">
		<div class="offset-9">
			<button id="uptbtn"
				class="btn btn-primary">수정</button>
			<button id="delbtn"
				class="btn btn-danger ml-2">삭제</button>
		</div>
	</div>
	
	<div class="modal fade" id="small_project">
		<div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            	head
	            </div>
	            <div class="modal-body">
	            	body
	            </div>
	    	</div>
		</div>
	</div>
</body>
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>


<!-- Vectormap -->
<script src="./vendor/raphael/raphael.min.js"></script>
<script src="./vendor/morris/morris.min.js"></script>


<script src="./vendor/circle-progress/circle-progress.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>

<script src="./vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>
<script type="text/javascript">
	$('#add_sp_btn').click(function(){
		$('#small_project').modal('show');
	});
</script>
</html>