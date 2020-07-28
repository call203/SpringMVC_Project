<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file =".././layout/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>STROY</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/boardContent.js?ver=1)"></script>
		<link href="${pageContext.request.contextPath}/resources/css/story.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	</head>
	<body>
	<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
      <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 font-weight-normal">Story....</h1>
        <p class="lead font-weight-normal">
        	강아지나 고양이를 키우고있거나 키울 예정인 우리.</br>
                          하지만 많은 보호자들은 지금 우리 반려동물의 문제를 해결하지 못하고 있습니다. </br>  
                          자신의 반려 동물들의 문제를 고치기 위해선 많은 비용의 돈을 들여 훈련 상담을 받거나 반려 동물들의 행동을 고쳐주는 프로그램에 출연하여 얼굴과 집을 공개하는 방식으로 전문 훈련사를 맞이해야합니다. </br> 
           	이러한 이유로 많이 곤란해 하고 있는 우리 아가들의 보호자들을 위해 다같이 고민과 그의 대한 해결방안을 공유할 수 있도록 하면 어떨까라는 생각을 사랑해 멍냥에서 하였습니다.</br>         	
         </p>
      </div>
      <div class="product-device box-shadow d-none d-md-block"></div>
      <div class="product-device product-device-2 box-shadow d-none d-md-block"></div>
    </div>
    
    <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
    
      <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
        <div class="my-3 py-3">
          <h2 class="display-5">꿀정보 공유</h2>
          <p class="lead">반려동물을 키우다가 공유하고 싶은 정보들! 다른 보호자가 알았으면 좋겠다는 것들을 공유해주세요~</p>
          <a class="btn btn-outline-secondary" href="#">자세히 보기</a>
        </div>

      </div>
      <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
        <div class="my-3 p-3">
          <h2 class="display-5">질문있어요!</h2>
          <p class="lead">반려동물을 키우다가 생긴 문제점 들을 다른 보호자들과 함께 공유해보세요~</p>
          <a class="btn btn-outline-secondary" href="#">자세히 보기</a>
        </div>
      </div>
    </div>
	<%@include file =".././layout/footer.jsp" %>
	</body>
</html>