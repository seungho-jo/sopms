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
								<h5>${riskDetail.pname}</h5>
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
								<h5>${riskDetail.risk_name}</h5>
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
								<h5>${riskDetail.risk_content}</h5>
							</div>
						</div>
						<!-- 리스크상태 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크 상태</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<h5>${riskDetail.risk_status}</h5>
						</div>
						<!-- 등록자 -->
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_1">등록자</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3" id="regMan">
							<h5>${riskDetail.id}</h5>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_2">등록일</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating" id="regDate">
								<h5>${riskDetail.risk_reg}</h5>
							</div>
						</div>
					</div>
					<div class="row g-2">
						<div class="col-md mb-3">
							<button type="button" class="btn btn-primary" id="button_left"
								onclick="javascript:goUpdate(${riskDetail.risk_no})">수정</button>
						</div>
						<div class="col-md mb-3">
							<button type="button" class="btn btn-primary" id="button_right"
								onclick="javascript:goDelete(${riskDetail.risk_no})">삭제</button>
						</div>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h4 class="card-title">조치내역</h4>
				</div>
					<div class="card-body">
						<div class="row g-2">
							<div class="col-1 mb-2">
								<div class="form-floating">
									<h4 id="title_jochi">조치내용</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<div class="form-floating">
									<h5>${riskJochi.risk_jochiCont}</h5>
								</div>
							</div>
							<div class="col-1 mb-3">
								<div class="form-floating">
									<h4 id="title_jochi">수정일</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<div class="form-floating">
									<h5>${riskJochi.risk_jochiUpt}</h5>
								</div>
							</div>
							<div class="col-1 mb-2">
								<div class="form-floating">
									<h4 id="title_jochi">조치자</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<h5>${riskJochi.id}</h5>
							</div>
						</div>
					</div>
	
				<div id="action_btn">
					<button class="btn btn-primary me-md-2" id="jochiBtn" type="button"
						data-toggle="modal" data-target="#exampleModalCenter">조치등록</button>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">댓글</h4>
				</div>
				<div class="card-body">
					<div class="form-floating">
						<label for="floatingTextarea2">${riskDetail.id}</label>
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px">
					  	</textarea>
							<button class="btn btn-primary me-md-2" type="button">댓글
								등록</button>
						</div>
				</div>
			</div>
			<!-- modal 수정 -->
			<div class="modal fade" id="UpdateModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">	
						<h5 class="modal-title" id="exampleModalLongTitle">수정 상세페이지</h5>
			</div>
			</div>
			</div>
			</div>
			<!--  modal 조치내역-->
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
						<form style="display: flex" method="post">
						<div class="modal-body">
							<div class="row g-2">
								<div class="col-4 mb-3">

									<h4 id="title">조치내용</h4>

								</div>
								<div class="col-6 mb-3">
									<input type="hidden" name="risk_no" value="${riskDetail.risk_no}"/>
									<textarea class="form-control" placeholder="조치내용을 입력하세요."
										name="risk_content" id="floatingTextarea2" style="height: 100px"></textarea>
									<label for="floatingTextarea2"></label>
								</div>
								<div class="col-4 mb-3">
									<h4 id="title">리스크 상태</h4>
								</div>
								<div class="col-4 mb-3">
									<select class="form-select" aria-label="Default select example"
										id="modal_status" name="risk_status">
										<option selected>리스크상태</option>
										<option>조치완료</option>
										<option>진행중</option>
										<option>홀드</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary" id="btn_complete">조치완료</button>
								</div>
							</div>
						</div>
						</form>
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
	
	$("#button_right").click(function(){
	});
	function goUpdate(no){
		$(location).attr("href","${path}/"+no);
	}
	
	function goDelete(no){
		$(location).attr("href","${path}/deleteRisk.do?risk_no="+no);
	}
	
	$("#btn_complete").click(function(){
		$("form").attr("action", "${path}/updateModalContent.do");
		$("form").submit();
	});
</script>
</html>