<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file =".././layout/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>USERLIST</title>
		<%@include file=".././common_resource.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js?ver=1"></script>
		<link href="${pageContext.request.contextPath}/resources/css/index.css?ver=1" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	</head>
	<body>
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
				<th>USERID</th>
				<th>NAME</th>
				<th>PWD</th>
				<th>EMAIL</th>
				<th>DRAGE</th>
				<th>가입일</th>
			</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${empty userList }" >
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when> 

					<c:when test="${!empty userList}">
						<c:forEach var="list" items="${userList}">
							<tr>
								<td><c:out value="${list.uid}"/></td>	
								<td>
									<a href="#" onClick="fn_contentView(<c:out value="${list.name}"/>)">
										<c:out value="${list.name}"/>					
									</a>
								</td>
								<td><c:out value="${list.pwd}"/></td>
								<td><c:out value="${list.email}"/></td>
								<td><c:out value="${list.grade}"/></td>
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
			<svg xmlns="http://www.w3.org/2000/svg" name="btnSearch" id="btnSearch" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"></circle><path d="M21 21l-5.2-5.2"></path></svg>
			</div>
		</div>
	</article>
	<%@include file =".././layout/footer.jsp" %>
	</body>
</html>