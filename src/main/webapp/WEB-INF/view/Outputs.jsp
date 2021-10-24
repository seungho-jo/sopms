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
<!-- Favicon icon
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet"> -->

<style type="text/css">
	a{
		text-decoration : none;
	}
	#tab_output{
		margin-top : 2%;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<form id="outputForm">
		<input type="hidden" name="pcode" value="${param.pcode}">
		<input type="hidden" name="curPage" value="1">
	</form>
	<div>
		<h3 class="font-weight-bold">산출물</h3>
		<table class="text-dark table table-hover table-responsive-sm" id="tab_output">
			<col width="10%">
			<col width="40%">
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<thead>
				<tr>
					<th>no</th>
					<th>작업명</th>
					<th>산출물</th>
					<th>작업자</th>
					<th>등록날자</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<ul class="pagination justify-content-center" id="paging2">
			
		</ul>
	</div>
</body>
<!-- Required vendors
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script> -->



<!-- Required vendors -->
<script src="${path}/vendor/global/global.min.js"></script>
<script src="${path}/js/quixnav-init.js"></script>
<script src="${path}/js/custom.min.js"></script>


<!-- Vectormap -->
<script src="${path}/vendor/raphael/raphael.min.js"></script>
<script src="${path}/vendor/morris/morris.min.js"></script>


<script src="${path}/vendor/circle-progress/circle-progress.min.js"></script>
<script src="${path}/vendor/chart.js/Chart.bundle.min.js"></script>

<script src="${path}/vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="${path}/vendor/flot/jquery.flot.js"></script>
<script src="${path}/vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="${path}/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="${path}/vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="${path}/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="${path}/vendor/jquery.counterup/jquery.counterup.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		outputList();
	});
	function outputList(){
		$.ajax({
			type:'post',
			url:'${path}/outputList.do',
			data:$("#outputForm").serialize(),
			dataType:'json',
			success:function(data){
				var show = "";
				$.each(data.list, function(index,item){//순번에 따라 item에저장
					show+="<tr><td>"+((data.outPut.count-(data.outPut.pageSize*(data.outPut.curPage-1)))-index)+"</td>";
					show+="<td>"+item.title+"</td>";
					show+="<td onclick='downOutPut("+"\""+item.fname+"\""+")'>"+item.fname+"</td>";
					show+="<td>"+item.m_name+"</td>";
					show+="<td>"+item.reqdate+"</td></tr>";
				})
				$("#tab_output tbody").html(show);
				var paging = "";
				paging += "<li class='page-item' id='pre'><a class='page-link' href='javascript:goBlock("+(data.outPut.startBlock-1)+")'>Pre</a></li>";
				for(var i=data.outPut.startBlock;i<=data.outPut.endBlock;i++){	
					var check = (data.outPut.curPage==i) ? 'active' : '';
					paging += "<li class='page-item "+ check +"'><a class='page-link' href='javascript:goBlock("+i+")'>"+i+"</a></li>"
				}
				paging += "<li class='page-item' id='next'><a class='page-link' href='javascript:goBlock("+(data.outPut.endBlock-1)+")'>Next</a></li>"
				$("#paging2").html(paging);
			},
			error:function(err){
			}
		})
	}
	function goBlock(no){
		$("[name=curPage]").val(no);
		outputList();
	}
	function downOutPut(text){
		location.href="${path}/download.do?fname="+text;
	}
</script>
</html>