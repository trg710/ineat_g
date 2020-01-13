<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Karma">
<style>
   /*전체이미지크기*/
    img {
        width: 150px;
        height: 100px;
    }

   

    /*8강*/
    .class8gang {
        position: absolute;
        bottom: 5%;
        width: 100%;
    }

    /*4강*/
    .class4gang {
        position: absolute;
        bottom: 20%;
        width: 100%;
        display: inline-block;
    }

    /*결승*/
    .class2gang {
        position: absolute;
        bottom: 35%;
        width: 100%;
    }
    
    /*우승자*/
    .classVictory{
        position: absolute;
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


    .modalBack {
        position: absolute;
        background-color: rgba(0, 0, 0, 0.6);
        width: 100%;
        height: 1080px;
        z-index: 500;
        display: none;
    }
    .startBtn{
       position: absolute;
       width:400px;
       height:100px;
       top:50%;
       left:50%;
       transform: translate(-50%,-50%);
       z-index:1000;
    }
    .matdcup{
    display : none;
    }
    
    .matdcupBack{
    display : none;
    }
    
     /*매치메뉴*/
    .match {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 800px;
        height: 400px;
        display: none;
        z-index: 1000;
    }
    
     .match img{
        float:left;
      width:400px;
       height:400px;
    } 
    
        /*n강 박스*/
     .nGangClass {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 800px;
        height: 400px;
        display: none;
        z-index: 1500;
        background : black;
        
    } 
    
    .nGang{
       position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
       font-style : italic;
       color: white;
       font-size: 100px;
       font-weight : 900;
    }
    
    /* vs 폰트 */
    
    .vsClass{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width:150px;
       background: rgba(255,255,255,0.6);
       text-align:center;
       border-radius : 50px;
    }
    .vsClass span{
       font-size: 64px;
       color:red;
       font-weight : 900;
    }
</style>
<style>
</style>

<body>

   <button type="button" class="startBtn btn btn-warning" id="start">맛드컵 시작하기</button>
<div class="matdcupBack">    
   <!-- 우승자 -->
    <div class="w3-row classVictory" id="victoryId">
    
        <div class="w3-col w3-container" style="width: 35%">
        </div>
        <div class="w3-col w3-container" style="width:30%" >
            <img class="w3-padding w3-round">
        </div>
        <div class="w3-col w3-container" style="width: 35%">
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
</div>
   
   <!-- 모달 백 -->
   <div class="modalBack"></div>
   
   <!-- 매치창 -->
   
   <div class="match">
	   <div class="nGangClass">
	         <span class="nGang"></span>
	   </div>
      <div class="vsClass">
      <span>VS</span>
      </div>
      <img id="match1player">
      <img id="match2player">
   </div>

   <script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
   <script type="text/javascript" src="/oxo/js/popper.min.js"></script>
   <script type="text/javascript" src="/oxo/js/pscript.js"></script>
   <script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/oxo/js/nav.js"></script>
   <script type="text/javascript" src="/oxo/js/matdcupJS.js"></script>
   <script>
   </script>
</body>
</html>