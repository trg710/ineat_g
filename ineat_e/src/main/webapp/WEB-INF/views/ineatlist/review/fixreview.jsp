<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰수정</title>
    <link rel="stylesheet" href="/oxo/css/bootstrap.min.css" media="screen">
    <script src="/oxo/js/popper.min.js"></script>
    <script src="/oxo/js/jquery.min.js"></script>
    <script src="/oxo/js/bootstrap.min.js"></script>
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
		
		.pointStarRating {
		    width: 156px;
		    height: 24px;
		    overflow: hidden;
		    display: inline-block;
		    vertical-align: top;
		    margin: 1px 0 0 0;
		    padding-left: 1px;
		    background: url(/oxo/img/sp_ico3.png) no-repeat;
		    background-position: 0 -1060px;
		}
		
		.pointStarlist {
		    height: 24px;
		    width: 12px;
		    overflow: hidden;
		    border: 0;
		    cursor: pointer;
		    background: url(/oxo/img/sp_ico3.png) no-repeat;
		    background-position: 0 -9999px;
		}
		.pic_1 {
            display: inline-block;
            position: relative;
            width: 100px;
            height: 100px;
            overflow: hidden;
            margin: 1px;
        }
        .pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        $(function () {
			
            $('.pointStarRating>div:odd').css('width', '19px');

            $('.reviewarea').each(function () {
                this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
            }).on('input', function () {
                this.style.height = '150px';
                this.style.height = (this.scrollHeight) + 'px';
            });

            var bool = true;
            var c_star = '#'+c_star;
            var c_index;
            var c_score = '${rvVO.score}';
            
            $('.pointStarlist').click(function () {
                c_star = $(this);
                c_index = c_star.index();
                bool = false;
                c_score = $(this).attr('id');
                $('#score').val(c_score);
            });

            $('.pointStarlist').mouseenter(function () {
                var star = $(this);
                var t_score = $(this).attr('id');
                $('#sc').text(t_score);
                var t_index = star.index();
                if ((t_index % 2) == 0) {
                    // 짝수이면
                    star.css('background-position', '-1px -1031px');
                } else {
                    // 홀수이면
                    star.css('background-position', '-13px -1031px');
                }
                star.prevAll('.odd').css('background-position', '-1px -1031px');
                star.prevAll('.even').css('background-position', '-13px -1031px');
                star.nextAll().css('background-position', '0 -9999px');
            });
            
            $('.pointStarRating').mouseleave(function () {
                if (bool == true) {
                	$('#sc').text(0);
                    $('.pointStarlist').css('background-position', '0 -9999px');
                } else {
                    $('.pointStarlist').css('background-position', '0 -9999px');
                    if ((c_index % 2) == 0) {
                        c_star.css('background-position', '-1px -1031px');
                    } else {
                        c_star.css('background-position', '-13px -1031px');
                    }
                    c_star.prevAll('.odd').css('background-position', '-1px -1031px');
                    c_star.prevAll('.even').css('background-position', '-13px -1031px');
                    c_star.nextAll().css('background-position', '0 -9999px');
                	$('#sc').text(c_score);
                }
            });
            
            $('#ck').click(function(){
            	var f_value = $('#f1').val();
            	if(f_value ==""){
            		console.log('비어있음');
            	}
            });
            
            var f_no;
            var f_id;
            var f_this;
            var count = 0;
            $(document).on('click', '.pic_1', function(e) {
    			e.stopImmediatePropagation();
    			
    			f_this = $(this).find('img');
            	f_no = $(this).index()+1;
            	f_id = "#f"+f_no;
            	$(f_id).click();
            });
            
            $(document).on('change', '.files' , function(e) {
            	e.stopImmediatePropagation();
            	console.log($(this).val());
            	
            	var tmp = URL.createObjectURL(e.target.files[0]);
            	f_this.attr('src', tmp);
            	
            	var f_value = $(this).val();
            	if( count < f_no && count <= 10){
            		count += 1;
	            	var resultlist ='';
	            	resultlist +='<div class="pic_1 ml-2">';
	            	resultlist +='<img src="/oxo/img/moreimg.png" class="pic">';
	            	resultlist +='</div>';
	            	$('#gall').append(resultlist);
	            	
	            	f_id = 'f'+(f_no+1);
	            	var inputfile = '<input type="file" class="form-control-file files" name="sfile" id="'+f_id+'">';
	            	$('#file_box').append(inputfile);
            	}
            	            	
            });
            
        });
        function reviewsubmit(){
        	$('.files:last').remove();
        	$('#reviewfrm').submit();
        }
    </script>
</head>

<body>
    <!-- 메인 -->

    <!--네비게이션바-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
        <a class="navbar-brand" href="#"><img src="/oxo/img/logo.png" style="margin-left: 30px; width: 100px;"></a>
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
                    <img src="/oxo/img/member.png" width="30x" style="margin-left: 15px;"
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
                    <h3> <b class="text-warning">리뷰 수정</b> </h3>
                    <div class="d-flex">
	                    <div class="pointStarRating d-flex">
	                        <div class="pointStarlist odd" id="0.5"></div>
	                        <div class="pointStarlist even" id="1"></div>
	                        <div class="pointStarlist odd" id="1.5"></div>
	                        <div class="pointStarlist even" id="2"></div>
	                        <div class="pointStarlist odd" id="2.5"></div>
	                        <div class="pointStarlist even" id="3"></div>
	                        <div class="pointStarlist odd" id="3.5"></div>
	                        <div class="pointStarlist even" id="4"></div>
	                        <div class="pointStarlist odd" id="4.5"></div>
	                        <div class="pointStarlist even" id="5"></div>
	                    </div>
                        <div class="starscore mr-2"><h3><b id="sc">0</b></h3></div>
                    </div>
                    <div>
                    
                        <form class="wrap" enctype="multipart/form-data" method="post" action="/oxo/ineatlist/review/addreview.eat" id="reviewfrm">
                            <input type="hidden" id="score" name="s_score" value="">
                            <input type="hidden" id="mlno" name="rv_mlno" value="${MLNO}">
                            <div id="file_box" style="display: none;">
	                           	<input type="file" class="form-control-file files" name="sfile" id="f1">
                            </div>
                            <textarea name="rv_body" class="p-3 mt-3 mb-3 reviewarea" placeholder="리뷰 내용을 작성해 주세요" maxlength="1000"></textarea>
                            <div class="gallery" id="gall">
                        		<div class="pic_1 ml-2">
                            		<img src="/oxo/img/moreimg.png" class="pic">
                                </div>
                        	</div>
                        	
                            <div class="text-right">
                                <button type="button" class="btn btn-secondary btn-lg"> 취소 </button>
                                <button type="button" class="btn btn-warning btn-lg ml-3" onclick="reviewsubmit()"> 글 작성 완료</button>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>