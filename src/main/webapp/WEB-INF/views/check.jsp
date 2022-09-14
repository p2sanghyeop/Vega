<%@page import="com.app.board.BoardDto"%>
<%@page import="com.app.board.RippleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>SangHyeop</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">	
	.col-sm-offset-2{
		padding-top: 10px;
		margin-left: 47%;
	}
</style>
</head>
<body>
	<div class="container">
		<h2>Spring MVC BOARD</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Check</div>
			<div class="panel-body">
				<input id="board_number" type="hidden" value= "${boardRead.board_number}" />
				<input type="hidden" id="page" value= "${pagination.page}" />
				<input type="hidden" id="range" value="${pagination.range}" />
					<!-- 제목 -->
					<div class="form-group">
						<label class="control-label col-sm-2">제목 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" value="${boardRead.title}"/> 
						</div>
					</div>

					<!-- 내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2">내용 : </label>
						<div class="col-sm-10">
							<!--  form-control 한줄 채워줌 -->
							<textarea class="form-control" rows="10" cols="" id="content">${boardRead.content}</textarea>
						</div>
					</div>

					<!-- 작성자 -->
					<div class="form-group">
						<label class="control-label col-sm-2">작성자 : </label>
						<div class="col-sm-10">
							<p class="form-control" id="user_id">${boardRead.user_id}</p>
						</div>
					</div>

					<!-- 작성 완료 / 취소 -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="contentUpdate" onclick="update(${pagination.page}, ${pagination.range})" class="btn btn-info btn-sm">수정</button>
							<button id="contentDelete" class="btn btn-info btn-sm">삭제</button>
							<button id="cancel" onclick="list(${pagination.page}, ${pagination.range})" class="brn btn-warning btn-sm">목록</button>
						</div>
					</div>
					
					 <!-- Reply Form {s} -->			
					 <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">				
					 	<form>					
					 		<div class="row">					
						 		<div class="col-sm-10">						
						 			<div>
						 				<textarea id="ripple_text" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
						 			</div>					
						 		</div>					
						 		<div class="col-sm-2">						
						 			<div>
						 				<input class="form-control" id="ripple_id" placeholder="댓글 작성자"/>
						 			</div>						
						 			<button type="button" class="btn btn-sm btn-primary" id="rippleSave" style="width: 100%; margin-top: 10px"> 저 장 </button>					
						 		</div>				
					 		</div>				
					 	</form>			
					 </div>			
					 <!-- Reply Form {e} -->
					<!-- ripple List {s}-->
					<div id="ripple">
						<h3 class="border-bottom pb-2 mb-0">Ripple List</h3>				
						 <c:forEach items="${rippleList}" var="rippleList">
							<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
								<input id="ripple_number" class="ripple_number" type="hidden" value= "${rippleList.ripple_number}" />
									<div id="riuppleList">
									<button type="button" id="rippleUpdate" class="btn btn-success rippleUpdate">수정</button>
									<button type="button" id="rippleDelete" class="btn btn-success rippleDelete">삭제</button>
										<div class="col-sm-10">						
								 			<div>
								 				<p>${rippleList.ripple_id}</p>
								 			</div>
								 			<div>
								 				<textarea id="ripple_texts" class="form-control ripple_texts " rows="3">${rippleList.ripple_text}</textarea>
								 			</div>						
							 			</div>
										<p>수정일:${rippleList.update_at} </br> 작성일:${rippleList.create_at}</p>
									</div>			
								</div> 
						</c:forEach>
					</div>
					<!-- ripple List {e}-->
			</div>
		</div>
	<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
	<script type="text/javascript">
	
	function update(page, range) {
		if (confirm('게시글을 수정하시겠습니까?')) {
			
			var title = $('#title').val();
			var content = $('#content').val();
			var board_number = $('#board_number').val();
			if (title == '') {
				alert('제목입력')
				return 0;
			}
			if (content == '') {
				alert('내용작성')
				return 0;
			}
	
			jsondata = {
				board_number: board_number,
				title: title,
				content: content
			}
	
			$.ajax({
				url: '/board/check/list',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(jsondata),
				success: function(response) {
					if (response > 0) {
						location.href = '/board/boardlist?page='+page+'&range='+range;
					}
				}
			})
		}
	}
	

	
	$('#contentDelete').click(function() {
		if (confirm('게시글을 삭제하시겠습니까?')) {
			var title = $('#title').val();
			var content = $('#content').val();
			var user_id = $('#user_id').val();
			var board_number = $('#board_number').val();
			jsondata = {
				board_number: board_number,
				user_id: user_id,
				title: title,
				content: content
			}

			$.ajax({
				url: '/board/check/list?board_number='+board_number,
				type: 'DELETE',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(jsondata),
				success: function(response) {
					if (response > 0) {
						location.href = "/board/boardlist"
					}
				}
			})
		}
	});
	
	function list(page, range) {
		var url = "${pageContext.request.contextPath}/boardlist";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url
		}

	
	$('#rippleSave').click(function() {
		if (confirm('댓글을 작성하시겠습니까?')) {
			var ripple_id = $('#ripple_id').val();
			var ripple_text = $('#ripple_text').val();
			var board_number = $('#board_number').val();
			var ripple_number = $('.ripple_number').val();
			if (ripple_text == '') {
				alert('내용작성')
				return 0;
			}
			if (ripple_id == ''){
				alert('작성자입력')
				return 0;
			}

			jsondata = {
				board_number: board_number,
				ripple_id: ripple_id,
				ripple_text: ripple_text,
				ripple_number: ripple_number
			}

			$.ajax({
				url: '/board/check/ripple',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(jsondata),
				success: function(response) {
				 	if (response > 0) {
						console.log(response);
						 $("#ripple_id").val("");
						 $("#ripple_text").val("");
						 $("#ripple").load(location.href + " #ripple");
					} 
				 	
				}
			})
		}
	});	
	
	
	$(document).on('click','.rippleUpdate',function(){		
			var selectIndex = $('.rippleUpdate').index(this); 
			console.log($('.rippleUpdate').index(this));
			
			console.log($('.ripple_texts')[selectIndex].value);
			var ripple_text = $('.ripple_texts')[selectIndex].value
			console.log($('.ripple_number')[selectIndex].value);
			var ripple_number = $('.ripple_number')[selectIndex].value
			if (confirm('댓글을 수정하시겠습니까?')) {
				var board_number = $('#board_number').val();
				
				if (ripple_text == '') {
					alert('내용작성')
					return 0;
				}
				
				jsondata = {
					board_number: board_number,
					ripple_text: ripple_text,
					ripple_number: ripple_number
				}
				
						
				$.ajax({
					url: '/board/check/ripple/update',
					type: 'POST',
					contentType: 'application/json',
					dataType: 'json',
					data: JSON.stringify(jsondata),
					success: function(response) {
						if (response > 0) {
							$("#ripple").load(location.href + " #ripple");
						}
						
					},
					error : function(error) {        
						alert("Error!");    
					}
					
				})
			}
	})
	
	

	$(document).on('click','.rippleDelete',function(){		
		var selectIndex = $('.rippleDelete').index(this); 
		console.log($('.rippleDelete').index(this));
		
		console.log($('.ripple_texts')[selectIndex].value);
		var ripple_text = $('.ripple_texts')[selectIndex].value
		console.log($('.ripple_number')[selectIndex].value);
		var ripple_number = $('.ripple_number')[selectIndex].value
		if (confirm('댓글을 삭제하시겠습니까?')) {
			var board_number = $('#board_number').val();
			
			if (ripple_text == '') {
				alert('내용작성')
				return 0;
			}
			
			jsondata = {
				board_number: board_number,
				ripple_text: ripple_text,
				ripple_number: ripple_number
			}
			
					
			$.ajax({
				url: '/board/check/ripple/?board_number='+board_number,
				type: 'DELETE',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(jsondata),
				success: function(response) {
					if (response > 0) {
						$("#ripple").load(location.href + " #ripple");
					}
					
				},
				error : function(error) {        
					alert("Error!");    
				}
				
			})
		}
	})
	
	
	
	</script>
</body>
</html>
