<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file =".././layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SIGNUPFORM</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js?ver=1"></script>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		
	</head>
	
	<script>
	
		$(document).on('click', '#btnSignup',function(e){
			e.preventDefault();
			
			$("#form").submit();
		});
		
		
	</script>
	
	<body>
	<div class="container_box">
		<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">회원가입</div>
                            <div class="card-body">

                            <form:form name="form" id="form" class="form-signup" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/user/insertuser">
                                    <div class="form-group">
                                        <label for="name" class="cols-sm-2 control-label">ID</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <form:input path="uid" id="uid" class="form-control" placeholder="제목을 입력해 주세요" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">EMAIL</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <form:input path="email" id="email" class="form-control" placeholder="이메일을 입력해 주세요" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="cols-sm-2 control-label">이름</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <form:input path="name" class="form-control" name="username" id="username" placeholder="이름을 입력해 주세요" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <form:input path="pwd" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요" />
                                            </div>
                                        </div>
                                    </div>

                                    </form:form>                                                                                         
                                    <div class="form-group ">
                                        <button type="button" class="btn btn-primary btn-lg btn-block login-button" id="btnSignup">가입하기</button>
                                    </div>
                                    <div class="login-register">
                                        <a href="index.php">Login</a>
                                    </div>
                                
                            </div>

                        </div>
                    </div>
         </div>
	</div>
	<%@include file =".././layout/footer.jsp" %>
	</body>
</html>