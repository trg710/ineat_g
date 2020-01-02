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
	// 작성페이지로
	$('#toWrite').click(function(){
		location.href = "/oxo/storyboard/storyBoardWrite.eat";
	});
	// 홈페이지로
	$('#toHome').click(function(){
		location.href = "/oxo/main.eat";
	});
	// 상세보기
	$('.toInfo').click(function(){
		var bno = $(this).attr('id');
		
		alert(bno);
		$('#bno').val(bno);
		$('#form1').submit();
		
	});
	
});

</script>
</head>
<body>

	<form method="post" action="/oxo/storyboard/storyBoardInfo.eat" id="form1">
		bno:<input type="text" name="bno" id="bno">
	</form>
	sid:<input type="text" value="${SID }">



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
	    <c:forEach var="data" items="${LIST }">
		    <div class="row mt-1 text-center">
		        <div class="col-md-2"></div>
		        <div class="col-md-2 border-bottom pb-1"><img src="/oxo/img/noimage.jpg" width="50%"></div>
		        <div class="col-md-2 border-bottom pt-4 toInfo" id="${data.bno }">${data.title }[5]</div>
		        <div class="col-md-1 border-bottom pt-4">${data.mid }</div>
		        <div class="col-md-1 border-bottom pt-4">${data.sbDate }</div>
		        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">${data.llike }<p><img src="/oxo/img/hate_16px.jpg">${data.hhate }</div>
		        <div class="col-md-1 border-bottom pt-4">${data.views }</div>
		        <div class="col-md-2"></div>
		    </div>
	    </c:forEach>
	    
	    <div class="row mt-4">
	        <div class="col-md-2"></div>
	        <div class="col-md-6"></div>
	        <div class="col-md-2">
	        	<div class="btn-group" role="group">
	        		<button type="button" id="toHome" class="btn btn-light">홈으로</button>
	        		<button type="button" id="toWrite" class="btn btn-light">글쓰기</button>
	        	</div>
	        </div>
	    </div>
	</div>
</body>
</html>