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
<link href="./css/risk_Index.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
#card-title{
	margin: 2% 0px 0px 1%;
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
			<div class="card-body">
				<form style="display: flex;">
					<select id="status" class="form-select">
						<option>himan</option>
						<option>higirl</option>
						<option>yjkim</option>
					</select>
				<div class="input-group" id="gp1">
					<input type="text" class="form-control input-sm">
						<div class="input-group-append">
							<button class="btn btn-primary">검색</button>
						</div>
				</div>
				</form>
			</div>
		</div>
		
		<div class="card">
		<h2 id="card-title">리스크</h2>
			<div class="card-body">
				<button type="button" class="btn btn-primary" id="button" onclick="location.href='risk_Insert.jsp'">등록하기</button>
			<div id="content_cnt">
				<h6 id="title">전체게시글 : 5</h6>	
			</div>
		<div class="table-responsive">
		<table id="bootstrap-data-table" class="table table-hover table-responsive-sm" width="100%" align="center">
			<thead>
				<tr>
					<th class="text-dark">리스크 제목</th>
					<th class="text-dark">등록자</th>
					<th class="text-dark">등록일</th>
					<th class="text-dark">리스크 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-dark"><a href="risk_Update.jsp">리스크1</td>
					<td class="text-dark">himan</td>
					<td class="text-dark">2021.09.28</td>
					<td class="text-dark"><span class="badge bg-success">조치완료</span></td>
				</tr>
				<tr>
					<td class="text-dark">리스크2</td>
					<td class="text-dark">higirl</td>
					<td class="text-dark">2021.09.29</td>
					<td class="text-dark"><span class="badge bg-secondary">홀드</span></td>
				</tr>
				<tr>
					<td class="text-dark">리스크3</td>
					<td class="text-dark">yjkim</td>
					<td class="text-dark">2021.09.27</td>
					<td class="text-dark"><span class="badge bg-primary">진행중</span></td>
				</tr>
				<tr>
					<td class="text-dark">리스크4</td>
					<td class="text-dark">hongildong</td>
					<td class="text-dark">2021.09.27</td>
					<td class="text-dark"><span class="badge bg-primary">진행중</span></td>
				</tr>
				<tr>
					<td class="text-dark">리스크5</td>
					<td class="text-dark">PM</td>
					<td class="text-dark">2021.09.28</td>
					<td class="text-dark"><span class="badge bg-secondary">홀드</span></td>			
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