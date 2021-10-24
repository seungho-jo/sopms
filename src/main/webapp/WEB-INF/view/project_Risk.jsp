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
<link href="./css/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">-->

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
	<form id="outputForm01">
		<input type="hidden" name="pcode" value="${param.pcode}">
		<input type="hidden" name="curPage" value="1">
	</form>
	<div>
		<h3 class="font-weight-bold">리스크</h3>
		<table class="table table-hover table-responsive-sm" id="tableList">
			<col width="25%">
			<col width="35%">
			<col width="20%">
			<col width="20%">
			<thead>
				<tr class="text-center">
					<th class="text-dark">리스크명</th>
					<th class="text-dark">리스크상태</th>
					<th class="text-dark">조치자</th>
					<th class="text-dark">등록날짜</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		<ul class="pagination justify-content-center" id="paging3">
				
		</ul>
	</div>		
</body>
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
	outputList01();
});

function outputList01(){
	$.ajax({
		type :'post',
		url :'${path}/outputList01.do',
		data:$("#outputForm01").serialize(),
		dataType:'json',
		success : function(data){
			var show = "";
			$.each(data.rlist, function(index,item){
				show+="<tr class='text-center text-dark'><td>"+item.risk_name+"</td>";
				show+="<td>"+item.risk_status+"</td>";
				show+="<td>"+item.id+"</td>";
				show+="<td>"+item.risk_reg+"</td></tr>";
			})
			$("#tableList tbody").html(show);
			var paging = "";
			paging += "<li class='page-item' id='pre'><a class='page-link' href='javascript:goBlock01("+(data.outPut.startBlock-1)+")'>Pre</a></li>"
			for(var i=data.outPut.startBlock;i<=data.outPut.endBlock;i++){	
				var check = (data.outPut.curPage==i) ? 'active' : '';
				paging += "<li class='page-item "+ check +"'><a class='page-link' href='javascript:goBlock01("+i+")'>"+i+"</a></li>"
			}
			paging += "<li class='page-item' id='next'><a class='page-link' href='javascript:goBlock01("+(data.outPut.endBlock-1)+")'>Next</a></li>"
			$("#paging3").html(paging);
		},
		error:function(err){
			console.log(err);
			alert(err);
		}
	})
}
function goBlock01(no){
	$("[name=curPage]").val(no);
	outputList01();
}
</script>
</html>

