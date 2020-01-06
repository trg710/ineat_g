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
<link rel="stylesheet" href="/oxo/css/nav.css">

<script type="text/javascript" src="/oxo/js/jquery.min.js" ></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxos/js/popper.min.js"></script>

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
    
   
	#filter{
		float:right;
	}
</style>


<script type="text/javascript">
$(function(){
		var listno = 5;
		var body = '${SCH.contents}';
		$(window).scroll(function() { 
			if ($(window).scrollTop() == $(document).height() - $(window).height())
			{ 
				$.ajax({
					url:"/oxo/moreResult.eat",
					type: "post",
					dataType:"json",
					data:{
						num : listno,
						contents:body
					},
					success: function(data){
					
						$(data).each(function(){
							var resultlist = '';
							listno += 1;
							
							console.log(listno);
							
							resultlist +='<div class="d-flex mainlist" data-id="'+this.ml_no+'">';
							resultlist +='<h2 style="display: inline-block; margin-right:10px;">'+listno+'.</h2>';
							resultlist +='<div class="imgbox">';
							resultlist +='<img src="/oxo/mainlist/'+this.ml_title+'1.jpg">';
							resultlist +='</div>';
							resultlist +='<div class="text_box">';
							resultlist +='<div> 버튼이미지 </div>';
							resultlist +='<ul>';
							resultlist +='<li>';
							resultlist +='<h2 class="d-inline-block">'+this.ml_title+'</h2>';
							resultlist +='<h2 class="d-inline-block"> <span>4.5</span>';
							resultlist +='</h2>';
							resultlist +='</li>';
							resultlist +='<li>';
							resultlist +=''+this.ml_newaddr+'';
							resultlist +='</li>';
							resultlist +='<li>';
							resultlist +='실현에 그들의 있는 인도하겠다는 것은 구하지 것이다.'; 
							resultlist +='</li>';
							resultlist +='<li>';
							resultlist +='이것이야말로 힘차게 싹이 아니다.';
							resultlist +='</li>';
							resultlist +='</ul>';
							resultlist +='<div> 자세히 보기 > </div>';
							resultlist +='</div>';
							resultlist +='</div>';
			                $('#listbox').append(resultlist);
						
						
						});
						}
					});
			}
			
		}); 
		
	
});
</script>
<script>
	$("#lr").click(function() {
		var str = (this).val();
	});
</script>
</head>

