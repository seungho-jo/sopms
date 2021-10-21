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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="${path}/css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first"></li>
                    <li><a class="has-arrow" href="${path}/dashboard.do"><i class="bi bi-house"></i><span class="nav-text">통합현황</span></a>
                    </li>
                    <li class="nav-label">프로젝트</li>
                    <li><a class="has-arrow" href="${path}/project.do?method=insertform"><i
                                class="bi bi-clipboard-plus"></i><span class="nav-text">생성</span></a>
                    </li>
                    <li><a class="has-arrow" href="${path}/management.do" ><i
                                class="bi bi-clipboard-check"></i><span class="nav-text">관리</span></a>
                    </li>
                    <li class="nav-label">작업</li>
                    <li><a class="has-arrow" href="${path}/myWork.do" aria-expanded="false"><i
                                class="bi bi-file-earmark-ruled"></i><span class="nav-text">내작업</span></a>
                    </li>
                    <li><a class="has-arrow" href="${path}/calendar_mem.do" aria-expanded="false"><i
                                class="bi bi-calendar-week"></i><span class="nav-text">일정</span></a>
                    </li>
                    <li><a class="has-arrow" href="${path}/riskPageList.do" aria-expanded="false"><i 
                    			class="bi bi-exclamation-circle"></i><span class="nav-text">리스크</span></a></li>
                    <li class="nav-label">커뮤니티</li>
                    <li><a class="has-arrow" href="${path}/chatmain.do" aria-expanded="false"><i
                                class="bi bi-chat"></i><span class="nav-text">채팅</span></a>
                    </li>
                    <li><a class="has-arrow" href="${path}/board.do?method=list" aria-expanded="false"><i
                                class="bi bi-receipt-cutoff"></i><span class="nav-text">공지사항</span></a>
                    </li>
                    <li class="nav-label">사원</li>
                    <li><a class="has-arrow" href="${path}/pageList.do" aria-expanded="false"><i
                                class="icon-people"></i><span class="nav-text">사원목록</span></a>
                    </li>
                </ul>
            </div>


        </div>
</body>
</html>