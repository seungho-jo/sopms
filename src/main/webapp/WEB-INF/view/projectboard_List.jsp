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
<title>SOPMS</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
h3 {
	border-bottom: 1px solid f9f9f9;
	padding-bottom: 5px;
}

table {
	text-align: center;
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
					<h3>커뮤니티 게시판</h3>
				</div>
				<div class="content-body">
					<div class="card">
						<div class="card-body">
							<form id="frm01" style="display: flex;" method="post">
								<input type="hidden" name="curPage" value="1"> <select
									id="status" name="status" class="form-select">
									<option value="">찾기 선택</option>
									<option value="btitle">제목</option>
									<option value="name">작성자</option>
								</select>
							</form>
						</div>
					</div>
					<div class="card-body">
						<button type="button"
							onclick="location.href='projectboard_Insert.jsp'"
							class="btn btn-primary">작성</button>
						<div id="content_cnt">
							<h6 id="title">전체게시글 : ${boardSch.count}</h6>
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
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link"
							href="javascript:goPage(${boardSch.startBlock-1})">Previous</a></li>

						<c:forEach var="cnt" begin="${boardSch.startBlock}"
							end="${boardSch.endBlock}">
							<li class="page-item ${boardSch.curPage==cnt?'active':''}">
								<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
							</li>
						</c:forEach>
						<li class="page-item"><a class="page-link"
							href="javascript:goPage(${boardSch.endBlock+1})">Next</a></li>
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
		$("#regBtn").click(function() {
			$(location).attr("href", "${path}/board.do?method=insertForm");
		});
		$("[name=pageSize]").val("${boardSch.pageSize}");
		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1);
			$("form").submit();
		});
	});
	function goPage(bcode){
		$("[name=curPage]").val(bcode);
		$("form").submit();
	}
	function go(no){		
		$(location).attr("href",
				"${path}/board.do?method=detail&bcode="+bcode);
	}
	$("#paging").children("li").click(function() {
		var id = $(this).attr('id');
		if (id == 'next') {
			if ($('.active').next().attr('id') == id) {
				alert("마지막 페이지 입니다");
				return;
			} else {
				$('.active').next().attr('class', 'page-item active');
				$('.active').first().attr('class', 'page-item');
			}
		} else if (id == 'pre') {
			if ($('.active').prev().attr('id') == id) {
				alert("첫 페이지 입니다");
				return;
			} else {
				$('.active').prev().attr('class', 'page-item active');
				$('.active').last().attr('class', 'page-item');
			}
		} else {
			$("#paging").children("li").attr('class', 'page-item');
			$(this).attr('class', 'page-item active');
		}
	});

	$(".metismenu").children().eq(12).attr('class', 'mm-active');
</script>
</html>