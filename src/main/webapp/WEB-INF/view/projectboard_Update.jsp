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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<!-- Summernote -->
<link href="./vendor/summernote/summernote.css" rel="stylesheet">
<style>
body {
	min-height: 100vh;
}

h3 {
	margin-bottom: 50px;
	padding-left: 16px;
}

.input-form {
	max-width: 680px;
	margin-top: 10px;
	margin-bottom: 50px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#insertbtn {
	margin-top: 50px;
	display: inline-block;
	width: 14%;
	margin-left: 84%;
}

#title, #date-start, #date-end, #team-cnt {
	height: 39px;
}

#titlediv {
	padding-left: 34px;
}

.input-group-text {
	position: relative;
	left: 24%;
}

.custom-file {
	position: relative;
	left: 2%;
}

.custom-file-label {
	width: 96%;
}

#contentdiv {
	display: block;
	width: 100%;
	min-height: 60%;
	border: 1px solid #eaeaea;
	padding: 0.375rem 0.75rem;
	font-size: 0.875rem;
	font-weight: 400;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	margin: auto;
	color: #3D4465;
}
</style>

<title>SOPMS</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<div class="container">

				<form action="${path}/board.do?method=update" method="post"
					id="updateform">
					<input type="hidden" class="form-control" name="bcode" id="bcode"
						placeholder="" value="${board.bcode}" required> <input
						type="hidden" class="form-control" name="name" id="name"
						placeholder="" value="${board.name}" required>
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h3 class="mb-5">공지사항 수정</h3>
							<div class="row">
								<div class="col-md-6 mb-3" id="titlediv">
									<input type="text" class="form-control" id="title"
										name="btitle" value="${board.btitle}" required>
								</div>
							</div>

							<div class="card-body">
								<textarea rows="10" cols="" name="bcontent" id="contentdiv">${board.bcontent}</textarea>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">첨부 파일</span>
								</div>
								<div class="custom-file">
									<input type="file" name="bfname" class="custom-file-input"
										id="file01" value="${board.bfname}"> <label class="custom-file-label"
										for="file01">${board.bfname}</label>
								</div>
								
							</div>
							<div class="row">
								<div class="offset-9">
									<button id="upt" class="btn btn-primary" data-toggle="modal"
										data-target="#exampleModalCenter" type="button" type="button">수정</button>
									<button id="del" class="btn btn-light" type="button">취소</button>
								</div>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">프로젝트 수정</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<p>프로젝트를 수정하시겠습니까?</p>
										</div>
										<div class="modal-footer">
											<button type="button" id="uptBtn_modal" name="uptbtn"
												class="btn btn-primary">확인</button>
											<button type="button" id="canBtn_modal" class="btn btn-light"
												data-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<!-- Summernote -->
<script src="./vendor/summernote/js/summernote.min.js"></script>
<!-- Summernote init -->
<script src="./js/plugins-init/summernote-init.js"></script>

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
	$(".metismenu").children().eq(11).attr('class', 'mm-active');
	$("#uptBtn_modal").click(function() {
		$("#updateform").submit();
		alert("프로젝트를 수정했습니다.");
	});
	$(".custom-file-input").on("change",function(){
		$(this).next(".custom-file-label").text($(this).val());
	});
	$("#canBtn_modal").click(function(){
		$(location).attr("href", "${path}/board.do?method=list");
	});
</script>
</html>