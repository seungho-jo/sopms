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
<!--  -->
<script src="codebase/dhtmlxgantt.js?v=7.1.6"></script>
<link rel="stylesheet" href="codebase/dhtmlxgantt.css?v=7.1.6">
<script src="./common/testdata.js?v=7.1.6"></script>

	<style type="text/css">
		.bd{
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

<!-- Favicon icon 

	-->
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
	               jsonObj.owner= gantt.manager;
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
	   
 
   });
 
</script>
</head>
<body class="bd">
	<div id="gantt_here" style='width: 100%; height: 450px;'></div>
		
	     <script>
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
			               jsonObj.owner= gantt.manager;
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
	     var opts = [];
	     
	    $.ajax({
				type:"post",
				url:"${path}/resourcelist.do?no="+<%=no%>,
				dataType:"json",
				async:false,
				success:function(data) {
		            var data = data.list;
		              $.each(data,function(index, res){
		            	  	
							opts[index] = {key: res.id, label: res.name};
							 console.log(opts[index]);
					});
		            
				},
				error:function(err){
					console.log(err);
				}
			});
		
			
		 var colHeader = '<div class="gantt_grid_head_cell gantt_grid_head_add" onclick="gantt.createTask()"></div>',
			colContent = function (task) {
			 if(task.id == <%=no%>){
					return ('<i class="fa gantt_button_grid gantt_grid_edit fa-pencil" onclick="clickGridButton(' + task.id + ', \'edit\')"></i>' +
							'<i class="fa gantt_button_grid gantt_grid_add fa-plus" onclick="clickGridButton(' + task.id + ', \'add\')"></i>'
						
						);
			 }
			 else{
				 return ('<i class="fa gantt_button_grid gantt_grid_edit fa-pencil" onclick="clickGridButton(' + task.id + ', \'edit\')"></i>' +
							'<i class="fa gantt_button_grid gantt_grid_delete fa-times" onclick="clickGridButton(' + task.id + ', \'delete\')"></i>'
							);
			 }
			};
	    gantt.config.open_tree_initially = true;
	 	gantt.locale.labels.section_description = "작업명";
		gantt.locale.labels.section_time = "기간";
		gantt.locale.labels.section_owner = "담당자";
		gantt.locale.labels.section_content = "작업내용";
		
		 gantt.config.columns =  [
		 	    {name:"text",       label:"작업명",  tree:true, min_width: 180, width: 200, resize: true },
		 	    {name:"start_date", label:"시작 날짜", align: "center", min_width: 100, width: 200, resize: true },
		 	    {name:"end_date", label:"종료 날짜", align: "center", min_width: 100, width: 200, resize: true },
		 	    {name:"owner", label:"담당자", align: "center", width: 60, resize: true,
		 	    	template: function (item) {
		 	    			for(var i =0; i<opts.length; i++){
		 	    				if (item.owner == opts[i].key){return opts[i].label;}
		 	    			}
		 		   	    	return "Undefined";
					} 
		 	    },
		 	
		 	    {name: "duration", label:"기간",width: 60, align: "center", resize: true},
		 	    {name: "content", label:"작업내용",width: 60, align: "center", resize: true},
		 	    
		 	   {
					name: "buttons",
					label: "  ",
					width: 75,
					template: colContent
				}
		 	   
		 	];
		
		 gantt.config.buttons_left = ["gantt_save_btn", "gantt_cancel_btn"];
		 gantt.config.buttons_right = [];
		 
		 gantt.locale.labels.icon_save = "저장";
		 gantt.locale.labels.icon_cancel = "취소";

		gantt.config.lightbox.sections=[
		    {name:"description", height:45, map_to:"text", type:"textarea", focus:true},
		    {name:"content", height:70, map_to:"content", type:"textarea"},
		    {name: "owner", height: 22, map_to: "owner", type: "select", options: opts},
		    {name:"time", height:72, map_to:"auto", type:"duration"}
		];
	
	
	     var formatFunc = gantt.date.date_to_str("%Y-%m-%d"); // 날짜 변환
	     
	     gantt.attachEvent("onLightboxSave", function(id, item){
	    	    if(!item.text){
	    	    	gantt.alert("작업명을 입력해주세요");
	    	    	//gantt.message({type:"error", text:"작업명을 입력해주세요"});
	    	        return false;
	    	    }
	    	    if(!item.content){
	    	    	gantt.alert("작업내용을 입력해주세요");
	    	    	//gantt.message({type:"error", text:"작업내용을 입력해주세요"});
	    	        return false;
	    	    }
	    	        return true;
	    	});    
	
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
	 				// lightbox가 열리고 난 뒤 작업
	 				gantt.attachEvent("onAfterLightbox", function() { 
	 					if (stat == 2) { // 저장버튼 클릭 시
	 							
	 						
	 								$.ajax({
	 									type : "post",
	 									url : "${path}/update.do",
	 									data : {
	 										workcode : id,
	 										title : gantt.getTask(id).text,
	 										content : gantt.getTask(id).content,
	 		 								start_date : formatFunc(gantt.getTask(id).start_date),
	 		 								duration : gantt.getTask(id).duration,
	 		 								manager : gantt.getTask(id).owner,
	 		 								parent : gantt.getTask(id).parent,
	 		 								r_pcode : <%=no%>,
	 	 									r_pm : "<%=pm%>"
	 									},
	 									success : function(data) {
	 										console.log(data);
	 										reset();
	 										//alert(gantt.getTask(id).id);
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
 		 								gantt.deleteTask(id);
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
<!-- Required vendors <script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>-->



<!-- Vectormap <script src="./vendor/raphael/raphael.min.js"></script>
<script src="./vendor/morris/morris.min.js"></script>


<script src="./vendor/circle-progress/circle-progress.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>

<script src="./vendor/gaugeJS/dist/gauge.min.js"></script>-->


<!--  flot-chart js <script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script-->


<!-- Owl Carousel <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>-->


<!-- Counter Up <script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>-->

</html>
