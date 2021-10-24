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
	href="${path}/images/favicon.png">
<link rel="stylesheet"
	href="${path}/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${path}/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="${path}/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="${path}/css/style.css" rel="stylesheet">
<link href="${path}/css/myWork.css" rel="stylesheet">
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
				<div class="card-body">
					<form style="display: flex;" method="post">
					<input type="hidden" name="curPage" value="1"/>
						<select id="status" name="status" class="form-select">
							<option value="">상태 선택</option>
							<option value="진행중">진행중</option>
							<option value="반려됨">반려됨</option>
							<option value="승인요청">승인요청</option>
							<option value="종료됨">종료됨</option>
						</select> 
						<select id="proOrsub" class="form-select">
							<option value="">검색어 선택</option>
							<option value="pname">프로젝트명</option>
							<option value="title">작업명</option>
						</select>
						<div class="input-group" id="gp1">
							<input type="text" id="search" class="form-control input-sm">
							<div class="input-group-append">
								<button class="btn btn-primary">검색하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="card">
			<h2 id="card-title">내 작업</h2>
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
									<th class="text-dark text-center">시작일</th>
									<th class="text-dark text-center">완료일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="wlist" items="${list}">
								<fmt:parseDate var="start_date1" value="${wlist.start_date}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate  var="start_date2" value="${start_date1}" type="DATE" pattern="yyyy-MM-dd"/>
								<fmt:parseDate var="end_date1" value="${wlist.end_date}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate  var="end_date2" value="${end_date1}" type="DATE" pattern="yyyy-MM-dd"/>
									<tr onclick="javascript:go(${wlist.workcode})">
										<th><input type="checkbox" class="text-dark"></th>
										<td class="text-dark text-center">${wlist.title}</td>
										<td class="text-dark text-center">${wlist.pname}</td>
										<td class="text-dark text-center">${wlist.pm_name}</td>
										<td class="text-dark text-center boxes"><span>${wlist.status}</span></td>
										<td class="text-dark text-center">${start_date2}</td> 
										<td class="text-dark text-center">${end_date2}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link" href="javascript:goBlock(${workSch.curPage-1})">Pre</a></li>
					<c:forEach var="cnt" begin="${workSch.startBlock}" end="${workSch.endBlock}">
					<li class="page-item ${workSch.curPage==cnt?'active':''}"><a class="page-link" href="javascript:goBlock(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item" id="next"><a class="page-link" href="javascript:goBlock(${workSch.curPage+1})">
							Next
					</a></li>
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


<script src="${path}/js/dashboard/dashboard-1.js"></script>
<script type="text/javascript">
	$(".metismenu").children().eq(6).attr('class', 'mm-active');
	$("#paging").children("li").click(function() {
		$("#paging").children("li").attr('class', 'page-item');
		$(this).attr('class', 'page-item active');
	});
	var arr = [];
	for(var i=1;i<$("tr").length;i++){
		var status = $("tr").eq(i).children("td:eq(3)").text();
		if(status=="반려됨"){
			$("tr").eq(i).children("td:eq(3)").children("span").attr("class","badge badge-danger");
		}else if(status=="진행중"){
			$("tr").eq(i).children("td:eq(3)").children("span").attr("class","badge badge-info");
		}else if(status=="종료됨"){
			$("tr").eq(i).children("td:eq(3)").children("span").attr("class","badge badge-success");
		}else if(status=="승인요청"){
			$("tr").eq(i).children("td:eq(3)").children("span").attr("class","badge badge-warning");
		}
	}
	function goBlock(no){
		$("[name=curPage]").val(no);
		$("form").submit();
	}
	function go(no){
		$(location).attr("href",
				"${path}/detailWork.do?workcode="+no);
	}
	var status = "${param.status}";
	if(status!=null&&status!=""){
		$("#status option[value="+status+"]").attr('selected','selected');
	}
	$("#proOrsub").change(function(){
		if($(this).val()=='title'){
			$("#search").attr("name",'title')
		}else if($(this).val()=='pname'){
			$("#search").attr("name",'pname')
		}
	})
</script>
</html>