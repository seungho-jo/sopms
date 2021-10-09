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
<title>Focus - Bootstrap Admin Dashboard</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<link href="./css/risk_Update.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div class="card">
				<h2 class="font-weight-bold" id="risk_title">리스크 상세 페이지</h2>
				<div class="card-body">
					<div class="row g-4">
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">프로젝트명</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>요구사항작성누락</h5>
							</div>
						</div>

						<!-- 리스크명 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크명</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>리스크1</h5>
							</div>
						</div>
						<!-- 리스크내용 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크내용</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>요구사항정의서 작성 누락되었습니다!!</h5>
							</div>
						</div>
						<!-- 리스크상태 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크 상태</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<h5>진행중</h5>
						</div>
						<!-- 등록자 -->
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_1">등록자</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<h5>김영진</h5>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_2">등록일</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h5>2021.09.30</h5>
							</div>
						</div>
					</div>
					<div class="row g-2">
						<div class="col-md mb-3">
							<button type="button" class="btn btn-primary" id="button_left">수정</button>
						</div>
						<div class="col-md mb-3">
							<button type="button" class="btn btn-primary" id="button_right">삭제</button>
						</div>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h4 class="card-title">조치내역</h4>
				</div>
				<div id="action_btn">
					<button class="btn btn-primary me-md-2" type="button"
						data-toggle="modal" data-target="#exampleModalCenter">조치등록</button>
				</div>
				<div class="card-body"></div>
			</div>
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">댓글</h4>
				</div>
				<div class="card-body">
					<div class="form-floating">
						<label for="floatingTextarea2">himan</label>
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px">
					  	</textarea>
						<div class="d-flex justify-content-end">
							<button class="btn btn-primary me-md-2" type="button">댓글
								등록</button>
						</div>
					</div>
				</div>
			</div>
			<!--  modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">조치 상세페이지</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row g-2">
								<div class="col-4 mb-3">

									<h4 id="title">조치자 명</h4>

								</div>
								<div class="col-6 mb-3">
									<input type="text" class="form-control" placeholder="조치자명 작성"
										aria-label="조치자명 작성">
								</div>
								<div class="col-4 mb-3">

									<h4 id="title">조치내용</h4>

								</div>
								<div class="col-6 mb-3">
									<textarea class="form-control" placeholder="조치내용을 입력하세요."
										id="floatingTextarea2" style="height: 100px"></textarea>
									<label for="floatingTextarea2"></label>
								</div>
								<div class="col-4 mb-3">
									<h4 id="title">리스크 상태</h4>
								</div>
								<div class="col-4 mb-3">
									<select class="form-select" aria-label="Default select example"
										id="modal_status">
										<option selected>리스크상태</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary">조치완료</button>
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
	$(".metismenu").children().eq(8).attr('class', 'mm-active');
</script>
</html>