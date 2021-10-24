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
<title>SOPMS</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
h3 {
	border-bottom: 1px solid f9f9f9;
	padding-bottom: 5px;
	margin: 2% 0px 0px 1%;
}

table {
	text-align: center;
}

#goinsert {
	margin-bottom: 2%;
	margin-right: 2%;
	float: left;
}

#search1 {
	width: 22%;
	position: relative;
	left: 74%;
}

#clear {
	clear: both;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="card">
			<div class="content-body">
				<h3>공지사항</h3>
				<div class="card"></div>
				<div class="card-body">
					<button type="button" id="goinsert" class="btn btn-primary">작성</button>
					<form id="frm01" style="display: flex;" method="post">
						<input type="hidden" name="curPage" value="1">
						<div class="input-group" id="search1">
							<select id="status" name="status" class="form-select">
								<option value="">분류</option>
								<option value="btitle">제목</option>
								<option value="name">작성자</option>
							</select> <input type="text" class="form-control input-sm" id="search">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button" id="searchbtn">검색</button>
							</div>
						</div>
					</form>
					<div id="clear"></div>
					<div id="content_cnt">
						<h6 id="totcount">전체게시글 : ${boardSch.count}</h6>
					</div>
					<div class="table-responsive">
						<table class="table table-responsive-sm table-hover">
							<col width="10%">
							<col width="54%">
							<col width="13%">
							<col width="13%">
							<col width="10%">
							<thead>
								<tr>
									<th class="text-dark">글번호</th>
									<th class="text-dark">제목</th>
									<th class="text-dark">작성자</th>
									<th class="text-dark">등록일자</th>
									<th class="text-dark">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bd" items="${list}">
									<tr onclick="javascript:go(${bd.bcode})">
										<td class="text-dark">${bd.bcode}</td>
										<td class="text-dark">${bd.btitle}</td>
										<td class="text-dark">${bd.name}</td>
										<td class="text-dark"><fmt:formatDate
												value="${bd.regdte}" /></td>
										<td class="text-dark">${bd.readcnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link"
						href="javascript:goBlock(${boardSch.startBlock-1})">Pre</a></li>
					<c:forEach var="cnt" begin="${boardSch.startBlock}"
						end="${boardSch.endBlock}">
						<li class="page-item ${boardSch.curPage==cnt?'active':''}"><a
							class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
					</c:forEach>
					<li class="page-item" id="next"><a class="page-link"
						href="javascript:goBlock(${boardSch.curPage+1})"> Next </a></li>
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
	$(document).ready(function() {
		var msg = "${msg}";
		if(msg!=null && msg!="") {
			alert(msg);
		}
		$("#regBtn").click(function() {
			$(location).attr("href", "${path}/board.do?method=insertform");
		});
		$("[name=pageSize]").val("${boardSch.pageSize}");
		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1);
			$("#frm01").submit();
		});
	});
	function goPage(bcode){
		$("[name=curPage]").val(bcode);
		$("#frm01").submit();
	}
	function goBlock(bcode){
		$("[name=curPage]").val(bcode);
		$("#frm01").submit();
	}
	function go(bcode){		
		$(location).attr("href",
				"${path}/board.do?method=detail&bcode="+bcode);
	}
	$("#goinsert").click(function(){
		$(location).attr("href","${path}/board.do?method=insertform");
		
	});	
	$("#searchbtn").click(function(){	
		$("#frm01").submit();
	});	
	$("#status").change(function(){
		console.log($(this).val());
		$("#search").attr("name",$(this).val());
	});

	$(".metismenu").children().eq(12).attr('class', 'mm-active');
</script>
</html>