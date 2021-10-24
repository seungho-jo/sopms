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
<title>사용자 목록</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->

<style>
.card-body {
	
}

.table {
	text-align: center;
	box-sizing: border-box;
	border-spacing: 2px;
	border-bottom-width: 1px;
}

#tableBigname { /*tr ( no. 이름 부서 등 큰제목)*/
	color: black;
	display: table-row;
}

#tableBigname>th {
	font-size: 15px;
}

.hoverTr:hover {
	background-color: #eaeaea;
}

.hoverTr {
	color: black;
}

#userPlus {
	margin-top: 2%;
	position: relative;
	left: 87%;
}
/* .modal-dialog{
    overflow-y: initial !important
} */
.modal-body1 {
	height: 350px;
	overflow-y: auto; /*테이블 양이 많아 질경우 스크롤*/
	padding: 0;
}
</style>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<div class="card" style="display: block;">
		<h3 class="font-weight-bold">리소스</h3>
		<div class="card-body">
			<table class="table" id="tableList1" style="color: black;">
				<!--.table table-hover table-responsive-sm  -->
				<thead id="theadName">
					<tr id="tableBigname">
						<th>이름</th>
						<th>부서</th>
						<th>직급</th>
						<th>삭제하기</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<form id="form22" method="post">
				<!-- 삭제 form -->
				<input type="hidden" name="id"> <input type="hidden"
					name="pcode">
			</form>
			<div class="button">
				<button type="button" id="userPlus" class="btn btn-secondary"
					data-toggle="modal" data-target=".bd-example-modal-lg">인원추가</button>
			</div>

			<!-- Modal ex) <div class="modal-dialog" style="width:auto;display:table"> 		-->
			<div class="bootstrap-modal">
				<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-hidden="true" id="modal1">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">인원 추가</h5>
								<button type="button" class="close" data-dismiss="modal">
								</button>
							</div>
							<div class="modal-body1">
								<div class="div-memberTable">
									<!--table-responsive  -->
									<table class="table" id="tablemodalId">
										<!--table table-bordered verticle-middle table-responsive-sm  -->
										<thead>
											<tr id="tableBigname">
												<th>이름</th>
												<th>부서</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody></tbody>

									</table>
									<div
										style="text-align: left; color: black; font-size: 20px; margin-top: 5%; margin-left: 3%;">추가할
										인원</div>
									<table class="table" id="tablemodalId2" style="color: black;">
										<!--table table-bordered verticle-middle table-responsive-sm  -->
										<thead>
											<tr id="tableBigname">
												<th>이름</th>
												<th>부서</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody></tbody>

									</table>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" id="regMaster"
											data-dismiss="modal">등록하기</button>
										<!-- modal에서 추가한 데이터 등록하기 -->
										<button type="button" class="btn btn-primary"
											data-dismiss="modal" id="cancelMaster">취소</button>
									</div>
								</div>
								<!-- tr누르면 이 table로 담아옴  -->

								<form class="div-result" id="result"
									style="text-align: center; font-size: 15px; color: black;"
									method="post">
									<input type="hidden" name="id"> <input type="hidden"
										name="pcode" value="${param.pcode}">
								</form>

								<!--table table-bordered verticle-middle table-responsive-sm  -->

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--.card-body -->

	</div>


	<!-- .card -->
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
	getMemberData();
	
});


	$("#regMaster").click(function(){//모달 내부에서 선택한 인원 등록하기 버튼
	 $("#result [name=id]").val(tdArr)
		$.ajax({
		type: 'POST',
		url: '${path}/resourceModalReg.do',
		data: $("#result").serialize(),
		dataType: 'json',
		success:function(data){
			//sql 결과 저장 
			var show = "";
			$.each(data.resourceList, function(index,item){//순번에 따라 item에저장
				show+="<tr class='hoverTr3'><td>"+item.name+"</td>";
				show+="<td>"+item.dept+"</td>";
				show+="<td>"+item.rank+"</td>";
				show+="<td><span onclick='javascript:deleteUser("+"\""+item.id+"\""+")"+"'><i class='fa fa-close color-danger'></i></span></td></tr>";
			})
			
				$("#tableList1 tbody").html(show);
		    	$('#tablemodalId tbody').html("");
		    	$('#tablemodalId2 tbody').html("");
				$("#modal1").modal('hide');
		},
		error:function(err){
		}
	})
})
tdArr = new Array();  	
$("#userPlus").click(function(){ //인원추가 버튼 누르면 나오는 modal창 
	$.ajax({
		type: 'POST',
		url: '${path}/resourceModal.do?pcode=${param.pcode}',
		dataType: 'json',
		success:function(data){
			//sql 결과 저장 
			var show = "";
			$.each(data.modalList, function(index,list){//순번에 따라 item에저장
				show+="<tr class='hoverTr'><td>"+list.name+"</td>";
				show+="<td>"+list.dept+"</td>";
				show+="<td>"+list.rank+"</td>";
				show+="<td style='display:none;'>"+list.id+"</td></tr>";
			})
			$("#tablemodalId tbody").html(show);
			//--------------------------------------------------------------------------------
},
		error:function(err){
				}
			})
		$(document).off("click").on('click','.hoverTr',function(){//modal 첫번쨰 테이블
		tdArr2 = new Array(); // 배열 선언 , 바깥쪽 배열 용도 ex) 세영[0][0], 세영[0][1], 세영[0][2]
		var tr = $(this);
		var td = tr.children();
		console.log("클릭한 Row의 모든 데이터 : " + tr.text());
		td.each(function(i) {
			tdArr2.push(td.eq(i).text());
		});
		console.log("tdArr  1번째 : " + tdArr);
		console.log("tdArr2 2번째 : " + tdArr2);
		$(this).remove();
		var tdArrText= "";
		tdArrText+="<tr class='hoverTr2'><td>"+tdArr2[0]+"</td>";
		tdArrText+="<td>"+tdArr2[1]+"</td>";
		tdArrText+="<td>"+tdArr2[2]+"</td>";
		tdArrText+="<td style='display:none'>"+tdArr2[3]+"</td></tr>";
		$("#tablemodalId2 tbody").append(tdArrText);
		tdArr.push($(this).children("td").eq(3).text());
		console.log("tdArr:"+tdArr);
	}) 
	$(document).on('click','.hoverTr2',function() {//modal 두번쨰 테이블 
			tdArr3 = new Array();
			var tr = $(this);
			var td = tr.children();
			td.each(function(i) {
				tdArr3.push(td.eq(i).text());
			});
			console.log("tdArr  3번째 : " + tdArr3);
			$(this).remove();
			
			var tdArrText2= "";
			tdArrText2+="<tr class='hoverTr'><td>"+tdArr3[0]+"</td>";
			tdArrText2+="<td>"+tdArr3[1]+"</td>";
			tdArrText2+="<td>"+tdArr3[2]+"</td></tr>";
			tdArrText2+="<td style='display:none'>"+tdArr3[3]+"</td></tr>";
			$("#tablemodalId tbody").append(tdArrText2);
			var deleteId = $(this).children("td").eq(3).text();
			tdArr = tdArr.filter(function(item){
				return item!=deleteId;
			});
			console.log("tdArr222:"+tdArr);
		})
		
})
	


