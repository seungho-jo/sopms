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
				<form method="post">
					<input type="hidden" name="curPage" value="1">
				</form>	
				<div class="card-body" id="card-body">
					<div class="table-responsive">
						<table class="table table-hover table-responsive-sm" id="workList">
							<thead>
								<tr>
									<th class="text-dark text-center">#</th>
									<th class="text-dark text-center">작업</th>
									<th class="text-dark text-center">프로젝트</th>
									<th class="text-dark text-center">담당자</th>
									<th class="text-dark text-center">상태</th>
									<th class="text-dark text-center">승인요청날자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="wlist" items="${list}">
								<fmt:parseDate var="apprdate1" value="${wlist.reqdate}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate  var="apprdate2" value="${apprdate1}" type="DATE" pattern="yyyy-MM-dd"/>
									<tr onclick="javascript:go(${wlist.workcode})">
										<th><input type="checkbox" class="text-dark"></th>
										<td class="text-dark text-center">${wlist.title}</td>
										<td class="text-dark text-center">SL솔루션 homepage</td>
										<td class="text-dark text-center">${wlist.m_name}</td>
										<td class="text-dark text-center boxes"><span class="badge badge-warning">${wlist.status}</span></td>
										<td class="text-dark text-center">${apprdate2}</td> 
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link" href="javascript:goBlock(${workPmSch.startBlock-1})">Pre</a></li>
					<c:forEach var="cnt" begin="${workPmSch.startBlock}" end="${workPmSch.endBlock}">
					<li class="page-item ${workPmSch.curPage==cnt?'active':''}"><a class="page-link" href="javascript:goBlock(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item" id="next"><a class="page-link" href="javascript:goBlock(${workPmSch.endBlock-1})">
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
function goBlock(no){
	$("[name=curPage]").val(no);
	$("form").submit();
}
function go(no){
	$(location).attr("href",
			"${path}/detailWorkPm.do?workcode="+no);
}
	
</script>
</html>