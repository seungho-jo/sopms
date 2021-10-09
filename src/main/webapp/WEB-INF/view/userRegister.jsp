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
<!-- bootstrap cdn -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">

<title>사용자 등록</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<style>
.form-name-badge-span, .form-dept-badge-span, .form-jobGrade-badge-span,
	.form-temporary-id-pass-badge-span { /*뱃지*/
	display: inline-block;
	padding: 0.7em 3em; /*세로 가로 */
	border-radius: 1rem;
	background-color: #646496;
	font-weight: 900;
	text-align: center;
	white-space: nowrap; /*공백 하나로 표시, 줄바꿈 x, 화면 최소로 줄였을때 글씨 안깨짐 */
	vertical-align: baseline;
	color: white;
	/*margin-left:30%;*/
}

.div-nametextform { /*이름뱃지 , 이름입력창 div */
	position: absolute;
	width: 500px;
	height: 120px;
	left: 150px; /*고정*/
}

.div-dept-jobgrade { /*부서, 부서select, 직급, 직급 select 전체 div*/
	width: 500px;
	height: 200px;
	margin-left: 13%;
}

.form-name-badge-span:hover { /*이름 뱃지*/
	background-color: #3C3C8C;
}

.form-name-rounded { /*이름 입력창*/
	border-radius: 0.3rem;
	padding: 0.5em;
	width: 380px;
	height: 40px;
	margin-top: 20px;
	border: 1px solid;
}

.form-name-badge { /*이름 뱃지*/
	/*    position: absolute;
 top: 210px;
 left:300px;   */
	
}
/*이름입력칸 */
.form-dept-badge-span:hover {
	background-color: #3C3C8C;
}

.form-jobGrade-badge-span:hover {
	background-color: #3C3C8C;
}

.form-dept-badge { /*부서 뱃지*/
	/*  position: absolute;
 top: 400px;
 left:385px;  */
	
}

#selectdept { /*부서 select */
	width: 380px;
	height: 40px;
	/*   position: absolute;
  top : 440px;
  left:415px; */
	border-radius: 0.3rem;
	padding: 0.5em;
	margin-top: 20px;
}

.div-dept {
	
}

.div-dept { /*부서 div */
	position: absolute;
	width: 450px;
	height: 200px;
	top: 290px;
	left: 150px;
}

.div-jobGrade { /*직급 div */
	width: 450px;
	height: 200px;
	position: absolute;
	top: 290px;
	left: 650px;
}

.div-temporary-id-pass { /*임시 아이디 비번 div  */
	position: absolute;
	top: 470px;
	left: 150px;
}

.form-jobGrade-badge { /*직급 뱃지*/
	/* position: absolute;
 top: 400px;
 left:900px;  */
	
}

#selectjobGrade { /*직급 select*/
	width: 380px;
	height: 40px;
	margin-top: 20px;
	/* position: absolute;
    top : 440px;
    left:930px; */
	border-radius: 0.3rem;
	padding: 0.5em;
}

.form-temporary-id-pass-badge-span:hover {
	background-color: #3C3C8C;
}

.form-temporary-id-pass-badge { /*임시 아이디비번 뱃지*/
	/* position: absolute;
  top: 700px;
  left:415px; */
	display: inline-block; /* 생성하기 버튼 이랑 동일하게 */
}

#but01 {
	width: 100px;
	height: 40px;
	font-weight: 600;
	margin-left: 40px;
}

#card1 {
	position: relative;
	margin: auto;
	width: 1300px;
	height: 750px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
}

#temporary-id, #temporary-pass { /*임시 아이디 비밀번호 뜨는 창 */
	margin-top: 4%;
	margin-left: 0.5%;
	width: 380px;
	height: 40px;
	border: 1px solid;
	border-radius: 0.3rem;
}

#btncommit { /*등록하기 버튼*/
	position: relative;
	top: 360px;
	left: 45%;
	width: 100px;
	height: 40px;
}
</style>
</head>

<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div id="card1">
				<h2
					style="text-align: left; size: 5%; font-weight: bold; padding: 1em 5em; white-space: nowrap;">사용자
					등록</h2>
				<div class="div-nametextform">
					<div class="form-name-badge">
						<span class="form-name-badge-span">이름</span>
					</div>
					<input type="text" class="form-name-rounded">
				</div>
				<!-- .div-nametextform -->
				<!----------이름 뱃지, 이름 입력창 합 div---------------------->
				<div class="div-dept-jobgrade">
					<div class="div-dept">
						<!-- 부서 div  -->
						<div class="form-dept-badge">
							<span class="form-dept-badge-span">부서</span>
						</div>
						<div class="select-dept">
							<select id="selectdept">
								<option value="gh">기획팀</option>
								<option value="ds">디자인팀</option>
								<option value="de">개발팀</option>
								<option value="">인사팀</option>
							</select>
						</div>
					</div>
					<!-- 부서 div -->

					<div class="div-jobGrade">
						<!-- 직급 div  -->
						<div class="form-jobGrade-badge">
							<span class="form-jobGrade-badge-span">직급</span>
						</div>
						<div class="select-jobGrade">
							<select id="selectjobGrade">
								<option>이사</option>
								<option>부장</option>
								<option>팀장</option>
								<option>차장</option>
								<option>과장</option>
								<option>대리</option>
								<option>주임</option>
								<option>사원</option>
							</select>
						</div>
					</div>
				</div>
				<div class="div-temporary-id-pass">
					<div class="form-temporary-id-pass-badge">
						<span class="form-temporary-id-pass-badge-span">임시 아이디 &
							비밀번호</span>
						<!-- 임시 아이디 비밀번호 뱃지  -->
					</div>
					<!-- .form-temporary-id-pass-badge -->
					<button type="button" class="btn btn-outline-primary" id="but01">생성하기</button>
					<input id="temporary-id" class="form-control" type="text" disabled>
					<input id="temporary-pass" class="form-control" type="text"
						disabled>
				</div>
				<!-- .div-temporary-id-pass -->


				<button type="button" id="btncommit" class="btn btn-secondary"
					data-toggle="modal" data-target="#exampleModalCenter">등록하기</button>

				<div class="modal fade" id="exampleModalCenter">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modaltitle">사용자 등록</h5>
								<button type="button" class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-body" id="modalbody">
								<h5>등록 하시겠습니까?</h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">등록</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .card-body -->
		</div>
		<!-- .card1 -->
	</div>
	<!-- .content-body -->

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

<script>
   $("#but01").click(function(){
      $("#temporary-id").val("아이디입니다.");
      $("#temporary-pass").val("비밀번호입니다.");
      
   })
	$(".metismenu").children().eq(13).attr('class', 'mm-active');

</script>
</html>