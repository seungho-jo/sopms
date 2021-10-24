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
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
#pro1 {
	text-align: center;
}

.circle {
	background-color: White;
	border: 3px Black solid;
	width: 100px;
	height: 100px;
	-webkit-border-radius: 150px;
	align: center;
	vertical-align: middle;
	margin: 30px 70px;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div class="container">
						<h1>회원 정보 수정</h1>
						<div id="pro1">
						<div class="row">
						<div>
							<center>
								<img src="images/profile.jpg"
									style=width="200px" height="200px">
							</center>
							<button>프로필 수정</button>
						</div>
						<div id="pro2">
							<table id="tab1" style="font-size: 25px; text-align: center;">
								<tr>
									<th>이름</th>
									<td>김재성</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>qaz123</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>1234</td>
									<td><button>수정</button></td>
								</tr>
								<tr>
									<th>생일</th>
									<td>1995.06.02</td>
									<td><button>수정</button></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>강남구</td>
									<td><button>수정</button></td>
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
						</div>
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