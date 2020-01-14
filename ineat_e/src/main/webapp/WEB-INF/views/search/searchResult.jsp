<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>inEat </title>

<link rel="stylesheet" href="/oxo/css/w3.css" >
<link rel="stylesheet" href="/oxo/css/bootstrap.css" >
<link rel="stylesheet" href="/oxo/css/nav.css">

<script type="text/javascript" src="/oxo/js/jquery.min.js" ></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxos/js/popper.min.js"></script>

<style>
    
   
	#filter{
		float:right;
	}
	
	
	.round-btn { 
 
    width:150px; 
 
    height:150px; 
 
    line-height:150px; 
 
    border: 2px solid #f5f5f5; 
 
    border-radius: 50%; 
 
    color:#f5f5f5; 
 
    text-align:center; 
 
    background-color: green; 
 
    font-size:20px; 
 
    font-weight:bold; 
 
    text-decoration: none; 
 
    
 
    
 
} 
 
.click-btn { 
    color: #17BAEF; 
 
    background-color: orange; 
 
    text-decoration: none; 
}

.btn-primary{
	background-color:orange;
	border-color:orange;
}

.btn-primary:hover{
	background-color:orange;
	border-color:orange;
}


<!-- 추가된 css -->

.btn-group-toggle{
	font-family: "Jua", sans-serif;
}
ul {
	list-style: none;
	width: auto;
	padding-left: 15px;
}

.bg {
	background-color: rgba(255, 255, 255, 1);
	border-color: rgba(214, 214, 214, 1);
	;
}

