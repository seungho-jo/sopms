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
<title>SOPMS</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<style>
	
	#bookmark_tab{text-align:center;}
	#bookmark_tab thead{color:darkgray;font-weight:bold;}
	.bookmark_icon{font-size:1.5rem;}
	.bookmark_icon:hover{cursor:pointer;}
	.sum_icon{font-size:1.2rem;}
	.card{
		border-radius:10px !important;
		border-top:4px solid lightgray !important;
	}
	.card_header{
		display:inline-block;
		padding:0.5rem 1rem 0.5rem 1rem;
		border-bottom:1px solid #D8D8D8;
		background:#F5F7F8;
	}
	.card_header h6{
		display:inline-block;
	}
	.subject_color{
		color:#343957 !important;
	}
	.
	
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
	           <div class="row">
		           <div class="col-4 d-sm-flex align-items-center mb-4">
		           		<i class="bi bi-house text-dark sum_icon"></i>
		               	<div id="title" class="h3 mb-0 font-weight-bold text-gray-800 ml-2">통합현황</div>
		           </div>
		           <div class="h4 offset-6 col-2">${sessionScope.user.name}(${sessionScope.user.rank})</div>
				</div>
				
	           <!-- Content Row -->
				<div class="row">
	           		
					<c:choose>
						<c:when test="${sessionScope.user.rank eq '부장'}">
							<!-- 부장 직급 사용자일 경우 -->
							<!-- Project -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#4e73df !important;">
									<div class="card_header">
										<i class="bi bi-clipboard-check text-primary sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-primary ml-1">프로젝트</h6>
									</div>
									<div class="card-body">
										<div class="h4 mt-4 mb-0 font-weight-bold text-gray-800 text-center">
											<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
												<span id="project_cnt_PM" data-toggle="tooltip" data-html="true" data-placement="right"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Task (부장) -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100" style="border-color:#1cc88a !important;">
									<div class="card_header">
										<i class="bi bi-tools text-success sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-success ml-1">작업</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="task_cnt_PM" data-toggle="tooltip" data-html="true" data-placement="right" title=""></span>
										</div>
										<hr>
										<div class="h5 mb-0 font-weight-bold text-gray-800 text-center">승인요청 
											<span id="task_req_cnt_PM" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- Risk (부장) -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#f6c23e !important;">
									<div class="card_header">
										<i class="bi bi-exclamation-triangle text-warning sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-warning ml-1">리스크</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="risk_cnt_PM" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- Output (부장) -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#36b9cc !important;">
									<div class="card_header">
										<i class="bi bi-sd-card text-info sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-info ml-1">산출물</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="output_cnt_PM" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 기타 직급 사용자일 경우 -->
							<!-- Project -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#4e73df !important;">
									<div class="card_header">
										<i class="bi bi-clipboard-check text-primary sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-primary ml-1">프로젝트</h6>
									</div>
									<div class="card-body">
										<div class="h4 mt-4 mb-0 font-weight-bold text-gray-800 text-center">
											<span id="project_cnt" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- Task -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#1cc88a !important;">
									<div class="card_header">
										<i class="bi bi-tools text-success sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-success ml-1">작업</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="task_cnt" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- Risk -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#f6c23e !important;">
									<div class="card_header">
										<i class="bi bi-exclamation-triangle text-warning sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-warning ml-1">리스크</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="risk_cnt" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- Output -->
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card shadow h-100 " style="border-color:#36b9cc !important;">
									<div class="card_header">
										<i class="bi bi-sd-card text-info sum_icon"></i>
										<h6 class="m-0 font-weight-bold text-info ml-1">산출물</h6>
									</div>
									<div class="card-body">
										<div class="h4 mb-0 mt-4 font-weight-bold text-gray-800 text-center">
											<span id="output_cnt" data-toggle="tooltip" data-html="true" data-placement="right"></span>
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<!-- 차트 -->
				<div class="row">
		            <!-- Donut Chart -->
	               <div class="col-xl-4 col-lg-4">
	                   <div class="card shadow mb-4">
	                       <!-- Card Header - Dropdown -->
	                       <div class="card_header pt-3">
	                           <h6 class="m-0 font-weight-bold text-dark">리스크 상태</h6>
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
	               <div class="col-xl-8 col-lg-8">
	                   <div class="card shadow mb-4">
	                       <div class="card_header pt-3">
	                           <h6 class="m-0 font-weight-bold text-dark">월별 리스크 발생</h6>
	                       </div>
	                       <div class="card-body">
	                           <div class="chart-bar">
	                               <canvas id="myBarChart" style="height:300px;"></canvas>
	                           </div>
	                       </div>
	                   </div>
	        		</div>       
	           </div>
	           
	           <!-- 프로젝트 북마크 -->
	           <div class="card shadow">
		           <div class="card_header justify-content">
		               <h5 class="mb-0 font-weight-bold text-dark mt-2" style="display:inline-block;">프로젝트 북마크</h5>
		               <div class="float-right padding-right;">
		               		<button id="bookmark_btn" class="btn btn-primary btn-sm text-right">수정</button>
		               </div>
		           </div>
		           <div class="card-body">
		           	<table id="bookmark_tab" class="table table-hover table-responsive-sm">
		           		<thead class="text-dark">
				           <tr id="thead">
								<td>프로젝트명</td>
								<td>PM</td>
								<td>시작일</td>
								<td>종료일</td>
								<td>남은기한</td>
				           </tr>
						</thead>
						<tbody class="text-secondary">  
				    	</tbody>
			       	</table>
		           </div>
		       </div>
	           
	           <!-- 공지사항 -->
	           <div class="card shadow">
		           <div class="card_header">
		               <h5 class="mb-0 font-weight-bold text-dark mt-2" style="display:inline-block;">공지사항</h5>
		           </div>
		           <div class="card-body" id="proj_tab">
		           	<table id="notice_tab" class="table table-hover table-responsive-sm text-center">
		           		<thead class="text-dark font-weight-bold">
				           <tr id="thead">
				              <td>제목</td>
				              <td>작성자</td>
				              <td>작성일자</td>
				              <td>조회수</td>
				           </tr>
						</thead>
						<tbody class="text-primary">
							<c:forEach var="board" items="${notice}" varStatus="status">
								<input type="hidden" value="${board.bcode}"/>
								<tr onClick="location.href='${path}/board.do?method=detail&bcode=${board.bcode}'"
									style="cursor:pointer">
									<td>${board.btitle}</td>
									<td><span class="emp_name">
											<input class="emp_id" type="hidden" value="${board.id}"/>
											${board.name}		
										</span></td>
									<td>${board.regdte}</td>
									<td>${board.readcnt}</td>
								</tr>
							</c:forEach>
				    	</tbody>
			       	</table>
		           </div>
		       </div>
	        </div>
			
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	
	<!-- project bookmark modal -->
	<div id="bookmark_modal" class="modal fade">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					 <h5 class="mb-0 font-weight-bold text-dark mt-2" style="display:inline-block;">프로젝트 북마크 수정</h5>
				</div>
				<div class="modal-body">
					<table id="modal_project_tab" class="table table-hover table-responsive-sm text-center">
						<thead class="text-dark font-weight-bold">
							<tr id="thead">
								<td>프로젝트명</td>
								<td>PM</td>
								<td>시작일</td>
								<td>종료일</td>
								<td>남은기간</td>
								<td>북마크</td>
							</tr>
						</thead>
						<tbody class="text-dark">
							<c:forEach var="proj" items="${projectList}" varStatus="status">
								<input class="proj_pcode" type="hidden" value="${proj.pcode}"/>
								<tr>
									<td class="text-left">${proj.pname}</td>
									<td><span class="emp_name">
											<input class="emp_id" type="hidden" value="${proj.pmId}"/>
											${proj.pmName}
										</span></td>
									<td>${proj.startDate}</td>
									<td>${proj.endDate}</td>
									<td>${proj.status}</td>
									<td>
										<!-- 북마크 아이콘 표시 -->
										<div class="bi bookmark_icon text-dark">
											<!-- 북마크 아이콘 상태 초기화 -->
											<c:choose>
												<c:when test="${proj.explanation eq ' '}">
													<i class="bi-bookmark-plus"></i>
													<i class="bi-bookmark-star-fill" style="display:none;"></i>
													<input type="checkbox" style="display:none;"/>
												</c:when>
												<c:otherwise>
													<i class="bi-bookmark-plus" style="display:none;"></i>
													<i class="bi-bookmark-star-fill"></i>
													<input type="checkbox" checked style="display:none;"/>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	loginCheck();
	// 프로젝트/작업/리스크/산출물 수 출력
	loadCountAll();
	//bookmark 목록 출력
	loadBookmark();
	//modal 창 닫는 이벤트 바인딩.
	$('#bookmark_modal').on('hide.bs.modal',loadBookmark);
	//툴팁
	$('[data-toggle="tooltip"]').tooltip();
})
function tooltipfunc(){
	$('[data-toggle="tooltip"]').tooltip();
}

