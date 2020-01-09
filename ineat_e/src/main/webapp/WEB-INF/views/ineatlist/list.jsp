<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 리스트</title>

<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/fonts/Jua-Regular.ttf">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="/oxo/js/jquery.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>

<style>
.btn-group-toggle{
	font-family: "Jua", sans-serif;
	
}
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
.pic{
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.pimgbox {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
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
	right: 0;
}

.mainlist {
	padding-top: 60px;
	padding-bottom: 30px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}

.listtop {
	padding-top: 30px;
	padding-bottom: 5px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}

.list_row {
	position: absolute;
	right: 0;
	bottom: 0;
	padding-bottom: 5px;
}

.list_row div {
	margin: auto 5px;
}

.page_box {
	margin-top: 20px;
}
.detail {
	cursor:pointer;
}
.favorite{
	width:35px;
	cursor:pointer;
	height:35px;
}

</style>


<script type="text/javascript">
	$(function() {

		var isEnd = false;
		var rno = 1;
		var type = 'nomal';
		var tag = '';
		var total = 5;

		$(document).on('mouseenter', '.mainlist', function(e) {
			e.stopImmediatePropagation();
			$(this).css('background', '#8080801a');
		});

		$(document).on('mouseleave', '.mainlist', function(e) {
			e.stopImmediatePropagation();
			$(this).css('background', '0');
		});
		$(document).on('click', '.detail', function(e) {
			e.stopImmediatePropagation();
			var no = $(this).attr('data-id')
			$(location).attr('href','/oxo/ineatlist/info.eat?ml_no='+no);
		});
		$(".loginpls").click(function(){
			alert('로그인 후 처리하세요');
		});
		
		$(".list_ajax").click(function(e) {
			e.preventDefault();
			var tid = $(this).attr('id');
			var tclass = $(this).attr('class');
			if (tclass.match('tag')) {
				$('#listbox').children('div').remove();
				tag = tid;
				rno = 1;
			} else if (tclass.match('type')) {
				$('#listbox').children('div').remove();
				type = tid;
				rno = 1;
			} else if (tclass.match('more')) {
				rno += 5;
			}
			/* 더보기 ajax asdasdasd */
			$.ajax({
				url : "/oxo/ineatlist/morelist.eat",
				type : "post",
				dataType : "json",
				data : {
					rno : rno,
					ml_type : type,
					ml_tag : tag
				},
				success : function(data) {
					var length = data.length;
					$('.more').css('display', 'block');
					if (length < 5) {
						$('.more').css('display', 'none');
					}
					for (var i = 0; i < length; i++) {
						var resultlist = '';
						resultlist += '<div class="d-flex mainlist pr-4">';
						resultlist += '<h1 style="display: inline-block; margin-right: 10px;">'+data[i].rno+'.</h1>';
						resultlist += '<div class="imgbox detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<img src="/oxo/mainlist/'+data[i].ml_title +'1.jpg">';
						resultlist += '</div>';
						resultlist += '<div class="text_box">';
						resultlist += '<div style="position:absolute;">';
						resultlist += '버튼이미지';
						resultlist += '</div>';
						resultlist += '<ul>';
						resultlist += '<li>';
						resultlist += '<h1 class="d-inline-block m-0 detail" data-id="'+data[i].ml_no +'">'+data[i].ml_title +'</h1>';
						resultlist += '<h1 class="d-inline-block m-0 ml-2 text-success">4.5</h1>';
						resultlist += '</li>';
						resultlist += '<li>';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted">'+data[i].ml_newaddr+'</small>';
						resultlist += '</h4>';
						resultlist += '</li>';
						resultlist += '<li class="d-flex mb-2">';
						resultlist += '<div>';
						resultlist += '<div class="pimgbox mr-2">';
						resultlist += '<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s" alt="avt" class="pic">';
						resultlist += '</div>';
						resultlist += '</div>';
						resultlist += '<div>';
						resultlist += '<b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의';
						resultlist += '이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.';
						resultlist += '인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의';
						resultlist += '이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.';
						resultlist += '</div>';
						resultlist += '</li>';
						resultlist += '<li class="d-flex mb-2">';
						resultlist += '<div>';
						resultlist += '<div class="pimgbox mr-2">';
						resultlist += '<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s" alt="avt" class="pic">';
						resultlist += '</div>';
						resultlist += '</div>';
						resultlist += '<div>';
						resultlist += '<b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의';
						resultlist += '이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.';
						resultlist += '</div>';
						resultlist += '</li>';
						resultlist += '</ul>';
						resultlist += '<div style="position:absolute;" class="detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted"> 자세히 보기 > </small>';
						resultlist += '</h4>';
						resultlist += '</div>';
						resultlist += '</div>';
						resultlist += '</div>';
						$('#listbox').append(resultlist);
					}
					total = $("#listbox").children('div').length;
					$('#total').html(total);
				}
			});
		});
	});
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg fixed-top">
		<a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
			style="margin-left: 30px; width: 100px;"></a>
		<div class="collapse navbar-collapse" id="navbar">

			<form class="form-inline col-9">
				<input class=" form-control col-10 mr-sm-2" type="text"
					placeholder="Search">
				<button class="btn btn-warning" type="submit">Search</button>
			</form>

			<ul class="navbar-nav float-left"
				style="width: 200px; margin-right: 20px;">
				<li class="nav-item"><a class="nav-link" href="#">Story</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
				<li class="nav-item"><a class="nav-link" href="#">List</a></li>
				<li class="nav-item"><img src="/oxo/img/member.png" width="30x"
					style="margin-left: 15px;"
					onclick="document.getElementById('login').style.display='block'">
				</li>
			</ul>
			<div></div>
		</div>
	</nav>

	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div style="width: 900px; margin: 0 auto;" class="pb-5">
				<!-- 태그 버튼들 정렬내용. -->
				<div class="btn-group-toggle d-flex justify-content-between col-12"
					data-toggle="buttons">
					<label class="btn btn-warning btn-lg list_ajax tag" id="한식">
						<input type="radio" name="options" id="option1" autocomplete="off">
						#한식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="중식">
						<input type="radio" name="options" id="option2" autocomplete="off">
						#중식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="양식">
						<input type="radio" name="options" id="option3" autocomplete="off">
						#양식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="일식">
						<input type="radio" name="options" id="option4" autocomplete="off">
						#일식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="회식">
						<input type="radio" name="options" id="option5" autocomplete="off">
						#회식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="카페">
						<input type="radio" name="options" id="option6" autocomplete="off">
						#카페
					</label>
				</div>

				<div class="listtop">
					<div>
						<em id="total">${TOTAL }</em>개<span id="common">(${type }순)</span>
					</div>
					<div class="list_row d-flex">
						<div class="lr">
							<a href="#" class="list_ajax type" id="count">조회순</a>
						</div>
						<div class="lr">
							<a href="#" class="list_ajax type" id="review">리뷰순</a>
						</div>
						<div class="lr">
							<a href="#" class="list_ajax type" id="like">좋아요순</a>
						</div>
					</div>
				</div>

				<!-- 리스트 컬럼 -->
				<div id="listbox">
				
					<c:forEach var="data" items="${LIST }" varStatus="sts">
						<div class="d-flex mainlist pr-4">
							<!-- 넘버 -->
							<h1 style="display: inline-block; margin-right: 10px;">${sts.count}.</h1>

							<!-- 이미지박스 -->
							<div class="imgbox detail" data-id="${data.ml_no }">
								<img src="/oxo/mainlist/${data.ml_title}1.jpg">
							</div>
							<!-- 텍스트박스 -->
							<div class="text_box position-relative">
							
								<c:if test="${empty SID }">
								<div class="favorite loginpls position-absolute">
									<img src="/oxo/img/favorite2.png" style="width: 100%;">
								</div>
								</c:if>
								
								<c:if test="${not empty SID }">
								<div class="favorite position-absolute">
									<img src="/oxo/img/favorite2.png" style="width: 100%;">
									<img src="/oxo/img/favorite.png" style="width: 100%; display: none">
								</div>
								</c:if>
								
								<ul>
									<li>
										<h1 class="d-inline-block m-0 detail" data-id="${data.ml_no }">${data.ml_title }</h1>
										<h1 class="d-inline-block m-0 ml-2 text-success">4.5</h1>
									</li>
									<li>
										<h4>
											<small class="text-muted ">${data.ml_newaddr }</small>
										</h4>
									</li>
									<li class="d-flex mb-2">
										<div>
											<div class="pimgbox mr-2">
												<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s" alt="avt" class="pic">
											</div>
										</div>
										<div>
											<b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의
											이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.
											인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의
											이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.
										</div>
									</li>
									<li class="d-flex mb-2">
										<div>
											<div class="pimgbox mr-2">
												<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQujpgIXc66CXx_lyy0TjzC2S26aKxpel6Yl_-qBrg3e06yfhKDyQ&s" alt="avt" class="pic">
											</div>
										</div>
										<div>
											<b>유저 id</b> 인류의 긴지라 설산에서 넣는 힘있다. 목숨이 보이는 인간에 그와 인생을 황금시대의
											이것이다. 어디 이것이야말로 힘차게 싹이 아니다. 실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.
										</div>
									</li>
								</ul>
								<div style="position:absolute;" class="detail" data-id="${data.ml_no }">
									<h4>
										<small class="text-muted">자세히 보기 > </small>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>


				<!-- 페이징처리  -->
				<div class="text-center page_box more list_ajax" id="more">
					<button class="btn btn-warning">더보기</button>
				</div>

			</div>
		</div>
	</div>
</body>

</html>