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
<link href="./css/dashboard.css" rel="stylesheet">


<title>SOPMS</title>

<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<%
String noS = request.getParameter("pcode");
String pm = request.getParameter("pm");
int no = Integer.parseInt(noS);
%>

</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout" class="h-50" method="post">
	<div id="main-wrapper" >
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body" >
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">프로젝트 상세</h4>
				</div>
				<div class="card-body">
					<!-- Nav tabs -->
					<div class="default-tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#summary">요약정보</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#wbs">WBS</a></li>
							
							
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#resource">리소스</a></li>
								
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#issue">이슈/리스크</a></li>

							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#output">산출물</a></li>
						</ul>
						
						<div class="tab-content">
						
						
							<div class="tab-pane fade show active" id="summary"
								role="tabpanel">
								<div class="pt-4">
									<jsp:include page="project_status_sum.jsp"></jsp:include>
								</div>
							</div>
							<div class="tab-pane fade" id="wbs">
								<div class="pt-4">
									<jsp:include page="ganttchart.jsp">									
										<jsp:param name="pcode" value="<%=noS%>" />
										<jsp:param name="pm" value="<%=pm%>" />
									</jsp:include>
									
								</div>
							</div>
							<div class="tab-pane fade" id="resource">
								<div class="pt-4">
									<jsp:include page="resource_List.jsp"/>
								</div>
							</div>
							<div class="tab-pane fade" id="issue">
								<div class="pt-4">
									<jsp:include page="project_Risk.jsp" />
								</div>
							</div>
							<div class="tab-pane fade" id="output">
								<div class="pt-4">
									<jsp:include page="Outputs.jsp" />
								</div>
							</div>
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

<!--  flot-chart js-->
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
	$(".metismenu").children().eq(4).attr('class', 'mm-active');
</script>
</html>