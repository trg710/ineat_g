<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board write</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript">
</script>
</head>
<body>
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
        <div class="col-md-7"><input type="text" style="width:756px" value=""></div>
    </div>
    <div class="row mt-2">
        <div class="col-md-2"></div>
        <div class="col-md-1 text-center">내용</div>
        <div class="col-md-7"><textarea cols="115" rows="10"></textarea></div>
    </div>
    <div class="row mt-2">
        <div class="col-md-2"></div>
        <div class="col-md-1 text-center">파일</div>
        <div class="col-md-6">
			<div class="input-group mb-3">
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
        		<button type="button" class="btn btn-light">목록으로</button>
        		<button type="button" class="btn btn-light">작성하기</button>
        	</div>
        </div>
    </div>
</body>
</html>