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
<link href="./css/manage_mem.css" rel="stylesheet">
<!-- fullcalendar -->
<link href="./vendor/fullcalendar/css/fullcalendar.min.css"
	rel="stylesheet">
<script src="./vendor/fullCalendar-use/js/main.js"
	type="text/javascript"></script>
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<style>
#proj_tab {
	text-align: center;
}

#proj_tab thead {
	color: darkgray;
	font-weight: bold;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading_일정관리 -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 font-weight-bold text-gray-800">일정 관리</h1>
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Donut Chart -->
					<div class="col-xl-6 col-lg-6">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div class="card-header pt-3">
								<h6 class="m-0 font-weight-bold text-primary">일정 현황</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie">
									<canvas id="myPieChart" style="height: 300px;"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 일정 목록 -->
					<div class="col-xl-6 col-lg-6">
						<div class="card shadow mb-4">
							<div class="card-header pt-3">
								<h6 class="m-0 font-weight-bold text-primary">일정 목록</h6>
							</div>
							<div class="card-body" id="proj_tab">
								<table class="table table-hover table-responsive-sm">
									<thead class="text-dark">
										<tr id="thead">
											<td>담당자</td>
											<td>일정명</td>
											<td>남은기한</td>
											<td>진행률</td>
										</tr>
									</thead>
									<tbody class="text-secondary">
										<tr>
											<td>방성원</td>
											<td>화면구현</td>
											<td>10일</td>
											<td>
												<div class="progress" style="height: 15px;">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 90%;">
														<span>90%</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>김길동</td>
											<td>화면설계</td>
											<td>14일</td>
											<td>
												<div class="progress" style="height: 15px;">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 76%;">
														<span>76%</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>홍길동</td>
											<td>DB설계</td>
											<td>16일</td>
											<td>
												<div class="progress" style="height: 15px;">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 36%;">
														<span>36%</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>신길동</td>
											<td>DB설계</td>
											<td>16일</td>
											<td>
												<div class="progress" style="height: 15px;">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 54%;">
														<span>54%</span>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								                            <ul class="pagination justify-content-center" id="paging">
								<li class="page-item" id="pre"><a class="page-link">Pre</a></li>
								<li class="page-item active" id="sel"><a class="page-link">1</a></li>
								<li class="page-item"><a class="page-link">2</a></li>
								<li class="page-item"><a class="page-link">3</a></li>
								<li class="page-item"><a class="page-link">4</a></li>
								<li class="page-item" id="next"><a class="page-link">
										Next
								</a></li>
							</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card">
						<div class="card-body">

							<div class="container">
								<!-- 주별 일정 -->
								<div id="wrapper">
									<div id="loading"></div>
									<div id="calendar"></div>
								</div>
							</div>
							<!-- /.container -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	//Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ "완료", "진행중", "시작전", "일정지연" ],
			datasets : [ {
				data : [ 7, 6, 4, 3 ],
				backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
				hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
				hoverBorderColor : "rgba(234, 236, 244, 1)",
			} ],
		},
		options : {
			maintainAspectRatio : false,
			tooltips : {
				backgroundColor : "rgb(255,255,255)",
				bodyFontColor : "#858796",
				borderColor : '#dddfeb',
				borderWidth : 1,
				xPadding : 15,
				yPadding : 15,
				displayColors : false,
				caretPadding : 10,
			},
			legend : {
				display : true,
				position : 'bottom'
			},
			cutoutPercentage : 80,
		},
	});
	function number_format(number, decimals, dec_point, thousands_sep) {
		// *     example: number_format(1234.56, 2, ',', ' ');
		// *     return: '1 234,56'
		number = (number + '').replace(',', '').replace(' ', '');
		var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
				: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
				: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
				: dec_point, s = '', toFixedFix = function(n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
		};
		// Fix for IE parseFloat(0.55).toFixed(0) = 0;
		s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		if (s[0].length > 3) {
			s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		}
		if ((s[1] || '').length < prec) {
			s[1] = s[1] || '';
			s[1] += new Array(prec - s[1].length + 1).join('0');
		}
		return s.join(dec);
	}
	
	<!-- 페이징 -->
	$("#paging").children("li").click(function() {
		var id = $(this).attr('id');
		if(id=='next'){
			if($('.active').next().attr('id')==id){
				alert("마지막 페이지 입니다");
				return;
			}else{
				$('.active').next().attr('class', 'page-item active');
				$('.active').first().attr('class', 'page-item');
			}
		}else if(id=='pre'){
			if($('.active').prev().attr('id')==id){
				alert("첫 페이지 입니다");
				return;
			}else{
				$('.active').prev().attr('class', 'page-item active');
				$('.active').last().attr('class', 'page-item');
			}
		}else{
			$("#paging").children("li").attr('class', 'page-item');
			$(this).attr('class', 'page-item active');
		}
	});
</script>

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

<!-- fullCalendar-use -->
<script src="./vendor/fullCalendar-use/vendor/js/jquery.min.js"></script>
<script src="./vendor/fullCalendar-use/vendor/js/bootstrap.min.js"></script>
<script src="./vendor/fullCalendar-use/vendor/js/moment.min.js"></script>
<script src="./vendor/fullCalendar-use/vendor/js/fullcalendar.min.js"></script>
<script src="./vendor/fullCalendar-use/vendor/js/ko.js"></script>
<script src="./vendor/fullCalendar-use/vendor/js/select2.min.js"></script>
<script
	src="./vendor/fullCalendar-use/vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="./vendor/fullCalendar-use/js/main2.js"></script>
<script src="./vendor/fullCalendar-use/js/etcSetting.js"></script>

<script src="./js/dashboard/dashboard-1.js"></script>
<script type="text/javascript">
	$(".metismenu").children().eq(7).attr('class', 'mm-active');
</script>
</html>