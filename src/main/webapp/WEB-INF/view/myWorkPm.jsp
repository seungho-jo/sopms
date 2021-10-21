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
<link href="./css/myWorkPm.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
#btnCol {
	margin: 2% 0 0% 4%;
}
#close {
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
}

#close:hover {
	background-color: rgba(0, 0, 0, 1);
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
				<h2 id="card-title">요청된 작업</h2>
				<div id="btnCol">
					<button class="btn btn-primary" id="reqConfirm" data-toggle="modal"
						data-target="#exampleModalCenter1">작업승인</button>
					<button class="btn btn-danger" id="companion" data-toggle="modal"
						data-target="#exampleModalCenter2">작업반려</button>
				</div>
				<form method="post" id="pageGo">
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
									<fmt:parseDate var="apprdate1" value="${wlist.reqdate}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="apprdate2" value="${apprdate1}"
										type="DATE" pattern="yyyy-MM-dd" />
									<tr>
										<th class="text-center"><input type="checkbox" class="text-dark" value="${wlist.workcode}"></th>
										<td class="text-dark text-center" onclick="javascript:go(${wlist.workcode})">${wlist.title}</td>
										<td class="text-dark text-center">SL솔루션 homepage</td>
										<td class="text-dark text-center">${wlist.m_name}</td>
										<td class="text-dark text-center boxes"><span
											class="badge badge-warning">${wlist.status}</span></td>
										<td class="text-dark text-center">${apprdate2}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link"
						href="javascript:goBlock(${workPmSch.startBlock-1})">Pre</a></li>
					<c:forEach var="cnt" begin="${workPmSch.startBlock}"
						end="${workPmSch.endBlock}">
						<li class="page-item ${workPmSch.curPage==cnt?'active':''}"><a
							class="page-link" href="javascript:goBlock(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item" id="next"><a class="page-link"
						href="javascript:goBlock(${workPmSch.endBlock-1})"> Next </a></li>
				</ul>
				<div class="modal fade" id="exampleModalCenter1">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form method="post" id="appr" enctype="multipart/form-data"
								action="approval.do">
								<input type="hidden" name="workcode" value="">
								<div class="modal-header">
									<h5 class="modal-title">작업 승인</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea class="form-control" rows="7" style="resize: none;"
										name="apprmsg"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn" id="close"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="apprBtn">작업승인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModalCenter2">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<form method="post" id="comp" enctype="multipart/form-data"
								action="companion.do">
								<input type="hidden" name="workcode" value="">
								<div class="modal-header">
									<h5 class="modal-title">작업 반려</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span>&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea class="form-control" rows="7" style="resize: none;"
										name="compmsg"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn" id="close"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-danger" id="compBtn">작업반려</button>
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
function goBlock(no){
	$("[name=curPage]").val(no);
	$("#pageGo").submit();
}
function go(no){
	$(location).attr("href",
			"${path}/detailWorkPm.do?workcode="+no);
}
var arry = new Array();
$("input:checkbox").on("click",function(){
	if($("input:checkbox").is(":checked") == true) {
		arry.push($(this).val());
	}else{
		arry = arry.filter((element) => element != $(this).val());
	}
})
$("#apprBtn").click(function(){
	$("[name=workcode]").val(arry);
	$("#appr").submit();
});
$("#compBtn").click(function(){
	$("[name=workcode]").val(arry);
	$("#comp").submit();
});
</script>
</html>