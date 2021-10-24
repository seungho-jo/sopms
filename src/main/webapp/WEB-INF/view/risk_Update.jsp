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
<link href="./css/risk_Update.css" rel="stylesheet">
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
				<h2 class="font-weight-bold" id="risk_title">리스크 상세 페이지</h2>
				<div class="card-body">
					<div class="row g-4">
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">프로젝트명</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>${riskDetail.pname}</h5>
							</div>
						</div>

						<!-- 리스크명 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크명</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>${riskDetail.risk_name}</h5>
							</div>
						</div>
						<!-- 리스크내용 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크내용</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="form-floating">
								<h5>${riskDetail.risk_content}</h5>
							</div>
						</div>
						<!-- 리스크상태 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
								<h4 id="title">리스크 상태</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<h5>${riskDetail.risk_status}</h5>
						</div>
						<!-- 등록자 -->
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_1">등록자</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3" id="regMan">
							<h5>${riskDetail.m_name}</h5>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating">
								<h4 id="title_2">등록일</h4>
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<div class="form-floating" id="regDate">
								<h5>${riskDetail.risk_reg}</h5>
							</div>
						</div>
					</div>
					<!-- 아이디와 조치자아이디 같은지 확인 -->
					<c:set var="name" value="${riskDetail.jochiPerson}"/>
					<c:choose>
						<c:when test="${user.rank=='부장'}">
						<div class="row g-2">
							<div class="col-md mb-3">
								<button type="button" class="btn btn-primary" id="btnAuthority"
								data-toggle="modal" data-target="#exampleModalCenter01">권한</button>
							</div>
						</div>
						</c:when>
				
						<c:when test="${user.id == name}" >
							<div class="row g-2">
							<div class="col-md mb-3">
								<button type="button" class="btn btn-primary" id="jochiBtn"
								data-toggle="modal" data-target="#exampleModalCenter02">수정</button>
							</div>
				
							<div class="col-md mb-3">
								<button type="button" class="btn btn-primary" id="button_right"
									onclick="javascript:goDelete(${riskDetail.risk_no})">삭제</button>
							</div>
						</div>
						</c:when>
						
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>

				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h4 class="card-title">조치내역</h4>
				</div>
					<div class="card-body">
						<div class="row g-2">
							<div class="col-1 mb-2">
								<div class="form-floating">
									<h4 id="title_jochi">조치내용</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<div class="form-floating">
									<h5>${riskJochi.risk_jochiCont}</h5>
								</div>
							</div>
							<div class="col-1 mb-3">
								<div class="form-floating">
									<h4 id="title_jochi">조치일</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<div class="form-floating">
									<h5>${riskJochi.risk_jochiUpt}</h5>
								</div>
							</div>
							<div class="col-1 mb-2">
								<div class="form-floating">
									<h4 id="title_jochi">조치자</h4>
								</div>
							</div>
							<div class="col-11 mb-2">
								<h5>${riskJochi.m_name}</h5>
							</div>
						</div>
					</div>
	
			</div>
			
			<!--  modal 권한-->
			<div class="modal fade" id="exampleModalCenter01" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
					
				<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">권한 부여</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="frm01" style="display: flex" method="post">
						<input type="hidden" name="pcode" value="${riskDetail.pcode}">
						<input type="hidden" name="risk_no" value="${riskDetail.risk_no}">
						<div class="modal-body">
							<div class="row g-2">
								<div class="col-4 mb-3">
									<h4 id="title">조치자</h4>
								</div>
								<div class="col-4 mb-3">
									<select class="form-select" aria-label="Default select example"
										id="modal_status" name="jochiPerson">
										<option selected>조치자 선택</option>
										<c:forEach var="meml" items="${memList}">
											<option value="${meml.id}">${meml.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary" id="btn_authority">조치완료</button>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
			
			
			<!-- 조치내역 수정 -->
			<div class="modal fade" id="exampleModalCenter02" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
					
				<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">조치 상세페이지</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="frm02" style="display: flex" method="post">
						<div class="modal-body">
							<div class="row g-2">
								<div class="col-4 mb-3">

									<h4 id="title">조치내용</h4>

								</div>
								<div class="col-6 mb-3">
									<input type="hidden" name="risk_no" value="${riskDetail.risk_no}"/>
									<textarea class="form-control" placeholder="조치내용을 입력하세요."
										name="risk_content" id="floatingTextarea2" style="height: 100px"></textarea>
									<label for="floatingTextarea2"></label>
								</div>
								<div class="col-4 mb-3">
									<h4 id="title">리스크 상태</h4>
								</div>
								<div class="col-4 mb-3">
									<select class="form-select" aria-label="Default select example"
										id="modal_status" name="risk_status">
										<option selected>리스크상태</option>
										<option>조치완료</option>
										<option>진행중</option>
										<option>홀드</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary" id="btn_complete">조치완료</button>
								</div>
							</div>
						</div>
						</form>
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
	$(".metismenu").children().eq(8).attr('class', 'mm-active');
	
	function goDelete(no){
		if(confirm("삭제하시겠습니까?")){
			$(location).attr("href","${path}/deleteRisk.do?risk_no="+no);
		}
	}
	// 조치버튼 클릭
	$("#btn_complete").click(function(){
		$("#frm02").attr("action", "${path}/updateModalContent.do");
		$("#frm02").submit();
	});
	
	$("#btn_authority").click(function(){
		$("#frm01").attr("action","${path}/updateAuthority.do");
		$("#frm01").submit();
	});
</script>
</html>