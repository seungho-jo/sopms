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
<style type="text/css">
	a{
		text-decoration : none;
	}
	#tab_output{
		margin-top : 2%;
	}
</style>
<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body>
	<div>
		<h3 class="font-weight-bold">리스크</h3>
		<table class="text-dark table table-hover table-responsive-sm" id="tab_output">
			<col width="10%">
			<col width="25%">
			<col width="35%">
			<col width="15%">
			<col width="15%">
			<tr>
				<th>no</th>
				<th>리스크명</th>
				<th>리스크내용</th>
				<th>조치자</th>
				<th>등록날짜</th>
			</tr>
			<tr>
				<td>5</td>
				<td>요구사항정의서누락</td>
				<td><a href="#" class="text-dark">요구사항정의서누락</a></td>
				<td>김영진</td>
				<td>2021.10.05</td>
			</tr>
			<tr>
				<td>4</td>
				<td>화면설계도버튼에러</td>
				<td><a href="#" class="text-dark">상세페이지버튼반응안합니다.</a></td>
				<td>조승호</td>
				<td>2021.10.01</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Erd내용누락</td>
				<td><a href="#" class="text-dark">Erd올려주세요.</a></td>
				<td>이관훈</td>
				<td>2021.09.28</td>
			</tr>
			<tr>
				<td>2</td>
				<td>로그인/회원가입에러</td>
				<td><a href="#" class="text-dark">로그인/회원가입 진행중 에러..</a></td>
				<td>정도원</td>
				<td>2021.09.27</td>
			</tr>
			<tr>
				<td>1</td>
				<td>요구사항정의서누락</td>
				<td><a href="#" class="text-dark">요구사항정의서누락</a></td>
				<td>PM</td>
				<td>2021.09.30</td>
			</tr>
		</table>
		<ul class="pagination justify-content-center" id="paging">
					<li class="page-item" id="pre"><a class="page-link">Pre</a></li>
					<li class="page-item active" id="sel"><a class="page-link">1</a></li>
					<li class="page-item"><a class="page-link">2</a></li>
					<li class="page-item"><a class="page-link">3</a></li>
					<li class="page-item"><a class="page-link">4</a></li>
					<li class="page-item" id="next"><a class="page-link">
							Next
					</a></li>
				</ul>
	</div>		