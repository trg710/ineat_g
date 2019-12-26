<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<script type="text/javascript" src="/js/fullpage.min.js"></script>
<script type="text/javascript" src="/js/pscript.js"></script>
<style>
</style>
<script type="text/javascript">
</script>
<style>
        .bg {
            background-color: rgba(255, 255, 255, 1);
            border-color: rgba(214, 214, 214, 1);
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
.reviewTitle{
			width: 80%;
			height: 40px;
			background-color: #ff7702;
			border-top-right-radius: 40px;
			padding-top:1px;
		}
.reviewBox{
	width: 80%;
	height: 130px;
	margin-top: 10px;
	border: 2px solid #ff7702;
}


<!--로그인 모달창 css-->
.form-control:focus {
  border:solid orange 2px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 165, 0, 0.4)
}

.btn-w{
    width:100%;
    margin-bottom: 0.5rem;
}

.size{
    font-size: 0.8rem;
    display: inline;
    text-align: center;
}

.w3-button:hover {
    color: #000!important;
    background-color: rgba(253,153,0,0.6)!important;
</style>
</head>
<body>
 	<!-- 메인 -->
 	
    <!--네비게이션바-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
        <a class="navbar-brand" href="#"><img src="img/logo.png" style="margin-left: 30px; width: 100px;"></a>
        <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

        <div class="collapse navbar-collapse" id="navbar">
            <form class="form-inline col-9">
                <input class=" form-control col-10 mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-warning" type="submit">Search</button>
            </form>
            <ul class="navbar-nav float-left" style="width: 200px; margin-right: 20px;">
                <li class="nav-item">
                    <a class="nav-link" href="#">Story</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Matdcup</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">List</a>
                </li>
                <li class="nav-item">
                    <img src="img/member.png" width="30x" style="margin-left: 15px;"
                    onclick="document.getElementById('login').style.display='block'">
                </li>
            </ul>
            <div>
            </div>
        </div>
    </nav>
    <!--네비게이션바-->

    <!--메인-->
    <div id="fullpage" class="wrapper">
        <!-- 섹션1-->
         <div class="section" style="background: url('img/main.jpg') no-repeat; background-size: cover;">
            <div id="page1" style="margin-top: 10%;">                    
                <img src="img/click.jpg" width="28%" id="mainimg" style="margin-left: 15px;">
                <img src="img/ineat.png" width="30%" style="margin-right:5%; margin-left: 5%;">
                <img src="img/matdcup.jpg" width="28%" id="mainimg">
            </div>
        </div>
        <!--임시섹션2-->
        <div class="section">
            <div class="content2">
                <div class="reviewTitle">리뷰 랭킹?</div>
                <div class="reviewBox"></div>
                <div class="reviewBox"></div>
                <div class="reviewBox"></div>
                <div class="reviewBox"></div>
            </div>
        </div>
    </div>
        <div class="section"></div>
        <div class="section"></div>
 
    <!-- 로그인 모달창 -->
    <div id="login" class="w3-modal">
    <div class="w3-modal-content" style="width:35%">
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('login').style.display='none'" id="x" style ="margin:10px 18px 0px 0px;"class="w3-button w3-display-topright">&times;</span>
        <!-- 로그인 모달 실제코드 -->
           
         <div style="border: solid orange 2px;">
        <div>
            <div style="text-align: center;">
            <img src="/img/logo.png" width="50%" style="align-content: center; padding-top: 20px;">
            </div>
            <div style="padding:20px 20px 0px 20px; margin:20px 20px 20px 20px;">
                <div>
                    <input type="text" class="form-control inputheight " id="id" placeholder="I D"">
                </div>
                <div>
                    <input type="password" class="form-control inputheight " style="margin-top: 10px;" id="password" placeholder="Password"">
                </div>
                <div>
                    <br>
                    <button type="submit" class="btn btn-warning btn-w">Login</button>
                </div>
                <div style="display: inline-block; margin:0px;" class="row col-md-12">
                    <div class="size col-md-4 " style="float: left;">
                            <p class="text-warning size"><b>회원가입</b></p>
                    </div>
                    <div class="size col-md-4" style="float: left;">
                        <p class="text-warning size"><b>아이디찾기</b></p>
                    </div>
                    <div class="size col-md-4" style="float: right;">
                        <p class="text-warning size"><b>비밀번호찾기</b></p>
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