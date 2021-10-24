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
h4 {
	border-bottom: 1px solid black;
	padding-bottom: 5px;
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
					<h4>프로젝트 리스트</h4>
				</div>
				<div class="card-body">

					<form style="display: flex;" method="post">
						<input type="hidden" name="curPage" value="1" />
						<button type="button" class="btn btn-primary" id="regBtn">등록하기</button>
					</form>
					<div class="table-responsive">
						<table class="table table-responsive-sm table-hover" width="100%"
							align="center">
							<thead>
								<tr>
									<th class="text-dark">프로젝트</th>
									<th class="text-dark">상태</th>
									<th class="text-dark">시작일</th>
									<th class="text-dark">완료일</th>
									<th class="text-dark">PM</th>
									<th class="text-dark">이슈/리스크</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="project" items="${list}">
									<fmt:parseDate var="start_date1" value="${project.startdate}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="start_date2" value="${start_date1}"
										type="DATE" pattern="yyyy-MM-dd" />
									<fmt:parseDate var="end_date1" value="${project.enddate}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="end_date2" value="${end_date1}"
										type="DATE" pattern="yyyy-MM-dd" />
									<tr onclick="javascript:go(${project.pcode})">
										<td class="text-dark">${project.pname}</td>
										<td><span>${project.status}</span></td>

										<td class="text-dark">${start_date2}</td>
										<td class="text-dark">${end_date2}</td>
										<td class="text-dark">${pm}</td>
										<td><span class="badge badge-pill badge-warning">${project.risk_cnt}</span>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link"
						href="javascript:goBlock(${project_List_paging.startBlock-1})">Pre</a></li>
					<c:forEach var="cnt" begin="${project_List_paging.startBlock}"
						end="${project_List_paging.endBlock}">
						<li class="page-item ${project_List_paging.curPage==cnt?'active':''}"><a class="page-link"
							href="javascript:goBlock(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item" id="next"><a class="page-link"
						href="javascript:goBlock(${project_List_paging.curPage+1})">
							Next </a></li>
				</ul>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>



<!-- Required vendors -->
<script src="${path}/vendor/global/global.min.js"></script>
<script src="${path}/js/quixnav-init.js"></script>
<script src="${path}/js/custom.min.js"></script>


<!-- Vectormap -->
<script src="${path}/vendor/raphael/raphael.min.js"></script>
<script src="${path}/vendor/morris/morris.min.js"></script>


<script src="${path}/vendor/circle-progress/circle-progress.min.js"></script>
<script src="${path}/vendor/chart.js/Chart.bundle.min.js"></script>

<script src="${path}/vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="${path}/vendor/flot/jquery.flot.js"></script>
<script src="${path}/vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="${path}/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="${path}/vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="${path}/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="${path}/vendor/jquery.counterup/jquery.counterup.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("[name=pageSize]").val("${project_List_paging.pageSize}");
	$("[name=pageSize]").change(function() {
		$("[name=curPage]").val(1);
		$("form").submit();
	});
});
	var arr = [];
	for(var i=1;i<$("tr").length;i++){
		var status = $("tr").eq(i).children("td:eq(1)").text();
		if(status=="종료됨"){
			$("tr").eq(i).children("td:eq(1)").children("span").attr("class","badge badge-pill badge-danger");
		}else if(status=="진행중"){
			$("tr").eq(i).children("td:eq(1)").children("span").attr("class","badge badge-pill badge-info");
		}else if(status=="완료됨"){
			$("tr").eq(i).children("td:eq(1)").children("span").attr("class","badge badge-pill badge-success");
		}
	}
	$("#regBtn").click(function(){
		location.href = "${path}/project.do?method=insertform";
	})
	function goBlock(no){
		$("[name=curPage]").val(no);
		$("form").submit();
	}
	function go(no){
		$(location).attr("href",
				"${path}/status.do?pcode="+no+"&pm=${id}");
	}
</script>
</html>