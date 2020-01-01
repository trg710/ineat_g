<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board write</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	// 스토리보드로 돌아가기
	$('#cancel').click(function(){
		location.href = "/oxo/storyboard/storyBoard.eat";
	});
	// 작성하기
	/*
	$('#toWrite').click(function(){
		location.href = "/oxo/storyboard/storyBoardWriteProc.eat";
	});
	*/
});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-8"><h3>inEat Story</h3></div>
	    </div>
	    <div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-8 border-bottom"></div>
	    </div>
	    <div class="row mt-2">
	        <div class="col-md-2"></div>
	        <div class="col-md-1 text-center">제목</div>
	        <div class="col-md-6"><input type="text" style="width:100%" value=""></div>
	    </div>
	    <div class="row mt-2">
	        <div class="col-md-2"></div>
	        <div class="col-md-1 text-center">내용</div>
	        <div class="col-md-6"><textarea cols="150" rows="10" style="width:100%"></textarea></div>
	    </div>
	    <div class="row mt-2">
	        <div class="col-md-2"></div>
	        <div class="col-md-1 text-center">파일</div>
	        <div class="col-md-6">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
					</div>
				</div>
	        </div>
	        <div class="col-md-1"></div>
	    </div>
	    <div class="row mt-4">
	        <div class="col-md-2"></div>
	        <div class="col-md-6"></div>
	        <div class="col-md-2">
	        	<div class="btn-group" role="group">
	        		<button type="button" id="cancel" class="btn btn-light">취소</button>
	        		<button type="button" id="toWrite" class="btn btn-light">작성하기</button>
	        	</div>
	        </div>
	    </div>
	</div>	
</body>
</html>