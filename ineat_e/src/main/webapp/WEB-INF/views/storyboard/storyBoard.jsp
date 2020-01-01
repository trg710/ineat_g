<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	$('#write').click(function(){
		location.href = "/oxo/storyboard/storyBoardWrite.eat";
	});
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
	        <div class="col-md-2 border-bottom">이미지</div>
	        <div class="col-md-2 border-bottom">제목</div>
	        <div class="col-md-1 border-bottom">작성자</div>
	        <div class="col-md-1 border-bottom">작성일</div>
	        <div class="col-md-1 border-bottom">좋아요, 싫어요</div>
	        <div class="col-md-1 border-bottom">조회수</div>
	    </div>
	    
	    <div class="row mt-1 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-2 border-bottom"><img src="/oxo/img/noimage.jpg" width="50%"></div>
	        <div class="col-md-2 border-bottom pt-4">여기 진짜 맛있어요![5]</div>
	        <div class="col-md-1 border-bottom pt-4">LeetsxPro</div>
	        <div class="col-md-1 border-bottom pt-4">2019-12-31</div>
	        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">10<p><img src="/oxo/img/hate_16px.jpg">1</div>
	        <div class="col-md-1 border-bottom pt-4">1</div>
	        <div class="col-md-2"></div>
	    </div>
	    <div class="row mt-1 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-2 border-bottom"><img src="/oxo/img/noimage.jpg" width="50%"></div>
	        <div class="col-md-2 border-bottom pt-4">여기 진짜 맛있어요!</div>
	        <div class="col-md-1 border-bottom pt-4">LeetsxPro</div>
	        <div class="col-md-1 border-bottom pt-4">2019-12-31</div>
	        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">10<p><img src="/oxo/img/hate_16px.jpg">1</div>
	        <div class="col-md-1 border-bottom pt-4">1</div>
	        <div class="col-md-2"></div>
	    </div>
	    <div class="row mt-1 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-2 border-bottom"><img src="/oxo/img/noimage.jpg" width="50%"></div>
	        <div class="col-md-2 border-bottom pt-4">여기 진짜 맛있어요![3]</div>
	        <div class="col-md-1 border-bottom pt-4">LeetsxPro</div>
	        <div class="col-md-1 border-bottom pt-4">2019-12-31</div>
	        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">10<p><img src="/oxo/img/hate_16px.jpg">1</div>
	        <div class="col-md-1 border-bottom pt-4">1</div>
	        <div class="col-md-2"></div>
	    </div>
	    <div class="row mt-1 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-2 border-bottom"><img src="/oxo/img/noimage.jpg" width="50%"></div>
	        <div class="col-md-2 border-bottom pt-4">여기 진짜 맛있어요!</div>
	        <div class="col-md-1 border-bottom pt-4">LeetsxPro</div>
	        <div class="col-md-1 border-bottom pt-4">2019-12-31</div>
	        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">10<p><img src="/oxo/img/hate_16px.jpg">1</div>
	        <div class="col-md-1 border-bottom pt-4">1</div>
	        <div class="col-md-2"></div>
	    </div>
	    <div class="row mt-4">
	        <div class="col-md-2"></div>
	        <div class="col-md-6"></div>
	        <div class="col-md-2">
	        	<div class="btn-group" role="group">
	        		<button type="button" class="btn btn-light">홈으로</button>
	        		<button type="button" id="write" class="btn btn-light">글쓰기</button>
	        	</div>
	        </div>
	    </div>
	</div>
</body>
</html>