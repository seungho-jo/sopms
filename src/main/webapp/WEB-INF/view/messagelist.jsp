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
	href="${path}/images/favicon.png">
<link rel="stylesheet"
	href="${path}/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${path}/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="${path}/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="${path}/css/style.css" rel="stylesheet">
<link href="${path}/css/chat.css" rel="stylesheet">
<link href="${path}/css/messagelist.css" rel="stylesheet">
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

	<div class="topbar">
		<div class="chatname"></div>
	</div>
	<div id="chatbelongs">
		<div id="chats"></div>
	</div>
	<div class="inputarea">
		<div class="inputmessage">
			<div class="form-group">
				<div class="textarea">
					<textarea class="form-control" id="write" rows="4"></textarea>
				</div>
			</div>
		</div>
		<div class="optionstab">
			<ul>
				<a>
					<li class="icons"><span class="material-icons">
							add_a_photo </span></li>
				</a>
				<a>
					<li class="icons"><span class="material-icons">
							attach_file </span></li>
				</a>
			</ul>
			<button type="button" id="send" class="btn btn-light">전송</button>
		</div>
	</div>



	<div id="template">
		<div class="messagearea">
			<div class="messageitem">
				<div class="photoarea">
					<div class="photo"></div>
				</div>
				<div class="content">
					<div class="name"></div>
					<div class="message">
						<div class="chatbubble">
							<div class="bubblecontent"></div>
						</div>
						<div class="chatinfo">
							<div class="shown"></div>
							<div class="time"></div>
							<div class="fromId"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
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