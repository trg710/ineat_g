<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Recommend</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="/css/w3.css" >
	<link rel="stylesheet" href="/css/bootstrap.css" >
	<link rel="stylesheet" href="/css/fullpage.min.css" >
	<style>
	    .bg {
            background-color: rgba(255, 255, 255, 1);
            border-color: rgba(214, 214, 214, 1);
        }
        
        .form-control:focus {
        border:solid orange 2px;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 165, 0, 0.4)
        }
		.content{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
		}
		.row{
			border: 1px solid red;
		}
		body{
			background: url('/img/main.jpg') no-repeat; 
			background-size: cover;
		}
		
		.conImg{
			margin: 50px;
		}
		.conImg img{
			height: 300px;
			opacity: 0.7;
		}
		
		.modalClass{
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%,-50%);
			z-index: 10000;
			display: none;
		}
		
		
	</style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light  bg">
        <a class="navbar-brand" href="#"><img src="/img/logo.png" style="margin-left: 30px; width: 100px;"></a>
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
                    <img src="/img/member.png" width="30x" style="margin-left: 15px;"
                    onclick="document.getElementById('login').style.display='block'">
                </li>
            </ul>
            <div>
            </div>
        </div>
    </nav>
<div class="content">
	<div class="conImg" data-toggle="modal" data-target="#weather">
		<a href="#"><img class="img-responsive" style="width:100%" src="/img/recommend_img1.png"></a>
	</div>
	<div class="conImg" data-toggle="modal" data-target="#age">
		<a href="#"><img class="img-responsive" style="width:100%" src="/img/recommend_img1.png"></a>
	</div>
</div>
	
<div id="weather" class="modalClass">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">날씨로 추천하는 메뉴</h4>
      </div>
	  <div class="modal-body">
		<img src="/img/recommend_sam.jpg" class="img-thumbnail">
	  </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
		<p><a href="#">삼계탕으로 검색하러 가기</a></p>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="age" class="modalClass">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">연령대별 가장 많이 검색한 메뉴</h4>
      </div>
	  <div class="modal-body">
		<img src="/img/recommend_sam.jpg" class="img-thumbnail">
	  </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <p><a href="#">삼계탕으로 검색하러 가기</a></p><button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript"></script>
</body>
</html>