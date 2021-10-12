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
<title>사용자 목록</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
thead {
	
}

.div-memberTable {
	/*display:block;*/
	width: 100%;
	overflow-x: auto;
	font-color: black;
}

table {
	text-align: center;
	box-sizing: border-box;
	border-spacing: 2px;
}

#card1 {
	position: relative;
	margin: auto;
	width: 1300px;
	height: 850px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
}

#tableBigname { /*tr ( no. 이름 부서 등 큰제목)*/
	color: #3C3C8C;
	display: table-row;
}

#tableBigname>th {
	font-size: 15px;
}

td {
	color: #3c3c3c;
}

#pagni01 {
	margin-top: 80px;
}

#searchForm {
	position: absolute;
	right: 17%;
	top: 13%;
	display: inline-block;
}

#btncommit {
	position: absolute;
	right: 6%;
	top: 13%;
}

#modalbody {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">

	$(document).ready(function() {
		$("[name=name]").on("keyup", function() {
			$.ajax({ //검색기능
				type : "post",
				url : "${path}/userListAjax.do",
				data : $("#searchForm").serialize(),
				dataType : "json",
				success : function(data) {
					// data.모델명
					var list = data.userList;
					var show = "";
					$(list).each(function(idx, member) {
						show += "<tr class='text-center'>";
						show += "	<td>" + member.dept + "</td>";
						show += "	<td>" + member.name + "</td>";
						show += "	<td>" + member.id + "</td>";
					});
					$("#tab tbody").html(show);
				},
				error : function(err) {
					console.log(err);
				}
			});
		});
	});
	$("[name=pageSize]").val("${userSch.pageSize}");
	$("[name=pageSize]").change(function() {
		$("[name=curPage]").val(1);
		$("#form1").submit();
	});
	function goPage(no) {
		$("[name=curPage]").val(no);
		$("#form1").submit();

	}
</script>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
<jsp:include page="navi.jsp" />
<div class="content-body">
	<div class="col-lg-12">
		<div id="card1">
			<h2
				style="text-align: left; size: 5%; font-weight: bold; padding: 1em 5em; white-space: nowrap;">사용자
	목록</h2>
<div class="card-body">
	<!-- 지우면 제일 왼오 바깥 세로선 사라짐  -->

	<div class="basic-form">
		<form id="searchForm">
			<div class="form-row align-items-center">
				<div class="col-auto">
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<div class="input-group-text">검색</div>
						</div>
						<input type="text" class="form-control" name="name"
							value="${param.name}" placeholder="이름으로 검색하세요">
					</div>
				</div>
			</div>
		</form>
		<button type="button" id="btncommit" class="btn btn-secondary"
			onclick="location.href='userRegister.jsp'">
			</a>등록하기
		</button>
		<div class="div-memberTable" style="margin-top: 5%;">
			<!--table-responsive  -->
			<form id="form1">
			<table class="table">
				<!--table table-bordered verticle-middle table-responsive-sm  -->
				<thead>
					<tr id="tableBigname">
						<th scope="col">No.</th>
						<th scope="col">부서</th>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mem" items="${list}">
						<tr>
							<td>${mem.no}</td>
							<td>${mem.dept}</td>
							<td>${mem.name}</td>
							<td>${mem.id}</td>
							<td><span><a data-toggle="modal"
									data-target="#exampleModalCenter" data-toggle="tooltip"
									data-placement="top" title="Close"><i
										class="fa fa-close color-danger"></i></a> </span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	<nav>
		<ul class="pagination justify-content-center" >
			<li class="page-item" id="pre"><a class="page-link"
				href="javascript:goPage(${userSch.startBlock-1})">Pre</a></li>
			<c:forEach var="cnt" begin="${userSch.startBlock}"
				end="${userSch.endBlock}">
				<li class="page-item ${userSch.curPage==cnt?'active':''}">
					<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
				</li>
			</c:forEach>
			<li class="page-item" id="next"><a class="page-link"
				href="javascript:goPage(${userSch.endBlock+1})"> Next </a></li>

		</ul>
	</nav>
	<div class="modal fade" id="exampleModalCenter">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modaltitle">사용자 삭제</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalbody">
					<h5>직원을 삭제하시겠습니까?</h5>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- .card-body -->
	</div>

</div>
<!-- .content-body -->
</div>
<!--# main-wrapper -->
<jsp:include page="footer.jsp" />
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