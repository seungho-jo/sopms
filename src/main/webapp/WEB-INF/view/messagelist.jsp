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
<title>Focus - Bootstrap Admin Dashboard</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/messagelist.css" />
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous">
  </script>
	
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">

      <div class="topbar">
        <div class="chatname">김광진 부장</div>
      </div>
      <div class="chats">
        <div class="messagearea">
          <div class="messageitem yourmessage">
            <div class="photoarea">
              <div class="photo"></div>
            </div>
            <div class="content">
              <div class="name">김광진 부장</div>
              <div class="message">
                <div class="chatbubble">
                  <div class="bubbleend">
                    <div class="pick"></div>
                  </div>
                  <div class="bubblecontent">작성하신 보고서 내용 잘 보았습니다. 특별한 문제는 발견하지 못했으니 일단 이 내용대로 개발 진행해주시면 될 것 같습니다. 혹시 개발중 변경사항 생기면 다시 메시지 부탁드립니다.
                  </div>
                </div>
                <div class="chatinfo">
                  <div class="shown">1</div>
                  <div class="time">12:30 PM</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="messagearea">
          <div class="messageitem mymessage">
            <div class="photoarea">
              <div class="photo"></div>
            </div>
            <div class="content">
              <div class="name">이진섭 대리</div>
              <div class="message">
                <div class="chatbubble">
                  <div class="bubblecontent">알겠습니다 부장님!</div>
                </div>
                <div class="chatinfo">
                  <div class="shown">1</div>
                  <div class="time">12:30 PM</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="inputarea">
        <div class="inputmessage">
          <div class="form-group">
            <div class="textarea"><textarea class="form-control" rows="4"></textarea></div>
          </div>
        </div>
        <div class="optionstab">
          <ul>
            <a>
              <li class="icons"><span class="material-icons">
                  add_a_photo
                </span></li>
            </a>
            <a>
              <li class="icons"><span class="material-icons">
                  attach_file
                </span></li>
            </a>
          </ul>
          <button type="button" class="btn btn-light">전송</button>
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