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
<style type="text/css">
	a{
		text-decoration : none;
	}
	#tab_output{
		margin-top : 2%;
	}
</style>
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body>
	<div>
		<h3 class="font-weight-bold">산출물</h3>
		<table class="text-dark table table-hover table-responsive-sm" id="tab_output">
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<tr>
				<th>no</th>
				<th>작업명</th>
				<th>산출물</th>
				<th>작업자</th>
				<th>등록날자</th>
			</tr>
			<tr>
				<td>5</td>
				<td>주간 보고서</td>
				<td><a href="#" class="text-dark">주간보고서.xlsx</a></td>
				<td>조승호</td>
				<td>2021.10.05</td>
			</tr>
			<tr>
				<td>4</td>
				<td>화면 설계서</td>
				<td><a href="#" class="text-dark">설계서0.1.jpg</a></td>
				<td>조승호</td>
				<td>2021.10.01</td>
			</tr>
			<tr>
				<td>3</td>
				<td>주간 보고서</td>
				<td><a href="#" class="text-dark">주간 보고서.xlsx</a></td>
				<td>김철수</td>
				<td>2021.09.28</td>
			</tr>
			<tr>
				<td>2</td>
				<td>UI/UX 분석</td>
				<td><a href="#" class="text-dark">분석.xml</a></td>
				<td>조승호</td>
				<td>2021.09.27</td>
			</tr>
			<tr>
				<td>1</td>
				<td>업무 계획서</td>
				<td><a href="#" class="text-dark">업무 계획서.txt</a></td>
				<td>PM01</td>
				<td>2021.08.31</td>
			</tr>
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