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
<!-- fullcalendar -->
<link href="./vendor/fullcalendar/lib/main.css" rel="stylesheet">
<script src="./vendor/fullcalendar/lib/main.js" type="text/javascript"></script>

<link href="./css/style.css" rel="stylesheet">
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="./vendor/fullcalendar/lib/moment-with-locales.js"
	type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>
<script>
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var toDay = new Date().toISOString().split("T")[0];
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'dayGridMonth,timeGridWeek,timeGridDay',
				center : 'title',
				right : 'prev,next today'
			},
			initialDate : toDay,
			navLinks : true,
			selectable : true,
			selectMirror : true,
			eventLimit : false,
			select : function(arg) {
				$("h2").click();
				$("#exampleModalLongTitle").text("일정등록");
				$("#regBtn").show();
				$("#uptBtn").hide();
				$("#delBtn").hide();
				$(".form-cal").show();
				$("#table-wbs").hide();
				$(".time_form").hide();
				$(".form-cal")[0].reset();
				$("#start").val(moment(arg.start).format().split("T")[0]);
				$("[name=start]").val(moment(arg.start).format().split("T")[0]);
				$("#end").val(moment(arg.end).format().split("T")[0]);
				$("[name=end]").val(moment(arg.end).format().split("T")[0]);
				calendar.unselect()
			},
			eventClick : function(arg) {
				$("h2").click();
				$("#exampleModalLongTitle").text("상세일정");
				$("#regBtn").hide();
				$("#uptBtn").show();
				$("#delBtn").show();
				$(".form-cal").show();
				$("#table-wbs").hide();

				if (arg.event.extendedProps.workcode != 0) {
					$("#uptBtn").hide();
					$("#delBtn").hide();
					$(".form-cal").hide();
					$("#table-wbs").show();
					console.log(arg.event.extendedProps.workcode);
				}
				addForm(arg.event);
			},
			eventDrop : function(info) {
				console.log("#이벤트 드랍#")
				console.log(info.event);
				addForm(info.event);
				ajaxFun("calendarUpdate.do")
			},
			eventResize : function(info) {
				console.log("#이벤트 사이즈변경#")
				console.log(info.event);
				addForm(info.event);
				ajaxFun("calendarUpdate.do")
			},
			editable : true,
			dayMaxEvents : false,
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					type : "post",
					url : "${path}/calList.do",
					dataType : "json",
					data : $("#sch").serialize(),
					success : function(data) {
						console.log(data)
						successCallback(data);
					},
					error : function(err) {
						console.log(err);
					}

				});
			}
			
		});
		/*
		function ajaxSch(info, successCallback, failureCallback) {
			$.ajax({
				type : "post",
				url : "${path}/calList.do",
				dataType : "json",
				data : $("#sch").serialize(),
				success : function(data) {
					console.log(data)
					successCallback(data);
				},
				error : function(err) {
					console.log(err);
				}

			});
		} */
		
		calendar.render();
		
		$("#pjsch").on('change',function(){
			console.log("캘린더쪽:"+$("#pjsch").val());
			$("[name=workcodeSch]").val($("#pjsch").val());
			// ajaxSch($("#pjsch").val());
			var calendarEl = document.getElementById('calendar');
			var toDay = new Date().toISOString().split("T")[0];
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : 'dayGridMonth,timeGridWeek,timeGridDay',
					center : 'title',
					right : 'prev,next today'
				},
				initialDate : toDay,
				navLinks : true,
				selectable : true,
				selectMirror : true,
				eventLimit : false,
				select : function(arg) {
					$("h2").click();
					$("#exampleModalLongTitle").text("일정등록");
					$("#regBtn").show();
					$("#uptBtn").hide();
					$("#delBtn").hide();
					$(".form-cal").show();
					$("#table-wbs").hide();
					$(".time_form").hide();
					$(".form-cal")[0].reset();
					$("#start").val(moment(arg.start).format().split("T")[0]);
					$("[name=start]").val(moment(arg.start).format().split("T")[0]);
					$("#end").val(moment(arg.end).format().split("T")[0]);
					$("[name=end]").val(moment(arg.end).format().split("T")[0]);
					$("#parent").val($("#pjsch").val()).prop("selected", true);
					$("[name=parent]").val($("#pjsch").val());
					calendar.unselect()
				},
				eventClick : function(arg) {
					$("h2").click();
					$("#exampleModalLongTitle").text("상세일정");
					$("#regBtn").hide();
					$("#uptBtn").show();
					$("#delBtn").show();
					$(".form-cal").show();
					$("#table-wbs").hide();
	
					if (arg.event.extendedProps.workcode != 0) {
						$("#uptBtn").hide();
						$("#delBtn").hide();
						$(".form-cal").hide();
						$("#table-wbs").show();
						console.log(arg.event.extendedProps.workcode);
					}
					addForm(arg.event);
				},
				eventDrop : function(info) {
					console.log("#이벤트 드랍#")
					console.log(info.event);
					addForm(info.event);
					ajaxFun("calendarUpdate.do")
				},
				eventResize : function(info) {
					console.log("#이벤트 사이즈변경#")
					console.log(info.event);
					addForm(info.event);
					ajaxFun("calendarUpdate.do")
				},
				editable : true,
				dayMaxEvents : false,
				events : function(info, successCallback, failureCallback) {
					$.ajax({
						type : "post",
						url : "${path}/calList.do",
						dataType : "json",
						data : $("#sch").serialize(),
						success : function(data) {
							console.log(data)
							successCallback(data);
						},
						error : function(err) {
							console.log(err);
						}
	
					});
				}
				
			});
			calendar.render();
		});
		$("#regBtn").click(
				function() {
					if ($("[name=parent]").val() == "") {
						alert("프로젝트를 등록하세요!");
						return;
					}
					if ($("[name=title]").val() == "") {
						alert("일정을 등록하세요!");
						return;
					}
					if ($("[name=allDay]").val() == "") {
						alert("종일여부를 선택하세요!");
						return;
					}
					if ($("[name=borderColor]").val() == "") {
						alert("일정색상을 선택하세요!");
						return;
					}
					if ($("[name=process]").val() == "") {
						alert("진행률을 선택하세요!");
						return;
					}
					if ($("[name=start]").val() == "") {
						alert("시작일을 선택하세요!");
						return;
					}
					if ($("[name=end]").val() == "") {
						alert("종료일을 선택하세요!");
						return;
					}
					if ($("[name=allDay]").val() == 0){
						if ($("#start_ty").val() == ""
								|| $("#end_ty").val() == "") {
							alert("오전/오후를 선택하세요!");
							return;
						}
						if ($("[name=start_hh]").val() == ""
								|| $("[name=end_hh]").val() == "") {
							alert("시간을 선택하세요!");
							return;
						}
						if ($("[name=start_mm]").val() == ""
								|| $("[name=end_mm]").val() == "") {
							alert("분을 선택하세요!");
							return;
						}
					}
					ajaxFun("calendarInsert.do")
				});
		$("#uptBtn").click(
				function() {
					if (confirm("수정하시겠습니까?")) {
						if ($("[name=parent]").val() == "") {
							alert("프로젝트를 등록하세요!");
							return;
						}
						if ($("[name=title]").val() == "") {
							alert("일정을 등록하세요!");
							return;
						}
						if ($("[name=allDay]").val() == "") {
							alert("종일여부를 선택하세요!");
							return;
						}
						if ($("[name=borderColor]").val() == "") {
							alert("일정색상을 선택하세요!");
							return;
						}
						if ($("[name=process]").val() == "") {
							alert("진행률을 선택하세요!");
							return;
						}
						if ($("[name=start]").val() == "") {
							alert("시작일을 선택하세요!");
							return;
						}
						if ($("[name=end]").val() == "") {
							alert("종료일을 선택하세요!");
							return;
						}
						if ($("[name=allDay]").val() == 0){
							if ($("#start_ty").val() == ""
									|| $("#end_ty").val() == "") {
								alert("오전/오후를 선택하세요!");
								return;
							}
							if ($("[name=start_hh]").val() == ""
									|| $("[name=end_hh]").val() == "") {
								alert("시간을 선택하세요!");
								return;
							}
							if ($("[name=start_mm]").val() == ""
									|| $("[name=end_mm]").val() == "") {
								alert("분을 선택하세요!");
								return;
							}
						}
						ajaxFun("calendarUpdate.do")
					}
				});
		$("#delBtn").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				ajaxFun("calendarDelete.do")
			}
		});

	});
	function ajaxFun(url) {
		$.ajax({
			type : "post",
			url : "${path}/" + url,
			data : $("form").serialize(),
			success : function(data) {
				alert(data);
				console.log($("form").serialize());
				location.reload();
			},
			error : function(err) {
				console.log(err);
				console.log($("form").serialize());
			}

		});
	}
	

	function addForm(event) {
		if (event.extendedProps.workcode == 0) {
			$(".form-cal")[0].reset();
			$("[name=id]").val(event.id);
			$("[name=workcode]").val(event.extendedProps.workcode);
			$("[name=parent]").val(event.extendedProps.parent);
			$("#parent").val(event.extendedProps.parent).prop("selected", true);
			$("[name=title]").val(event.title);
			$("#borderColor").val(event.borderColor).prop("selected", true);
			$("[name=borderColor]").val(event.borderColor);
			$("[name=backgroundColor]").val(event.backgroundColor);
			$("[name=textColor]").val(event.textColor);
			$("[name=content]").val(event.extendedProps.content);
			var start = moment(event.start).format().split("T")[0];
			var bf_start = moment(event.start).subtract(1, 'days').format().split("T")[0];
			var start_hourS = moment(event.start).format().split("T")[1].substring(0, 2);
			var start_minS = moment(event.start).format().split("T")[1].substring(3, 5);
			var start_hour = parseInt(start_hourS);
			var start_min = parseInt(start_minS);
			var end = moment(event.end).format().split("T")[0];
			var bf_end = moment(event.end).subtract(1, 'days').format().split("T")[0];
			var end_hourS = moment(event.end).format().split("T")[1].substring(0, 2);
			var end_minS = moment(event.end).format().split("T")[1].substring(3, 5);
			var end_hour = parseInt(end_hourS);
			var end_min = parseInt(end_minS);
			$("#start").val(start);
			$("#end").val(end);
			if(start_hour > 14){
				$("[name=start]").val(bf_start);
			}else{
				$("[name=start]").val(start);
			}
			if(end_hour > 14){
				$("[name=end]").val(bf_end);
			}else{
				$("[name=end]").val(end);
			}
			if (event.allDay) {
				$(".time_form").hide();
				$("#all").prop("selected", true);
				$("[name=start]").val(bf_start+"T15:00:00.000Z");
				$("[name=end]").val(bf_end+"T15:00:00.000Z");
			} else {
				$(".time_form").show();
				$("#time").prop("selected", true);
				if (start_hour > 12) {
					$("#stime_type").val("2").prop("selected", true);
					if (start_hour < 19) {
						$("#start_hour").val(start_hour - 12).prop("selected",
								true);
						$("[name=start_hh]").val("0" + (start_hour-9));
					}else {
						$("#start_hour").val(start_hour - 12).prop("selected",
								true);
						$("[name=start_hh]").val("" + (start_hour-9));
					}
					$("#start_min").val(start_min).prop("selected", true);
					$("#start_ty").val("2");
					if (start_min < 10) {
						$("[name=start_mm]").val("0" + ("" + start_min));
					} else {
						$("[name=start_mm]").val("" + start_min);
					}
				} else {
					$("#stime_type").val("1").prop("selected", true);
					if(start_hour == 0){
						$("#start_hour").val("12").prop("selected",
								true);
						$("[name=start_hh]").val("15");
					}else{
						$("#start_hour").val(start_hour).prop("selected", true);
						if (start_hour < 9){
							$("[name=start_hh]").val("" + (start_hour+15));
						}else{
							$("[name=start_hh]").val("0" + (start_hour-9));
						}
					}
					$("#start_min").val(start_min).prop("selected", true);
					$("#start_ty").val("1");
					if (start_min < 10) {
						$("[name=start_mm]").val("0" + ("" + start_min));
					} else {
						$("[name=start_mm]").val("" + start_min);
					}
					;
				}
				if (end_hour > 12) {
					$("#etime_type").val("2").prop("selected", true);
					if (end_hour < 19) {
						$("#end_hour").val(end_hour - 12).prop("selected",
								true);
						$("[name=end_hh]").val("0" + (end_hour-9));
					}else {
						$("#end_hour").val(end_hour - 12).prop("selected",
								true);
						$("[name=end_hh]").val("" + (end_hour-9));
					}
					$("#end_min").val(end_min).prop("selected", true);
					$("#end_ty").val("2");
					if (end_min < 10) {
						$("[name=end_mm]").val("0" + ("" + end_min));
					} else {
						$("[name=end_mm]").val("" + end_min);
					}
				} else {
					$("#etime_type").val("1").prop("selected", true);
					if(end_hour == 0){
						$("#end_hour").val("12").prop("selected",
								true);
						$("[name=end_hh]").val("15");
					}else{
						$("#end_hour").val(end_hour).prop("selected", true);
						if (end_hour < 9){
							$("[name=end_hh]").val("" + (end_hour+15));
						}else{
							$("[name=end_hh]").val("0" + (end_hour-9));
						}
					}
					$("#end_min").val(end_min).prop("selected", true);
					$("#end_ty").val("1");
					if (end_min < 10) {
						$("[name=end_mm]").val("0" + ("" + end_min));
					} else {
						$("[name=end_mm]").val("" + end_min);
					}
					;
				}
			}
			$("[name=allDay]").val(event.allDay ? 1 : 0);
			$("#process").val(event.extendedProps.process).prop("selected",
					true);
			console.log(event.extendedProps.process);
			$("[name=process]").val(event.extendedProps.process);
			$("[name=status]").val(event.extendedProps.status);
		} else {
			// wbs 모달창
			$("#title-wbs").text(event.title);
			$("#content-wbs").text(event.extendedProps.content);
			$("#start-wbs").text(moment(event.start).format('LLL'));
			$("#end-wbs").text(moment(event.end).format('LLL'));
			$("#process-wbs").text(event.extendedProps.status);
		}
	}