.imgbox {
	min-width: 238px;
	height: 238px;
	overflow: hidden;
	position: relative;
}
.pic{
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.pimgbox {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
}


.imgbox img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.text_box {
	width: 100%;
	height: 100%;
}

.text_box ul li {
	margin: 5px 0;
}

.text_box div {
	right: 0;
}

.mainlist {
	padding-top: 60px;
	padding-bottom: 30px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}
.mainlist:hover {
	background:#8080801a;
}


.listtop {
	padding-top: 30px;
	padding-bottom: 5px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}

.list_row {
	position: absolute;
	right: 0;
	bottom: 0;
	padding-bottom: 5px;
}

.list_row div {
	margin: auto 5px;
}

.page_box {
	margin-top: 20px;
}
.detail {
	cursor:pointer;
}
.favorite{
	width:35px;
	cursor:pointer;
	height:35px;
}
.loginpls{
	width:35px;
	cursor:pointer;
	height:35px;
}

</style>


<script type="text/javascript">
$(function(){
		var listno=5;
		var body = '${SCH.contents}';
		var cost = new Array();
		// 필터원형 버튼에 관한
		$('.round-btn').click(function(){
			$(this).toggleClass('click-btn');
		});
		// 적용 or 취소 버튼 클릭시 
		$('#commit').click(function(){
			for(var i = 0; i< $('.click-btn').length; i++){
			if($('.click-btn').eq(i).html() == '10,000'){
				cost[i] = 1;
			}
			else if($('.click-btn').eq(i).html() == '20,000'){
				cost[i] = 2;
			}
			else if($('.click-btn').eq(i).html() == '30,000'){
				cost[i] = 3;
			}
			else if($('.click-btn').eq(i).html() == '40,000'){
				cost[i] = 4;
			}
			else if($('.click-btn').eq(i).html() == '50,000'){
				cost[i] = 5;
			}// end if
			
			} // end for
			
			
			// 태그 검색 
			var val = document.getElementsByName('options');
			var tag;
			for(var i = 0; i<val.length; i++){
				if(val[i].checked){
					tag = val[i].value;
				}
			}
			
			// 리뷰, 조회, 좋아요 순서 변수 세팅 
			var val2 = document.getElementsByName('options1');
			var tag2;
			for(var i = 0; i<val2.length; i++){
				if(val2[i].checked){
					tag2 = val2[i].value;
				}
			}
			alert(cost+tag);
			
			$.ajax({
				url:"/oxo/filterSearch.eat",
				type:"post",
				traditional : true,
				dataType:"json",
				data:{
					"contents":body,
					"price":cost,
					"tag":tag,
					"order":tag2
				},
				success:function(data){
					listno=5;
					
					$('#listbox').empty();
					for (var i = 0; i < data.length; i++) {
						var resultlist = '';
						resultlist += '<div class="d-flex mainlist pr-4">';
						resultlist += '<h1 style="display: inline-block; margin-right: 10px;">'+data[i].rno+'.</h1>';
						resultlist += '<div class="imgbox detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<img src="/oxo/mainlist/'+data[i].ml_title +'1.jpg">';
						resultlist += '</div>';
						resultlist += '<div class="text_box position-relative">';
						
						if(data[i].favorite == '0'){
							resultlist += '<div class="favorite f_in position-absolute" data-id="'+data[i].ml_no +'">';
							resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
							resultlist += '</div>';
						}else if(data[i].favorite == '1'){
							resultlist += '<div class="favorite f_out position-absolute" data-id="'+data[i].ml_no +'">';
							resultlist += '<img src="/oxo/img/favorite.png" style="width: 100%;">';
							resultlist += '</div>';
						}else if(data[i].favorite == null){
							resultlist += '<div class="loginpls position-absolute">';
							resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
							resultlist += '</div>';
						}
						
						resultlist += '<ul>';
						resultlist += '<li>';
						resultlist += '<h1 class="d-inline-block m-0 detail" data-id="'+data[i].ml_no +'">'+data[i].ml_title +'</h1>';
						resultlist += '<h1 class="d-inline-block m-0 ml-2 text-success">4.5</h1>';
						resultlist += '</li>';
						resultlist += '<li>';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted">'+data[i].ml_newaddr+'</small>';
						resultlist += '</h4>';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted">'+data[i].ml_menu+'</small>';
						resultlist += '</h4>';
						resultlist += '</li>';
						
						var idx = 1;
						if(data[i].rvList.length >= 2){
							idx = 2;
						}
						for (var j = 0; j < idx; j++) {
							var t1 = data[i].rvList;
							if(t1.length > 0){
							resultlist += '<li class="d-flex mb-2">';
							resultlist += '<div>';
							resultlist += '<div class="pimgbox mr-2">';
							resultlist += '<img src="/oxo/upload/'+t1[j].profile+'" alt="avt" class="pic">';
							resultlist += '</div>';
							resultlist += '</div>';
							resultlist += '<div>';
							resultlist += ' <b>'+ t1[j].m_id+'</b>'+ t1[j].rv_body+'';
							resultlist += '</div>';
							resultlist += '</li>';
							}
						}
						resultlist += '</ul>';
						resultlist += '</div>';
						resultlist += '<div style="position:absolute; bottom: 10px; right: 5px;" class="detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted"> 자세히 보기 > </small>';
						resultlist += '</h4>';
						resultlist += '</div>';
						resultlist += '</div>';
						$('#listbox').append(resultlist);
					}
					
					$('#filterModal').css('display','none');
				}
			});
		});	
		
		$('#cancle').click(function(){
			$('.round-btn').removeClass('click-btn');
			$('#filterModal').css('display','none');
		});
		
		// 무한 스크롤 
		$(window).scroll(function() { 
			if ($(window).scrollTop() == $(document).height() - $(window).height())
			{ 
				
				
				
				$.ajax({
					url:"/oxo/moreResult.eat",
					type: "post",
					 traditional : true,
					dataType:"json",
					data:{
						num : listno,
						contents:body,
						price:cost
					},
					success: function(data){
						
						listno += 5;
						var length = data.length;
						
						for (var i = 0; i < length; i++) {
							var resultlist = '';
							resultlist += '<div class="d-flex mainlist pr-4">';
							resultlist += '<h1 style="display: inline-block; margin-right: 10px;">'+data[i].rno+'.</h1>';
							resultlist += '<div class="imgbox detail" data-id="'+data[i].ml_no +'">';
							resultlist += '<img src="/oxo/mainlist/'+data[i].ml_title +'1.jpg">';
							resultlist += '</div>';
							resultlist += '<div class="text_box position-relative">';
							
							if(data[i].favorite == '0'){
								resultlist += '<div class="favorite f_in position-absolute" data-id="'+data[i].ml_no +'">';
								resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
								resultlist += '</div>';
							}else if(data[i].favorite == '1'){
								resultlist += '<div class="favorite f_out position-absolute" data-id="'+data[i].ml_no +'">';
								resultlist += '<img src="/oxo/img/favorite.png" style="width: 100%;">';
								resultlist += '</div>';
							}else if(data[i].favorite == null){
								resultlist += '<div class="loginpls position-absolute">';
								resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
								resultlist += '</div>';
							}
							
							resultlist += '<ul>';
							resultlist += '<li>';
							resultlist += '<h1 class="d-inline-block m-0 detail" data-id="'+data[i].ml_no +'">'+data[i].ml_title +'</h1>';
							resultlist += '<h1 class="d-inline-block m-0 ml-2 text-success">4.5</h1>';
							resultlist += '</li>';
							resultlist += '<li>';
							resultlist += '<h4>';
							resultlist += '<small class="text-muted">'+data[i].ml_newaddr+'</small>';
							resultlist += '</h4>';
							resultlist += '<h4>';
							resultlist += '<small class="text-muted">'+data[i].ml_menu+'</small>';
							resultlist += '</h4>';
							resultlist += '</li>';
							var idx = 1;
							if(data[i].rvList.length >= 2){
								idx = 2;
							}
							for (var j = 0; j < idx; j++) {
								var t1 = data[i].rvList;
								if(t1.length > 0){
								resultlist += '<li class="d-flex mb-2">';
								resultlist += '<div>';
								resultlist += '<div class="pimgbox mr-2">';
								resultlist += '<img src="/oxo/upload/'+t1[j].profile+'" alt="avt" class="pic">';
								resultlist += '</div>';
								resultlist += '</div>';
								resultlist += '<div>';
								resultlist += ' <b>'+ t1[j].m_id+'</b>'+ t1[j].rv_body+'';
								resultlist += '</div>';
								resultlist += '</li>';
								}
							}
							resultlist += '</ul>';
							resultlist += '</div>';
							resultlist += '<div style="position:absolute; bottom: 10px; right: 5px;" class="detail" data-id="'+data[i].ml_no +'">';
							resultlist += '<h4>';
							resultlist += '<small class="text-muted"> 자세히 보기 > </small>';
							resultlist += '</h4>';
							resultlist += '</div>';
							resultlist += '</div>';
							$('#listbox').append(resultlist);
						}
						
						$('#filterModal').css('display','none');
						
					
						}
					});
			}
			
		}); 
		
		
		$(document).on('click','.detail', function(e){
			e.stopImmediatePropagation();
		var id = $(this).data('id');
		$(location).attr('href','/oxo/ineatlist/info.eat?ml_no='+id);
			alert(id);
		});
		
		$(document).on('click', '.loginpls', function(e) {
			e.stopImmediatePropagation();
			alert('로그인 후 처리하세요');
		});
		

		$(document).on('click', '.favorite', function(e) {
			e.stopImmediatePropagation();
			var fav = $(this);
			
			var ml_no = fav.attr('data-id');
			 $.ajax({
	            url : "/oxo/ineatlist/favoriteup.eat",
	            type : "post",
	            dataType : "json",
	            data : {
					ml_no : ml_no
	            },
	            success : function(data){
	            	console.log(data);
	            	if(fav.find('img').attr('src').includes("favorite2")) {
	    				fav.find('img').attr('src','/oxo/img/favorite.png');
	    				fav.removeClass('f_in');
	    				fav.addClass('f_out');
	    				console.log('성공');
	    			}else {
	    				fav.find('img').attr('src','/oxo/img/favorite2.png');
	    				fav.removeClass('f_out');
	    				fav.addClass('f_in');
	    				console.log('실패');
	    			}
	            },
	            error : function(){
	               alert('###에러');
	            }
			});
		});
		
	
		 
});
</script>
<script>
	$("#lr").click(function() {
		var str = (this).val();
		
		
	});
</script>
</head>

<body>
   <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
      <a class="navbar-brand" href="#"><img src="img/logo.png"
         style="margin-left: 30px; width: 100px;"></a>
         <script type="text/javascript">
         $(function() {
            //네비바 로고 클릭 시 메인화면으로 이동
            $('.navbar-brand').click(function() {
               $(location).attr('href', '/oxo/main.eat');
            });
         });
         </script>
      <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

      <div class="collapse navbar-collapse" id="navbar">
         <form class="form-inline col-9" action="/oxo/searchProc.eat" method="POST">
                <input class=" form-control col-10 mr-sm-2" type="text" placeholder="Search" name="contents">
                <button class="btn btn-warning" type="submit">Search</button>
           </form>
         <ul class="navbar-nav float-left"
            style="width: 200px; margin-right: 20px;">
            <li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
            <li class="nav-item"><a class="nav-link" href="#">List</a></li>
            <li class="nav-item"><img src="img/member.png" width="30x"
               style="margin-left: 15px;">
               <script type="text/javascript">
			  $(function(){
			  	//스토리 이동
			  	$('#story').click(function(){
			  		$(location).attr('href','/oxo/storyboard/storyBoard.eat');
			  	});
			  	//맛드컵 이동
			  	//리스트 이동
			  	$('#list').click(function(){
			  		$(location).attr('href','/oxo/ineatlist/list.eat');
			  	});
			   });
			</script>
               <ul class="navbar-nav">
                  <c:if test="${empty SID}">
                  <li class="nav-item" id="loginbtn"><a class="nav-link" href="#">로그인</a></li>
                  <li class="nav-item" id="joinbtn"><a class="nav-link" href="#">회원가입</a></li>
                  </c:if>
                  <c:if test="${not empty SID}">
                     <li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
                     <li class="nav-item"><a class="nav-link" href="#" id="memInfo">회원정보보기</a></li>
                  </c:if>
               </ul></li>
         </ul>
      </div>
   </nav>
   <!--네비게이션바-->

    <div class="container" style="margin-top: 100px;">
    	
    	<img src="/oxo/img/filter.png" class="btn" style="width:100px;" id="filter"
    	onclick="document.getElementById('filterModal').style.display='block'"/>
    	
        <div class="row">
            <div style="width: 900px; margin: 0 auto; "class="pb-5">

			
				
					<!--  맛집리스트 부분 -->
				<div class="listtop">
					<div>
					<span id="common">(${SCH.contents}) 검색 결과</span>
					</div>
					
				</div>

				<!-- 리스트 컬럼 -->
			<div id="listbox">
				
					<c:forEach var="data" items="${LIST }" varStatus="sts">
						<div class="d-flex mainlist pr-4">
						
							<!-- 넘버 -->
							<h1 style="display: inline-block; margin-right: 10px;">${sts.count}.</h1>
							
							<!-- 이미지박스 -->
							<div class="imgbox detail" data-id="${data.ml_no }">
								<img src="/oxo/mainlist/${data.ml_title}1.jpg">
							</div>
							<!-- 텍스트박스 -->
							<div class="text_box position-relative">
							
								<c:choose>
									<c:when test="${data.favorite eq '0'}">
										<div class="favorite f_in position-absolute" data-id="${data.ml_no }">
											<img src="/oxo/img/favorite2.png" style="width: 100%;">
										</div>
									</c:when>
									<c:when test="${data.favorite eq '1'}">
										<div class="favorite f_out position-absolute" data-id="${data.ml_no }">
											<img src="/oxo/img/favorite.png" style="width: 100%;">
										</div>
									</c:when>
									<c:otherwise>
										<div class="loginpls position-absolute">
											<img src="/oxo/img/favorite2.png" style="width: 100%;">
										</div>
									</c:otherwise>
								</c:choose>
								
								<ul>
									<li>
										<h1 class="d-inline-block m-0 detail" data-id="${data.ml_no }">${data.ml_title }</h1>
										<h1 class="d-inline-block m-0 ml-2 text-success">4.5</h1>
									</li>
									<li>
										<h4>
											<small class="text-muted ">${data.ml_newaddr }</small>
										</h4>
										<h4>
											<small class="text-muted ">${data.ml_menu }</small>
										</h4>
									</li>
									<c:forEach var="data2" items="${data.rvList}" varStatus="sts" begin="0" end="1">
									<li class="d-flex mb-2">
										<div>
											<div class="pimgbox mr-2">
												<img src="/oxo/upload/${data2.profile}" alt="avt" class="pic">
											</div>
										</div>
										<div>
											<b>${data2.m_id }</b>${data2.rv_body}
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<div style="position:absolute; bottom: 10px; right: 5px;" class="detail" data-id="${data.ml_no }">
								<h4>
									<small class="text-muted">자세히 보기 > </small>
								</h4>
							</div>
						</div>
					</c:forEach>
					
				</div>
				<!--  end 맛집리스트 -->


            </div>
        </div>
	</div>
	
	
	<div id="filterModal" class="w3-modal">
      <div class="w3-modal-content" style="width: 35%">
         <div class="w3-container w3-padding">
            <span id="x" style="margin: 10px 18px 0px 0px;"
               class="w3-button w3-display-topright" onclick="document.getElementById('filterModal').style.display='none'">&times;</span>
          <center>
          <h6 class="display-3">검색 필터</h6>
          <hr>
          <a class="round-btn" href="#">10,000</a><a class="round-btn" href="#">20,000</a>
          <a class="round-btn" href="#">30,000</a><a class="round-btn" href="#">40,000</a>
          <a class="round-btn" href="#">50,000</a>
          <hr>
          <div class="btn-group-toggle d-flex justify-content-between col-12"
					data-toggle="buttons">
					<label class="btn btn-warning btn-lg list_ajax tag" id="한식">
						<input type="radio" name="options" value="#한식" id="option1" autocomplete="off">
						#한식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="중식">
						<input type="radio" name="options" value="#중식" id="option2" autocomplete="off">
						#중식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="양식">
						<input type="radio" name="options" value="#양식" id="option3" autocomplete="off">
						#양식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="일식">
						<input type="radio" name="options" value="#일식" id="option4" autocomplete="off">
						#일식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="회식">
						<input type="radio" name="options" value="#회식" id="option5" autocomplete="off">
						#회식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="카페">
						<input type="radio" name="options" value="#카페" id="option6" autocomplete="off">
						#카페
					</label>
				</div>
				<hr>
				 <div class="btn-group-toggle d-flex justify-content-between col-12"
					data-toggle="buttons">
					</label> <label class="btn btn-warning btn-lg " id="review">
						<input type="radio" name="options1" id="option4" value="" autocomplete="off">
						리뷰순
					</label> <label class="btn btn-warning btn-lg " id="like">
						<input type="radio" name="options1" id="option5" value="favorite" autocomplete="off">
						좋아요순
					</label> <label class="btn btn-warning btn-lg " id="views">
						<input type="radio" name="options1" id="option6" value="ml_count" autocomplete="off">
						조회순
					</label>
				</div>	
						
				<hr>
          <button class=" col-5 btn btn-warning" id="commit">적용</button>
          <button class=" col-5 btn btn-secondary" id="cancle">취소</button>
		</center>
      </div>
   </div>
   </div>
</body>
</html>