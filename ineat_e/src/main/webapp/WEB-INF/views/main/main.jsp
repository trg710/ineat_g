<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/oxo/css/fullpage.min.css">
<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
<script type="text/javascript" src="/oxo/js/fullpage.min.js"></script>
<script type="text/javascript" src="/oxo/js/pscript.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function() {
		//로그인처리
		$('#login').css('display', 'none');
		$('#loginbtn').click(function() {
			$('#login').css('display', 'block');
		});
		$('#x').click(function() {
			$('#login').css('display', 'none');
		});
		
		$('#loginsub').click(function(){
			$.ajax({
				url : "/oxo/member/loginProc.eat",
				type : "post",
				dataType : "json",
				data : {"id" : $('#id').val(),
					"pw" : $('#password').val()},
				success : function(cnt){
					if(cnt==1){
						location.reload();
					}else{
						alert('로그인에 실패하였습니다.');
					}
				},
				error : function(){
					alert('###에러');
				}
			});
		});
		
		
		
		//로그아웃
		$('#logout').click(function(){
			$(location).attr('href', '/oxo/member/logout.eat');
		});
		
		//회원가입처리
		$('#joinbtn').click(function() {
			$(location).attr('href', '/oxo/member/join.eat');
		});
	});
</script>
<style>
.clearfix::before, .clearfix::after {
	display: block;
	content: '';
	clear: both;
}

#page1 {
	padding: 50px;
	background-color: rgba(255, 255, 255, 0.3);
	display: inline-block;
}

#mainimg {
	border: solid white 10px;
}
/*섹션2*/
.content2 {
	margin-top: 50px;
}

.reviewTitle {
	width: 70%;
	height: 40px;
	background-color: #ff7702;
	border-top-right-radius: 40px;
	margin: 20px auto;
}

.reviewBox {
	width: 70%;
	height: 10em;
	border: 2px solid #ff7702;
	background-color: white;
	margin: 15px auto;
	padding: 5px;
}

.review {
	width: 80%;
	height: 100%;
	margin: 0 auto;
	display: inline-block;
	position: relative;
}

.rvtext {
	height: 112px;
	width: 150%;
	float: left;
	margin-left: 22px;
}

/*3섹션*/
#page3 {
	align-content: center;
	padding: 20px 100px 20px 100px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.5);
	display: inline-block;
	border-top: 10px solid #ff7702;
	border-bottom: 10px solid #ff7702;
}

#img {
	margin: 10px;
}

#img:hover {
	border: solid white 10px;
	box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.8);
}

<!--
로그인 모달창 css-->
.form-control:focus {
	border: solid orange 2px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(255, 165, 0, 0.4)
}

.btn-w {
	width: 100%;
	margin-bottom: 0.5rem;
}

.size {
	font-size: 0.8rem;
	display: inline;
	text-align: center;
}

