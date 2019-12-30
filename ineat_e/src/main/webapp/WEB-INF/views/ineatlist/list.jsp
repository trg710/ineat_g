<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 리스트</title>

<link rel="stylesheet" href="/oxo/css/w3.css" >
<link rel="stylesheet" href="/oxo/css/bootstrap.css" >

<script type="text/javascript" src="/oxo/js/jquery.min.js" ></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>

<style>
    ul {
        list-style: none;
        width: auto;
        padding-left: 15px;
    }

    .bg {
        background-color: rgba(255, 255, 255, 1);
        border-color: rgba(214, 214, 214, 1);
        ;
    }

    .imgbox {
        min-width: 238px;
        height: 238px;
        overflow: hidden;
        position: relative;
    }

    .imgbox img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .text_box {
        width: 100%;
        height: 100%;
    }

    .text_box ul li {
        margin: 5px 0;
    }

    .text_box div {
        position: absolute;
        right: 0;
    }

    .mainlist {
        padding-top: 30px;
        padding-bottom: 30px;
        width: 760px;
        margin: 0 auto;
        border-bottom: 1px solid #dbdbdb;
        position: relative;
    }

    .listtop {
        padding-top: 30px;
        padding-bottom: 5px;
        width: 760px;
        margin: 0 auto;
        border-bottom: 1px solid #dbdbdb;
        position: relative;
    }
    .list_row{
        position: absolute;
        right: 0;
        bottom: 0;
        padding-bottom: 5px;
    }
    .list_row div{
        margin: auto 5px;
    }
    .page_box{
        margin-top: 20px;
    }
</style>


<script type="text/javascript">
	
</script>
<script>
	$("#lr").click(function() {
		var str = (this).val();

	});
</script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg fixed-top">
        <a class="navbar-brand" href="#"><img src="/oxo/img/logo.png" style="margin-left: 30px; width: 100px;"></a>
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
                    <img src="/oxo/img/member.png" width="30x" style="margin-left: 15px;"
                        onclick="document.getElementById('login').style.display='block'">
                </li>
            </ul>
            <div>
            </div>
        </div>
    </nav>

    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div style="width: 900px; margin: 0 auto;">

                <!-- 태그 버튼들 정렬내용. -->
                <div class="btn-group-toggle d-flex justify-content-between col-12" data-toggle="buttons">
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option1" autocomplete="off"> #태그 1
                    </label>
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option2" autocomplete="off"> #태그 2
                    </label>
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option3" autocomplete="off"> #태그 3
                    </label>
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option4" autocomplete="off"> #태그 4
                    </label>
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option5" autocomplete="off"> #태그 5
                    </label>
                    <label class="btn btn-outline-warning">
                        <input type="radio" name="options" id="option6" autocomplete="off"> #태그 6
                    </label>
                </div>

                <div class="listtop">
                    <div>
                        <em>n</em>개<span id="common">(ㅇㅇ순)</span>
                    </div>
                    <div class="list_row d-flex">
                        <div class="lr">조회순</div>
                        <div class="lr">리뷰순</div>
                        <div class="lr">좋아요순</div>
                    </div>
                </div>
				
                <!-- 리스트 컬럼 -->
                <div class="d-flex mainlist">
                
                    <!-- 넘버 -->
                    <h2 style="display: inline-block; margin-right:10px;">1.</h2>

                    <!-- 이미지박스 -->
                    <div class="imgbox">
                        <img src="http://starpizza.co.kr/data/goodsImages/GOODS1_1525318753.jpg">
                    </div>
					
                    <!-- 텍스트박스 -->
                    <div class="text_box">
                        <div> 버튼이미지 </div>
                        <ul>
                            <li>
                                <h2 class="d-inline-block"> 식당이름</h2>
                                <h2 class="d-inline-block"> <span>4.5</span>
                                </h2>
                            </li>
                            <li>
                                서울 특별시 가산동 470-8
                            </li>
                            <li>
                                <b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의 이것이다. 어디 이것이야말로 힘차게 싹이 아니다.
                                실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.
                            </li>
                            <li>
                                <b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의 이것이다. 어디 이것이야말로 힘차게 싹이 아니다.
                                실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의 이것이다. 어디
                                이것이야말로 힘차게 싹이 아니다.
                            </li>
                        </ul>
                        <div> 자세히 보기 > </div>
                    </div>
                </div>



                <!-- 페이징처리  -->
                <div class="text-center d-flex page_box">
                    <ul class="pagination" style="margin: 0 auto;">
                        <li class="page-item disabled">
                            <a class="page-link" href="#">&laquo;</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">&raquo;</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
	</div>
</body>

</html>