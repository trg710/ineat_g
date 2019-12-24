<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/popper.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		$('#pwck').keyup(function(){
		var pw = $('#pw').val();
		var pwck = $('#pwck').val();
		var msg = $('#pwmsg');
		if(pw==pwck){
			msg.html('비밀번호가 일치합니다.').css('color','#fd8f00');
		}
		if(pw!=pwck){
			msg.html('비밀번호가 일치하지 않습니다.').css('color','gray');
		}
		if(pw=="" && pwck==""){
			msg.html("");
		}
		
		});
	});
</script>
</head>
<body>

<body>
    <div class="container">
        <div class="row text-center">
            <div class="col-3"></div>
            <div class="col-6" id="joinbox" style="border: solid orange 8px; padding : 20px; margin:20px;" width="200px" height="500px">
                    <img src="/img/logo.png" width="50%">
                    <div class="id">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>ID</em></h4>
                        <input type="text" class="form-control inputheight " id="id" placeholder="">
                        <div>
                        <h6><span class="float-left" style="font-size: 12px;">아이디 체크</span>
                        <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt">Check</button>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="pw">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Password</em></h4>
                        <input type="password" class="form-control inputheight" id="pw" placeholder="">
                    </div>
                    <br>
                    <div class="pwck">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Password Check</em></h4>
                        <input type="password" class="form-control inputheight" id="pwck" placeholder="">
                        <div>
                        <h6><span class="float-left" style="font-size: 12px;" id="pwmsg"></span>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="nick">
                        <h4 class="text-warning left text-left " style="margin-bottom: 2px;"><em>Nick-name</em></h4>
                        <input type="text" class="form-control inputheight" id="nick" placeholder="">
                        <div>
                        <h6><span class="float-left" style="font-size: 12px;">닉네임 체크</span>
                        <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt">Check</button>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="tel">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Tel</em></h4>
                            <input type="text" class="form-control inputheight" id="tel" placeholder="">
                            <div>
                            <h6><span class="float-left" style="font-size: 12px;">전화번호 체크</span>
                            <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt">Check</button>
                            </h6>
                            </div>
                     </div>
                     <br>
                    <div class="email">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>E-mail</em></h4>
                            <input type="text" class="form-control inputheight" id="email" placeholder="">
                            <div>
                            <h6><span class="float-left" style="font-size: 12px;">이메일 체크</span>
                            <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt">Check</button>
                            </h6>
                            </div>
                     </div>
                     <br>
                    <div class="birth">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Birthday</em></h4>
                            <input type="text" class="form-control col-5 d-inline inputheight" id="birth1" placeholder="">
                            <input type="text" class="form-control col-3 d-inline inputheight" id="birth2" placeholder="">
                            <input type="text" class="form-control col-3 d-inline inputheight" id="birth3" placeholder="">
                     </div>
                    <br>
                    <div>
                        <button type="button" class="btn btn-warning">Join</button>
                        <button type="button" class="btn btn-secondary">Cancel</button>
                    </div>
            </div>
        </div>
    </div>

</body>

</body>
</html>