</script>
<style>
#table-wbs table tr th {
	font-size: 17px;
	color: black;
	padding: 10px;
	width: 20%;
}

#table-wbs table tr td {
	font-size: 17px;
	color: black;
	padding-left: 40px;
	width: 80%;
}

#table-wbs table tr {
	height: 4vw;
}
#calendar{
	min-height: 1800px;
}
</style>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">

			<div class="card">
				<div class="card-body">
					<div class="container">
						<!-- Page Heading_전체일정 -->
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 font-weight-bold text-gray-800">전체 일정</h1>
							<form method="post" id="sch">
								<input type="hidden" name="workcodeSch" value="0"/>
								<select id="pjsch" class="form-select text-center">
									<option value="0">전체 일정&nbsp;&nbsp;&nbsp;[시작일~종료일]</option>
								<c:forEach var="list" items="${sch}">
									<option value="${list.workcode}">${list.title}&nbsp;&nbsp;&nbsp;[${list.start}~${list.end}]</option>
								</c:forEach>
								</select>
							</form>
							<button type="button"
								onclick="location.href='${path}/manage_mem.do'"
								class="btn btn-primary">관리 페이지</button>
						</div>
						<!-- 일자 클릭시 메뉴오픈 -->
						<div id="wrapper">
							<div id="calendar"></div>
						</div>
						<!-- 일정 추가 MODAL -->
						<h2 data-toggle="modal" data-target="#exampleModalCenter"></h2>
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<!-- 일반 등록창 -->
										<form class="form-cal" method="post">
											<input type="hidden" name="id" value="0" />
											<div class="input-group mb-3" id="parent_select">
												<div class="input-group-prepend">
													<span class="input-group-text">프로젝트명</span>
												</div>
												<select id="parent" class="form-control"
													onchange="parentChange(this.value);">
													<option value="">프로젝트를 선택해주세요</option>
													<c:forEach var="list" items="${sch}">
														<option value="${list.workcode}">${list.title}</option>
													</c:forEach>
												</select> <input type="hidden" name="parent"/>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">일정</span>
												</div>
												<input type="text" name="title" class="form-control"
													placeholder="일정입력">
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">종일여부</span>
												</div>
												<select id="allDay" class="form-control"
													onchange="allDayChange(this.value)">
													<option value="">종일여부를 선택해주세요</option>
													<option value="true" id="all">종일</option>
													<option value="false" id="time">시간</option>
												</select> <input type="hidden" name="allDay" value="" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">시작일</span>
												</div>
												<input type="date" id="start" class="form-control"
													placeholder="입력" onchange="startChange(this.value)">
												<input type="hidden" name="start" />
											</div>
											<div class="time_form">
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">시작시간</span>
													</div>
													<select id="stime_type" class="form-control"
														onchange="stChange(this.value)">
														<option value="">오전/오후</option>
														<option value="1">오전</option>
														<option value="2">오후</option>
													</select> <input type="hidden" id="start_ty" /> 
													<select id="start_hour" class="form-control"
														onchange="shChange(this.value)">
														<option value="">HH</option>
														<c:forEach var="i" begin="01" end="12">
															<option value="${i}">${i}시</option>
														</c:forEach>
													</select> <input type="hidden" name="start_hh" value="0"/> 
													<select id="start_min" class="form-control"
														onchange="smChange(this.value)">
														<option value="">MM</option>
														<c:forEach var="i" begin="00" end="59">
															<option value="${i}">${i}분</option>
														</c:forEach>
													</select> <input type="hidden" name="start_mm" value="0"/>
												</div>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">종료일</span>
												</div>
												<input type="date" id="end" class="form-control"
													placeholder="입력" onchange="endChange(this.value)">
												<input type="hidden" name="end" />
											</div>
											<div class="time_form">
												<div class="input-group mb-3" id="end_time_form">
													<div class="input-group-prepend">
														<span class="input-group-text">종료시간</span>
													</div>
													<select id="etime_type" class="form-control"
														onchange="etChange(this.value)">
														<option value="">오전/오후</option>
														<option value="1">오전</option>
														<option value="2">오후</option>
													</select> <input type="hidden" id="end_ty" /> 
													<select id="end_hour" class="form-control" 
														onchange="ehChange(this.value)">
														<option value="">HH</option>
														<c:forEach var="i" begin="1" end="12">
															<option value="${i}">${i}시</option>
														</c:forEach>
													</select> <input type="hidden" name="end_hh"  value="0"/> 
													<select id="end_min" class="form-control" 
														onchange="emChange(this.value)">
														<option value="">MM</option>
														<c:forEach var="i" begin="00" end="59">
															<option value="${i}">${i}분</option>
														</c:forEach>
													</select> <input type="hidden" name="end_mm" value="0"/>
												</div>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">내용</span>
												</div>
												<textarea name="content" rows="5" cols="10"
													class="form-control"></textarea>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">일정색상</span>
												</div>
												<select id="borderColor" class="form-control"
													onchange="colorChange(this.value)">
													<option value="">색상을 선택해주세요</option>
													<option value="#F44336" style="color: #F44336;">빨간색</option>
													<option value="#F57C00" style="color: #F57C00;">주황색</option>
													<option value="#FFD700" style="color: #FFD700;">노란색</option>
													<option value="#2E7D32" style="color: #2E7D32;">초록색</option>
													<option value="#0099cc" style="color: #0099cc;">하늘색</option>
													<option value="#000000" style="color: #000000;">검은색</option>
												</select> <input type="hidden" name="borderColor" value=""> <input
													type="hidden" name="backgroundColor" value=""> <input
													type="hidden" name="textColor" value=""> <input
													type="hidden" name="status" value="">
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">진행률</span>
												</div>
												<select id="process" class="form-control"
													onchange="processChange(this.value)">
													<option value="">진행률을 선택해주세요</option>
													<c:forEach var="i" begin="0" end="100">
														<option value="${i}">${i}%</option>
													</c:forEach>
												</select> <input type="hidden" name="process" value="" />
											</div>
										</form>
										<!-- wbs 모달창 -->
										<div id="table-wbs">
											<table height="100%">
												<tr>
													<th>일정</th>
													<td id="title-wbs"></td>
												</tr>
												<tr>
													<th>시작일</th>
													<td id="start-wbs"></td>
												</tr>
												<tr>
													<th>종료일</th>
													<td id="end-wbs"></td>
												</tr>
												<tr>
													<th>내용</th>
													<td id="content-wbs"></td>
												</tr>
												<tr>
													<th>진행률</th>
													<td id="process-wbs"></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" id='regBtn' class="btn btn-primary">등록</button>
										<button type="button" id='uptBtn' class="btn btn-info">수정</button>
										<button type="button" id='delBtn' class="btn btn-warning">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.container -->
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
<script>
	var parentChange = function(value) {
		$("[name=parent]").val(value);
	}
	var allDayChange = function(value) {
		if (value == "true") {
			$("[name=allDay]").val(1);
			$("[name=borderColor]")
			.val($("#borderColor option:selected").val());
			$("[name=backgroundColor]").val(
					$("#borderColor option:selected").val());
			$("[name=textColor]").val("#FFFFFF");
			$(".time_form").hide();
		} else if (value == ""){
			$("[name=allDay]").val("");
			$(".time_form").hide();
		} else {
			$("[name=allDay]").val(0);
			$("[name=borderColor]")
			.val($("#borderColor option:selected").val());
			$("[name=backgroundColor]").val("#FFFFFF");
			$("[name=textColor]").val($("#borderColor option:selected").val());
			$(".time_form").show();
		}
		console.log($("[name=allDay]").val());
		console.log($("[name=backgroundColor]").val());
	}
	var colorChange = function(value) {
		if (value == ""){
			$("[name=borderColor]").val("");
			$("[name=backgroundColor]").val("");
			$("[name=textColor]").val("");
		} else if ($("[name=allDay]").val() == 1){
			$("[name=borderColor]").val(value);
			$("[name=backgroundColor]").val(value);
			$("[name=textColor]").val("#FFFFFF");
		} else {
			$("[name=borderColor]").val(value);
			$("[name=backgroundColor]").val("#FFFFFF");
			$("[name=textColor]").val(value);
		}
		console.log($("[name=textColor]").val());
	}
	var processChange = function(value) {
		console.log(value);
		$("[name=process]").val(value);
		if (value == 0) {
			$("[name=status]").val("승인요청");
		} else if (value > 0 && value < 100) {
			$("[name=status]").val("진행중");
		} else if (value == ""){
			$("[name=status]").val("");
		} else {
			$("[name=status]").val("종료됨");
		}
		console.log($("[name=status]").val());
	}
	var startChange = function(value) {
		console.log(value);
		if ($("[name=allDay]").val() == 1 || parseInt($("[name=start_hh]").val()) > 14) {
			$("[name=start]").val(moment(value).subtract(1, 'days').format().split("T")[0] + "T15:00:00.000Z");
		} else {
			$("[name=start]").val(value);
		}
		console.log($("[name=start]").val());
	}
	var endChange = function(value) {
		if ($("[name=allDay]").val() == 1 || parseInt($("[name=end_hh]").val()) > 14) {
			$("[name=end]").val(moment(value).subtract(1, 'days').format().split("T")[0] + "T15:00:00.000Z");
		} else {
			$("[name=end]").val(value);
		}
	}
	var stChange = function(value) {
		$("#start_ty").val(value);
		if (value == 1) {
			if ($("[name=start_hh]").val() == "0"){
				$("[name=start_hh]").val("0");
			}else if (parseInt($("[name=start_hh]").val()) > 11) {
				$("[name=start_hh]").val(
						"0" + (parseInt($("[name=start_hh]").val()) - 12));
			} else {
				$("[name=start_hh]").val(
						"" + (parseInt($("[name=start_hh]").val()) + 12));
			}
		} else {
			if ($("[name=start_hh]").val() == "0"){
				$("[name=start_hh]").val("0");
			}else if (parseInt($("[name=start_hh]").val()) < 3) {
				$("[name=start_hh]")
						.val("" + (parseInt($("[name=start_hh]").val()) + 12));
			} else if (parseInt($("[name=start_hh]").val()) > 21) {
				$("[name=start_hh]").val(
						"" + (parseInt($("[name=start_hh]").val()) - 12));
			} else{
				$("[name=start_hh]").val(
						"0" + (parseInt($("[name=start_hh]").val()) - 12));
			}
		}
		if(parseInt($("[name=start_hh]").val()) > 14) {
			$("[name=start]").val(moment($("[name=start]").val()).subtract(1, 'days').format().split("T")[0]);
			console.log($("[name=start]").val());
		}
		console.log($("[name=start]").val());
		console.log($("[name=start_hh]").val());
	}
	var shChange = function(value) {
		if ($("#start_ty").val() == 1) {
			if (value == ""){
				$("[name=start_hh]").val("0");
			}else if(value < 9){
				$("[name=start_hh]").val("" + (parseInt(value) + 15));				
			} else if(value == 12){
				$("[name=start_hh]").val("" + (parseInt(value) + 3));				
			} else{
				$("[name=start_hh]").val("0" + (parseInt(value) - 9));				
			}
		} else {
			if (value == ""){
				$("[name=start_hh]").val("0");
			}else if (value < 7 || value == 12) {
				$("[name=start_hh]").val("0" + (parseInt(value) + 3));
			} else {
				$("[name=start_hh]").val("" + (parseInt(value) - 9));
			}
		}
		;
		if(parseInt($("[name=start_hh]").val()) > 14) {
			$("[name=start]").val(moment($("[name=start]").val()).subtract(1, 'days').format().split("T")[0]);
			console.log($("[name=start]").val());
		}
		console.log($("[name=start_hh]").val());
	}
	var smChange = function(value) {
		if (value == ""){
			$("[name=start_hh]").val("0");
		}else if (value < 10) {
			$("[name=start_mm]").val("0" + value);
		} else {
			$("[name=start_mm]").val("" + value);
		}
		console.log($("[name=start_mm]").val());
	}
	var etChange = function(value) {
		$("#end_ty").val(value);
		if (value == 1) {
			if ($("[name=end_hh]").val() == "0"){
				$("[name=end_hh]").val("0");
			}else if (parseInt($("[name=end_hh]").val()) > 11) {
				$("[name=end_hh]").val(
						"0" + (parseInt($("[name=end_hh]").val()) - 12));
			} else {
				$("[name=end_hh]").val(
						"" + (parseInt($("[name=end_hh]").val()) + 12));
			}
		} else {
			if ($("[name=end_hh]").val() == "0"){
				$("[name=end_hh]").val("0");
			}else if (parseInt($("[name=end_hh]").val()) < 3) {
				$("[name=end_hh]")
						.val("" + (parseInt($("[name=end_hh]").val()) + 12));
			} else if (parseInt($("[name=end_hh]").val()) > 21) {
				$("[name=end_hh]").val(
						"" + (parseInt($("[name=end_hh]").val()) - 12));
			} else{
				$("[name=end_hh]").val(
						"0" + (parseInt($("[name=end_hh]").val()) - 12));
			}
		}
		if(parseInt($("[name=end_hh]").val()) > 15) {
			$("[name=end]").val(moment($("[name=end]").val()).subtract(1, 'days').format().split("T")[0]);
			console.log($("[name=end]").val());
		}
		console.log($("[name=end]").val());
		console.log($("[name=end_hh]").val());
	}
	var ehChange = function(value) {
		if ($("#end_ty").val() == 1) {
			if (value == ""){
				$("[name=end_hh]").val("0");
			}else if(value < 9){
				$("[name=end_hh]").val("" + (parseInt(value) + 15));				
			} else if(value == 12){
				$("[name=end_hh]").val("" + (parseInt(value) + 3));				
			} else{
				$("[name=end_hh]").val("0" + (parseInt(value) - 9));				
			}
		} else {
			if (value == ""){
				$("[name=end_hh]").val("0");
			}else if (value < 7 || value == 12) {
				$("[name=end_hh]").val("0" + (parseInt(value) + 3));
			} else {
				$("[name=end_hh]").val("" + (parseInt(value) - 9));
			}
		}
		;
		if(parseInt($("[name=end_hh]").val()) > 14) {
			$("[name=end]").val(moment($("[name=end]").val()).subtract(1, 'days').format().split("T")[0]);
			console.log($("[name=end]").val());
		}
		console.log($("[name=end_hh]").val());
	}
	var emChange = function(value) {
		if (value == ""){
			$("[name=end_mm]").val("0");
		}else if (value < 10) {
			$("[name=end_mm]").val("0" + value);
		} else {
			$("[name=end_mm]").val("" + value);
		}
		console.log($("[name=end_mm]").val());
	}
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
<script type="text/javascript">
	
</script>
</html>