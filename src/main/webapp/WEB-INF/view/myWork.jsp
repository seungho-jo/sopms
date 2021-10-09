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
					<form style="display: flex;">
						<select id="status" class="form-select">
							<option>상태 선택</option>
							<option>진행중</option>
							<option>반려됨</option>
						</select> 
						<select id="proOrsub" class="form-select">
							<option>검색어 선택</option>
							<option>프로젝트명</option>
							<option>작업명</option>
						</select>
						<div class="input-group" id="gp1">
							<input type="text" class="form-control input-sm">
							<div class="input-group-append">
								<button class="btn btn-primary">검색하기</button>
							</div>
						</div>
						<button class="btn btn-primary" id="apprReq">승인요청</button>
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
									<th class="text-dark">#</th>
									<th class="text-dark">작업</th>
									<th class="text-dark">프로젝트</th>
									<th class="text-dark">담당자</th>
									<th class="text-dark">상태</th>
									<th class="text-dark">시작일</th>
									<th class="text-dark">완료일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark"><a href="detailWork.jsp" class="text-dark">주간 보고서</a></td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-info">진행중</span></td>
									<td class="text-dark">21/09/27</td>
									<td class="text-dark">21/10/01</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">index page</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-info">진행중</span></td>
									<td class="text-dark">21/09/27</td>
									<td class="text-dark">21/10/06</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">요구사항 정의서</td>
									<td class="text-dark">SL솔루션 homepage</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-danger">반려됨</span></td>
									<td class="text-dark">21/09/23</td>
									<td class="text-dark">21/09/26</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">최종 보고서</td>
									<td class="text-dark">현대 모비스 서버 증축</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-info">진행중</span></td>
									<td class="text-dark">21/09/25</td>
									<td class="text-dark">21/09/30</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">서버 통신 불량</td>
									<td class="text-dark">현대 모비스 서버 증축</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/09/04</td>
									<td class="text-dark">21/09/08</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">현대 모비스 서버 증축</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/09/04</td>
									<td class="text-dark">21/09/08</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">현대 모비스 서버 증축</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/08/27</td>
									<td class="text-dark">21/09/01</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">주간 보고서</td>
									<td class="text-dark">GS_SHOP 홈페이지</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/08/27</td>
									<td class="text-dark">21/09/01</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">Modal 창 에러 제거</td>
									<td class="text-dark">GS_SHOP 홈페이지</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/08/27</td>
									<td class="text-dark">21/09/01</td>
								</tr>
								<tr>
									<th><input type="checkbox" class="text-dark"></th>
									<td class="text-dark">결제 오류 확인</td>
									<td class="text-dark">GS_SHOP 홈페이지</td>
									<td class="text-dark">PM01</td>
									<td class="text-dark"><span class="badge badge-success">완료됨</span></td>
									<td class="text-dark">21/08/20</td>
									<td class="text-dark">21/09/26</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link">Pre</a></li>
					<li class="page-item active" id="sel"><a class="page-link">1</a></li>
					<li class="page-item"><a class="page-link">2</a></li>
					<li class="page-item"><a class="page-link">3</a></li>
					<li class="page-item"><a class="page-link">4</a></li>
					<li class="page-item" id="next"><a class="page-link">
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
	$("#paging").children("li").click(function() {
		var id = $(this).attr('id');
		if(id=='next'){
			if($('.active').next().attr('id')==id){
				alert("마지막 페이지 입니다");
				return;
			}else{
				$('.active').next().attr('class', 'page-item active');
				$('.active').first().attr('class', 'page-item');
			}
		}else if(id=='pre'){
			if($('.active').prev().attr('id')==id){
				alert("첫 페이지 입니다");
				return;
			}else{
				$('.active').prev().attr('class', 'page-item active');
				$('.active').last().attr('class', 'page-item');
			}
		}else{
			$("#paging").children("li").attr('class', 'page-item');
			$(this).attr('class', 'page-item active');
		}
	});
</script>
</html>