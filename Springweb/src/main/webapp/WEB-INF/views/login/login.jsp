<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file =".././layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>board</title>
 		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js?ver=1"></script>
		<link href="${pageContext.request.contextPath}/resources/css/login.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	</head>
	<div class="wrapper fadeInDown">
  	<div id="formContent">

    <!-- Login Form -->
    <form:form class="form-signin" name="form" id="form" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/login">
    	<div>
    		<h2>로그인</h2>
    	</div>	
      	<form:input path="pwd" id="pwd" class="form-control" placeholder="User ID" required="" autofocus="" />
      	<!--form:input path="pwd" id="pwd" class="form-control" placeholder="password" required="" autofocus="" />-->
      	<input type="submit" class="fadeIn fourth" value="Log In">


    	<!-- Remind Passowrd -->
    	<div id="formFooter">
      	<a class="underlineHover" href="${pageContext.request.contextPath}/user/signupForm">아직 회원가입을 안하셨나요?</a>
      	<br>
      	<a class="underlineHover" href="#">비밀번호를 잊으셨나요?</a>
    	</div>
   	</form:form>

  </div>
</div>
<%@include file =".././layout/footer.jsp" %>
</html>