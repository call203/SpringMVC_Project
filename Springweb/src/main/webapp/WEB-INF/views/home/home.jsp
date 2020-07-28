<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file =".././layout/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HOME</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js?ver=1"></script>
		<link href="${pageContext.request.contextPath}/resources/css/animationSlide.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	</head>
	<body>
	<div class="slide">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
  	<%@include file =".././layout/footer.jsp" %>
	</body>

</html>