.w3-button:hover {
	color: #000 !important;
	background-color: rgba(253, 153, 0, 0.6) !important;
}
</style>
</head>
<body>
	<!-- 메인 -->

	<!--네비게이션바-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
		<a class="navbar-brand" href="#"><img src="img/logo.png"
			style="margin-left: 30px; width: 100px;"></a>
			<script type="text/javascript">
			$(function() {
				//네비바 로고 클릭 시 메인화면으로 이동
				$('.navbar-brand').click(function() {
					$(location).attr('href', '/oxo/main.eat');
				});
			</script>
		<!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

		<div class="collapse navbar-collapse" id="navbar">
			<form class="form-inline col-10">
				<input class=" form-control col-11 mr-sm-2" type="text"
					placeholder="Search">
				<button class="btn btn-warning" type="submit">Search</button>
			</form>
			<ul class="navbar-nav float-left"
				style="width: 200px; margin-right: 20px;">
				<li class="nav-item"><a class="nav-link" href="#">Story</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List</a></li>
				<li class="nav-item"><img src="img/member.png" width="30x"
					style="margin-left: 15px;">
					<ul class="navbar-nav">
						<c:if test="${empty SID}">
						<li class="nav-item" id="loginbtn"><a class="nav-link">로그인</a></li>
						<li class="nav-item" id="joinbtn"><a class="nav-link"
							href="#">회원가입</a></li>
						</c:if>
						<c:if test="${not empty SID}">
							<li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="#">회원정보보기</a></li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--네비게이션바-->

	<!--메인-->
	<div id="fullpage" class="wrapper">
		<!-- 섹션1-->
		<div class="section"
			style="background: url('img/main.jpg') no-repeat; background-size: cover;">
			<div id="page1" style="margin-top: 5%;">
				<img src="img/click.jpg" width="28%" id="mainimg"
					style="margin-left: 15px;"> <img src="img/ineat.png"
					width="30%" style="margin-right: 5%; margin-left: 5%;"> <img
					src="img/matdcup.jpg" width="28%" id="mainimg">
			</div>
		</div>
		<!--임시섹션2-->
		<div class="section mt-n1"
			style="background: url('img/main2.jpg') no-repeat; background-size: cover;">
			<div class="content2">
				<div class="reviewTitle">
					<h1 style="font-size: 38px; color: rgb(255, 255, 255);">
						<em>R e v i e w</em>
					</h1>
				</div>
				<div class="reviewBox col-12">
					<div class="membInfo col-2 center-block" style="float: left;">
						<img src="img/member.png" width="70px" height="70px"
							style="margin: 10px 0px 0px 14px;">
						<h6></h6>
						<h4 class="badge badge-warning"
							style="font-size: 13px; margin-left: 5px;">닉네임닉네임</h4>
					</div>
					<div class="review col-12 clearfix" style="margin-top: 3px;">
						<div style="margin-right: 20px;">
							<img src="img/k_doen.jpg" width="112px;" height="112px"
								style="float: left; border: solid white 1px;"> <img
								src="img/k_doen.jpg" width="112px;" height="112px"
								style="float: left; border: solid white 1px;"> <img
								src="img/k_doen.jpg" width="112px;" height="112px"
								style="float: left; border: solid white 1px;">
						</div>
						<div class="col-4 rvtext">
							<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
						</div>
						<div class="jumsu" style="float: right;" width="50px"
							height="50px;">
							<h1 style="font-size: 80px; color: rgb(0, 148, 0);">
								<b><em>4.2</em></b>
							</h1>
						</div>
					</div>
				</div>
				<div class="reviewBox"></div>
				<div class="reviewBox"></div>
				<div class="reviewBox"></div>
			</div>
		</div>

	<!--섹션3-->
	<div class="section"
		style="background: url('img/main.jpg') no-repeat; background-size: cover;"
		align="center">
		<div id="page3" style="margin-top: 5%;">
			<div align="left">
				<img src="img/한식1.jpg" onmouseover="this.src='img/한식2.jpg'"
					onmouseout="this.src='img/한식1.jpg'" width="250px" id="img"> <img
					src="img/중식1.jpg" onmouseover="this.src='img/중식2.jpg'"
					onmouseout="this.src='img/중식1.jpg'" width="250px" id="img"> <img
					src="img/양식1.jpg" onmouseover="this.src='img/양식2.jpg'"
					onmouseout="this.src='img/양식1.jpg'" width="250px" id="img">
			</div>
			<div style="margin-left: 30%;" align="right">
				<img src="img/일식1.jpg" onmouseover="this.src='img/일식2.jpg'"
					onmouseout="this.src='img/일식1.jpg'" width="250px" id="img"> <img
					src="img/회식1.jpg" onmouseover="this.src='img/회식2.jpg'"
					onmouseout="this.src='img/회식1.jpg'" width="250px" id="img"> <img
					src="img/카페1.jpg" onmouseover="this.src='img/카페2.jpg'"
					onmouseout="this.src='img/카페1.jpg'" width="250px" id="img">
			</div>
		</div>
	</div>
	</div>

	<!-- 로그인 모달창 -->
	<div id="login" class="w3-modal">
		<div class="w3-modal-content" style="width: 35%">
			<div class="w3-container w3-padding">
				<span id="x" style="margin: 10px 18px 0px 0px;"
					class="w3-button w3-display-topright">&times;</span>
				<!-- 로그인 모달 실제코드 -->

				<div style="border: solid orange 2px;">
					<div>
						<div style="text-align: center;">
							<img src="/oxo/img/logo.png" width="50%"
								style="align-content: center; padding-top: 20px;">
						</div>
						<div
							style="padding: 20px 20px 0px 20px; margin: 20px 20px 20px 20px;">
							<div>
								<input type="text" class="form-control inputheight " id="id" name="id"
									placeholder="I D"">
							</div>
							<div>
								<input type="password" class="form-control inputheight "
									style="margin-top: 10px;" id="password" name="pw" placeholder="Password">
							</div>
							<div>
								<br>
								<button type="button" class="btn btn-warning btn-w" id="loginsub">Login</button>
							</div>
							<div style="display: inline-block; margin: 0px;"
								class="row col-md-12">
								<div class="size col-md-6" style="float: left;">
									<p class="text-warning size">
										<b>아이디찾기</b>
									</p>
								</div>
								<div class="size col-md-6" style="float: right;">
									<p class="text-warning size">
										<b>비밀번호찾기</b>
									</p>
								</div>
							</div>
							<p></p>
							<p class="text-muted text-center pt-1">Copyright © INEAT Corp. All Rights Reserved.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 모달 실제코드 여기까지 -->
		</div>
	</div>

</body>
</html>