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
<div class="boxClear">
  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">날씨로 추천하는 메뉴</h4>
      </div>
	  <div class="modal-body">
		 <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-col w3-third">
      <img src="/img/recommend_sam.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-col w3-third">
      <img src="/img/recommend_sam.jpg" alt="Sandwich" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-col w3-third">
      <img src="/img/recommend_sam.jpg" alt="Sandwich" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
  </div>
	  </div>
      <div class="modal-footer">
		<p><a href="#">삼계탕으로 검색하러 가기</a></p>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
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
		<ul class="w3-ul">
			<li>1위</li>
			<li>2위</li>
			<li>3위</li>
			<li>4위</li>
			<li>5위</li>
			<li>6위</li>
			<li>7위</li>
			<li>8위</li>
			<li>9위</li>
			<li>10위</li>
		</ul>
      </div>
      <div class="modal-footer">
    	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=44b647d32d3a2207ba2169b2aa1a7f92&units=metric',function(data){
		var $nowTemp = data.main.temp;
		var $minTemp = data.main.temp_min;
		var $maxTemp = data.main.temp_max;
		var $weather = data.weather[0].main;
		var $wIcon = data.weather[0].icon;
		var $wIconImg = '<img src=\"http://openweathermap.org/img/wn/' + $wIcon + '.png" />';
			
		$('.ctemp').append($nowTemp);
		$('.weather').append($weather);
	});
	</script>
</body>
</html>