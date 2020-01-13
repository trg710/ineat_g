$(document).ready(function() {
   var match8 = $('#8gang img');
   var match4 = $('#4gang img');
   var match2 = $('#2gang img');
   var match111 = $('.match  img');
   var winner = $('.winner img');
   var i = 0;
   var j = 0;

   function addNum() {
      i += 2;
   }
   function setZero() {
      i = 0;
      j = 0;
   }

   // 스타트버튼 누르면 매치칸에 사진두개 넣기
   function start8gang() {
      var player1 = match8.eq(i).attr('src');
      var player1Id = match8.eq(i).attr('id');
      var player2 = match8.eq(i + 1).attr('src');
      var player2Id = match8.eq(i + 1).attr('id');
      $('.match img').eq(0).attr({
         src : player1,
         id : player1Id
      });
      $('.match img').eq(1).attr({
         src : player2,
         id : player2Id
      });

   }
   

   // 4강
   function startFour() {
      var Fplayer1 = match4.eq(i).attr('src');
      var Fplayer1Id = match4.eq(i).attr('id');
      var Fplayer2 = match4.eq(i + 1).attr('src');
      var Fplayer2Id = match4.eq(i + 1).attr('id');
      $('.match img').eq(0).attr({
         src : Fplayer1,
         id : Fplayer1Id
      });
      $('.match img').eq(1).attr({
         src : Fplayer2,
         id : Fplayer2Id
      });
   }

   // 결승
   function finalMatch() {
      var finalPlayer1 = match2.eq(i).attr('src');
      var finalPlayer1Id = match2.eq(i).attr('id');
      var finalPlayer2 = match2.eq(i + 1).attr('src');
      var finalPlayer2Id = match2.eq(i + 1).attr('id');
      $('.match img').eq(0).attr({
         src : finalPlayer1,
         id : finalPlayer1Id
      });
      $('.match img').eq(1).attr({
         src : finalPlayer2,
         id : finalPlayer2Id
      });

   }

   function nGangClassUp(nMatch) {
      $('.nGang').text(nMatch);
      setTimeout(function() {
         $('.nGangClass').animate({
            top : -1000
         }, 800);
      }, 1500);
   }
   function nGangShow(nMatch) {
      $('.nGang').text(nMatch);

      $('.nGangClass').css({
         position : 'absolute',
         top : '50%',
         left : '50%'
      });

   }
   
   $('#match1player').mouseenter(function(){
	   $(this).css('opacity','0.6');
   });
   $('#match1player').mouseleave(function(){
	   $(this).css('opacity','1');
   });
  
   //맛드컵우승자에서 메인으로 가기
/*   $('#goMain').click(function(){
	  $(location).attr('href','/oxo/main.eat');
   });*/
   
/*   $('#goRanking').click(function(){
	  $('.ranking').css({
		  "display" : "block",
		  "z-index" : "1200"
	  });
	   
	  $.ajax({
		  url : "matdcupRanking.eat",
          type : "post",
          dataType : "json",
          success : function(list){
        	  alert(list.length);
          },
          error: function(){
        	alert('통신오류');  
          }
	  });
   });*/
   
   //맛드컵 시작하기 클릭
   $('#start').click(function() {
      $('.nGangClass').css('display', 'block');
      var eight = '8강';
      nGangClassUp(eight);
      $('.startBtn').css('display', 'none');
      //$('.matdcupBack').css('display', 'none');
      $('.modalBack').css('display', 'block');
      $('.match').css('display', 'block');
   });


   start8gang();
   
   
   // 이미지 선택하면 승자로 가기
   $('.match img').click(function() {

      var test = $(this).attr('src');
      var testId = $(this).attr('id');

      $('.winner img').eq(j++).attr({
         src : test,
         id : testId
      });
      
      console.log(testId);
      addNum();
      start8gang();
      
      if (j == 4) {
         var four = '4강';
         setZero();
         nGangShow(four);
         nGangClassUp(four);
         // alert(i + ' | ' + j);
         startFour();
        
         //4강 이미지 선택	//off추가하기
         $('.match img').off().click(function() {
            var test123 = $(this).attr('src');
            var test123Id = $(this).attr('id');
            $('.winner2 img').eq(j++).attr({
               src : test123,
               id : test123Id
            });
            console.log(test123Id);
            addNum();
            startFour();

            // 결승
            if (j == 2) {
               setZero();
               var finalMatchText= 'FINAL';
               nGangShow(finalMatchText);
               nGangClassUp(finalMatchText);
            
               finalMatch();
               // 우승자 선택
               $('.match img').off().click(function() {
            	   $('.vsClass > span').text('WINNER!');
            	   $('.vsClass').css('width','400px');
            	   $('.btnMatch').css('display','block');
                  var victory = $(this).attr('src');
                  var victoryId = $(this).attr('id');
                  var thisId = $(this);
                  
                  var goSearchText = '\'' + victoryId + '\''+ '검색하기';
                  $('#goSearch').text(goSearchText);//서치버튼에 우승자 이름 추가하기
                  
                  $('.match').find('img').not(thisId).css('display', 'none');
                  //우승자 아닌 이미지 없애기
                  $('.match').css('width','600px');
                  //$('.match img').css('opacity','1');

                  console.log(victoryId);
                  $('#victoryId img').attr({
                     src : victory,
                     id : victoryId
                  });
                  $('.modalBack').css('display', 'none');

                  var winName = $('#victoryId img').eq(0).attr('id');

                  $.ajax({
                     url : "matdcupWin.eat",
                     type : "post",
                     dataType : "json",
                     data : {
                        "winName" : winName
                     },
                     success : function(cnt) {
                        if (cnt == 1) {
                           $('.match img').off('click');
                        } else {
                           alert(cnt);
                        }
                     },
                     error : function() {
                        alert('통신에러');
                     }
                  });

                  // 나눔 줄
               });
            }
         });
      }
   });
});