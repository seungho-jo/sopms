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
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
#row {
	width: 90%;
	margin: auto;
	min-height: 1000px;
	display: flex;
}

#pro1 {
	width: 19%;
	height: 100%;
	padding: 1%;
	background-color: white;
	border-radius: 20px;
	margin: 0 0.5%;
	background-color: white;
	text-align : center;
}

#tab1 {
	width: 100%;
	margin: 15% 0;
}

#pro2 {
	width: 79%;
	height: 100%;
	padding: 1%;
	background-color: white;
	border-radius: 20px;
	margin: 0 0.5%;
	padding: 1%;
}

#tab2 {
	width: 100%;
}

.circle {
	background-color: White;
	border: 2px rgb(52, 57, 87) solid;
	width: 100px;
	height: 100px;
	-webkit-border-radius: 150px;
	align: center;
	vertical-align: middle;
	margin: auto;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div id="container">
				<div style="margin: 0 0 2% 5%">
					<h1 class="fw-bold">프로필</h1>
				</div>
				<div id="row">
					<div id="pro1">
						<center>
							<img src="images/profile.jpg"
								style="display: block; marign: auto;" align="middle"
								width="150px" height="150px">
						</center>
						<table id="tab1" class="text-dark text-center"
							style="font-size: 20px">
							<tr>
								<th>이름</th>
								<td>김재성</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>1995.06.02</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>강남구</td>
							</tr>
							<tr>
								<th>부서</th>
								<td>개발팀</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>사원</td>
							</tr>

						</table>
						<button class="btn btn-primary">정보 수정</button>
					</div>

					<div id="pro2">
						<table id="tab2" style="font-size: 21px; text-align: center;">
							<tr>
								<th>진행중인 작업</th>
								<th>새로운 작업</th>
								<th>취소한 작업</th>
							</tr>
							<tr style="text-align: center; line-height: 90px;">
								<td class="text-center"><div class="circle">
										<a href="">3</a>
									</div></td>
								<td class="text-center">
									<div class="circle">
										<a href="">2</a>
									</div>
								</td>
								<td class="text-center">
									<div class="circle">
										<a href="">4</a>
									</div>
								</td>
							</tr>
							<tr>
								<th>프로젝트</th>
								<th>새로운 채팅</th>
								<th>결제대기</th>
							</tr>
							<tr style="text-align: center; line-height: 90px;">
								<td class="text-center"><div class="circle">
										<a href="">1</a>
									</div></td>
								<td class="text-center">
									<div class="circle">
										<a href="">2</a>
									</div>
								</td>
								<td class="text-center">
									<div class="circle">
										<a href="">2</a>
									</div>
								</td>
							</tr>
						</table>
						<div style="margin-top: 8%; padding: 2%;">
							<h3>참여 프로젝트</h3>
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
											<div class="progress" style="height: 15px;">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
													style="width: 10%;">
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
											<div class="progress" style="height: 15px;">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
													style="width: 90%;">
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
											<div class="progress" style="height: 15px;">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
													style="width: 90%;">
													<span>90%</span>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin-top: 8%; padding: 2%;">
							<h3>내 작업</h3>
							<table class="text-dark table table-hover table-responsive-sm"
								id="tab_output">
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
									<td>김재성</td>
									<td>2021.10.05</td>
								</tr>
								<tr>
									<td>4</td>
									<td>화면 설계서</td>
									<td><a href="#" class="text-dark">설계서0.1.jpg</a></td>
									<td>김재성</td>
									<td>2021.10.01</td>
								</tr>
								<tr>
									<td>3</td>
									<td>주간 보고서</td>
									<td><a href="#" class="text-dark">주간 보고서.xlsx</a></td>
									<td>김재성</td>
									<td>2021.09.28</td>
								</tr>
								<tr>
									<td>2</td>
									<td>UI/UX 분석</td>
									<td><a href="#" class="text-dark">분석.xml</a></td>
									<td>김재성</td>
									<td>2021.09.27</td>
								</tr>
								<tr>
									<td>1</td>
									<td>업무 계획서</td>
									<td><a href="#" class="text-dark">업무 계획서.txt</a></td>
									<td>김재성</td>
									<td>2021.08.31</td>
								</tr>
							</table>
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
</html>