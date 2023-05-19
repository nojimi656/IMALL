
// header 
var prevScrollpos = window.pageYOffset;

window.onscroll = function () {
    var currentScrollpos = window.pageYOffset;

    if (prevScrollpos > currentScrollpos) {
        document.getElementById("high").style.top = "0";
    } else {
        document.getElementById("high").style.top = "-90px";
    }
    prevScrollpos = currentScrollpos;
}




$(document).ready(function(){


  // nav 열기, 닫기
  $('#gnbOpen').on('click', function(){
    $('#gnb').animate({"left":"0"}, 300);
    $('.search-container').fadeOut();
  });
  $('#gnbCLose').on('click', function(){
    $('#gnb').animate({"left":"-100%"}, 300);
  });



  // nav gnb 열기, 닫기
  $('#gnb .gnb-1> li').on('click', function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $(this).find('ul.snb').slideUp(300);
    } else {
      $(this).addClass('active');
      $(this).find('ul.snb').slideDown(300);
      $(this).siblings().removeClass('active');
      $(this).siblings().find('ul.snb').slideUp(300);
    }
  });



  // 검색창 
  $('#search-btn').on('click', function(){
    $('.search-container').fadeIn();
    $('#gnb').animate({"left":"-100%"}, 300);
  });
  $('#searchClose').on('click', function(){
    $('.search-container').fadeOut();
  });



  // 반응형 해상도 변경시 새로고침
  // jQuery(function($) {

  //   window.onresize = function(){
  //     document.location.reload();
  //   };

  // });



  // pop-up 
  $('#popClose').on('click', function(){
    $('.pop-up').fadeOut();

    if($("#todaycloseyn").prop("checked")) {
      console.log("todaycloseyn value : " + todaycloseyn);
      setCookie('divpop1', 'Y' , 1 );
    }
  });
 
  
  if(getCookie("divpop1") == "Y"){
        $("#divpop1").hide();
      $('.pop-up').hide();
  }

  //쿠키설정    
  function setCookie( name, value, expiredays ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
    }

  //쿠키 불러오기
  function getCookie(name) { 
      var obj = name + "="; 
      var x = 0; 
      while ( x <= document.cookie.length ) 
      { 
          var y = (x+obj.length); 
          if ( document.cookie.substring( x, y ) == obj ) 
          { 
              if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                  endOfCookie = document.cookie.length;
              return unescape( document.cookie.substring( y, endOfCookie ) ); 
          } 
          x = document.cookie.indexOf( " ", x ) + 1; 
          
          if ( x == 0 ) break; 
      } 
      return ""; 
  }




});



// top으로 이동
const toTopEl = document.querySelector('#to-top');

window.addEventListener('scroll', _.throttle(function () {
  console.log(window.scrollY);
  if (window.scrollY > 500) {
    gsap.to(toTopEl, .2, {
      x: 0
    });
  } else {
    gsap.to(toTopEl, .2, {
      x: 100
    });
  }
}, 700));


toTopEl.addEventListener('click', function () {
  gsap.to(window, .7, {
    scrollTo: 0
  });
});



// AOS.js
AOS.init();
