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
<link href="./vendor/fullcalendar/lib/main.css" rel="stylesheet">
<script src="./vendor/fullcalendar/lib/main.js" type="text/javascript"></script>
<script src="./vendor/fullcalendar/lib/moment-with-locales.js"
	type="text/javascript"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var toDay = new Date().toISOString().split("T")[0];
	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar : {
			left : 'dayGridMonth,timeGridWeek,timeGridDay',
			center : 'title',
			right : 'prev,next today'
		},
		initialView: 'timeGridWeek',
		initialDate : toDay,
		navLinks : true,
		selectable : true,
		selectMirror : true,
		eventLimit : false,
		eventClick : function(arg) {
			$("h2").click();
			$("#exampleModalLongTitle").text("상세일정");
			
			if(arg.event.extendedProps.workcode != 0) {
				$("#table-cal").hide();
				$("#table-wbs").show();
			}else{
				$("#table-cal").show();
				$("#table-wbs").hide();
			}
			addForm(arg.event);
		},
		editable : true,
		dayMaxEvents : false,
		events : function(info, successCallback, failureCallback) {
			$.ajax({
				type : "post",
				url : "${path}/calList.do",
				dataType : "json",
				success : function(data) {
					console.log(data)
					successCallback(data);
				},
				error : function(err) {
					console.log(err);
				}

			});

		}
	});

	calendar.render();
});
function addForm(event) {
	if(event.extendedProps.workcode == 0){
		$("#title-cal").text(event.title);
		$("#content-cal").text(event.extendedProps.content);
		$("#start-wbs").text(moment(event.start).format('LLL'));
		$("#end-wbs").text(moment(event.end).format('LLL'));
		$("#process-cal").text(event.extendedProps.process+"%");
	}  else {
		// wbs 모달창
		$("#title-wbs").text(event.title);
		$("#content-wbs").text(event.extendedProps.content);
		$("#start-wbs").text(moment(event.start).format('LLL'));
		$("#end-wbs").text(moment(event.end).format('LLL'));
		$("#process-wbs").text(event.extendedProps.status);
	}
}
</script>
<style>
#proj_tab {
	text-align: center;
}

#proj_tab thead {
	color: darkgray;
	font-weight: bold;
}
	#table-wbs table tr th {
	    font-size: 17px;
	    color: black;
	    padding: 10px;
	    width: 20%;
	}
	#table-wbs table tr td {
	    font-size: 17px;
	    color: black;
	    padding-left: 40px;
	    width: 80%;
	}
	#table-wbs table tr {
    height: 4vw;
	}	
	#table-cal table tr th {
	    font-size: 17px;
	    color: black;
	    padding: 10px;
	    width: 20%;
	}
	#table-cal table tr td {
	    font-size: 17px;
	    color: black;
	    padding-left: 40px;
	    width: 80%;
	}
	#table-cal table tr {
    height: 4vw;
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
								<span>*기한이 지난 일정은 -로 카운트됩니다.</span>
							</div>
							<div class="card-body" id="proj_tab">
								<table class="table table-hover table-responsive-sm">
									<thead class="text-dark">
										<tr id="thead">
											<td>담당자</td>
											<td>일정명</td>
											<td>남은기한</td>
											<td>진행상태</td>
										</tr>
									</thead>
									<tbody class="text-secondary">
										<c:forEach var="list" items="${calListAll}">
										<tr>
											<td>${list.cal_name}</td>
											<td>${list.title}</td>
											<td>${list.d_day}</td>
											<td>
											<!-- 진행률별 프로테이지바 수정 -->
											<c:choose>
												<c:when test="${list.cal_process eq '진행중' || list.cal_process eq '승인요청'}">
															<span>${list.cal_process}</span>
												</c:when>
												<c:otherwise>
															<span>${list.cal_process}%</span>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<form method="post">
									<input type="hidden" name="curPage" value="1"/>
								</form>
								 <ul class="pagination justify-content-center" id="paging">
									<li class="page-item" id="pre"><a class="page-link" href="javascript:goBlock(${calListSch.startBlock-1})">Pre</a></li>
									<c:forEach var="cnt" begin="${calListSch.startBlock}" end="${calListSch.endBlock}">
									<li class="page-item ${calListSch.curPage==cnt?'active':''}"><a class="page-link" href="javascript:goBlock(${cnt})">${cnt}</a></li>
									</c:forEach>
									<li class="page-item" id="next"><a class="page-link" href="javascript:goBlock(${calListSch.endBlock-1})">
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
									<div id="calendar"></div>
								</div>
								<!-- 일정 추가 MODAL -->
						<h2 data-toggle="modal" data-target="#exampleModalCenter"></h2>
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 일반 모달창 -->
										<div id="table-cal">
												<table height="100%">
													<tr><th>일정</th><td id="title-cal"></td></tr>
													<tr><th>시작일</th><td id="start-cal"></td></tr>
													<tr><th>종료일</th><td id="end-cal"></td></tr>
													<tr><th>내용</th><td id="content-cal"></td></tr>
													<tr><th>진행률</th><td id="process-cal"></td></tr>
												</table>
										</div>
										<!-- wbs 모달창 -->
										<div id="table-wbs">
												<table height="100%">
													<tr><th>일정</th><td id="title-wbs"></td></tr>
													<tr><th>시작일</th><td id="start-wbs"></td></tr>
													<tr><th>종료일</th><td id="end-wbs"></td></tr>
													<tr><th>내용</th><td id="content-wbs"></td></tr>
													<tr><th>진행률</th><td id="process-wbs"></td></tr>
												</table>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
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
$(".metismenu").children().eq(6).attr('class', 'mm-active');
$("#paging").children("li").click(function() {
	$("#paging").children("li").attr('class', 'page-item');
	$(this).attr('class', 'page-item active');
});
function goBlock(no){
	$("[name=curPage]").val(no);
	$("form").submit();
}

//Pie Chart Example
console.log(${calStatus});
let calStatusObj = JSON.parse('${calStatus}');
let statusArr = [];
let cntArr = [];
calStatusObj.forEach(function(item, index, arr){
   statusArr.push(item.status);
   cntArr.push(item.cnt);
})
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
   type : 'doughnut',
   data : {
      labels : statusArr,
      datasets : [{
         data : cntArr,
         backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
         hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
         hoverBorderColor : "rgba(234, 236, 244, 1)",
      }],
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

<script src="./js/dashboard/dashboard-1.js"></script>
<script type="text/javascript">
	$(".metismenu").children().eq(7).attr('class', 'mm-active');
</script>
</html>