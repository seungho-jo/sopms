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
<link href="./css/myWorkPm.css" rel="stylesheet">
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
				<h2 id="card-title">요청된 작업</h2>
				<div id="colBtn">
					<button class="btn btn-primary" id="reqConfirm">작업승인</button>
					<button class="btn btn-danger" id="companion">작업반려</button>
				</div>
				<div class="card-body" id="card-body">
					<div class="table-responsive">
						<table class="table table-hover table-responsive-sm" id="workList">
							<thead>
								<tr>
									<th class="text-dark">#</th>
									<th class="text-dark">작업</th>
									<th class="text-dark">프로젝트</th>
									<th class="text-dark">담당자</th>
									<th class="text-dark">상태</th>
									<th class="text-dark">시작일</th>
									<th class="text-dark">완료일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark"><a href="detailWorkPm.jsp" class="text-dark">주간 보고서</a></td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 요구사항 정의서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">index page</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-danger">반려됨</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">진행중</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/25</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
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
</html>