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
<title>SOPMS - RiskIndex</title>
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
<title>리스크</title>
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
<script type="text/javascript">
</script>

<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
		<div class="card">
			<div class="card-body">
				<form id="frm01" style="display: flex;" action="${path}/riskPageList.do" method="post">
					<input type="hidden" name="curPage">
					<select id="status" class="form-select">
						<option>himan</option>
						<option>higirl</option>
						<option>yjkim</option>
					</select>
				<div class="input-group" id="gp1">
					<input type="text" class="form-control input-sm" name="risk_name" value="${param.risk_name}" placeholder="리스크명">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">검색</button>
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
				<h6 id="title">전체게시글 : ${riskSch.count}</h6>	
			</div>
		<div class="table-responsive">
		<table id="bootstrap-data-table" class="table table-hover table-responsive-sm" width="100%" align="center">
			<thead>
				<tr class="text-center">
					<th class="text-dark">번호</th>
					<th class="text-dark">리스크명</th>
					<th class="text-dark">등록자</th>
					<th class="text-dark">리스크상태</th>
					<th class="text-dark">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rk" items="${list}">
				<tr class="text-center">
					<td class="text-dark">${rk.risk_no}</td>
					<td class="text-dark">${rk.risk_name}</td>
					<td class="text-dark">${rk.id}</td>
					<td class="text-dark">${rk.risk_status}</td>
					<td class="text-dark">${rk.risk_reg}</td>
				</tr>		
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		<ul class="pagination justify-content-center">
		
		  <li class="page-item"><a class="page-link" 
		  	href="javascript:goPage(${riskSch.startBlock-1})">Previous</a></li>
		  
			  <c:forEach var="cnt" begin="${riskSch.startBlock}" 
			  	end="${riskSch.endBlock}">
			  <li class="page-item ${riskSch.curPage==cnt?'active':''}">
			  	<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
			  </c:forEach>
		  <li class="page-item"><a class="page-link" 
		  href="javascript:goPage(${riskSch.endBlock+1})">Next</a></li>
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
	$("[name=pageSize]").val("${riskSch.pageSize}");
	$("[name=pageSize]").change(function() {
		$("[name=curPage]").val(1);
		$("#frm01").submit();
	});
	function goPage(no) {
		console.log(1111111111111111);
		$("[name=curPage]").val(no);
		$("#frm01").submit();
	}
</script>
</html>