<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/fullpage.min.css">
<style>
.bg {
	background-color: rgba(255, 255, 255, 1);
	border-color: rgba(214, 214, 214, 1);
}

.form-control:focus {
	border: solid orange 2px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(255, 165, 0, 0.4)
}

.content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

body {
	background: url('/oxo/img/main.jpg') no-repeat;
	background-size: cover;
}

.conImg {
	margin: 50px;
}

.conImg img {
	height: 300px;
	opacity: 0.7;
}

.w3-content {
	background: white;
}

.white {
	background: rgba(255, 255, 255, 0.7);
}

.yellow {
	background: rgba(255, 255, 0, 0.4);
}
</style>
<script type="text/javascript" src="/oxo/js/nav.js"></script>
</head>

<body>

<!--네비게이션바-->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
      <a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
         style="margin-left: 30px; width: 100px;"></a>
 
      <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

      <div class="collapse navbar-collapse" id="navbar">
         <form class="form-inline col-10" action="/oxo/searchProc.eat" method="POST">
            <input class=" form-control col-11 mr-sm-2" type="text" placeholder="Search" name="contents">
            <button class="btn btn-warning" type="submit">Search</button>
         </form>
         <ul class="navbar-nav float-left"
            style="width: 200px; margin-right: 20px;">
            <li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
            <li class="nav-item" id="cup"><a class="nav-link" href="#">Matdcup</a></li>
            <li class="nav-item" id="list"><a class="nav-link" href="#">List</a></li>
            <li class="nav-item"><img src="/oxo/img/member.png" width="30x"
               style="margin-left: 15px;">
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
	<div class="container-xl">
		<div class="row content" style="padding: 50px;">
			<div class="col-4 white">
				<h1>날씨</h1>
				<div class="card">
					<img id="thumNail"
						class="img-thumbnail card-img-top">
					<div class="card-body">
						<p class="card-text">
							현재 기온은 <h3><span id="ctemp"></span>도</h3>로 <h3><span id="dayCondition"></span></h3>
							입니다.<span class="recommendTitle"></span>가게의  <h3><span class="recommendMenu"></span></h3>는 어떠실까요??
						</p>
					</div>
					<div class="card-title">
						<button type="button" class="btn btn-warning recommendTitle"><p>검색하기</p></button>
					</div>

				</div>
			</div>
			<div class="col-4 white">
			<form class="form-inline col-9" action="/oxo/searchProc.eat" method="POST" id="frm">
                <input type="hidden" id="contents" name="contents">
           </form>
				<h1>많이 검색한 메뉴</h1>
				<ul class="list-group">
					<c:forEach var="listMenu" items="${LISTMENU}">
						<li class="list-group-item listMenu" id="list_ml_menu">${listMenu.ml_menu}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-4 white">
				<h1>많이 검색한 맛집</h1>
				<ul class="list-group">
					<c:forEach var="list" items="${LIST}">
						<li class="list-group-item listTitle">${list.ml_title}</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON(
					'http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=44b647d32d3a2207ba2169b2aa1a7f92&units=metric',
						function(data) {
							var nowTemp = data.main.temp;
							var humidity = data.main.humidity;
							var dayCondition;
							if (nowTemp > 20) {
								dayCondition = '더운날';
							} else if (nowTemp > 5) {
								dayCondition = '선선한날';
							} else {
								dayCondition = '추운날';
							}
							$('#dayCondition').append(dayCondition);
							$('#ctemp').append(nowTemp);
							$.ajax({
								url : "weather.eat",
								type : "post",
								dataType : "json",
								data : {
									"dayCondition" : dayCondition
								},
								success : function(adata) {
									var thum = "/oxo/mainlist/"+ adata.mf_filename
									//alert(adata.mf_filename);
									$('.recommendTitle').append(adata.ml_title);
									$('.recommendMenu').append(adata.ml_menu);
									$('#thumNail').attr("src",thum);
								},
								error : function() {
									alert('통신에러');
								}
							});
						});
		$('.listMenu').click(function(){
			var searchTitle = $(this).text();
			alert(searchTitle);						
			$('#contents').val(searchTitle);
			$('#frm').submit();
		});
		
		$('.listTitle').click(function(){
			var searchTitle = $(this).text();
			alert(searchTitle);
			$('#contents').val(searchTitle);
			$('#frm').submit();
		});
	});
	</script>
</body>

</html>
