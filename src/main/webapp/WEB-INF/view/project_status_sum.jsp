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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
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
		<div class="offset-9">
			<button id="upt" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModalCenter"
				class="btn btn-primary btn-lg btn-block center-block" type="button">수정</button>
			<button id="del" class="btn btn-danger ml-2" data-toggle="modal"
				data-target="#exampleModalCenter2"
				class="btn btn-primary btn-lg btn-block center-block" type="button">삭제</button>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로젝트 수정</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post"  >
					<input type="hidden" class="form-control" name="pcode" id="pcode"
						placeholder="" value="${project.pcode}" required>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">프로젝트명</label> <input
								type="text" class="form-control" name="pname" id="title"
								placeholder="" value="${project.pname}" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">부서</label>
							<button id="deptbtn" data-toggle="modal"
								data-target="#exampleModalCenter3"
								class="btn btn-primary btn-lg btn-block center-block"
								type="button">부서선택</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3"></div>
						<div class="col-md-6 mb-3" id="output"><h5>${project.dept}</h5></div>
						<input type="hidden" class="form-control" name="dept" id="output2"
							placeholder="" value="" required>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">시작일</label> <input
								type="text" class="form-control" id="startdate"
								value="${project.startdate}" name="startdate">
						</div>
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">종료일</label> <input
								type="text" class="form-control" id="enddate"
								value="${project.enddate}" name="enddate">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">팀원수</label> <input
								type="text" class="form-control" id="team-cnt" name="teamnum"
								placeholder="" value="${project.teamnum}" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="name" class="text-dark">프로젝트상태</label><br> <select
								name="status" id="status">
								<option selected value="${project.status}">${project.status}</option>
								<option value="진행중">진행중</option>
								<option value="종료됨">종료됨</option>
								<option value="보류">보류</option>
							</select>
						</div>
					</div>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1"
							class="form-label text-dark">프로젝트 설명</label>
						<textarea class="form-control" name="explanation"
							id="exampleFormControlTextarea1" rows="7">${project.explanation}</textarea>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
					<button type="button" id="uptBtn_modal" name="uptbtn"
						class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
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
	<div class="modal fade" id="exampleModalCenter3">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">부서등록</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<input type="checkbox" class="check" value="디자인1"> 디자인1팀 <input
							type="checkbox" class="check" value="디자인2"> 디자인2팀 <input
							type="checkbox" class="check" value="개발1"> 개발1팀 <input
							type="checkbox" class="check" value="개발2"> 개발2팀 <input
							type="checkbox" class="check" value="기획1"> 기획1팀 <input
							type="checkbox" class="check" value="기획2"> 기획2팀 <input
							type="checkbox" id="allCheck"> 모두 체크<br /> 프로젝트 부서리스트 :
						<span id="multiPrint"></span><br />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">확인</button>
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
	$(document).ready(function() {
		getProjectData();
	})
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
	function printData(data) {
		let pjInfo = data.info;
		console.log('INFO:' + JSON.stringify(pjInfo));
		$('#pj_name').text(pjInfo.pname);
		$('#pj_pm').text(pjInfo.pmName);
		$('#pj_start_date').text(pjInfo.startDate);
		$('#pj_end_date').text(pjInfo.endDate);
		$('#pj_max_headCnt').text(pjInfo.teamNum);
		$('#pj_status').text(pjInfo.status);
		$('#pj_explanation').text(pjInfo.explanation);

		let pjDeptArr = data.dept;
		console.log('DEPT:' + JSON.stringify(pjDeptArr));
		let deptHTML = '';
		pjDeptArr.forEach(function(element, index, array) {
			if (index != 0)
				deptHTML += '<br>';
			deptHTML += element;
		});
		$('#pj_dept').html(deptHTML);
	}

	$('#add_sp_btn').click(function() {
		$('#small_project').modal('show');
	});
	$("#delBtn_modal").click(function() {	
		$(location).attr("href",
			"${path}/project.do?method=delete&pcode=" + ${param.pcode});
	});
	$("#upt").click(function(){
			$("form").attr("action","${path}/project.do?method=updateform&pcode="+ ${param.pcode});
	});
	$("#uptBtn_modal").click(function(){
			$("form").attr("action","${path}/project.do?method=update");
			$("form").submit();
	});
	$(document).ready(function() {
		$(".check").click(function() {
			var str = "";
			$(".check").each(function() {
				if ($(this).is(":checked"))
					str += $(this).val() + ",";
			});
			$("#multiPrint").text(str);
			$("#output").text(str);
			$("#output2").attr("value",str);
		});

		$("#allCheck").click(function() {
			if ($(this).is(":checked"))
				$(".check").attr("checked", "checked")
			else
				$(".check").removeAttr("checked")
			var str = "";
			$(".check").each(function() {
				if ($(this).is(":checked"))
					str += $(this).val() + ",";
			});
			$("#multiPrint").text(str);
			$("#output").text(str);
			$("#output2").attr("value",str);

		});
		

	});
</script>
</html>