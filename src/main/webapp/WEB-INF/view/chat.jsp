<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>SOPMS 채팅</title>
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
<style>
.contentarea .messagearea .messageitem .photoarea .photo {
  background-image: url("${path}/images/profile.jpg");
}
</style>

</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	<div id="main-wrapper">
		<jsp:include page="header.jsp" />
		<jsp:include page="navi.jsp" />
		<div class="content-body">

			<div class="container-fluid">

				<div id="showcontent">

					<div id="chatbox">
						<div class="profileArea">
							<ul class="list-group">
								<li class="list-group-item" aria-disabled="true"><b>채팅방 목록</b></li>
								<c:forEach var="CR" items="${chatroomList}">
									<a href="${path}/getMessage.do?chatroomId=${CR.chatroomId}">
										<li class="list-group-item" onclick="getMsg(this)">
											<div class="itemBox" style="cursor: pointer; display: flex;">
												<div class="profilePic">
													<div class="photo" style="border-radius: 50%; overflow: hidden; width: 45px; height: 45px; background-image: url(${path}/images/profile.jpg); background-size: 45px;">
													</div>
												</div>
												<div class="profileContent" style="margin-left: 10px;">
													<ul>
														<li class="name">${CR.chatroomName}</li>
													</ul>
												</div>
											</div>
									</li>
									</a>
								</c:forEach>
							</ul>
						</div>
					</div>

					<!-- 채팅방 Start -->
					<div class="contentarea">
						<div class="topbar">
							<div class="chatname"></div>
						</div>
						<div id="chatbelongs">
							<div id="chats">
								<c:forEach var="message" items="${messageList}">
									<c:if test="${message.fromId eq currentId}">
										<div class="messagearea mymessage">
											<div class="messageitem">
												<div class="photoarea">
													<div class="photo"></div>
												</div>
												<div class="content">
													<div class="name">${message.fromId}</div>
													<div class="message">
														<div class="chatbubble">
															<div class="bubblecontent">${message.messageBody}</div>
														</div>
														<div class="chatinfo">
															<div class="shown"></div>
															<div class="time"></div>
															<div class="fromId"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${message.fromId ne currentId}">
										<div class="messagearea yourmessage">
											<div class="messageitem">
												<div class="photoarea">
													<div class="photo"></div>
												</div>
												<div class="content">
													<div class="name">${message.fromId}</div>
													<div class="message">
														<div class="chatbubble">
															<div class="bubblecontent">${message.messageBody}</div>
														</div>
														<div class="chatinfo">
															<div class="shown"></div>
															<div class="time"></div>
															<div class="fromId"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>

							</div>
						</div>
						<div class="inputarea">
							<div class="inputmessage">
								<div class="form-group">
									<div class="textarea">
										<textarea class="form-control" id="write" rows="4"></textarea>
									</div>
								</div>
							</div>
							<div class="optionstab">

								<button type="button" id="send" class="btn btn-light">전송</button>
							</div>
						</div>

					</div>
					<div id="template">
						<div class="messagearea">
							<div class="messageitem">
								<div class="photoarea">
									<div class="photo"></div>
								</div>
								<div class="content">
									<div class="name"></div>
									<div class="message">
										<div class="chatbubble">
											<div class="bubblecontent"></div>
										</div>
										<div class="chatinfo">
											<div class="shown"></div>
											<div class="time"></div>
											<div class="fromId"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
<script src="./js/dashboard/dashboard-1.js"></script>
<!-- Counter Up -->
<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>

<script type="text/javascript">
	$('.chatname').val("<c:out value='${toId}'/>")

	let id = "<c:out value='${currentId}'/>"

	$(document).ready(
			function() {
				let wsocket = new WebSocket("ws://" + location.host
						+ "/sopms/chat-ws.do?chatroomId=${chatroomId}");
				wsocket.onopen = function(evt) {
					let mx = parseInt($("#chats").height());
					$("#chatbelongs").scrollTop(mx);
					//메시지 하나 보낼까 싶기도 해 아님 접속중 메시지 띄우든지
				}

				wsocket.onmessage = function(evt) {
					let time = evt.timeStamp;

					receiveMsg(evt.data);
				}
				//메시지 send evt
				$("#send").click(function() {

					sendMsg();
				})

				$("#write").keyup(function(e) {
					if (e.keyCode == 13) {

						sendMsg();
					}
				});
				//메시지 보내기
				function sendMsg() {
					let option = {
						chatroomId : "<c:out value='${chatroomId}'/>",
						fromId : "<c:out value='${currentId}'/>",
						messageBody : $("#write").val()
					}
					jsonOption = JSON.stringify(option)
					wsocket.send(jsonOption);
					console.log(jsonOption)
					//AJAX POST
					//						$.post('saveMessage.do', jsonOption, function(){
					//						console.log(jsonOption);
					//						}

					$.ajax({
						type : "POST",
						url : "${path}/saveMessage.do",
						data : JSON.stringify(option),
						contentType : 'application/json',
						dataType : "json",
					});

					$("#write").val('')

				}
			});

	function receiveMsg(msg) {
		let messageItem = JSON.parse(msg)
		console.log(messageItem)
		if (messageItem.fromId == id) {
			let newMsg = $('#template').clone();
			newMsg.find('.messagearea').addClass('mymessage')
			newMsg.removeAttr('id');
			newMsg.find('.name').html(messageItem.fromId);
			newMsg.find('.bubblecontent').html(messageItem.messageBody);
			$('#chats').append(newMsg);
			let mx = parseInt($("#chats").height());
			$("#chatbelongs").scrollTop(mx);
		}

		else {
			let newMsg = $('#template').clone();
			newMsg.find('.messagearea').addClass('yourmessage')
			newMsg.removeAttr('id');
			newMsg.find('.bubblecontent').html(messageItem.messageBody);
			$('#chats').append(newMsg);
			let mx = parseInt($("#chats").height());
			$("#chatbelongs").scrollTop(mx);
		}
	}

	/*	function getMsg() {
	 let chatroomId = $('.itemBox').find('.crNo').val();
	 $.get("${path}/getMessage.do", {
	 chatroomId : <c:out value="${CR.chatroomId}"/>
	 }, function(data) {

	 console.log(chatroomId)

	 })
	 } */
</script>
</html>