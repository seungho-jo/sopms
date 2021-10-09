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
</style>

<title>SOPMS</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
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
						<h3 class="mb-5">프로젝트 등록</h3>
						<form class="validation-form" novalidate>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name" class="text-dark">프로젝트명</label> <input
										type="text" class="form-control" id="title" placeholder=""
										value="" required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="name" class="text-dark">부서</label> <select
										class="form-select">
										<option>분류선택</option>
										<option value="1">기획팀</option>
										<option value="2">디자인팀</option>
										<option value="3">개발팀</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name" class="text-dark">시작일</label> <input
										type="text" class="form-control" id="date-start"
										placeholder="" value="" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="name" class="text-dark">종료일</label> <input
										type="text" class="form-control" id="date-end" placeholder=""
										value="" required>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name" class="text-dark">팀원수</label> <input
										type="text" class="form-control" id="team-cnt" placeholder=""
										value="" required>
								</div>
							</div>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1"
									class="form-label text-dark">프로젝트 설명</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="7"></textarea>
							</div>
							<button id="insertbtn" data-toggle="modal"
								data-target="#exampleModalCenter"
								class="btn btn-primary btn-lg btn-block center-block"
								type="button">등록</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">프로젝트 등록</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>프로젝트를 등록하시겠습니까?</h5>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-light"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary">등록</button>
										</div>
									</div>
								</div>
							</div>

						</form>
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
</script>
</html>