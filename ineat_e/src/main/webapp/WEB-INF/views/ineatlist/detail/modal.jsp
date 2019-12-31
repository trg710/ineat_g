<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title> </title>

<link rel="stylesheet" href="/oxo/css/w3.css" >
<link rel="stylesheet" href="/oxo/css/bootstrap.css" >

<link rel="stylesheet" href="/oxo/css/demo.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/oxo/css/flexslider.css" type="text/css" media="screen" />


<script type="text/javascript" src="/oxo/js/jquery.min.js" ></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>

<script defer src="/oxo/js/jquery.flexslider.js"></script>


<style>
</style>

<script type="text/javascript">
$(function () {
    $('#carousel').flexslider({
      animation: "slide",
      controlNav: false,
      animationLoop: false,
      slideshow: false,
      itemWidth: 80,
      itemMargin: 5,
      asNavFor: '#slider'
    });
    $('#slider').flexslider({
      animation: "slide",
      controlNav: false,
      animationLoop: false,
      slideshow: false,
      sync: "#carousel",
      start: function (slider) {
        $('body').removeClass('loading');
      }
    });
  });
</script>

</head>
<body>
<!-- 메인 -->
  <div class="container" style="margin-top: 100px;">
    <div class="row m-0">
      <!-- 사진 갤러리 영역 -->
      <div class="col-9 pt-4" style="position: relative;">
        <section class="slider">
          <div id="slider" class="flexslider">
            <ul class="slides">
              <li>
                <img src="/oxo/img/photo1.jpeg" />
              </li>
              <li>
                <img src="/oxo/img/photo2.jpeg" />
              </li>
              <li>
                <img src="/oxo/img/photo3.jpeg" />
              </li>
            </ul>
          </div>

          <div id="carousel" class="flexslider">
            <ul class="slides" style="justify-content: center;">
              <li>
                <img src="/oxo/img/photo1.jpeg" />
              </li>
              <li>
                <img src="/oxo/img/photo2.jpeg" />
              </li>
              <li>
                <img src="/oxo/img/photo3.jpeg" />
              </li>
            </ul>
          </div>
        </section>
        <div
          style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; z-index: -2; background-color: black; opacity: 0.6;">
        </div>
      </div>
      <!-- 아바타, 텍스트 영역 -->
      <div class="col-3" style="background: white;">
      </div>
    </div>
    <!-- 아바타, 텍스트 영역 종료 -->
  </div>


</body>
</html>