<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<h2>Vega BOARD</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Write</div>
			<div class="panel-body">
				
					<!-- 제목 -->
					<div class="form-group">
						<label class="control-label col-sm-2">제목 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="Enter title">
						</div>
					</div>

					<!-- 내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2">내용 : </label>
						<div class="col-sm-10">
							<!--  form-control 한줄 채워줌 -->
							<textarea class="form-control" rows="10" cols="" id="content"></textarea>
						</div>
					</div>

					<!-- 작성자 -->
					<div class="form-group">
						<label class="control-label col-sm-2">작성자 : </label>
						<div class="col-sm-10">
						<input type="text" class="form-control" id="user_id"
								placeholder="Enter username">
						</div>
					</div>
					
					<!-- 첨부파일 -->
					<!-- <div class="form-group">
						<label class="control-label col-sm-2">첨부파일 : </label>
						<input type="file" id="file_upload" name="uploadFiles" multiple="multiple"/>
					</div> -->
					<div class="form-group" id="file-list">        
						<label class="control-label col-sm-2">첨부파일 : </label>
							<a href="#this" onclick="addFile()">파일추가</a>        
							<div class="file-group">            
								<input type="file" name="file"><a href='#this'name='file-delete'>삭제</a>        
							</div>    
					</div>

					<!-- 작성 완료 / 취소 -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="contentSubmit" class="btn btn-info btn-sm">작성</button>
							<button id="cancel" class="brn btn-warning btn-sm">취소</button>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
	<script type="text/javascript">
	$('#contentSubmit').click(function() {
		if (confirm('게시글을 작성하시겠습니까?')) {
			var title = $('#title').val();
			console.log(title);
			var content = $('#content').val();
			console.log(content);
			var user_id = $('#user_id').val();
			console.log(user_id);		
			if (title == '') {
				alert('제목입력')
				return 0;
			}
			if (content == '') {
				alert('내용작성')
				return 0;
			}
			if (user_id == ''){
				alert('작성자입력')
				return 0;
			}
			jsondata = {
				user_id: user_id,
				title: title,
				content: content
			}

			$.ajax({
				url: '/board/write',
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(jsondata),
				success: function(response) {
					console.log(response)
					if (response > 0) {
						location.href = "/board/boardlist"
					}
				}
			})
		}
	});
	$('#cancel').click(function(){
		location.href = "/board/boardlist"
	})
	
	
	
	function addFile() {        
		var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";        
			$("#file-list").append(str);        
			$("a[name='file-delete']").on("click", function(e) {            e.preventDefault();            deleteFile($(this));        });    }     
			function deleteFile(obj) {        obj.parent().remove();    }
	</script>
</body>
</html>
