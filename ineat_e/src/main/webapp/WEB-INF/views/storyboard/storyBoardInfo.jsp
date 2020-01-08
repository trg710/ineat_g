<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board info</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap&subset=korean" rel="stylesheet">
<style>
	.kor{
		font-family: "Noto Serif KR", sans-serif;
	}
</style>
<script type="text/javascript">
$(function(){
	$('#toList').click(function(){
		location.href = "/oxo/storyboard/storyBoard.eat";
	});
	
	$('.like').click(function(){
		if('${SID}' == ""){
			alert('로그인 후 이용해 주세요.');
		}else{
			$('#likeForm').submit();	
		};
	});
	
	$('.hate').click(function(){
		if('${SID}' == ""){
			alert('로그인 후 이용해 주세요.');
		}else{
			$('#hateForm').submit();
		};
	});
	
	$('#delete').click(function(){
		$('#deleteForm').submit();
	});
	
	// 게시물 상세 보기
	$('#toEdit').click(function(){
		var aid = '${SID}';
		var abno = '${DATA.bno}';
		$.ajax({
			url		: "/oxo/storyboard/sbViewDetail.eat",
			type	: "post",
			dataType: "json",
			data	: {
				mid : aid,
				bno : abno
			},
			success : function(data){
				$('#bno').html(data.bno);
				$('#mid').html(data.mid);
				$('#title').html(data.title);
				$('#content').html(data.content);
				
				$('#bno2').html(data.bno);
				$('#mid2').html(data.mid);
				$('#title2').val(data.title);
				$('#content2').val(data.content);
			},
			error : function(){
				alert('회원 정보 요청에 실패했습니다.');
			}
		});
	});
	
	// 게시물 수정 처리
	
	$('#edit').click(function(){
		// 할 일
		// 데이터 읽어오고
		var title1 = $('#title').text();
		var title2 = $('#title2').val();
		var content1 = $('#content').text();
		var content2 = $('#content2').val();
		var bno = $('#bno').text();
		
		
		if(title1 == title2 && content1 == content2){
			alert("수정 내용이 없습니다.")
			return;
		}
		
		$.ajax({
			url		: "/oxo/storyboard/sbInfoEdit.eat",
			type	: "post",
			dataType: "json",
			data	: {
				title : title2,
				content : content2,
				bno  : bno
			
			},
			
			success : function(data){
				
				if(data.cnt == 1){
					
					location.href="/oxo/storyboard/storyBoard.eat";
					alert('정보가 수정 되었습니다.');
				}else{
					alert('정보 수정을 실패했습니다.');
				}
			},
			error : function(){
				alert('서버 오류');
				
			}
		});		
	}); 
	
	// 댓글 등록
	function content(){
		var content = $('#ccontent').val();
			
		if('${SID}' == ""){
			alert('로그인 후 이용해주세요.');
			return;
		}else if(!content){
			alert('내용을 입력해주세요.');
			return;
		};
		$('#form1').submit();
	}
	$('#register').click(content);
	
	// 댓글 수정 처리
	$('.toCmtEdit').click(function(){
		var cno = $(this).attr('id');
		
		$.ajax({
			url		: "/oxo/storyboard/sbCmtView.eat",
			type	: "post",
			dataType: "json",
			data	: {
				cno : cno
			},
			success : function(data){
				$('#cno').html(data.cno);
				$('#cmid').html(data.mid);
				$('#ccontent').html(data.ccontent);
				
				$('#cno2').html(data.cno);
				$('#cmid2').html(data.mid);
				$('#ccontent2').val(data.ccontent);
				
			},
			error : function(){
				alert('회원 정보 요청에 실패했습니다.');
			}
		});
	});

	// 댓글 수정 처리
	$('#cmtEdit').click(function(){
		// 할 일
		// 데이터 읽어오고
		var content1 = $('#ccontent').text();
		var content2 = $('#ccontent2').val();
		var cno = $('#cno').text();
		
		
		if(content1 == content2){
			alert("수정 내용이 없습니다.")
			return;
		}
		
		$.ajax({
			url		: "/oxo/storyboard/sbCmtEdit.eat",
			type	: "post",
			dataType: "json",
			data	: {
				content : content2,
				cno  : cno
			
			},
			
			success : function(data){
				
				if(data.cnt == 1){
					alert('정보가 수정 되었습니다.');
					$('#bnoInfo').submit();
				}else{
					alert('정보 수정을 실패했습니다.');
				}
			},
			error : function(){
				alert('서버 오류');
				
			}
		});		
	});
	
	// 댓글 삭제
	$('.cmtDelete').click(function(){
		var cno = $(this).attr('id');
		alert(cno);
		$('#ccno').val(cno);
				
		$('#deleteForm2').submit();
	});
	
});
</script>
</head>
<body>
<div style="display:none">
	<form method="post" action="/oxo/storyboard/sbLike.eat" id="likeForm">
		sid:<input type="text" name="mid" value="${SID }" />
		sbno:<input type="number" name="bno" value="${DATA.bno  }" />
		isshow:<input type="text" name="isshow" value="Y" />
	</form>
	
	<form method="post" action="/oxo/storyboard/sbHate.eat" id="hateForm">
		sid:<input type="text" name="mid" value="${SID }" />
		sbno:<input type="number" name="bno" value="${DATA.bno }" />
		isshow:<input type="text" name="isshow" value="N" />
	</form>
	
	<form method="post" action="/oxo/storyboard/sbDelete.eat" id="deleteForm">
		sid:<input type="text" name="mid" value="${SID }" />
		sbno:<input type="text" name="bno" value="${DATA.bno }" />
	</form>
	
	<form method="post" action="/oxo/storyboard/sbCmtOneDelete.eat" id="deleteForm2">
		cno:<input type="text" id="ccno" name="cno"/>
		sbno:<input type="number" name="bno" value="${DATA.bno }" />
	</form>
	
	<form method="post" action="/oxo/storyboard/storyBoardInfo.eat" id="bnoInfo">
		sbno:<input type="number" name="bno" value="${DATA.bno }" />
	</form>
