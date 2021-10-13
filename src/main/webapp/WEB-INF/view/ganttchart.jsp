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
<script src="codebase/dhtmlxgantt.js?v=7.1.6"></script>
<link rel="stylesheet" href="codebase/dhtmlxgantt.css?v=7.1.6">
	<style>
		html, body {
			padding: 0px;
			margin: 0px;
			height: 100%;
			
		}
	</style>
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


<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body>
	<div id="gantt_here" style='width:auto; min-height:1000px;'></div>
		<!-- Modal  -->
		<div class="modal fade" id="exampleModalCenter" style="display: none;" aria-hidden="true">
	         <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
	                 <div class="modal-header">
	                     <h5 class="modal-title">Modal title</h5>
	                     <button type="button" class="close" data-dismiss="modal"><span>×</span>
	                     </button>
	                 </div>
	                 <div class="modal-body">
	                     <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
	                 </div>
	                 <div class="modal-footer">
	                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                     <button type="button" class="btn btn-primary">Save changes</button>
	                 </div>
	             </div>
	         </div>
	     </div>
	     
	<script>

	gantt.config.autosize = "xy";
	gantt.config.autosize_min_width = 1000;
	gantt.config.columns =  [
	    {name:"text",       label:"Task name",  tree:true, width:100 },
	    {name:"start_date", label:"Start time", align: "center", width: 100 },
	    {name:"end_date", label:"End time", align: "center", width: 100 },
	    {name:"PM", label:"PM", align: "center", width: 60 },
	    {name: "duration", width: 60, align: "center"},
	    {name: "add", width: 44}
	];
	
		gantt.init("gantt_here");

		gantt.parse({
			data: [
				{ id: 1, text: "Project #2", start_date: "01-04-2018", end_date: "19-04-2018", PM: "PM01",duration: 18, progress: 0.4, open: true },
				{ id: 2, text: "Task #1", start_date: "02-04-2018", end_date: "10-04-2018", PM: "PM01", duration: 8, progress: 0.6, parent: 1 },
				{ id: 3, text: "Task #2", start_date: "11-04-2018", end_date: "19-04-2018", PM: "PM01", duration: 8, progress: 0.6, parent: 1 }
			],
			links: [
				{id: 1, source: 1, target: 2, type: "1"},
				{id: 2, source: 2, target: 3, type: "0"}
			]
		});
		gantt.attachEvent("onTaskClick", function() {
			 $("#exampleModalCenter").modal("show");
		});
	</script>
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
</html>