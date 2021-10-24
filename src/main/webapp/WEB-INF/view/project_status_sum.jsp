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
<!-- Favicon icon 
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
	<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>-->

<style>
#status{
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 5px);
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
}
</style>

<title>SOPMS</title>

</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div class="row h4 font-weight-bold ml-4 my-2 text-primary">프로젝트
		등록 정보</div>
	<hr class="mx-3">
	<br>
	<div class="row mx-2 mb-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 제목</div>
		<div id="pj_name" class="col text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 상태</div>
		<div id="pj_status" class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">팀원수</div>
		<div id="pj_max_headCnt" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">부서</div>
		<div id="pj_dept" class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">PM</div>
		<div id="pj_pm" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">시작일</div>
		<div id="pj_start_date" class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">종료일</div>
		<div id="pj_end_date" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 설명</div>
		<br>
		<p id="pj_explanation" class="col-8 text-dark"></p>
	</div>
	<div class="row">
		<div class="offset-9" id="btns" style="display:none">
			<button id="upt" class="btn btn-primary" type="button">수정</button>
			<button id="del" class="btn btn-danger ml-2" data-toggle="modal"
				data-target="#exampleModalCenter2"
				class="btn btn-primary btn-lg btn-block center-block" type="button">삭제</button>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter2">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로젝트 삭제</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5>프로젝트를 삭제하시겠습니까?</h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
					<button type="button" id="delBtn_modal" name="delbtn"
						class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="small_project">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">소단위 프로젝트 등록</div>
				<div class="modal-body">
					<div id="insert_smpj"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Required vendors -->
<script src="${path}/vendor/global/global.min.js"></script>
<script src="${path}/js/quixnav-init.js"></script>
<script src="${path}/js/custom.min.js"></script>


<!-- Vectormap -->
<script src="${path}/vendor/raphael/raphael.min.js"></script>
<script src="${path}/vendor/morris/morris.min.js"></script>


<script src="${path}/vendor/circle-progress/circle-progress.min.js"></script>
<script src="${path}/vendor/chart.js/Chart.bundle.min.js"></script>

<script src="${path}/vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="${path}/vendor/flot/jquery.flot.js"></script>
<script src="${path}/vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="${path}/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="${path}/vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="${path}/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="${path}/vendor/jquery.counterup/jquery.counterup.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		getProjectData();
	});
	function getProjectData() {
		$.ajax({
			type : 'POST',
			url : '${path}/projectSum.do',
			data : 'pcode=${param.pcode}',
			dataType : 'json',
			success : function(data) {
				printData(data);
			},
			error : function(err) {
				alert(err);
			}
		});
	}

	function printData(data){
		$('#pj_name').text(data.pname);
		$('#pj_pm').text(data.pmName);
		$('#pj_start_date').text(data.startDate);
		$('#pj_end_date').text(data.endDate);
		$('#pj_max_headCnt').text(data.teamNum);
		$('#pj_status').text(data.status);
		$('#pj_explanation').html(data.explanation);
		//부서 목록 출력
		let deptHTML = '';
		data.dept.forEach(function(element,index,array){
			if(index!=0) deptHTML+='<br>';
			deptHTML+=element;
		});
		if($('#pj_pm').text()=='${user.name}') {
			$("#btns").css('display','block');
		}
		$('#pj_dept').html(deptHTML);
	}

	$("#delBtn_modal").click(function() {	
		$(location).attr("href",
			"${path}/project.do?method=delete&pcode=" + ${param.pcode});
	});
	$("#upt").click(function(){
			$(location).attr("href","${path}/project.do?method=updateform&pcode="+ ${param.pcode});
	});
	
</script>
</html>