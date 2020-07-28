<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file =".././layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>board</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/boardForm.js?ver=1"></script>
		<link href="${pageContext.request.contextPath}/resources/css/boardForm.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<!---CKEditor-->
		<script src="https://cdn.ckeditor.com/ckeditor5/20.0.0/classic/ckeditor.js"></script>
		

	</head>
	<script>
		$(document).ready(function(){

		var mode = '<c:out value="${mode}"/>';

		if ( mode == 'edit'){
			//입력 폼 셋팅
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='bid']").val(<c:out value="${boardContent.bid}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${boardContent.reg_id}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#tag").val('<c:out value="${boardContent.tag}"/>');
		}

		});
     </script>

	</script>
	<body>
	<article>
		<div class="container" role="main">
				
			<p class="test"><span>함께 공유해요!</span></p>
			<p class="Sec_t"> 우리 반려동물들을 위해 마음껏 공유할 내용을 적어주세요~ </p>
			
			<form:form name="form" id="form" role="form" modelAttribute="boardVO" method="post" action="saveBoard" accept-charset="euc-kr">

				<form:hidden path="bid" />
				<input type="hidden" name="mode" />
				
				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" id="title" class="form-control" placeholder="제목을 입력해 주세요" />
				</div>
			
				<div class="mb-3">
                  <label for="reg_id">작성자</label>
                  <form:input path="reg_id" id="reg_id" class="form-control" placeholder="이름을 입력해 주세요"  />
                </div>

				
                <div class="mb-3">
                   <label for="content">내용</label>
                   <form:textarea path="content" id="content" class="form-control" rows="5" placeholder="내용을 입력해 주세요" />
                   <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
                </div>

				
				<div class="mb-3">
                   <label for="tag">TAG</label>
                   <form:input path="tag" id="tag" class="form-control" placeholder="태그를 입력해 주세요" />
                 </div>
			</form:form>

				
			<div>
				<button type="button" class="btn btn-sm btn-outline-secondary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-outline-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>
	<%@include file =".././layout/footer.jsp" %>
	</body>

</html>