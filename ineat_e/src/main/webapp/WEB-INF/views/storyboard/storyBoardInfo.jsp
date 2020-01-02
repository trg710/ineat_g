<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board info</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	$('#toList').click(function(){
		location.href = "/oxo/storyboard/storyBoard.eat";
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
	        <div class="col-md-2 border-bottom">${title }</div>
	        <div class="col-md-3 border-bottom"></div>
	        <div class="col-md-1 border-bottom">조회수: ${views }</div>
	        <div class="col-md-1 border-bottom">${mid }</div>
	        <div class="col-md-1 border-bottom">${wdate }</div>
	    </div>
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-3"><img src="/oxo/img/noimage.jpg" width="100%"></div>
	    	<div class="col-md-5 pt-3">${content }</div>
	    </div>
	    <div class="row mt-2 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-1"><img src="/oxo/img/like_16px.jpg">10<img src="/oxo/img/hate_16px.jpg" class="ml-2">1</div>
	        <div class="col-md-7"></div>
	    </div>
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-1"></div>
	    	<div class="col-md-6 border-bottom">맛집만다니는사람<br><span class="ml-3">여기 진짜 맛잇긴해요 ㅋㅋㅋ</span></div>
	    	<div class="col-md-1"></div>
	    </div>
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-1"></div>
	    	<div class="col-md-6 border-bottom">flex해봐유<br><span class="ml-3">저두 한번 가봐야 겠네요 ㅋㅋㅋ</span></div>
	    	<div class="col-md-1"></div>
	    </div>
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-1"></div>
	    	<div class="col-md-6 border-bottom"><p class="ml-3">└ 라면좋아<br><span class="ml-4">저두 가봐야겠어요 ㅋㅋㅋㅋㅋ</span></p></div>
	    	<div class="col-md-1"></div>
	    </div>
	    <div class="row mt-2 text-center">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-1"></div>
	    	<div class="col-md-6 border"></div>
	    	<div class="col-md-1"><button type="button" class="btn btn-light">등록</button></div>
	    </div>
	    <div class="row mt-4">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8"><button type="button" id="toEdit" class="btn btn-light">수정하기</button></div>
	    </div>
	    <div class="row mt-4 text-center">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8"><button type="button" id="toList" class="btn btn-light">목록으로</button></div>
	    </div>
	</div>
</body>
</html>