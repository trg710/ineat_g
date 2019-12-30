<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰작성</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <script src="js/popper.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .bg {
            background-color: rgba(255, 255, 255, 1);
            border-color: rgba(214, 214, 214, 1);
        }

        .reviewarea {
            width: 100%;
            height: 150px;
            resize: none;
            font-size: 16px;
            border-color: rgba(214, 214, 214, 1);
            border-radius: 3px;
            overflow-y: hidden;
        }
        .pointStarRating{
            width: 117px;
            height: 25px;

            background: url(img/star.png) no-repeat;
            background-position-x: 0;
        }
        .pointStarlist{
            height: 24px;
            width: 12px;
            /* background: url(img/star.png) no-repeat; */
            background-position-x: -25;
            background: red;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            $('.pointStarRating>div:odd').css('background','red');

            $('.reviewarea').each(function () {
                this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
            }).on('input', function () {
                this.style.height = '150px';
                this.style.height = (this.scrollHeight) + 'px';
            });
        });
    </script>
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

    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-12">
                <div class="" style="width: 700px; margin: 0 auto;">
                    <h3> <b class="text-warning">리뷰 작성</b> </h3>
                    <div class="pointStarRating d-flex">
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                        <div class="pointStarlist"></div>
                    </div>
                    <div>
                        <form class="wrap" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="#">
                            <input type="hidden" name="sFile" id="file">
                            <textarea class="p-3 mt-3 mb-3 reviewarea" placeholder="리뷰 내용을 작성해 주세요"
                                maxlength="4000"></textarea>

                            <div class="text-right">
                                <button class="btn btn-secondary btn-lg"> 취소 </button>
                                <button class="btn btn-warning btn-lg ml-3"> 글 작성 완료</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>


</body>
</html>