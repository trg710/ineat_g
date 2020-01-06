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
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light  bg">
		<a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
			style="margin-left: 30px; width: 100px;"></a>
		<div class="collapse navbar-collapse" id="navbar">
			<form class="form-inline col-9">
				<input class=" form-control col-10 mr-sm-2" type="text"
					placeholder="Search">
				<button class="btn btn-warning" type="submit">Search</button>
			</form>
			<ul class="navbar-nav float-left"
				style="width: 200px; margin-right: 20px;">
				<li class="nav-item"><a class="nav-link" href="#">Story</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List</a></li>
				<li class="nav-item"><img src="/oxo/img/member.png" width="30x"
					style="margin-left: 15px;"
					onclick="document.getElementById('login').style.display='block'">
				</li>
			</ul>
			<div></div>
		</div>
	</nav>
	<div class="container-xl">
		<div class="row content" style="padding: 50px;">
			<div class="col-4 white">
				<h1>날씨</h1>
				<div class="card">
					<img src="/oxo/img/recommend_sam.jpg"
						class="img-thumbnail card-img-top">
					<div class="card-body">
						<h5 class="card-title">삼계탕</h5>
						<p class="card-text">
							현재 기온은 <h3><span id="ctemp"></span>도</h3>로 <h3><span id="dayCondition"></span></h3>
							입니다.<span class="recommendTitle"></span>가게의  <h3><span class="recommendMenu"></span></h3>는 어떠실까요??
						</p>
					</div>
				</div>
			</div>
			<div class="col-4 white">
				<h1>많이 검색한 메뉴</h1>
				<ul class="list-group">
					<c:forEach var="listMenu" items="${LISTMENU}">
						<li class="list-group-item">${listMenu.ml_menu}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-4 white">
				<h1>많이 검색한 맛집</h1>
				<ul class="list-group">
					<c:forEach var="list" items="${LIST}">
						<li class="list-group-item">${list.ml_title}</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$
				.getJSON(
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
									//alert(adata.mf_filename);
									$('.recommendTitle').append(adata.ml_title);
									$('.recommendMenu').append(adata.ml_menu);
								},
								error : function() {
									alert('통신에러');
								}
							});
						});
	</script>
</body>

</html>
