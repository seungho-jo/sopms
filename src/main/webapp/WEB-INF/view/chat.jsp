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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/teamlist.css" />
<link rel="stylesheet" href="./css/chat.css" />
<link rel="stylesheet" href="./css/messagelist.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous">
	
</script>

</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">

			<div class="card">

				<div id="showcontent">

					<div id="chatbox">
						<div class="profileArea">
							<ul class="list-group">
								<li class="list-group-item" aria-disabled="true">채팅방 목록</li>
								<li class="list-group-item" aria-disabled="true">
									<div class="profileItem myProfile">
										<div class="itemBox">
											<div class="profilePic">
												<div class="photo"></div>
											</div>
											<div class="profileContent">
												<ul>
													<li class="name">이진섭 대리</li>
													<li class="position">인사관리모듈 개발</li>
												</ul>
											</div>
											<div class="groupchat"></div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<!-- 채팅방 Start -->
					<div class="contentarea">
						<jsp:include page="messagelist.jsp" />
					</div>
					<!-- 채팅방 END -->

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
	$('.chatname').val("<c:out value='${toId}'/>")

	let id = "<c:out value='${currentId}'/>"

	$(document).ready(function() {
		let wsocket = new WebSocket("ws://"+location.host+"/sopms/chat-ws.do?chatroomId=${chatroomId}");
		wsocket.onopen = function(evt) {
			let userInfo = {
				type : 'System',
				userId : id,
			}
			console.log(userInfo)
			wsocket.send(JSON.stringify(userInfo))
		}

		wsocket.onmessage = function(evt) {
			let time = evt.timeStamp;

			receiveMsg(evt.data);
		}

		$("#send").click(function() {
			let option = {
				chatroomId : "<c:out value='${chatroomId}'/>",
				fromId : "<c:out value='${currentId}'/>",
				toId : $('.chatname').val(),
				msg : $("#write").val()
			}
			console.log(option)
			wsocket.send(JSON.stringify(option));
			$("#write").val('')

		}

		)
	});

	function receiveMsg(msg) {
		let messageItem = JSON.parse(msg)
		console.log(messageItem)
		if (messageItem.type !== null && messageItem.type == 'system') {
			console.log('system message')
		} else {
			if (messageItem.fromId == id) {
				let newMsg = $('#template').clone();
				newMsg.find('.messagearea').addClass('mymessage')
				newMsg.removeAttr('id');
				newMsg.find('.name').html("<c:out value='${showName}'/>");
				newMsg.find('.bubblecontent').html(messageItem.msg);
				//JSON.stringify(msg.msg).slice(1, -1)
				$('#chats').append(newMsg);
				let mx = parseInt($("#chats").height());
				$("#chatbelongs").scrollTop(mx);

			}

			else {
				let newMsg = $('#template').clone();
				newMsg.find('.messagearea').addClass('yourmessage')
				newMsg.removeAttr('id');
				newMsg.find('.bubblecontent').html(messageItem.msg);
				$('#chats').append(newMsg);
				let mx = parseInt($("#chats").height());
				$("#chatbelongs").scrollTop(mx);
			}
		}

	}

	function sendMsg(msg) {

		let myMsg = $('#template').clone();
		myMsg.removeAttr('id');
		myMsg.find('.bubblecontent').html($sendmsg);
		$('#chats').append(myMsg);

		console.log("메시지 보내는중~")

	}
</script>
</html>