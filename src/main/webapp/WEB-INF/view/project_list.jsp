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
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
 h4{
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
                            <div class="card-header" id="title" style="display: block;" >
                                <h4>프로젝트 리스트</h4>
                            </div>
                            <div class="card-body">
                            	<button type="button" class="btn btn-primary" id="regBtn">등록하기</button>
                                <div class="table-responsive">
                                    <table class="table table-responsive-sm table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-dark">프로젝트</th>
                                                <th class="text-dark">상태</th>
                                                <th class="text-dark">완료율</th>
                                                <th class="text-dark">시작일</th>
                                                <th class="text-dark">완료일</th>
                                                <th class="text-dark">PM</th>
                                                <th class="text-dark">체크</th>
                                                <th class="text-dark">이슈/리스크</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a class="text-dark" href="project_status.jsp">SL솔루션 homepage</a></td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
                                            </tr>
                                            <tr>
                                                <td class="text-dark">SL솔루션 homepage</td>
                                                <td><span class="badge badge-pill badge-info">진행중</span>
                                                <td>
                                                    <div class="progress" style="background: rgba(127, 99, 244, .1)">
                                                        <div class="progress-bar bg-primary" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-dark">21/09/23</td>
												<td class="text-dark">21/09/25</td>
												<td class="text-dark">PM01</td>
												<td class="text-dark">PM01</td>
                                                <td><span class="badge badge-pill badge-warning">0</span>
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
	$("#regBtn").click(function(){
		location.href = "project_Insert.jsp";
	})
</script>
</html>