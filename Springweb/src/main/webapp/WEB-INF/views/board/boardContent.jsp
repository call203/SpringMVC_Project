<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@include file="./common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/boardContent.js?ver=1)"></script>
		<link href="${pageContext.request.contextPath}/resources/css/boardContent.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	</head>
	<body>
		<article>
		<div class="container" role="main">
			<h2><c:out value="${boardContent.title}"/></h2>

			<div class="bg-white rounded shadow-sm">
				<div class="board_info_box">
					<span class="board_author">작성자 : <c:out value="${boardContent.reg_id}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span class="board_date">작성일 : <c:out value="${boardContent.reg_dt}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
					<span class="board_date">조회수 : <c:out value="${boardContent.view_cnt}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</div>
				<br>
				<br>
				<div class="board_content">${boardContent.content}</div>
				<br>
				<br>
				<div class="board_tag">TAG : <c:out value="${boardContent.tag}"/></div>
			</div>		

			<div style="margin-top : 20px">
				<button type="button" class="btn btn-danger" onClick="btnUpdate(<c:out value="${boardContent.bid}"/>)">수정</button>
				<button type="button" class="btn btn-danger" onClick="btnDelete(<c:out value="${boardContent.bid}"/>)">삭제</button>
				<button type="button" class="btn btn-danger" id="btnList">목록</button>
			</div>
			
		</div>

	</article>

	</body>
</html>