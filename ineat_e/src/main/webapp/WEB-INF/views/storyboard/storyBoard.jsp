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
		if('${SID}' == ""){
			alert("로그인 후 이용해 주세요.");
		}else{
			location.href = "/oxo/storyboard/storyBoardWrite.eat";
		};
	});
	// 홈페이지로
	$('#toHome').click(function(){
		location.href = "/oxo/main.eat";
	});
	// 상세보기
	$('.toInfo').click(function(){
		
		var listbno = $(this).attr('id');
		
		$('#bno').val(listbno);
		
		/* $('#bno').val(textbno);
		$('#mid').val(textmid); */
		
		$('#form1').submit();
	});
	
	// 페이지 버튼 처리
	if('${PAGE.startPage}' == 1){
		$('#preBtn').toggleClass('pBtn');	
	}
	if('${PAGE.endPage}' == '${PAGE.totalPage}'){
		$('#nextBtn').toggleClass('pBtn');
	}
	
	$('.pBtn').click(function(){
		var sPage = $(this).html();
		var ptxt = $('#preBtn').html();
		var ntxt = $('#nextBtn').html();
		if(sPage == '${PAGE.nowPage}') return;
		
		if(sPage == ptxt){
			sPage = '${PAGE.startPage - 1}';
			$('#nowPage').val(sPage);
		} else if(sPage == ntxt){
			sPage = '${PAGE.endPage + 1}';
			$('#nowPage').val(sPage);
		} else {
			$('#nowPage').val(sPage);
		}
		$('#form2').submit();
	});
});

</script>
</head>
<body>













	<form method="post" action="/oxo/storyboard/storyBoardInfo.eat" id="form1">
		bno:<input type="text" name="bno" id="bno">
	</form>
	
sid:<input type="text" value="${SID }">

	<form method="post" action="/oxo/storyboard/storyBoard.eat" id="form2">
		nowpage:<input type="text" name="nowPage" id="nowPage">
	</form>

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
		        <div class="col-md-2 border-bottom pb-1">
			        <c:if test="${data.saveName == null }">
		    			<img src="/oxo/img/noimage.jpg" width="50%">
		    		</c:if>
		    		<c:if test="${data.saveName != null}">
		    			<img src="/oxo/upload/${data.saveName }" width="50%">
		    		</c:if>
		        </div>
		        <div class="col-md-2 border-bottom pt-4 toInfo" id="${data.bno}" >
		        	<c:if test="${data.title.length() ge 15 }">
	        			${data.title.substring(0, 15) }...
	        		</c:if>
	        		<c:if test="${data.title.length() lt 15 }">
	        			${data.title}
	        		</c:if>
	        		<c:if test="${data.cmtCnt > 0 }">
		        		[${data.cmtCnt }]
	        		</c:if>
	        	</div>
		        <div class="col-md-1 border-bottom pt-4">${data.mid}</div>
		        <div class="col-md-1 border-bottom pt-4">${data.sbDate }</div>
		        <div class="col-md-1 border-bottom pt-3"><img src="/oxo/img/like_16px.jpg">${data.llike }<p><img src="/oxo/img/hate_16px.jpg">${data.hhate }</div>
		        <div class="col-md-1 border-bottom pt-4">${data.views }</div>
		        <div class="col-md-2"></div>
		    </div>
	    </c:forEach>
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link pBtn" href="#" tabindex="-1" aria-disabled="true" id="preBtn">Prev</a>
		    </li>
		    <c:forEach var="page" begin="${PAGE.startPage }" end="${PAGE.endPage }">
		    <li class="page-item"><a class="page-link pBtn" href="#">${page }</a></li>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link pBtn" href="#" id="nextBtn">Next</a>
		    </li>
		  </ul>
		
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