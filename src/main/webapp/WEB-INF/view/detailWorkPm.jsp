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
<style type="text/css">
#project {
	width: 90%;
	margin: auto;
	padding: 0 0 2% 0;
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
}

#content {
	padding: 2% 2% 5% 2%;
	background-color: white;
	width: 90%;
	min-height: 450px;
	margin: auto;
	margin-top: 2%;
	border-radius: 10px;
	box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
}

#content h3 {
	padding-bottom: 1%;
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
}

#content table {
	width: 100%;
	color: black;
}

#content table tr {
	height: 4vw;
}

#content table tr th {
	font-size: 17px;
}

#btnCol {
	margin-top: 3%;
	padding-top: 2%;
	border-top: 2px solid rgba(0, 0, 0, 0.1);
}

#reqConfirm {
	margin-right: 1%;
}

#companion {
	margin-right: 1%;
}

#back {
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
}

#back:hover {
	background-color: rgba(0, 0, 0, 1);
}
#close {
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
}

#close:hover {
	background-color: rgba(0, 0, 0, 1);
}
#fname{
	line-height : 35px;
}
#fname:hover{
	cursor:pointer;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<h1 id="project">SL솔루션 homepage</h1>
			<div id="content">
				<h3>주간 보고서</h3>
				<table>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
					<fmt:parseDate var="start_date1" value="${detail.start_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate  var="start_date2" value="${start_date1}" type="DATE" pattern="yyyy-MM-dd"/>
					<fmt:parseDate var="end_date1" value="${detail.end_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate  var="end_date2" value="${end_date1}" type="DATE" pattern="yyyy-MM-dd"/>
					<tr>
						<th>작업 시작일</th>
						<td>${start_date2}</td>
						<th>작업 완료일</th>
						<td>${end_date2}</td>
					</tr>
					<tr>
						<th>승인 요청자</th>
						<td>${detail.m_name}</td>
						<th>상태</th>
						<td>${detail.status}</td>
					</tr>
					<tr>
						<th>작업 내용</th>
						<td>${detail.content}</td>
						<th>승인 메시지</th>
						<td>${detail.reqmsg}</td>
					</tr>
					<!-- 파일 다운로드 배울시 변경 예정 -->
					<tr>
						<th>첨부파일</th>
						<td><div class="custom-file" id="fname">
								${detail.fname == null?'':detail.fname}
							</div></td>
					</tr>
				</table>
				<div id="btnCol">
					<button class="btn btn-primary" id="reqConfirm" data-toggle="modal" data-target="#exampleModalCenter1">작업승인</button>
					<button class="btn btn-danger" id="companion" data-toggle="modal" data-target="#exampleModalCenter2">작업반려</button>
					<button class="btn btn" id="back">뒤로가기</button>
				</div>
				<div class="modal fade" id="exampleModalCenter1">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
						<form method="post" id="appr" enctype="multipart/form-data" action="approval.do">
							<input type="hidden" name="workcode" value="${param.workcode}">
							<div class="modal-header">
								<h5 class="modal-title">작업 승인</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<textarea class="form-control" rows="7" style="resize : none;" name="apprmsg"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn" id="close"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary" >작업승인</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModalCenter2">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form method="post" id="comp" enctype="multipart/form-data" action="companion.do">
							<input type="hidden" name="workcode" value="${param.workcode}">
							<div class="modal-header">
								<h5 class="modal-title">작업 반려</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<textarea class="form-control" rows="7" style="resize : none;" name="compmsg"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn" id="close"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-danger" >작업반려</button>
							</div>
							</form>
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
<script type="text/javascript">
	$(".metismenu").children().eq(6).attr('class', 'mm-active');
	// custom-file-input custom-file-label
	$(".custom-file-input").on("change", function() {
		$(this).next(".custom-file-label").text($(this).val());
	})
	$("#back").click(function(){
		history.back();
	})
	$("#fname").click(function(){
		location.href="${path}/download.do?fname="+$(this).text();
	})
</script>
</html>