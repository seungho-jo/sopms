<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SOPMS</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link href="./css/style.css" rel="stylesheet">

</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                    	<div class="row no-gutters mx-5">
                            <div class="col-xl-12">
                            	<div>
								  	<select class="form-control" id="selectLan">
								  		<option value="" ><spring:message code="chlang"/></option>
								  		<option value="ko" ><spring:message code="ko"/></option>
								  		<option value="en" ><spring:message code="en"/></option>
								  	</select>
                            	</div>
                            </div>
                        </div>
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">SOPMS LOGIN</h4>
                                    <form method="post" action="login.do">
                                        <div class="form-group">
                                            <label><strong><spring:message code="id"/></strong></label>
                                            <input type="text" name="id" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label><strong><spring:message code="pwd"/></strong></label>
                                            <input type="password" name="pass" class="form-control" >
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                    <input class="form-check-input" type="checkbox" id="basic_checkbox_1">
                                                    <label class="form-check-label" for="basic_checkbox_1"><spring:message code="remID"/></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <a href="#"><spring:message code="inquiry"/></a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button id="lgbtn" type="button" class="btn btn-primary btn-block"><spring:message code="login"/></button>
                                        </div>
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
		var lang="${param.lang}";
		$("#selectLan").val(lang);
		$("#selectLan").change(function(){
			if( $(this).val()!=""){
				$(location).attr("href","${path}/choiceLan.do?lang="+$(this).val());
			}
		});
	});
    
    $("#lgbtn").click(function(){
    	if($("[name=id]").val()==""){
    		alert("아이디를 입력해주세요");
    		$("[name=id]").focus();
    	}else if($("[name=pass]").val()==""){
    		alert("비밀번호를 입력해주세요");
    		$("[name=pass]").focus();
    	}else{
    		$("form").submit();
    	}
    });
    var msg = "${msg}";
    if(msg!=null&&msg!=""){
    	alert(msg);
    }
    </script>

</body>

</html>