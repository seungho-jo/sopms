
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
	width: 100%;
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

#modalbody {
	text-align: center;
}
.card-body{
	position:relative;
}
#searchForm{ /*검색 폼*/
	width:58%;
	height:70%;
	margin-left:39%;
	display: inline-block;
}
#btncommit { /*버튼*/
	margin-left:9%;
}
</style>
</head>

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
	<form id="searchForm" >
		<div class="form-row align-items-center">
			<div class="col-auto" id="searchForm">
				<div class="input-group mb-2" >
					<div class="input-group-prepend">
						<div class="input-group-text">검색</div>
					</div>
					<input type="text" class="form-control" name="name"
						value="${param.name}" placeholder="이름으로 검색하세요">
				<button type="button" id="btncommit" class="btn btn-secondary"
				onclick="location.href='${path}/Insertpage.do'">등록하기</button>
				</div>
				
			</div>
		</div>
</form>

<div class="div-memberTable" style="margin-top: 5%;">
<form id="form1" method="post">
	<input type="hidden" name="curPage">
		<!--table-responsive  -->

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
	<c:choose>
		<c:when test="${mem.dept eq 'gh1'}">
			<td>기획1팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'gh2'}">
			<td>기획2팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'ds1'}">
			<td>디자인1팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'ds2'}">
			<td>디자인2팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'de1'}">
			<td>개발1팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'de2'}">
			<td>개발2팀</td>
		</c:when>
		<c:when test="${mem.dept eq 'is'}">
			<td>인사팀</td>
		</c:when>
		<c:otherwise>
			<td>${mem.dept}</td>
		</c:otherwise>
	</c:choose>
	<td>${mem.name}</td>
	<td>${mem.id}</td>

	<td><span onclick="javascript:deleteUser('${mem.id}')">
			<i class="fa fa-close color-danger"></i></span></td>
</tr>

</c:forEach>
				</tbody>
			</table>
	</form>
		</div>
</div>
<form id="form22" method="post" action="${path}/memberDelete.do">
<input type="hidden" name="id">

</form>
	<ul class="pagination justify-content-center" id="paging">
	<li class="page-item" id="pre"><a class="page-link"
		href="javascript:goPage(${userSch.curPage-1})">Pre</a></li>
<c:forEach var="cnt" begin="${userSch.startBlock}"
end="${userSch.endBlock}">
<li class="page-item ${userSch.curPage==cnt?'active':''}">
<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
</li>
</c:forEach>
<li class="page-item" id="next"><a class="page-link"
	href="javascript:goPage(${userSch.curPage+1})"> Next </a></li>

	</ul>

</div>
<!-- .card-body -->
	</div>

</div>
<!-- .content-body -->
</div>
<!--# main-wrapper -->
</div>

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
 function deleteUser(id){
	$("#form22 [name=id]").val(id);
	if(confirm("승인하시겠습니까?")){
		$("#form22").submit();
	}
}

//$("[name=pageSize]").val("${userSch.pageSize}");
//$("[name=pageSize]").change(function() {
//	$("[name=curPage]").val(1);
//	$("#form1").submit();
//});
function goPage(no) {
	$("[name=curPage]").val(no);
  $("#form1").submit();
};
	
	
	
</script>
</html>