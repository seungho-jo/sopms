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
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: toDay,
      navLinks: true,
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	console.log("매개변수로 받는 내용");
    	console.log(arg);
    	console.log("시작:"+arg.start);
    	console.log("종료:"+arg.end);
    	console.log("종일여부:"+arg.allDay);
    	$("h2").click();
    	$("#exampleModalLongTitle").text("일정등록");
    	$("#regBtn").show();
    	$("#uptBtn").hide();
    	$("#delBtn").hide();
    	$("form")[0].reset();
    	$("#start").val(arg.start.toLocaleString());
    	$("[name=start]").val(arg.start.toISOString());
    	console.log(arg.start.toISOString());
    	$("#end").val(arg.end.toLocaleString());
    	$("[name=end]").val(arg.end.toISOString());
    	$("#allDay").val(""+arg.allDay);
    	console.log("종일:"+(arg.allDay?1:0));
    	$("[name=allDay]").val((arg.allDay?1:0));
        calendar.unselect()
      },
      eventClick: function(arg) {
    	console.log("특정일정 클릭시!!");
    	console.log(arg.event);
    	
    	$("h2").click();
    	$("#exampleModalLongTitle").text("상세일정");
    	$("#regBtn").hide();
    	$("#uptBtn").show();
    	$("#delBtn").show();
    	addForm(arg.event);
      },
	  eventDrop:function(info){
	 	console.log("#이벤트 드랍#")	
	 	console.log(info.event);
		addForm(info.event);
		ajaxFun("calendarUpdate.do")
	  },
	  eventResize:function(info){ 
		 console.log("#이벤트 사이즈변경#")	
		 console.log(info.event);	
		 addForm(info.event);
		 ajaxFun("calendarUpdate.do")
	  },      
      editable: true,
      dayMaxEvents: true,
      events: function(info,successCallback, failureCallback){
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/calList.do",
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data)
    			  successCallback(data);
    		  },
    		  error:function(err){
    			  console.log(err);
    		  }
    		  
    	  });
    	  
      }
    });

    calendar.render();
    
    $("#regBtn").click(function(){
    	if($("[name=title]").val()==""){
    		alert("일정을 등록하세요!");
    		return;
    	}
    	ajaxFun("calendarInsert.do")
    });
    $("#uptBtn").click(function(){
    	if(confirm("수정하시겠습니까?")){
    		ajaxFun("calendarUpdate.do")
    	}
    });
    $("#delBtn").click(function(){
		if(confirm("삭제하시겠습니까?")){
			ajaxFun("calendarDelete.do")
    	}   	
    });
    
    
  });
  function ajaxFun(url){
  	$.ajax({
		type:"post",
		url:"${path}/"+url,
		data:$("form").serialize(),
		success:function(data){
			alert(data);
			location.reload();
		},
		error:function(err){
			console.log(err);
		}
		
	});  	  
  }
  function addForm(event){
  	$("form")[0].reset();
	$("[name=id]").val(event.id);
	$("[name=title]").val(event.title);
	$("#color").val(event.color);
	$("[name=content]").val(event.extendedProps.content);
	$("#start").val(event.start.toLocaleString());
	$("[name=start]").val(event.start.toISOString());
	$("#end").val(event.end.toLocaleString());
	$("[name=end]").val(event.end.toISOString());
	$("#allDay").val(""+event.allDay);
	$("[name=allDay]").val((event.allDay?1:0)); 	  	  
  }

</script>
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
							<button type="button" onclick="location.href='manage_mem.jsp'"
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

										<form class="form" method="post">
											<input type="hidden" name="id" value="0" />
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">일정</span>
												</div>
												<input type="text" name="title" class="form-control"
													placeholder="일정입력">
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">시작일</span>
												</div>
												<input type="text" id="start" class="form-control"
													placeholder="입력"> <input type="hidden" name="start">
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">종료일</span>
												</div>
												<input type="text" id="end" class="form-control"
													placeholder="입력"> <input type="hidden" name="end">
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
												<select id="color" class="form-control">
													<option value="purple">보라색</option>
													<option value="red">빨간색</option>
													<option value="yellow">노랑색</option>
													<option value="green">초록색</option>
													<option value="brown">갈색</option>
													<option value="black">검정색</option>
													<option value="pink">분홍색</option>
													<option value="navy">파란색</option>
													<option value="aqua">하늘색</option>
												</select>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">종일여부</span>
												</div>
												<select id="allDay" class="form-control">
													<option value="true">종일</option>
													<option value="false">시간</option>
												</select> <input type="hidden" name="allDay" />
											</div>
										</form>
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