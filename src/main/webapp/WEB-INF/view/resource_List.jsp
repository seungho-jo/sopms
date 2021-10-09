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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.card-body {
	
}

.table {
	text-align: center;
	box-sizing: border-box;
	border-spacing: 2px;
	border-bottom-width: 1px;
}

#tableBigname { /*tr ( no. 이름 부서 등 큰제목)*/
	color: black;
	display: table-row;
}

#tableBigname>th {
	font-size: 15px;
}

.hoverTr:hover {
	background-color: #eaeaea;
}

.hoverTr {
	color: black;
}

#userPlus {
	margin-top: 2%;
	position: relative;
	left: 87%;
}
/* .modal-dialog{
    overflow-y: initial !important
} */
.modal-body1 {
	height: 350px;
	overflow-y: auto; /*테이블 양이 많아 질경우 스크롤*/
	padding: 0;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">


	<div class="card" style="display: block;">
		<h3 class="font-weight-bold">리소스</h3>
		<div class="card-body">
			<table class="table">
				<!--.table table-hover table-responsive-sm  -->
				<thead id="theadName">
					<tr id="tableBigname">
						<th>이름</th>
						<th>부서</th>
						<th>직급</th>
						<th>투입날짜</th>
						<th>삭제하기</th>
					</tr>
				</thead>
				<tbody>
					<tr class="hoverTr">
						<td>김지나</td>
						<td>기획팀</td>
						<td>부장</td>
						<td>2021년 10월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>황철용</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>2021년 11월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>조성빈</td>
						<td>디자인팀</td>
						<td>차장</td>
						<td>2021년 10월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>윤지혜</td>
						<td>개발팀</td>
						<td>과장</td>
						<td>2021년 11월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>나정림</td>
						<td>디자인팀</td>
						<td>과장</td>
						<td>2021년 11월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>곽주빈</td>
						<td>개발팀</td>
						<td>대리</td>
						<td>2021년 11월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
					<tr class="hoverTr">
						<td>한나라</td>
						<td>디자인팀</td>
						<td>대리</td>
						<td>2021년 11월 1일</td>
						<td><span><a data-toggle="modal"
								data-target="#exampleModalCenter" data-placement="top"
								title="Close"><i class="fa fa-close color-danger"></i></a></span></td>
					</tr>
				</tbody>
			</table>
			<div class="button">
				<button type="button" id="userPlus" class="btn btn-secondary"
					data-toggle="modal" data-target=".bd-example-modal-lg">인원추가</button>
			</div>
			<!-- 삭제 Modal -->
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

			<!-- Modal ex) <div class="modal-dialog" style="width:auto;display:table"> 		-->
			<div class="bootstrap-modal">
				<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">인원 추가</h5>
								<button type="button" class="close" data-dismiss="modal">
								</button>
							</div>
							<div class="modal-body1">
								<div class="div-memberTable">
									<!--table-responsive  -->
									<table class="table" id="tablemodalId">
										<!--table table-bordered verticle-middle table-responsive-sm  -->
										<thead>
											<tr id="tableBigname">
												<th scope="col">이름</th>
												<th scope="col">부서</th>
												<th scope="col">직급</th>
											</tr>
										</thead>
										<tbody>
											<tr class="hoverTr">
												<td>김지은</td>
												<td>디자인팀1</td>
												<td>부장</td>
											</tr>
											<tr class="hoverTr">
												<td>윤효주</td>
												<td>디자인팀1</td>
												<td>차장</td>
											</tr>
											<tr class="hoverTr">
												<td>조성빈</td>
												<td>기획팀1</td>
												<td>과장</td>
											</tr>
											<tr class="hoverTr">
												<td>정다운</td>
												<td>기획팀1</td>
												<td>과장</td>
											</tr>
											<tr class="hoverTr">
												<td>황숙빈</td>
												<td>개발팀1</td>
												<td>과장</td>
											</tr>
											<tr class="hoverTr">
												<td>윤지성</td>
												<td>개발팀2</td>
												<td>대리</td>
											</tr>
											<tr class="hoverTr">
												<td>김태형</td>
												<td>개발팀2</td>
												<td>대리</td>
											</tr>
											<tr class="hoverTr">
												<td>윤대원</td>
												<td>디자인팀1</td>
												<td>주임</td>

											</tr>
											<tr class="hoverTr">
												<td>심형래</td>
												<td>디자인팀1</td>
												<td>주임</td>

											</tr>
											<tr class="hoverTr">
												<td>천성필</td>
												<td>개발팀2</td>
												<td>사원</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="div-result" id="result" method="post">
									<!-- tr누르면 이 div로 담아옴  -->

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">저장</button>
								<button type="button" class="btn btn-primary">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--.card-body -->



		</div>
	</div>
	<!-- .card -->

</body>

<script>
	//var str=""
	tdArr = new Array(); // 배열선언 , 안쪽 배열 용도 ex) 세영[0][0], 세영[1][0], 세영[2][0]  	   

	$("#tablemodalId tr")
			.click(
					function() {
						tdArr2 = new Array(); // 배열 선언 , 바깥쪽 배열 용도 ex) 세영[0][0], 세영[0][1], 세영[0][2]

						var tdArrText = "<font size='6' font color=black>선택한 직원 <br><br></font>";
						console.log("tdArr : " + tdArr);
						console.log("tdArr2 : " + tdArr2);

						// 현재 클릭된 Row(<tr>)
						var tr = $(this);
						var td = tr.children();

						// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
						console.log("클릭한 Row의 모든 데이터 : " + tr.text());

						// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
						// 여기서 바깥쪽 배열을 반복문으로 값을 넣음 ex - (조성빈	디자인팀	차장), tdArr2[0] = "조성빈", tdArr2[1] = "디자인팀", tdArr2[2] = "차장"
						td.each(function(i) {
							tdArr2.push(td.eq(i).text());
						});

						// 여기서 바깥쪽 배열 데이터를 안쪽 배열에 넣음 ex - tdArr[0] = [조성빈, 디자인팀, 차장]
						tdArr.push(tdArr2);

						console.log(tdArr);
						console.log(tdArr2);

						// td.eq(index)를 통해 값을 가져올 수도 있다.
						// var name = td.eq(0).text();
						// var dept = td.eq(1).text();
						// var job= td.eq(2).text();

						// console.log("배열 형태: " + name, dept, job);
						// 여기서 tdArr[0] 데이터를 이차원 배열로 하나씩 끄집어냄 ex = tdArr[0][0] = "조성빈", tdArr[0][1] = "디자인팀"
						for(var i = 0; i < tdArr.length; i++) {
							tdArrText += "<font size='5' font color=gray>"
									+ tdArr[i][0] + "</font>"
									+ "<font size='5' font color=gray>"
									+ tdArr[i][1] + "<br></font>"; // 출력은 바깥에서 선언한 배열을 출력    
						}
						console.log(tdArrText)
						$("#result").html(tdArrText);

					})
</script>

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