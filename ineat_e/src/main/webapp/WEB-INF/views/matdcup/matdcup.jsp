<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
	/*전체이미지크기*/
    img {
        width: 150px;
        height: 100px;
    }

    /*매치메뉴*/
    .match {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
        height: 200px;
        display: none;
        border: 1px solid red;
        z-index: 1000;
    }

    /*8강*/
    .class8gang {
        position: absolute;
        bottom: 5%;
        width: 100%;
        border: 1px solid red;
    }

    /*4강*/
    .class4gang {
        position: absolute;
        border: 1px solid blue;
        bottom: 20%;
        width: 100%;
        display: inline-block;
    }

    /*결승*/
    .class2gang {
        position: absolute;
        border: 1px solid black;
        bottom: 35%;
        width: 100%;
    }
    
    /*우승자*/
    .classVictory{
        position: absolute;
        border: 1px solid orange;
        bottom: 50%;
        width: 100%;
    }
    .classVictory img{
        width: 100%;
        height: 250px;
    }
    .victoryBox{
        width: 250px;
        height: 250px;
    }
    .victoryBox>img{
        width: 250px;
        height: 250px;
    }

    .imgBox {
        border: 1px solid yellow;
        width: 25%;
        float: left;
    }

    .imgBox img {
        width: 42%;
    }

    .finalwinner {
        position: absolute;
        top: 90px;
        border: 1px solid green;
        width: 50%;
        height: 195px;
    }

    .modalBack {
        position: absolute;
        background-color: rgba(255, 255, 0, 0.6);
        width: 100%;
        height: 1080px;
        z-index: 500;
        display: none;
    }
</style>
<style>
</style>

<body>
	<div>
        <button id="start">시작하기</button>
    </div>
    
	<!-- 우승자 -->
    <div class="w3-row classVictory" id="victoryId">
       <div class="w3-col w3-m5">
        </div>
        <div class="w3-col w3-m2" >
            <img class="w3-padding w3-round">
        </div>
        <div class="w3-col w3-m5">
        </div>
    </div>


	<!-- 결승 -->
    <div class="w3-row w3-margin-bottom class2gang winner2" id="2gang">
        <div class="w3-col w3-container" style="width: 37.77777%">
        </div>
        <div class="w3-col w3-container" style="width: 25%">
            <img class="w3-padding w3-round w3-half">
            <img class="w3-padding w3-round w3-half">
        </div>
        <div class="w3-col w3-container" style="width: 37.77777%">
        </div>
    </div>
	<!--4강-->
	<div class="w3-row w3-margin-bottom class4gang winner" id="4gang">
        <div class="w3-col w3-container" style="width: 16.66666%">
        </div>
        <div class="w3-col w3-container" style="width: 25%">
            <img class="w3-padding w3-round w3-half">
            <img class="w3-padding w3-round w3-half">
        </div>
        <div class="w3-col w3-container" style="width: 16.66666%">
        </div>
        <div class="w3-col w3-container" style="width: 25%">
            <img class="w3-padding w3-round w3-half">
            <img class="w3-padding w3-round w3-half">
        </div>
        <div class="w3-col w3-container" style="width: 16.66666%">
        </div>
    </div>


	<!-- 8강 -->
	<div class="w3-row w3-bottom w3-margin-bottom" id="8gang">
		<div class="w3-col w3-container" style="width: 25%">
			<c:forEach begin="0" end="1" var="list" items="${MLIST}">
				<img src="/oxo/matdcupImg/${list.md_name}.jpg"
					id="${list.md_name}" class="w3-padding w3-round w3-half">
			</c:forEach>
		</div>
		<div class="w3-col w3-container" style="width: 25%">
			<c:forEach begin="2" end="3" var="list" items="${MLIST}">
				<img src="/oxo/matdcupImg/${list.md_name}.jpg"
					id="${list.md_name}" class="w3-padding w3-round w3-half">
			</c:forEach>
		</div>
		<div class="w3-col w3-container" style="width: 25%">
			<c:forEach begin="4" end="5" var="list" items="${MLIST}">
				<img src="/oxo/matdcupImg/${list.md_name}.jpg"
					id="${list.md_name}" class="w3-padding w3-round w3-half">
			</c:forEach>
		</div>
		<div class="w3-col w3-container" style="width: 25%">
			<c:forEach begin="6" end="7" var="list" items="${MLIST}">
				<img src="/oxo/matdcupImg/${list.md_name}.jpg"
					id="${list.md_name}" class="w3-padding w3-round w3-half">
			</c:forEach>
		</div>
	</div>


		<!-- <div class="imgBox">
			<img src="img/1.jpg" id="1" class="w3-margin w3-card-6 w3-round">
			<img src="img/2.jpg" id="2" class="w3-margin w3-card-4 w3-round">
		</div>

		<div class="imgBox">
			<img src="img/3.jpg" id="3" class="w3-margin w3-card-4 w3-round">
			<img src="img/4.jpg" id="4" class="w3-margin w3-card-4 w3-round">
		</div>
		<div class="imgBox">
			<img src="img/5.jpg" id="5" class="w3-margin w3-card-4 w3-round">
			<img src="img/6.jpg" id="6" class="w3-margin w3-card-4 w3-round">
		</div>
		<div class="imgBox">
			<img src="img/7.jpg" id="7" class="w3-margin w3-card-4 w3-round">
			<img src="img/8.jpg" id="8" class="w3-margin w3-card-4 w3-round">
		</div> -->


	<div class="modalBack"></div>
	<div class="match">
		<img id="match1player"> <img id="match2player">
	</div>

	<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
	<script type="text/javascript" src="/oxo/js/pscript.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script type="text/javascript" src="/oxo/js/matdcupJS.js"></script>
	<script>
		$(document).ready(function() {
			$('#start').click(function() {
				$('.modalBack').css('display', 'block');
				$('.match').css('display', 'block');
			});

			$('.listMd').click(function() {
				var str = $(this).attr('id');
				alert(str);
			});
		});
	</script>
</body>
</html>