$(document).on("click","#cancelMaster", function() {
    $('#tablemodalId tbody').html("");
    $('#tablemodalId2 tbody').html("");
	tdArr.length=0;    
	console.log(tdArr.length);
});
function getMemberData(){ //리소스 처음 리스트 
	$.ajax({
		type: 'POST',
		url: '${path}/projectStatus_resource.do?pcode=${param.pcode}',
		dataType: 'json',
		success:function(data){
			//sql 결과 저장 
			var show = "";
			$.each(data.resourceList, function(index,item){//순번에 따라 item에저장
				show+="<tr class='hoverTr3'><td>"+item.name+"</td>";
				show+="<td>"+item.dept+"</td>";
				show+="<td>"+item.rank+"</td>";
				show+="<td><span onclick='javascript:deleteUser("+"\""+item.id+"\""+")"+"'><i class='fa fa-close color-danger'></i></span></td></tr>";
			})
				$("#tableList1 tbody").html(show);
		},
		error:function(err){
		}
	})
}
function deleteUser(id){
	$("#form22 [name=id]").val(id);
	$("#form22 [name=pcode]").val(${param.pcode});
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type: 'POST',
			url: '${path}/resourcememberDelete.do',
			dataType: 'json',
			data:$("#form22").serialize(),
			success:function(data){
				var show = "";
				$.each(data.resourceList, function(index,item){//순번에 따라 item에저장
					show+="<tr class='hoverTr3'><td>"+item.name+"</td>";
					show+="<td>"+item.dept+"</td>";
					show+="<td>"+item.rank+"</td>";
					show+="<td><span onclick='javascript:deleteUser("+"\""+item.id+"\""+")"+"'><i class='fa fa-close color-danger'></i></span></td></tr>";
				})
					$("#tableList1 tbody").html(show);
			},
			error:function(err){
			}
		})
	}
}

</script>
</html>