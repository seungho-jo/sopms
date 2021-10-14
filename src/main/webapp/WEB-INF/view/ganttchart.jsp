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
<script type="text/javascript">
   $(document).ready(function() {
      $.ajax({
         type : "post",
         url : "${path}/wbslist.do",
         dataType : "json",
         success : function(data) {
            var data = data.list;
            var jsonArray = new Array();
              $.each(data,function(index, gantt){
                 var jsonObj = new Object();
               jsonObj.id= gantt.workcode;
               jsonObj.text= gantt.title;
               jsonObj.start_date= gantt.start_date;
               jsonObj.duration= gantt.duration;
               jsonObj.owner= gantt.manager;
               jsonObj.parent= gantt.parent;
              // jsonObj.open= gantt.open;
              // jsonObj.type= gantt.type;
               jsonArray.push(jsonObj);
              });
            var task_List = new Object();
            task_List.data=jsonArray;
            console.log(task_List);
         
            gantt.init("gantt_here");
            gantt.parse(task_List);
         },
         error : function(err) {
            console.log(err);
         }
      });
      
      
      
      
      $(".gantt_btn_set gantt_left_btn_set gantt_save_btn_set").click(function(){
         alert("g");
      });
      
      $("#regBtn").click(function(){
         alert("a");
      });
   });
</script>