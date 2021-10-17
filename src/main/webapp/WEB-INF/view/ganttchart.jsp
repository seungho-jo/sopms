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
<script src="../common/testdata.js?v=7.1.6"></script>
	<style>
		html, body {
			height: 100%;
			padding: 0px;
			margin: 0px;
			overflow: hidden;
		}

		.fa {
			cursor: pointer;
			font-size: 14px;
			text-align: center;
			opacity: 0.2;
			padding: 5px;
		}

		.fa:hover {
			opacity: 1;
		}

		.fa-pencil {
			color: #ffa011;
		}

		.fa-plus {
			color: #328EA0;
		}

		.fa-times {
			color: red;
		}
	</style>
	<!-- <style>
		html, body {
			padding: 0px;
			margin: 0px;
			height: 100%;
			
		}
	</style> -->
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

<%
String noS = request.getParameter("pcode");
String pm = request.getParameter("pm");
int no = Integer.parseInt(noS);
%>
<script type="text/javascript">
   $(document).ready(function() {
	   
	   
	      $.ajax({
	         type : "post",
	         url : "${path}/wbslist.do?no="+<%=no%>,
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
	               jsonObj.owner= gantt.pm_name;
	               jsonObj.parent= gantt.parent;
	               jsonObj.content= gantt.content;
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
</head>
<body>
	<div id="gantt_here" style='width: 100%; height: 450px;'></div>
		<!-- Modal  -->
		<div class="modal fade" id="exampleModalCenter" style="display: none;" aria-hidden="true">
	         <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
	                 <div class="modal-header">
	                     <h5 class="modal-title">수정</h5>
	                     <button type="button" class="close" data-dismiss="modal"><span>×</span>
	                     </button>
	                 </div>
	                 <div class="modal-body">
	                     <p></p>
	                 </div>
	                 <div class="modal-footer">
	                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                     <button type="button" class="btn btn-primary">Save changes</button>
	                 </div>
	             </div>
	         </div>
	     </div>
	     
	     <div class="modal fade" id="exampleModalCenter1" style="display: none;" aria-hidden="true">
	         <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
	                 <div class="modal-header">
	                     <h5 class="modal-title">추가</h5>
	                     <button type="button" class="close" data-dismiss="modal"><span>×</span>
	                     </button>
	                 </div>
	                 <div class="modal-body">
	                     <p></p>
	                 </div>
	                 <div class="modal-footer">
	                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                     <button type="button" class="btn btn-primary">Save changes</button>
	                 </div>
	             </div>
	         </div>
	     </div>
	     
	     
	     <script>
	     gantt.config.open_tree_initially = true;
	 	gantt.locale.labels.section_description = "작업명";
		gantt.locale.labels.section_time = "기간";
		gantt.locale.labels.section_owner = "담당자";
		gantt.locale.labels.section_content = "작업내용";
		/*var opts = [
		   // {key:1, label: "High"},                                            
		   // {key:2, label: "Normal"},                                         
		   // {key:3, label: "Low"}                                            
		];
		$.ajax({
			type:"post",
			url:"${path}/schMember2.do",
			dataType:"json",
			async:false,
			success:function(data){
				console.log("결과");
				console.log(data);
				
				var show="";
				$(mlist).each(function(idx, mem){
					//Object.keys(mlist).length mlist.length
					//if(idx < Object.keys(mlist).length)
						opts[idx] = {key: mem.id, label: mem.name};
					
				});
				
			},
			error:function(err){
				console.log(err);
			}
		});*/
		
		gantt.config.lightbox.sections=[
		    {name:"description", height:45, map_to:"text", type:"textarea", focus:true},
		    {name:"content", height:70, map_to:"content", type:"textarea"},
		    {name:"owner", height:45, map_to:"owner",type:"textarea"},
		    /*{ //멤버 목록
				name: "owner", height: 22, map_to: "owner", type: "select", options: opts]
			},*/
		    {name:"time", height:72, map_to:"auto", type:"duration"}
		];
	     
	     var colHeader = '<div class="gantt_grid_head_cell gantt_grid_head_add" onclick="gantt.createTask()"></div>',
			colContent = function (task) {
				return ('<i class="fa gantt_button_grid gantt_grid_edit fa-pencil" onclick="clickGridButton(' + task.id + ', \'edit\')"></i>' +
					'<i class="fa gantt_button_grid gantt_grid_add fa-plus" onclick="clickGridButton(' + task.id + ', \'add\')"></i>' +
					'<i class="fa gantt_button_grid gantt_grid_delete fa-times" onclick="clickGridButton(' + task.id + ', \'delete\')"></i>');
			};
	

		
	     gantt.config.columns =  [
	 	    {name:"text",       label:"작업명",  tree:true, min_width: 180, width: 200, resize: true },
	 	    {name:"start_date", label:"시작 날짜", align: "center", min_width: 100, width: 200, resize: true },
	 	    {name:"end_date", label:"종료 날짜", align: "center", min_width: 100, width: 200, resize: true },
	 	    {name:"owner", label:"PM", align: "center", width: 60, resize: true },
	 	    {name: "duration", label:"기간",width: 60, align: "center", resize: true},
	 	    {name: "content", label:"작업내용",width: 60, align: "center", resize: true},
	 	    
	 	   {
				name: "buttons",
				label: colHeader,
				width: 75,
				template: colContent
			}
	 	   
	 	];
	    // gantt.init("gantt_here");
	     var formatFunc = gantt.date.date_to_str("%Y-%m-%d"); // 날짜 변환
	     function reset(){//gant차트 다시 로딩하는 함수
	    	 $.ajax({
			         type : "post",
			         url : "${path}/wbslist.do?no="+<%=no%>,
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
			               jsonObj.owner= gantt.pm_name;
			               jsonObj.parent= gantt.parent;
			               jsonObj.content= gantt.content;
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
	     }
	  // 등록 수정 삭제 버튼 함수
	 	function clickGridButton(id, action) {
	 		var stat = 0;
	 		switch (action) {
	 			case "edit":
	 				gantt.showLightbox(id);
	 				gantt.attachEvent("onLightboxCancel", function(id){ // 취소버튼 클릭 시
	 					stat = 1;
	 					return;
	 				})
	 				gantt.attachEvent("onLightboxSave", function(id, task, is_new){ // 저장버튼 클릭 시
	 				    stat = 2;
	 				    return true;

	 				})

	 				gantt.attachEvent("onLightboxDelete", function(id) { // 라이트 창에서 삭제버튼 클릭 시
	 					
	 					gantt.confirm({
	 						title : gantt.locale.labels.confirm_deleting_title,
	 						text : "완료",
	 						callback : function(res) {
		 						if (res)
		 							$.ajax({
		 								type : "post",
		 								url : "${path}/delete.do",
		 								data : {
		 									id : id,
		 									r_pcode : <%=no%>,
		 									r_pm : "<%=pm%>"
		 								},
		 								success : function(data) {
		 									gantt.deleteTask(id);
		 									reset();
		 									
		 								},
		 								error : function(err) {
		 									alert("실패!");
		 									console.log(err);
		 								}
		 							});
		 					}
	 					});
	 					
	 					return true;
	 				})
	 				gantt.attachEvent("onAfterLightbox", function() { // lightbox가 열리고 난 뒤 작업
	 					if (stat == 2) { // 저장버튼 클릭 시
	 								$.ajax({
	 									type : "post",
	 									url : "${path}/update.do",
	 									data : {
	 										workcode : id,
	 										title : gantt.getTask(id).text,
	 		 								start_date : formatFunc(gantt.getTask(id).start_date),
	 		 								duration : gantt.getTask(id).duration,
	 		 								pm : "<%=pm%>",
	 		 								manager : gantt.getTask(id).owner,
	 		 								parent : gantt.getTask(id).parent,
	 		 								r_pcode : <%=no%>,
	 	 									r_pm : "<%=pm%>"
	 									},
	 									success : function(data) {
	 										console.log(data);
	 										reset();
	 										alert(gantt.getTask(id).id);
	 										
	 									},
	 									error : function(err) {
	 										console.log("에러" + err);
	 										alert("실패");
	 									}
	 								});
	 					}
	 				});

	 				
	 				break;
	 			case "add":
	 				gantt.createTask(null, id);
	 				gantt.attachEvent("onAfterTaskAdd", function(id,item){
	    					stat = 3;
	 					if (stat == 3) { // 추가버튼 클릭 시
	 						$.ajax({
	 							type : "post",
	 							url : "${path}/insert.do",
	 							data : {
	 								title : gantt.getTask(id).text,
	 								content : gantt.getTask(id).content,
	 								start_date : formatFunc(gantt.getTask(id).start_date),
	 								duration : gantt.getTask(id).duration,
	 								pm : "<%=pm%>",
	 								manager : gantt.getTask(id).owner,
	 								parent : gantt.getTask(id).parent,
	 								r_pcode : <%=no%>,
 									r_pm : "<%=pm%>"
	 							},
	 							
	 							success : function(data) {
	 								console.log(data);
	 								gantt.deleteTask(id);
	 								reset();
	 								alert("성공");
	 								
	 								
	 							},
	 							error : function(err) {
	 								console.log("에러" + err);
	 								
	 								alert("실패");
	 							}
	 						});
	 					}
	 				});
	 				break;
	 			case "delete":
	 				gantt.confirm({
	 					title : gantt.locale.labels.confirm_deleting_title,
	 					text : "삭제하시겠습니까?",
	 					callback : function(res) {
	 						if (res)
	 							$.ajax({
	 								type : "post",
	 								url : "${path}/delete.do",
	 								data : {
	 									id : id,
	 									r_pcode : <%=no%>,
	 									r_pm : "<%=pm%>"
	 								},
	 								success : function(data) {
	 									gantt.deleteTask(id);
	 									reset();
	 									
	 									
	 								},
	 								error : function(err) {
	 									alert("실패!");
	 									console.log(err);
	 								}
	 							});
	 					}
	 				});

	 				break;
	 			}
	 		}
	 		
	     
	     
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
