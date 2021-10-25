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
<title>SOPMS 채팅</title>
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
<link rel="stylesheet" href="./css/teamlist.css" />
<link rel="stylesheet" href="./css/chat.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous">
	
</script>

</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">

			<div class="container-fluid">

				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>대화상대 목록</h4>
							<span class="ml-1">대화를 원하는 사원을 선택하세요</span>
						</div>
					</div>
				</div>

				<!-- 시간남으면 해라				<div
						class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<button type="button" class="btn btn-rounded btn-primary">
							<span class="btn-icon-left text-primary"><i
								class="fa fa-plus color-info"></i> </span>그룹채팅방 개설
						</button>
					</div>

				</div>

				<div class="row"
					style="display: flex; justify-content: center; text-align: center; padding: 10px 0px 30px 0px">
					<a href="${path}/getChatroom.do"><button type="button"
							class="btn btn-square btn-outline-primary" style="width: 50vw" )>채팅방
							목록 바로가기</button></a>
				</div>
				
				 -->

				<!-- PAGE TITLE END -->

				<div class="row" style="padding-bottom: 20px;">
					<div class="col-xl-4 col-xxl-3 col-lg-3 col-sm-3"></div>
					<div class="col-xl-4 col-xxl-3 col-lg-3 col-sm-3"></div>
					<div
						class="col-sm-11 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
						<form class="form-inline" method="GET" action="searchTeam.do"
							id="searchForm">
							<select class="custom-select my-1 mr-sm-2" id="sel1" name="pcode">
								<option value="" selected disabled hidden>프로젝트 검색</option>
								<c:forEach var="project" items="${myProjects}">
									<option value="${project.pcode}">${project.pname}</option>
								</c:forEach>
							</select>
							<button type="submit" id="submit"
								class="btn btn-primary mb-0 teamSch" style="height: 75%;">검색</button>
						</form>

					</div>
				</div>

				<div id="memberList">
					<div class="row"  style="display: flex; justify-content: center;">
						<c:forEach var="user" items="${userList}">
							<c:if test="${user.id ne currentId}">
								<div class="col-xl-3 col-xxl-6 col-lg-6 col-sm-6 member" style="margin: 30px; background-color: white;">
									<div class="usercard" style="height: 10%;">
											<div class="profilearea" style="display: flex; justify-content: center; padding: 20px;">
												<div class="profileImage"
													style="border-radius: 50%; overflow: hidden; width: 75px; height: 75px; background-position: center; background-image: url(${path}/images/profile.jpg); background-size: 75px;"
														alt="default_profile;">
												</div>
											</div>
											<div class="namearea" style="text-align: center;">
												<h5 class="name-rank">${user.name}
													${user.rank}</h5>
												<form class="form-inline" action="getChatroom.do"
													method="post" style="height: 30px;">
													<input type="hidden" name="toId" value="${user.id}" />
											</div>
											<div class="d-sm-flex"
												style="justify-content: center;">
												<button type="submit" class="btn btn-primary privateChat" style="margin-bottom: 20px;">대화
													시작</button>
											</div>
											</form>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<c:forEach var="teammate" items="${teammates}">
						<c:if test="${teammate.id ne currentId}">
								<div class="col-xl-3 col-xxl-6 col-lg-6 col-sm-6 member" style="margin: 30px; background-color: white;">
									<div class="usercard" style="height: 10%;">
											<div class="profilearea" style="display: flex; justify-content: center; padding: 20px;">
												<div class="profileImage"
													style="border-radius: 50%; overflow: hidden; width: 75px; height: 75px; background-position: center; background-image: url(${path}/images/profile.jpg); background-size: 75px;"
														alt="default_profile;">
												</div>
											</div>
											<div class="namearea" style="text-align: center;">
												<h5 class="name-rank">${teammate.name} ${teammate.rank}</h5>
												<form class="form-inline" action="getChatroom.do"
													method="post" style="height: 30px;">
													<input type="hidden" name="toId" value="${teammate.id}" />
											</div>
											<div class="d-sm-flex"
												style="justify-content: center;">
												<button type="submit" class="btn btn-primary privateChat" style="margin-bottom: 20px;">대화
													시작</button>
											</div>
											</form>
									</div>
								</div>
							</c:if>
							<!--<c:if test="${teammate.id ne currentId}">
								<div class="col-xl-4 col-xxl-3 col-lg-3 col-sm-3 member">
									<div class="card">
										<div class="card-header">
											<div class="profileImage">
												<img src="${path}/images/default_profile.png"
													alt="default_profile" />
											</div>
										</div>
										<div class="card-body">
											<form action="getChatroom.do" method="post">
												<input type="hidden" name="toId" value="${teammate.id}" />
												<p class="card-text id">${teammate.id}</p>
												<p class="card-text name-rank">${teammate.name}
													${teammate.rank}</p>
												<p class="card-text">
													<button type="submit" class="btn btn-primary privateChat">대화
														시작</button>
												</p>
											</form>
										</div>
									</div>
								</div>
							</c:if>-->
						</c:forEach>

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

<script>
<!--js 제어-->
	let id = $('.id').val()

	let btn = $('.privateChat')

	btn.click(function() {
		$.post("${path}/getChatroom.do", {
			sendid : id
		}.done(function() {
			alert: "success"
		}))
	})

	let teamSch = $('.teamSch')

	/*	let submit = $('#submit')
	 submit.click(
	 function(){
	 $('#searchForm').submit()
	 }
	 )*/

	//	let codeParam = $('#sel1').val().split('-')[1]
	/*	teamSch.click($.get("${path}/searchTeam.do", {
	 pcode : $('#sel1').val().split('-')[1]
	 }, function(data) {
	 $('#memberList').empty()
	 for (i = 0; i < data.length; i++) {
	 let user = data[i]
	 if (user.id == "${currentId}") {
	 continue;
	 }
	 let member = $('#template').clone();
	 member.find('.id').html(user.name)
	 member.removeAttr('id');
	 member.find('.card-text .name-rank')
	 member.find('.toId').val(user.id)
	 console.log(user)
	 $('#memberList').append(member);
	 }
	 })

	 );*/
</script>
</html>