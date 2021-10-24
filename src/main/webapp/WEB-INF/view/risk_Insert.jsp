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
<link href="./css/risk_Insert.css" rel="stylesheet">
<title>Risk Insert</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">
			<form style="display: flex" method="post">
			<input type="hidden" name="rank" value="">
			<div class="card" style="min-height:1000px;">
			<h2 id="card-title">리스크 등록</h2>
				<div class="card-body">
					<!-- 프로젝트명 -->
					<div class="row g-2" style="margin-top:10%">
						<div class="col-4 mb-3">
							<div class="form-floating">
					     		<h4 id="title">프로젝트명 </h4>
					    	</div>
					    </div>
					    <div class="col-6 mb-3">
						      <select id="pcode" class="form-select" name="pcodeS" id="floatingSelectGrid" aria-label="Floating label select example">
						        <option selected>프로젝트</option>
						      	<c:forEach var="pro" items="${pj}">
						      		<option value="${pro.pcode}">${pro.pname}</option>
						      	</c:forEach>
						      </select>
					  	</div>	
					<!-- 리스크명 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
					     		<h4 id="title">리스크명 </h4>
					    	</div>
					    </div>
					    <div class="col-6 mb-3">
					    	<div class="form-floating">
					      		<input type="text" class="form-control" placeholder="리스크명 작성" aria-label="리스크명 작성" name="risk_name" >
					    	</div>
					  	</div>
					<!-- 리스크 내용 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
					     		<h4 id="title">리스크내용</h4>
					    	</div>
					    </div>
					    <div class="col-6 mb-3">
					    	<div class="form-floating">
							  <textarea class="form-control" name="risk_content" placeholder="리스크내용을 입력하세요." id="floatingTextarea2" style="height: 100px"></textarea>
							  <label for="floatingTextarea2"></label>
							</div>
					  </div>	
					  <!-- 리스크 상태 -->
						<div class="col-4 mb-3">
							<div class="form-floating">
					     		<h4 id="title">리스크 상태 </h4>
					    	</div>
					    </div>
					    <div class="col-6 mb-3">
					    	<div class="form-floating">
					      		<select id="status" name="risk_status" class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
						        <option selected>리스크 상태</option>
						        <option>조치완료</option>
						        <option>진행중</option>
						        <option>홀드</option>
						      </select>
					    	</div>
					  	</div>
					  <!-- pm이 작성자 일 경우 -->
					  	<c:if test="${user.rank=='부장'}">
					  		<div class="col-4 mb-3">
								<div class="form-floating">
						     		<h4 id="title">조치자 선택</h4>
						    	</div>
					    	</div>
					    	<div class="col-6 mb-3">
					    		<div class="form-floating">
						      		<select id="jochiPerson" name="jochiPerson" class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
								        <option selected>조치자</option>
							     	 </select>
					    		</div>
					  		</div>
					  	</c:if>
				</div>
				<div class="row g-2">
					<div class="col-md mb-3">
						<button type="button" class="btn btn-primary" id="button_left">등록</button>
					</div>
					<div class="col-md mb-3">
						<button type="button" class="btn btn-primary" id="button_right">취소</button>
					 </div>
				</div>
			</div>
		</div>
		</form>
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
	
	$("#pcode").change(function(){
		$.ajax({
			type:"post",
			url:"${path}/getJochiPcode.do?pcode="+$(this).val(),
			dataType:'json',
			success:function(data){
				var show = "";
				$.each(data.getPcode, function(index, item){
					show+="<option value='"+item.id+"'>"+item.m_name+"</option>";
				})
				$("#jochiPerson").append(show);
			},
			error:function(err){
			}
		});
	});	

	$(".metismenu").children().eq(8).attr('class', 'mm-active');
	
	$("#button_left").click(function(){
		if(${user.rank == '부장'}){
			if($("[name=pcodeS]").val()=="프로젝트"){
				alert("프로젝트명을 선택하세요.");
				$("[name=pcodeS]").focus();
				return false;
			}else if($("[name=risk_name]").val()==""){
				alert("리스크명을 입력하세요.");
				$("[name=risk_name]").focus();
				return false;
			}else if($("[name=risk_content]").val()==""){
				alert("리스크내용을 입력하세요.");
				$("[name=risk_content]").focus();
				return false;
			}else if($("[name=risk_status]").val()=="리스크 상태"){
				alert("리스크 상태를 선택하세요.");
				$("[name=risk_status]").focus();
				return false;
			}else if($("[name=jochiPerson]").val()=="조치자"){
				console.log($("[name=jochiPerson]").val());
				alert("조치자를 선택하세요.");
				$("[name=jochiPerson]").focus();
				return false;
			}else{
				$("form").attr("action", "${path}/insertRisk.do");
				$("form").submit();
			}
		}else{
			if($("[name=pcodeS]").val()=="프로젝트"){
				alert("프로젝트명을 선택하세요.");
				$("[name=pcodeS]").focus();
				return false;
			}else if($("[name=risk_name]").val()==""){
				alert("리스크명을 입력하세요.");
				$("[name=risk_name]").focus();
				return false;
			}else if($("[name=risk_content]").val()==""){
				alert("리스크내용을 입력하세요.");
				$("[name=risk_content]").focus();
				return false;
			}else if($("[name=risk_status]").val()=="리스크 상태"){
				alert("리스크 상태를 선택하세요.");
				$("[name=risk_status]").focus();
				return false;
			}else{
				$("form").attr("action", "${path}/insertRisk.do");
				$("form").submit();
			}
		}
	});
	
	$("#button_right").click(function(){
		if(confirm("취소하시겠습니까?")){
		$(location).attr("href","${path}/riskPageList.do");
		}
	});
	
	$("#status").change(function(){
		console.log($(this).val());
		console.log($("[name=risk_name]").val());
		console.log($("[name=risk_content]").val());
		console.log($("[name=risk_name]").val());
		
	});
	
	$("[name=pcodeS]").change(function(){
		console.log($(this).val());
		console.log(typeof $(this).val());
	});
	
</script>
</html>