function loginCheck(){
	if(${sessionScope.user eq null}){
		alert("로그인이 필요합니다.");
		location.href="${path}/index.do";
	}
}


let isPM = ${sessionScope.user.rank eq '부장'};

var msg = "${msg}";
if(msg!=null && msg!="") {
	alert(msg);
}
//Pie Chart Example
(function loadpPieChart(){
	let riskStatusArr = JSON.parse('${riskStatus}');
	let statusArr = [];
	let cntArr = [];
	riskStatusArr.forEach(function(item, index, arr){
		statusArr.push(item.status);
		cntArr.push(item.cnt);
	});
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: statusArr,
	    datasets: [{
	      data: cntArr,
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#E2A9F3'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#DA81F5'],
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
})();



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
(function loadBarChart(){
	var ctx = document.getElementById("myBarChart");
	let riskMonthlyArr = JSON.parse('${riskMonthly}');
	let countArr = [];
	let monthArr = [];
	riskMonthlyArr.forEach(function(obj, index, arr){
		countArr.push(obj.count);
		monthArr.push(obj.month);
	});
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: monthArr,
	    datasets: [{
	      label: "Risk",
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      data: countArr,
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
	          max: Math.ceil(Math.max.apply(null,countArr)/10)*10,
	          maxTicksLimit: 10,
	          padding: 5,
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
})();


$('#bookmark_btn').on('click',function(){
	$('#bookmark_modal').modal('show');
})



$('#bookmark_modal .bookmark_icon').click(function(){
	if($(this).children('input[type=checkbox]').is(":checked")){
		bookmarkOff(this);
	}else{
		bookmarkOn(this);
	}
});

// 북마크 추가 함수. bookmark_icon class 입력
function bookmarkOn(obj){
	$(obj).children('input[type=checkbox]').attr('checked',true);
	$(obj).children('i').eq(0).hide();
	$(obj).children('i').eq(1).show();
	let index = $('#modal_project_tab .bookmark_icon').index($(obj));
	let pcode = $('#modal_project_tab .proj_pcode').eq(index).val();
	insertBookmark(pcode);
}
// 북마크 제거 함수. bookmark_icon class 입력
function bookmarkOff(obj){
	$(obj).children('input[type=checkbox]').attr('checked',false);
	$(obj).children('i').eq(0).show();
	$(obj).children('i').eq(1).hide();
	let index = $('#modal_project_tab .bookmark_icon').index($(obj));
	let pcode = $('#modal_project_tab .proj_pcode').eq(index).val();
	deleteBookmark(pcode);
}

// bookmark list 를 Database에서 가져온 후 화면에 출력.
function loadBookmark(){
	$.ajax({
		url:'dashboard/bookmarkList.do',
		type:'post',
		dataType:'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			bookmarkListCallback(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}
// bookmark Database Table 에 프로젝트의 pcode 추가.
function insertBookmark(pcode){
	$.ajax({
		url:'dashboard/insertBookmark.do',
		type:'post',
		data:'pcode='+pcode,
		//dataType:'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
		},
		error:function(e){
			console.log(e);
		}
	});
}
// bookmark Database Table 에 프로젝트의 pcode 제거.
function deleteBookmark(pcode){
	$.ajax({
		url:'dashboard/deleteBookmark.do',
		type:'post',
		data:'pcode='+pcode,
		//dataType:'json',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
		},
		error:function(e){
			console.log(e);
		}
	});
}
// bookmark list를 화면에 업데이트. ajax로 가져왔을 때 실행.
function bookmarkListCallback(projectArr){
	let tableHTML = '';
	projectArr.forEach(function(proj,index,arr){
		tableHTML +='<input type="hidden" value="'+proj.pcode+'"/>'
					+'<tr><td>'	+ proj.pname+'</td>'
					+'<td><span class="emp_name">'+proj.pmName
					+'<input class="emp_id" type="hidden" value="'+proj.pmId+'"/></span></td>'
					+'<td>'+proj.startDate+'</td>'
					+'<td>'+proj.endDate+'</td>'
					+'<td>'+proj.status+'</td></tr>';
	});
	$('#bookmark_tab tbody').html(tableHTML);
	$('#bookmark_tab tbody .emp_name').each(function(index,item){
		bindUserTooltip(item);
	});
}

function loadCountAll(){
	let nameListObj = JSON.parse('${nameList}');
	if(isPM){
		updateCntSpan(nameListObj.projectPM, $('#project_cnt_PM'));
		updateCntSpan(nameListObj.taskPM, $('#task_cnt_PM'));
		updateCntSpan(nameListObj.taskReqPM, $('#task_req_cnt_PM'));
		updateCntSpan(nameListObj.riskPM, $('#risk_cnt_PM'));
		updateCntSpan(nameListObj.outputPM, $('#output_cnt_PM'));
	}else{
		updateCntSpan(nameListObj.project, $('#project_cnt'));
		updateCntSpan(nameListObj.task, $('#task_cnt'));
		updateCntSpan(nameListObj.risk, $('#risk_cnt'));
		updateCntSpan(nameListObj.output, $('#output_cnt'));	
	}
}

function updateCntSpan(list, $spanObj){
	let tooltip='';
	list.forEach(function(pname,index,arr){
		if(index!=0) tooltip+='<br>';
		tooltip += index+1+'. '+pname;
	});
	$spanObj.prop('title',tooltip);
	$spanObj.html(list.length);	
}

function loadEmpInfo(id){
	$.ajax({
		url:'dashboard/empInfo.do',
		type:'post',
		data:'id='+id,
		dataType:'json',
		async:false,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			return data;
		},
		error:function(e){
			console.log(e);
		}
	})
}

$('.emp_name').each(function(index, item){
	bindUserTooltip(item);
});
function bindUserTooltip($nameSpan){
	$($nameSpan).each(function(){
		let $nameSpan = $(this);
		let id = $(this).children('.emp_id').val();
		$.ajax({
			url:'dashboard/empInfo.do',
			type:'post',
			data:'id='+id,
			dataType:'json',
			async:false,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(userObj){
				tooltip = '['+userObj.dept+' '+userObj.rank+']'+userObj.name+'('+userObj.id+')';
				bindTooltip($nameSpan,tooltip);
			},
			error:function(e){
				console.log(e);
			}
		})
	});
}
function bindTooltip($obj,tooltip){
	$obj.prop({'data-toggle':'tooltip','data-html':'true','data-placement':'right','title':tooltip});
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
</html>