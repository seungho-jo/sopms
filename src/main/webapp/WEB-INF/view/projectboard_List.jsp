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
<title>SOPMS</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
h3 {
	border-bottom: 1px solid f9f9f9;
	padding-bottom: 5px;
}
table {
text-align: center;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div class="card">
				<div class="card-header" id="title" style="display: block;">
					<h3>팀 커뮤니티</h3>
				</div>
				<div class="card-body">
					<button type="button" onclick="location.href='projectboard_Insert.jsp'" class="btn btn-primary">작성</button>
					<div class="table-responsive">
						<table class="table table-responsive-sm table-hover">
							<col width="10%">
							<col width="54%">
							<col width="13%">
							<col width="13%">
							<col width="10%">
							<thead>
								<tr>
									<th class="text-dark">글번호</th>
									<th class="text-dark">제목</th>
									<th class="text-dark">작성자</th>
									<th class="text-dark">등록일자</th>
									<th class="text-dark">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">10</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">9</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">8</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">7</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">6</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">5</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">4</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">3</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">2</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
								</tr>
								<tr onclick="location.href='projectboard_Detail.jsp'">
									<td class="text-dark">1</td>
									<td class="text-dark">파일요청의 건</td>
									<td class="text-dark">홍길동</td>
									<td class="text-dark">2021-10-04</td>
									<td class="text-dark">3</td>
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
					<li class="page-item" id="next"><a class="page-link"> Next
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

	$(".metismenu").children().eq(12).attr('class','mm-active');

</script>
</html>