<body>
   <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
      <a class="navbar-brand" href="#"><img src="img/logo.png"
         style="margin-left: 30px; width: 100px;"></a>
         <script type="text/javascript">
         $(function() {
            //네비바 로고 클릭 시 메인화면으로 이동
            $('.navbar-brand').click(function() {
               $(location).attr('href', '/oxo/main.eat');
            });
         });
         </script>
      <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

      <div class="collapse navbar-collapse" id="navbar">
         <form class="form-inline col-9" action="/oxo/searchProc.eat" method="POST">
                <input class=" form-control col-10 mr-sm-2" type="text" placeholder="Search" name="contents">
                <button class="btn btn-warning" type="submit">Search</button>
           </form>
         <ul class="navbar-nav float-left"
            style="width: 200px; margin-right: 20px;">
            <li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
            <li class="nav-item"><a class="nav-link" href="#">List</a></li>
            <li class="nav-item"><img src="img/member.png" width="30x"
               style="margin-left: 15px;">
               <ul class="navbar-nav">
                  <c:if test="${empty SID}">
                  <li class="nav-item" id="loginbtn"><a class="nav-link" href="#">로그인</a></li>
                  <li class="nav-item" id="joinbtn"><a class="nav-link" href="#">회원가입</a></li>
                  </c:if>
                  <c:if test="${not empty SID}">
                     <li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
                     <li class="nav-item"><a class="nav-link" href="#" id="memInfo">회원정보보기</a></li>
                  </c:if>
               </ul></li>
         </ul>
      </div>
   </nav>
   <!--네비게이션바-->

    <div class="container" style="margin-top: 100px;">
    	
    	<img src="/oxo/img/filter.png" class="btn" style="width:100px;" id="filter"
    	onclick="document.getElementById('filterModal').style.display='block'"/>
    	
        <div class="row">
            <div style="width: 900px; margin: 0 auto; "class="pb-5">

                <!-- 태그 버튼들 정렬내용. -->
                <div class="btn-group-toggle d-flex justify-content-between col-12" data-toggle="buttons">
                    <label class="btn btn-primary btn-lg btn-block">
                        <input type="radio" name="options" id="option1" autocomplete="off"> 맛집리스트
                    </label>
                    <label  class="btn btn-default btn-lg btn-block">
                        <input type="radio" name="options" id="option2" autocomplete="off"> 스토리보드
                    </label>
                   
                </div>
				<!-- end 버튼  -->
                <div class="listtop"> 
                <div class="list_row d-flex"></div>
                </div>
				
                <!-- 리스트 컬럼 -->
                <div id = "listbox2">
	                <c:forEach var="data" items="${LIST2 }" varStatus="sts">
		                <div class="d-flex mainlist" data-id="${data.ml_no }">
		                	
		                    <!-- 넘버 -->
		                    <h2 style="display: inline-block; margin-right:10px;">${sts.count}.</h2>
		
		                    <!-- 이미지박스 -->
		                    <div class="imgbox">
		                        <!-- <img src="http://starpizza.co.kr/data/goodsImages/GOODS1_1525318753.jpg"> -->
		                        <img src="/oxo/mainlist/${data.ml_title }1.jpg">
		                    </div>
							
		                    <!-- 텍스트박스 -->
		                    <div class="text_box">
		                        <div> 버튼이미지 </div>
		                        <ul>
		                            <li>
		                                <h2 class="d-inline-block"> ${data.ml_title }</h2>
		                                <h2 class="d-inline-block"> <span>4.5</span>
		                                </h2>
		                            </li>
		                            <li>
		                                ${data.ml_newaddr }
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
	                </c:forEach>
				</div>
				
				<!--  스토리 보드 부분 -->
				<div id = "listbox">
	                <c:forEach var="data" items="${LIST }" varStatus="sts">
		                <div class="d-flex mainlist" data-id="${data.ml_no }">
		                	
		                    <!-- 넘버 -->
		                    <h2 style="display: inline-block; margin-right:10px;">${sts.count}.</h2>
		
		                    <!-- 이미지박스 -->
		                    <div class="imgbox">
		                        <!-- <img src="http://starpizza.co.kr/data/goodsImages/GOODS1_1525318753.jpg"> -->
		                        <img src="/oxo/mainlist/${data.ml_title }1.jpg">
		                    </div>
							
		                    <!-- 텍스트박스 -->
		                    <div class="text_box">
		                        <div> 버튼이미지 </div>
		                        <ul>
		                            <li>
		                                <h2 class="d-inline-block"> ${data.ml_title }</h2>
		                                <h2 class="d-inline-block"> <span>4.5</span>
		                                </h2>
		                            </li>
		                            <li>
		                                ${data.ml_newaddr }
		                            </li>
		                            <li>
		                                <b>유저 id</b> 
		                            </li>
		                            <li>
		                                <b>유저 id</b> 
		                            </li>
		                        </ul>
		                        <div> 자세히 보기 > </div>
		                    </div>
		                </div>
	                </c:forEach>
				</div>
				<!--  end 스토리보드 -->


            </div>
        </div>
	</div>
	
	
	<div id="filterModal" class="w3-modal">
      <div class="w3-modal-content" style="width: 35%">
         <div class="w3-container w3-padding">
            <span id="x" style="margin: 10px 18px 0px 0px;"
               class="w3-button w3-display-topright" onclick="document.getElementById('filterModal').style.display='none'">&times;</span>
          <center>
          <h6 class="display-3">검색 필터</h6>
          <hr>
          
		</center>
      </div>
   </div>
   </div>
</body>
</html>