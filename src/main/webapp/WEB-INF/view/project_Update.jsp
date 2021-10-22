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
<!-- Daterange picker -->
<link href="./vendor/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Clockpicker -->
<link href="./vendor/clockpicker/css/bootstrap-clockpicker.min.css"
	rel="stylesheet">
<!-- asColorpicker -->
<link href="./vendor/jquery-asColorPicker/css/asColorPicker.min.css"
	rel="stylesheet">
<!-- Material color picker -->
<link
	href="./vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet">
<!-- Pick date -->
<link rel="stylesheet" href="./vendor/pickadate/themes/default.css">
<link rel="stylesheet" href="./vendor/pickadate/themes/default.date.css">
<link href="./css/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
}

h3 {
	margin-bottom: 100px;
}

.input-form {
	max-width: 680px;
	margin-top: 10px;
	margin-bottom: 50px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#insertbtn {
	margin-top: 50px;
	display: inline-block;
}

#title, #date-start, #date-end, #team-cnt {
	height: 39px;
}

#status {
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
<script type="text/javascript">
	
</script>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div class="container">

				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h3 class="mb-5">프로젝트 수정</h3>

						<form action="${path}/project.do?method=update" method="post" id="updateform" name="insert01">
							<input type="hidden" class="form-control" name="pcode" id="pcode"
								placeholder="" value="${project.pcode}" required>
							<input type="hidden" class="form-control" name="id" id="id"
								placeholder="" value="${project.id}" required>
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
								<div class="col-md-6 mb-3" id="output">
									<p>${project.dept}</p>
								</div>
								<input type="hidden" class="form-control" name="dept"
									id="output2" placeholder="" value="${project.dept}" required>
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
						<div class="row">
							<div class="offset-9">
								<button id="upt" class="btn btn-primary" data-toggle="modal"
									data-target="#exampleModalCenter" type="button" type="button">수정</button>
								<button id="del" class="btn btn-light" type="button">취소</button>
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
										<p>프로젝트를 수정하시겠습니까?</p>
									</div>
									<div class="modal-footer">
										<button type="button" id="uptBtn_modal" name="uptbtn"
											class="btn btn-primary">확인</button>
										<button type="button" id="canBtn_modal" class="btn btn-light"
											data-dismiss="modal">취소</button>				
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
											<input type="checkbox" class="check" value="디자인1">
											디자인1팀 <input type="checkbox" class="check" value="디자인2">
											디자인2팀 <input type="checkbox" class="check" value="개발1">
											개발1팀 <input type="checkbox" class="check" value="개발2">
											개발2팀 <input type="checkbox" class="check" value="기획1">
											기획1팀 <input type="checkbox" class="check" value="기획2">
											기획2팀 <input type="checkbox" id="allCheck"> 모두 체크<br />
											프로젝트 부서리스트 : <span id="multiPrint"></span><br />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-light"
											data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>



					</div>
				</div>


			</div>
			<jsp:include page="footer.jsp" />
		</div>
</body>
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<!-- Daterangepicker -->
<!-- momment js is must -->
<script src="./vendor/moment/moment.min.js"></script>
<script src="./vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- clockpicker -->
<script src="./vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script>
<!-- asColorPicker -->
<script src="./vendor/jquery-asColor/jquery-asColor.min.js"></script>
<script src="./vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
<script
	src="./vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
<!-- Material color picker -->
<script
	src="./vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- pickdate -->
<script src="./vendor/pickadate/picker.js"></script>
<script src="./vendor/pickadate/picker.time.js"></script>
<script src="./vendor/pickadate/picker.date.js"></script>
<!-- Daterangepicker -->
<script src="./js/plugins-init/bs-daterange-picker-init.js"></script>
<!-- Clockpicker init -->
<script src="./js/plugins-init/clock-picker-init.js"></script>
<!-- asColorPicker init -->
<script src="./js/plugins-init/jquery-asColorPicker.init.js"></script>
<!-- Material color picker init -->
<script src="./js/plugins-init/material-date-picker-init.js"></script>
<!-- Pickdate -->
<script src="./js/plugins-init/pickadate-init.js"></script>
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
$(".metismenu").children().eq(3).attr('class', 'mm-active');
$(document).ready(function() {
	$(".check").click(function() {
		var str = "";
		$(".check").each(function() {
			if ($(this).is(":checked"))
				str += $(this).val() + ",";
		});
		$("#multiPrint").text(str);
		$("#output").text(str);
		$("#output2").attr("value", str);
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
		$("#output2").attr("value", str);

	});

	});
	$("#uptBtn_modal").click(function() {
		if (insert01.pname.value == "" || insert01.startdate.value == "" || insert01.enddate.value == ""|| insert01.teamnum.value == "") {
			alert("필수입력란이 비었습니다. 확인해주세요.");
			return false;
		}
		var startDate = $("input[name=startdate]").val().split("-");
		var endDate  = $("input[name=enddate]").val().split("-");
		var sDate = new Date(startDate[0], startDate[1], startDate[2]).valueOf();
		var eDate = new Date(endDate[0], endDate[1], endDate[2]).valueOf();
		if ( sDate >= eDate ) {
			alert("시작일과 종료일을 확인해주세요.");
			return false;			
		}
		$("#updateform").submit();
		alert("프로젝트를 수정했습니다.");
	});
	$("#del").click(function(){
		history.back();
	});
</script>
</html>