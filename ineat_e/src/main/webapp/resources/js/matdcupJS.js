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
            function setZero(){
                i = 0;
                j = 0;
            }
            //스타트버튼 누르면 매치칸에 사진두개 넣기
            function startSet() {
                var player1 = match8.eq(i).attr('src');
                var player2 = match8.eq(i + 1).attr('src');
                $('.match img').eq(0).attr('src', player1);
                $('.match img').eq(1).attr('src', player2);
            };

            //4강
            function startFour() {
                var Fplayer1 = match4.eq(i).attr('src');
                var Fplayer2 = match4.eq(i + 1).attr('src');
                $('.match img').eq(0).attr('src', Fplayer1);
                $('.match img').eq(1).attr('src', Fplayer2);
            }
            
            //결승
            function finalMatch(){
                var finalPlayer1 = match2.eq(i).attr('src');
                var finalPlayer2 = match2.eq(i + 1).attr('src');
                $('.match img').eq(0).attr('src', finalPlayer1);
                $('.match img').eq(1).attr('src', finalPlayer2);
                
            }


            startSet();

            // 이미지 선택하면 승자로 가기
            $('.match img').click(function() {
                var test = $(this).attr('src');
                $('.winner img').eq(j++).attr('src', test);
                addNum();
                startSet();
                
                if (j == 4) {
                    setZero();
                    //alert(i + ' | ' + j);
                    startFour();
                    $('.match img').off().click(function() {
                        var test123 = $(this).attr('src');
                        $('.winner2 img').eq(j++).attr('src', test123);
                        addNum();
                        startFour();
                        if(j== 2){
                            setZero();
                            finalMatch();
                            $('.match img').off().click(function(){
                                var victory = $(this).attr('src');
                               $('#victoryId img').attr('src',victory);
                                $('.modalBack').css('display','none');
                                $('.match').css('display','none');
                                $('body').find('img').siblings(victory).css('opacity','0.6');
                            });
                        }
                    });
                }
            });
        });