</div>
				
	<div class="container-fluid">
		<div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-8 text-primary font-italic"><h1>My story in inEat Story</h1></div>
	    </div>
	    <div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-3 border-bottom kor" style="font-size: 17px">${DATA.title }</div>
	        <div class="col-md-1 border-bottom"></div>
	        <div class="col-md-1 border-bottom kor">조회수:${DATA.views }</div>
	        <div class="col-md-1 border-bottom kor">작성자:${DATA.mid }</div>
	        <div class="col-md-2 border-bottom kor">작성일:${DATA.sbDate }</div>
	    </div>
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-3 pb-2 border-bottom">
	    		<c:if test="${DATA.saveName == null }">
	    			<img src="/oxo/img/noimage.jpg" width="100%">
	    		</c:if>
	    		<c:if test="${DATA.saveName != null}">
	    			<img src="/oxo/upload/${DATA.saveName }" width="100%">
	    		</c:if>
	    	</div>
	    	<div class="col-md-5 border-bottom pt-3 kor" style="font-size: 17px">${DATA.content }</div>
	    </div>
	    <div class="row mt-2 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-1">
	        	<div class="btn-group" role="group">
		        	<button id="${DATA.bno }" type="button" class="like btn btn-light">
		        		<img src="/oxo/img/like_16px.jpg">${DATA.llike }
		        	</button>
		        	<button id="${DATA.bno }" type="button" class="hate btn btn-light">
		        		<img src="/oxo/img/hate_16px.jpg" class="ml-2">${DATA.hhate }
		        	</button>
	        	</div>
	        </div>
	        <div class="col-md-7"></div>
	    </div>
	    
	    <!-- 댓글 보기 처리 -->
	    <div class="row mt-2">
	    	<c:forEach var="data" items="${LIST }">
		    	<div class="col-md-2"></div>
		    	<div class="col-md-1"></div>
		    	<div class="col-md-5 border-bottom kor">${data.mid }<br><span class="ml-3 kor">${data.ccontent }</span></div>
		    	<div class="col-md-1 border-bottom kor">${data.cDate }</div>
		    	<div class="col-md-2">
		    		<c:if test="${SID == data.mid }">
			    		<div class="btn-group" role="group">
			    			<button type="button" id="${data.cno }" class="btn btn-light toCmtEdit" data-toggle="modal" data-target="#myModal2">수정</button>
			    			<button type="button" id="${data.cno }" class="btn btn-light cmtDelete">삭제</button>
			    		</div>
			    	</c:if>
		    	</div>
		    	<div class="col-md-1"></div>
		    </c:forEach>
	    </div>
	    
	    <div class="row mt-2">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-1"></div>
	    	<div class="col-md-6">
	    		<form id="form1" method="post" action="/oxo/storyboard/sbComment.eat" >
				    <input type="text" id="ccontent" name="content" style="width:100%">
				    <input type="hidden" name="bno" value="${DATA.bno }">
				    <input type="hidden" name="mid" value="${SID}">
				</form>
	    	</div>
	    	<div class="col-md-1"><button type="button" id="register" class="btn btn-light">등록</button></div>
	    </div>
	    <c:if test="${SID == DATA.mid }">
		    <div class="row mt-4">
		    	<div class="col-md-2"></div>
		    	<div class="col-md-8">
		    		<div class="btn-group" role="group">
		    			<button type="button" id="toEdit" class="btn btn-light" data-toggle="modal" data-target="#myModal1">수정하기</button>
		    			<button type="button" id="delete" class="btn btn-light">삭제하기</button>
		    		</div>
		    	</div>
		    </div>
	    </c:if>
	    
	    
	    <!-- 게시물 상세 보기 -->
	    
	    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title text-center" id="exampleModalLabel">inEat Story</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="container-fluid kor">
				    <div class="row" style="display:none">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">글번호</div>
				        <div class="col-md-5"><span id="bno" style="display:none"></span><span id="bno2"></span></div>
				    </div>
				    <div class="row">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">아이디</div>
				        <div class="col-md-5"><span id="mid" style="display:none"></span><span id="mid2"></span></div>
				    </div>
				    <div class="row">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">제목</div>
				        <div class="col-md-5"><span id="title" style="display:none"></span><input type="text" id="title2" name="title2" style="width:100%"></div>
				    </div>
				    <div class="row">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">내용</div>
				        <div class="col-md-5"><span id="content" style="display:none"></span><textarea id="content2" name="content2" cols="150" rows="10" style="width:100%"></textarea></div>
				    </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" id="edit" class="btn btn-primary">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	    <!-- 댓글 상세 보기 -->
	    
	    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title text-center" id="exampleModalLabel">inEat Story</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="container-fluid kor">
				    <div class="row" style="display:none">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">댓글번호</div>
				        <div class="col-md-5"><span id="cno" style="display:none"></span><span id="cno2"></span></div>
				    </div>
				    <div class="row">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">아이디</div>
				        <div class="col-md-5"><span id="cmid" style="display:none"></span><span id="cmid2"></span></div>
				    </div>
				    <div class="row">
				        <div class="col-md-2"></div>
				        <div class="col-md-2">내용</div>
				        <div class="col-md-5"><span id="ccontent" style="display:none"></span><textarea id="ccontent2" name="ccontent2" cols="150" rows="10" style="width:100%"></textarea></div>
				    </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" id="cmtEdit" class="btn btn-primary">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	    
	    
	    <div class="row mt-4 text-center">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8"><button type="button" id="toList" class="btn btn-light">목록으로</button></div>
	    </div>
	</div>
</body>
</html>