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
</script>
<style>
.form-control:focus {
  border:solid orange 2px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 165, 0, 0.4)
}

.btn-w{
    width:100%;
    margin-bottom: 0.5rem;
}

.size{
    font-size: 0.8rem;
    display: inline;
    text-align: center;
}

.w3-button:hover {
    color: #000!important;
    background-color: rgba(253,153,0,0.6)!important;
</style>
</head>
<body>
 <button type="button" class="btn btn-outline-warning "
 onclick="document.getElementById('login').style.display='block'">login</button>
 
 
    <!-- 로그인 모달창 -->
    <div id="login" class="w3-modal">
    <div class="w3-modal-content" style="width:35%">
      <div class="w3-container w3-padding" >
        <span onclick="document.getElementById('login').style.display='none'" id="x" style ="margin:10px 18px 0px 0px;"class="w3-button w3-display-topright">&times;</span>
        <!-- 로그인 모달 실제코드 -->
           
         <div style="border: solid orange 2px;">
        <div>
            <div style="text-align: center;">
            <img src="/img/logo.png" width="50%" style="align-content: center; padding-top: 20px;">
            </div>
            <div style="padding:20px 20px 0px 20px; margin:20px 20px 20px 20px;">
                <div>
                    <input type="text" class="form-control inputheight " id="id" placeholder="I D"">
                </div>
                <div>
                    <input type="password" class="form-control inputheight " style="margin-top: 10px;" id="password" placeholder="Password"">
                </div>
                <div>
                    <br>
                    <button type="submit" class="btn btn-warning btn-w">Login</button>
                </div>
                <div style="display: inline-block; margin:0px;" class="row col-md-12">
                    <div class="size col-md-4 " style="float: left;">
                            <p class="text-warning size"><b>회원가입</b></p>
                    </div>
                    <div class="size col-md-4" style="float: left;">
                        <p class="text-warning size"><b>아이디찾기</b></p>
                    </div>
                    <div class="size col-md-4" style="float: right;">
                        <p class="text-warning size"><b>비밀번호찾기</b></p>
                    </div>
                </div>
                <p></p>
                <p class="text-muted text-center pt-1">Copyright © INEAT Corp. All Rights Reserved.</p>
            </div>
        </div>
    </div>
    </div>
        <!-- 로그인 모달 실제코드 여기까지 -->
      </div>
    </div>
    
</body>
</html>