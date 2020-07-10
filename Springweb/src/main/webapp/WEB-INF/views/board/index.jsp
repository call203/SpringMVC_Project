<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<title>board</title>
 		<%@include file="./common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js?ver=1"></script>
		<link href="${pageContext.request.contextPath}/resources/css/index.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	</head>

	<body>
	<div class="main_t">
		<p class="test"><span>함께 공유해요!</span></p>	
	
		<button id="writeboard" type="button" class="btn btn-danger">글쓰기</button>
	</div>
	<article>
	<div class="container">
			<table class="table table-hover">
				<colgroup>
				<col style="width:5%;" />
				<col style="width:auto;" />
				<col style="width:15%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
			</colgroup>
	
			<thead>
			<tr>
				<th>NO</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${empty boardList }" >
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when> 

					<c:when test="${!empty boardList}">
						<c:forEach var="list" items="${boardList}">
							<tr>
								<td><c:out value="${list.bid}"/></td>	
								<td>
									<a href="#" onClick="fn_contentView(<c:out value="${list.bid}"/>)">
										<c:out value="${list.title}"/>					
									</a>
								</td>
								<td><c:out value="${list.reg_id}"/></td>
								<td><c:out value="${list.view_cnt}"/></td>
								<td><c:out value="${list.reg_dt}"/></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<!-- pagination{s} -->
		
	<script>		
		function fn_contentView(bid){
			var url="/board/getBoardContent";
			url= url +"?bid="+bid;
			location.href = url;
		
		}

		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "/board";

			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
	
		}

 		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
		
			var url = "/board";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + keyword;

			location.href = url;	
		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "/board";
		
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + keyword;
				

			location.href = url;

		}
		
		$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/board";
 		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = encodeURI(url);
		console.log(url);

	});	

	</script>
		<div id="paginationBox">
			<ul class="pagination">
			
				<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize},'${search.searchType}', '${search.keyword}')">이전</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${search.searchType}', '${search.keyword}')"> ${idx} </a></li>
			</c:forEach>

				
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', ${pagination.range}', '${pagination.rangeSize},'${search.searchType}', '${search.keyword}')" >다음</a></li>
			</c:if>

		</ul>
	</div>
	<!-- pagination{e} -->
	<!-- search{s} -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="Content">본문</option>
					<option value="reg_id">작성자</option>
				</select>
			</div>

			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<!-- search{e} -->
			<div> 	
			<img src="${pageContext.request.contextPath}/resources/image/search.png?ver=1" alt="btnImages" class="btnImages"
			name="btnSearch" id="btnSearch" style="width:10%; height:20%">
			</div>
		</div>
	</article>
</body>

</html>
