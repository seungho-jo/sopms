<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Focus - Bootstrap Admin Dashboard</title>
<link rel="stylesheet" href="./css/messagelist.css">
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">

	<div class="topbar">
		<div class="chatname"></div>
	</div>
	<div id="chatbelongs">
		<div id="chats"></div>
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
			<ul>
				<a>
					<li class="icons"><span class="material-icons">
							add_a_photo </span></li>
				</a>
				<a>
					<li class="icons"><span class="material-icons">
							attach_file </span></li>
				</a>
			</ul>
			<button type="button" id="send" class="btn btn-light">전송</button>
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


</body>
</html>