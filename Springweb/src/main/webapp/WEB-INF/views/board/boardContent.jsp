<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file =".././layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/boardContent.js?ver=1)"></script>
		<link href="${pageContext.request.contextPath}/resources/css/boardContent.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	</head>
	<script>
	$( document ).ready(function() {
	showCommantList();

  });
	function showCommantList(){

		var url = "/restBoard/getCommantList";

		var paramData = {"bid" : "${boardContent.bid}"};

		$.ajax({

            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
    	    success: function(result) {
               	var htmls = "";
			if(result.length < 1){
				htmls+= "등록된 댓글이 없습니다.";
			} else {

	                    $(result).each(function(){
	                
	                     htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.reg_id + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editCommant(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteCommant(' + this.rid +')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.content;
	                     htmls += '</p>';
	                     htmls += '</div>';
	
	                });	//each end


			}

			$("#CommantList").html(htmls);

            }	   // Ajax success end

		});	// Ajax end

	}
	
	$(document).on('click', '#btnCommantSave', function(){

		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();

		var paramData = JSON.stringify({
				"content": replyContent
				, "reg_id": replyReg_id
				, "bid":'${boardContent.bid}'
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "/restBoard/saveCommant"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showCommantList();
				$('#content').val('');
				$('#reg_id').val('');
			}
			, error: function(error){

				console.log("에러 : " + error);
			}
		});
	});
	
	function fn_editCommant(rid, reg_id, content){

		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateCommant(' + rid + ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showCommantList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';

		$('#rid' + rid).replaceWith(htmls);
		$('#rid' + rid + ' #editContent').focus();

	}

	
	function fn_updateCommant(rid, reg_id){

		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"content": replyEditContent
				, "rid": rid
		});
		var headers = {"Content-Type" : "application/json"

				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({

			url: "/restBoard/updateCommant"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				console.log(result);
				showCommantList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
		
	}
	
	function fn_deleteCommant(rid){
		var paramData = JSON.stringify({"rid": rid});
		var headers = {
				"Content-Type" : "application/json",
				 "X-HTTP-Method-Override" : "POST"};
		$.ajax({

			url: "/restBoard/deleteCommant"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				console.log(result);
				showCommantList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
		location.reload();
	}


	</script>
	
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
				<button type="button" class="btn btn-sm btn-outline-secondary" onClick="btnUpdate(<c:out value="${boardContent.bid}"/>)">수정</button>
				<button type="button" class="btn btn-sm btn-outline-secondary" onClick="btnDelete(<c:out value="${boardContent.bid}"/>)">삭제</button>
				<button type="button" class="btn btn-sm btn-outline-secondary" id="btnList">목록</button>
			</div>
			
			<!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="CommantVO" method="post">
				<form:hidden path="bid" id="bid"/>

				<div class="row">
					<div class="col-sm-10">
						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
					</div>
					
					<div class="col-sm-2">
						<form:input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></form:input>
						<button type="button" class="btn btn-sm btn-outline-secondary" id="btnCommantSave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
					
				</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->

			<!-- Reply List {s}-->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">댓글</h6>
				<div id="CommantList"></div>
			</div> 

			<!-- Reply List {e}-->



	</article>
	<%@include file =".././layout/footer.jsp" %>
	</body>
</html>