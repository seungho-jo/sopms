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
<link href="./css/dashboard.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<style>
	
	#proj_tab{text-align:center;}
	#proj_tab thead{color:darkgray;font-weight:bold;}
	.countSumIcon{font-size:1.5rem;}
	.card{
		border-radius:10px !important;
	}
	.count_sum_header{
		display:inline-block;
		padding:0.5rem 1rem 0.5rem 1rem;
		border-bottom:1px solid #D8D8D8;
		background:#FAFAFA;
	}
	.count_sum_header h6{
		display:inline-block;
	}
	.count_sum{
		border-top:5px solid !important;
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
	
	           <!-- Page Heading_통합현황 -->
	           <div class="d-sm-flex align-items-center justify-content-between mb-4">
	           		<i class="bi bi-house text-primary countSumIcon"></i>
	               	<div id="title" class="h3 mb-0 font-weight-bold text-gray-800">통합현황</div>
	           </div>
	
	           <!-- Content Row -->
				<div class="row">
				
					<!-- Project -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 count_sum" style="border-color:#4e73df !important;">
							<div class="count_sum_header">
								<i class="bi bi-clipboard-check text-primary countSumIcon"></i>
								<h6 class="m-0 font-weight-bold text-primary">프로젝트</h6>
							</div>
							<div class="card-body">
								<div class="h4 mb-0 font-weight-bold text-gray-800 text-center">${countSum.projectCnt}</div>
							</div>
						</div>
					</div>
	             
	           		<!-- Task -->
					<c:choose>
						<c:when test="${sessionScope.user.rank eq '부장'}">
							<!-- 부장 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-primary shadow h-100 count_sum" style="border-color:#1cc88a !important;">
									<div class="count_sum_header">
										<i class="bi bi-tools text-success countSumIcon"></i>
										<h6 class="m-0 font-weight-bold text-success">작업</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 font-weight-bold text-gray-800 text-center">${countSum.taskCntAll}</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 기타 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-success shadow h-100 count_sum" style="border-color:#1cc88a !important;">
									<div class="count_sum_header">
										<i class="bi bi-tools text-success countSumIcon"></i>
										<h6 class="m-0 font-weight-bold text-success">작업</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 font-weight-bold text-gray-800 text-center">${countSum.taskCnt}</div>
									</div>
								</div>
							</div>	
						</c:otherwise>
					</c:choose>
	               
	              <!-- Risk -->
					<c:choose>
						<c:when test="${sessionScope.user.rank eq '부장'}">
							<!-- 부장 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-warning shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
													리스크</div>
												<div class="h5 mb-0 font-weight-bold text-warning">${countSum.riskCntAll}</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-exclamation-triangle text-warning countSumIcon"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 기타 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-warning shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
													리스크</div>
												<div class="h5 mb-0 font-weight-bold text-warning-800">${countSum.riskCnt}</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-exclamation-triangle text-warning countSumIcon"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
	
	
	               <!-- Output -->
	               <c:choose>
						<c:when test="${sessionScope.user.rank eq '부장'}">
							<!-- 부장 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
													산출물</div>
												<div class="h5 mb-0 font-weight-bold text-info-800">${countSum.outputCntAll}</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-sd-card text-info countSumIcon"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 기타 직급 사용자일 경우 -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
													산출물</div>
												<div class="h5 mb-0 font-weight-bold text-info-800">${countSum.outputCnt}</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-sd-card text-info countSumIcon"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
	           
	           <!-- Heading_중요프로젝트 -->
	           <div class="card">
		           <div class="card-header">
		               <h1 class="card-title mb-0 font-weight-bold text-primary">중요 프로젝트</h1>
		           </div>
		           <div class="card-body" id="proj_tab">
		           	<table class="table table-hover table-responsive-sm">
		           		<thead class="text-dark">
				           <tr id="thead">
				              <td>프로젝트명</td>
				              <td>PM</td>
				              <td>시작일</td>
				              <td>종료일</td>
				              <td>남은기한</td>
				              <td>진행률</td>
				           </tr>
				       </thead>
				       <tbody class="text-secondary">
				           <tr>
				              <td>A사 인사 관리 시스템</td>
				              <td>고길동</td>
				              <td>2021-05-01</td>
				              <td>2022-04-30</td>
				              <td>D-99</td>
				              <td>
				              	<div class="progress" style="height:15px;">
								  <div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width:10%;">
								    <span>10%</span>
								  </div>
								</div>
				              </td>
				           </tr>
				           <tr>
				              <td>B사 예약 관리 시스템</td>
				              <td>마이클</td>
				              <td>2020-11-30</td>
				              <td>2021-04-20</td>
				              <td>D-89</td>
				              <td>
				              	<div class="progress" style="height:15px;">
								  <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%;">
								    <span>90%</span>
								  </div>
								</div>
				              </td>
				           </tr>
				           <tr>
				              <td>B사 재고 관리 시스템</td>
				              <td>도우너</td>
				              <td>2020-11-30</td>
				              <td>2021-04-20</td>
				              <td>D-89</td>
				              <td>
				              	<div class="progress" style="height:15px;">
								  <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%;">
								    <span>90%</span>
								  </div>
								</div>
				              </td>
				           </tr>
				    	</tbody>
			       	</table>
		           </div>
		       </div>
	           
	           <!-- Heading_공지사항 -->
	           <div class="card">
		           <div class="card-header">
		               <h1 class="card-title mb-0 font-weight-bold text-primary">공지사항</h1>
		           </div>
		           <div class="card-body" id="proj_tab">
		           	<table class="table table-hover table-responsive-sm">
		           		<thead class="text-dark">
				           <tr id="thead">
				              <td>프로젝트명</td>
				              <td>제목</td>
				              <td>작성자</td>
				              <td>작성일자</td>
				           </tr>
				       </thead>
				       <tbody class="text-secondary">
				           <tr>
				              <td>A사 인사 관리 시스템</td>
				              <td>요구사항 변경 공지</td>
				              <td>고길동</td>
				              <td>2020-12-02</td>
				           </tr>
				           <tr>
				              <td>B사 예약 관리 시스템</td>
				              <td>12월 일정 공지</td>
				              <td>마이콜</td>
				              <td>2020-11-24</td>
				           </tr>
				           <tr>
				              <td>B사 재고 관리 시스템</td>
				              <td>공통 이슈사항 안내</td>
				              <td>도우너</td>
				              <td>2020-10-11</td>
				           </tr>
				    	</tbody>
			       	</table>
		           </div>
		       </div>
	           
	           <div class="row">
		            <!-- Donut Chart -->
	               <div class="col-xl-6 col-lg-6">
	                   <div class="card shadow mb-4">
	                       <!-- Card Header - Dropdown -->
	                       <div class="card-header pt-3">
	                           <h6 class="m-0 font-weight-bold text-primary">리스크 현황</h6>
	                       </div>
	                       <!-- Card Body -->
	                       <div class="card-body">
	                           <div class="chart-pie">
	                               <canvas id="myPieChart" style="height:300px;"></canvas>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	               
	               <!-- Bar Chart -->
	               <div class="col-xl-6 col-lg-6">
	                   <div class="card shadow mb-4">
	                       <div class="card-header pt-3">
	                           <h6 class="m-0 font-weight-bold text-primary">리스크 발생 횟수</h6>
	                       </div>
	                       <div class="card-body">
	                           <div class="chart-bar">
	                               <canvas id="myBarChart" style="height:300px;"></canvas>
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
<script type="text/javascript">
var msg = "${msg}";
if(msg!=null && msg!="") {
	alert(msg);
}
//Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["요구사항변경", "일정지연", "예산부족" , "기타"],
    datasets: [{
      data: [3, 1, 1, 1],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: true,
      position: 'bottom'
    },
    cutoutPercentage: 80,
  },
});

function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
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

	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["January", "February", "March", "April", "May", "June"],
	    datasets: [{
	      label: "Risk",
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      data: [24, 28, 35, 18, 26, 20],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 6
	        },
	        maxBarThickness: 25,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 50,
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ':' + number_format(tooltipItem.yLabel);
	        }
	      }
	    },
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


<script src="./js/dashboard/dashboard-1.js"></script>
</html>