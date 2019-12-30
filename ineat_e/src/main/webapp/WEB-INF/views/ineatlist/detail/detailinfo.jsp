<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 상세보기</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">

    <script src="js/popper.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .m0 {
            margin: 0;
        }

        .bg {
            background-color: rgba(255, 255, 255, 1);
            border-color: rgba(214, 214, 214, 1);
            ;
        }

        .listtop {

            padding-bottom: 5px;
            margin: 0 auto;
            border-bottom: 1px solid #dbdbdb;
            position: relative;
        }

        .listcommon {
            position: absolute;
            right: 0;
        }

        .listcommon div {
            margin: auto 5px;
        }

        .bbg {
            border-bottom: solid 1px #dbdbdb;
            width: 950px;
            margin: 0 auto;
            padding: 10px 0;
        }

        .info {
            border-collapse: separate;
            border-spacing: 0 10px;
            margin: 25px 0;
        }

        .info td {
            padding-left: 50px;
        }

        .imgbox {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
        }

        .pic_1 {
            display: inline-block;
            position: relative;
            width: 130px;
            height: 130px;
            overflow: hidden;
            margin: 1px;
        }

        .pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .blurEffect {
            filter: brightness(30%);
        }

        .overindex {
            margin: 0;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 24px;
        }
    </style>

    <script>
        $(function () {
            $('.gallery').each(function () {
                if ($('div', this).length > 6) {
                    var gal = $(this).children().eq(4);
                    var count = gal.nextAll().length;
                    gal.nextAll().css("display", "none");
                    gal.children('img').addClass('blurEffect');
                    gal.append( '<b></b>' );
                    gal.children('b').text("+"+count);
                    gal.children('b').addClass('overindex');
                }
            });

        });
    </script>

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg fixed-top">
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



    <div class="container" style="margin-top: 100px;">

        <div class="row m0 pb-3 bbg">
            <!-- 탑인포영역 -->
            <div class="detail col-8 p-0">

                <!-- 해더 -->
                <div class="header d-flex position-relative">
                    <h2>음식점 이름</h2><span>
                        <h2>4.7</h2>
                    </span>
                    <div class="position-absolute" style="right: 0;">이미지</div>
                </div>

                <!-- 탑 -->
                <div class="listtop d-flex">
                    <div>ㅇ조회수 : <span>000</span> </div>
                    <div class="ml-3">ㅇ추천수 : <span>000</span> </div>
                    <div class="ml-3">ㅇ리뷰수 : <span>000</span> </div>
                    <div class="listcommon">
                        <div>2019-12-27</div>
                    </div>
                </div>

                <!-- 센터 -->
                <table class="info">
                    <tbody>
                        <tr>
                            <th>주소</th>
                            <td>ㅇㅇㅇㅇ</td>
                        </tr>
                        <tr>
                            <th>대표메뉴</th>
                            <td>ㅇㅇㅇㅇ</td>
                        </tr>
                        <tr>
                            <th>가격대</th>
                            <td>ㅇㅇㅇㅇ</td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>ㅇㅇㅇㅇ</td>
                        </tr>
                        <tr>
                            <th>영업시간</th>
                            <td>ㅇㅇㅇㅇ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="background-color: aqua;" class="col-4">
                지도영역
            </div>
        </div>
        <!-- 탑인포영역 종료 -->



        <!-- 갤러리영역 -->
        <div class="row m0 bbg">
            <div class="col-12 text-center">
                갤러리 영역
            </div>
        </div>
        <!-- 갤러리영역 종료 -->



        <!-- 리뷰영역 -->
        <div class="row m0 bbg">
            <!-- 아바타 이미지 /아이디 -->
            <div class="col-10 d-flex mb-3">
                <div class="text-center mt-3">
                    <div class="imgbox">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s"
                            alt="avt" class="pic">
                    </div>
                    <span>닉네임</span>
                </div>

                <!-- 리뷰내용 -->
                <div class="ml-4">
                    <p> 2019-12-27</p>
                    <p>
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                    </p>

                    <div class="gallery">
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">

                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 등록점수 -->
            <div class="col-2 text-center mt-3">
                <h1><b>4.7</b></h1>
                <div>별모양 이미지</div>
            </div>
        </div>
        <!-- 리뷰영역 종료 -->

        <div class="row m0 bbg">
            <!-- 아바타 이미지 /아이디 -->
            <div class="col-10 d-flex mb-3">
                <div class="text-center mt-3">
                    <div class="imgbox">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s"
                            alt="avt" class="pic">
                    </div>
                    <span>닉네임</span>
                </div>

                <!-- 리뷰내용 -->
                <div class="ml-4">
                    <p> 2019-12-27</p>
                    <p>
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                        리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역 리뷰 상세내용 영역
                    </p>

                    <div class="gallery">
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">

                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                        <div class="pic_1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKuUOfGf8PwlNkBzfiOQdiM4r40X85-C4nB-OZTAAMKcYHFvRJA&s"
                                class="pic">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 등록점수 -->
            <div class="col-2 text-center mt-3">
                <h1><b>4.7</b></h1>
                <div>별모양 이미지</div>
            </div>
        </div>
        <!-- 리뷰영역 종료 -->
    </div>
</body>
</html>