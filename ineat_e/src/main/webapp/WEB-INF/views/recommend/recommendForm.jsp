<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/oxo/css/fullpage.min.css">
<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
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

/* .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
} */
body {
	background: url('/oxo/img/main.jpg') no-repeat;
	background-size: cover;
}

.card border-danger {
	width: 450px;
}

#thumNail {
	width: 430px;
	height: 330px;
	margin: 0px auto;
	margin-top: 10px;
	padding: 8px;
	border: 1px solid rgba(255, 119, 0, 0.5);
}

#recommendID {
	position: absolute;
	right: 10px;
}

.conImg img {
	height: 300px;
	opacity: 0.7;
}

.w3-content {
	background: white;
}

.white {
	background: rgba(255, 255, 255, 0.8);
	padding: 15px;
}

.imgClass {
	height: 350px;
}

.apiFont {
	font-size: 20px;
	color: #ff7702;
	font-weight: 600;
}

ul {
	cursor: pointer;
}

ul li:hover {
	color: #ff7702;
}

h2 {
	color: #ff7702;
}

.more {
	font-size: 16px;
	text-decoration:
}
</style>
<script type="text/javascript" src="/oxo/js/nav.js"></script>
</head>

<body>

	<!--네비게이션바-->
	<nav class="navbar navbar-expand-lg navbar-light bg">
		<a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
			style="margin-left: 30px; width: 100px;"></a>

		<!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

		<div class="collapse navbar-collapse" id="navbar">
			<form class="form-inline col-10" action="/oxo/searchProc.eat"
				method="POST">
				<input class=" form-control col-11 mr-sm-2" type="text"
					placeholder="Search" name="contents">
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
							<li class="nav-item" id="loginbtn"><a class="nav-link"
								href="#">로그인</a></li>
							<li class="nav-item" id="joinbtn"><a class="nav-link"
								href="#">회원가입</a></li>
						</c:if>
						<c:if test="${not empty SID}">
							<li class="nav-item"><a class="nav-link" href="#"
								id="logout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								id="memInfo">회원정보보기</a></li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--네비게이션바-->
	<div class="container-fhd">
		<div class="row" style="padding: 50px;">
			<div class="col-sm-4 white">
				<h2>
					<em>inEAT Recommend</em>
				</h2>
				<div class="card " id="box1" style="height: 505px;">
					<img id="thumNail"
						class="imgClass img-thumbnail card-img-top img-responsive">
					<div class="card-body">
						<p class="card-text">
							현재 기온은 <span class="apiFont" id="ctemp"></span>℃로 <span
								class="apiFont" id="dayCondition"></span> 입니다.<br> <span
								class="recommendTitle apiFont"></span>의 <span
								class="recommendMenu apiFont"></span>, 추천드립니다!
						</p>
						<div class="">
							<button type="button" class="btn btn-warning " id="recommendID"
								style="bottom: 10px;">
								<span class="recommendTitle"></span>&nbsp검색
							</button>
						</div>
					</div>

				</div>
			</div>
			<div class="col-sm-4 white">

				<!-- 검색으로 보내기 -->
				<form class="form-inline col-9" action="/oxo/searchProc.eat"
					method="POST" id="frm">
					<input type="hidden" id="contents" name="contents">
				</form>

				<h2>
					<em>MENU LIST</em>
					<button type="button" class="btn btn-warning" data-toggle="modal"
						data-target="#exampleModalScrollable">more</button>
				</h2>
				<ul class="list-group">
					<c:forEach begin="0" end="9" var="listMenu" items="${LISTMENU}">
						<li class="list-group-item listMenu" id="list_ml_menu"><h5>${listMenu.ml_menu}</h5></li>
					</c:forEach>
				</ul>
			</div>

			<!-- 스토리로 보내기 -->
			<div class="col-sm-4 white">
				<h2>
					<em>LAST WEEKLY TOP 10</em>
				</h2>
				<ul class="list-group">
					<c:forEach var="list" items="${LIST}">
						<li class="list-group-item listTitle" id="${list.ml_no}"><h5>${list.ml_title}
								<span class="badge badge-primary badge-pill">★
									${list.avg}</span>
							</h5></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalScrollable" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalScrollableTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalScrollableTitle">
						<em>MENU LIST</em></h2>
				</div>
				<div class="modal-body">
					<ul class="list-group">
					<c:forEach var="listMenu" items="${LISTMENU}">
						<li class="list-group-item listMenu" id="list_ml_menu"><h5>${listMenu.ml_menu}</h5></li>
					</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
	<script type="text/javascript" src="/oxo/js/fullpage.min.js"></script>
	<script type="text/javascript" src="/oxo/js/pscript.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
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
												$('#dayCondition').append(
														dayCondition);
												$('#ctemp').append(nowTemp);

												$
														.ajax({
															url : "weather.eat",
															type : "post",
															dataType : "json",
															data : {
																"dayCondition" : dayCondition
															},
															success : function(
																	adata) {
																var thum = "/oxo/mainlist/"
																		+ adata.mf_filename
																//alert(adata.mf_filename);
																$(
																		'.recommendTitle')
																		.append(
																				adata.ml_title);
																$(
																		'.recommendMenu')
																		.append(
																				adata.ml_menu);
																$('#thumNail')
																		.attr(
																				"src",
																				thum);
																$(
																		'#recommendID > span')
																		.attr(
																				"id",
																				adata.ml_no);

															},
															error : function() {
																alert('통신에러');
															}
														});
											});
							//추천메뉴 검색하기
							$('.listMenu').click(function() {
								var searchTitle = $(this).text();
								//alert(searchTitle);						
								$('#contents').val(searchTitle);
								$('#frm').submit();
							});

							//추천맛집 검색하기
							$('.listTitle').click(
									function() {
										var no = $(this).attr('id');
										$(location).attr(
												'href',
												'/oxo/ineatlist/info.eat?ml_no='
														+ no);
									});

							//날씨추천메뉴 검색하기
							$('#recommendID').click(
									function() {
										var no = $('#recommendID > span').attr(
												'id');
										$(location).attr(
												'href',
												'/oxo/ineatlist/info.eat?ml_no='
														+ no);
									});

							//마우스 아이콘, text스타일  변경
							$('.list-group-item > h3').hover(function() {
								$(this).css({
									"cursor" : "pointer",
									"text-decoration" : "underline"
								});
							}, function() {
								$(this).css('text-decoration', 'none');
							});

							//더보기 스타일변경
							$('.more').hover(function() {
								$(this).css({
									"cursor" : "pointer",
									"text-decoration" : "underline"
								});
							}, function() {
								$(this).css('text-decoration', 'none');
							});

						});
	</script>
</body>

</html>
