<%@page import="com.app.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>SangHyeop</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  	.pagination{
  		display: block;
  		text-align: center;
  		
  	}
  	.pagination li a {
  		float: none;
  		padding: 10px;
  	}
  	
  	.page-item{
  		cursor: pointer;
  	}
  </style>
</head>
<body>
 
<div class="container">
  <h2>Vega Board</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board List</div>
    <div class="panel-body">
    	<table class="table table-hover">
    		<tr class="info">
    			<td>작성자</td>
    			<td>제목</td>
    			<td>내용</td>
    			<td>수정일</td>
    			<td>작성일</td>
    		</tr>
    		<c:choose>
	    		<c:when test="${fn:length(boardList)>0}">
		    		<c:forEach var="boardList" items="${boardList}">
				    	<tr onclick="getBoard(${boardList.board_number}, ${pagination.page}, ${pagination.range} )">
				    		<td>${boardList.user_id}</td>
				    		<td>${boardList.title}</td>
				    		<td>${boardList.content}</td>
				    		<td>${boardList.update_at}</td>
				    		<td>${boardList.create_at}</td>
				    	</tr>
	    			</c:forEach>		
	    		</c:when>
  				<c:otherwise>
	            	<tr><td colspan=5 style="text-align: center;">게시글이 없습니다</td></tr>
				</c:otherwise>          
    		</c:choose>
    	</table>
    	<a href="/board/write">
 		<button class="btn btn-primary">글쓰기</button>
    	</a>
    	<!-- pagination{s} -->	
    	<div id="paginationBox" style="">		
    		<ul class="pagination">
    			<c:if test="${pagination.prev}">
    				<li class="page-item"><a class="page-link" onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">&laquo;</a></li>	
    			</c:if>							
    			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">				
    			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
    				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
    			</c:forEach>							
    			<c:if test="${pagination.next}">				
    				<li class="page-item"><a class="page-link" onClick="fn_next('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">&raquo;</a></li>
    			</c:if>	
    		</ul>	
    	</div>	
    	<!-- pagination{e} -->

    </div>
  </div>
</div>
<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
<script>

	function getBoard(board_number, page, range) {
		var url = "${pageContext.request.contextPath}/check?board_number="+board_number;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} 
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/boardlist";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
		
		
	//페이지 번호 클릭	
	function fn_pagination(page, range, rangeSize) {
			
		var url = "${pageContext.request.contextPath}/boardlist";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		}
			
		
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/boardlist";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}	

	
	
</script>
</body>
</html>