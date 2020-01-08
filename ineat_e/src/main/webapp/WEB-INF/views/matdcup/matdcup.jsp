<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
	.matheight{
		height:100px;
	}
</style>
<style>
</style>

<body>
	<div class="w3-row w3-bottom">
		<c:forEach var="list" items="${MLIST}">
            <div class="w3-col s6 m4 l1 w3-padding">
                <img src="/oxo/matdcupImg/${list.md_name}.jpg" style="width:100%;" id="${list.md_name}"class="matheight listMd">
            </div>
            	<img id="tt">
		</c:forEach>
    </div>
    
    <script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
	<script type="text/javascript" src="/oxo/js/pscript.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script>
		$(document).ready(function(){
			$('.listMd').click(function(){
				var str = $(this).attr('id');
				alert(str);
			});
		});
	</script>
</body>
</html>