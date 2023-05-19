<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<html lang="ko">


<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ITWILL MALL</title>
  <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="<%=cp%>/imal/data/main.css" />
  <link rel="stylesheet" href="<%=cp%>/imal/data//media.css" />
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- GSAP & ScrollToPlugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js" integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js" integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- SWIPER -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
  <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  <!-- ScrollMagic -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- AOS.js -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script defer src="<%=cp%>/imal/data/main.js"></script>
</head>


<body>
  
  <header id="high">

    <div class="inner">
      <a href="javascript:void(0)" id="gnbOpen"><img src="https://casa.co.kr/images/common/btn_m_list.png" alt="내비게이션 열기" /></a>
      <h1>
        <a href="<%=cp%>/imal/main.jsp"/><img src="<%=cp %>/imal/data/logo/imal_logo.png" alt="itwillmall"/></a>
      </h1>
      <ul class="gnb-sub">
        <li id="search-btn"><a href="javascript:void(0)"><img src="<%=cp %>/imal/data/image_main/btn_top_search.png" alt="상품검색" /></a></li>
        <li><a href="javascript:void(0)"><img src="<%=cp %>/imal/data/image_main/btn_top_login.png" alt="로그인" /></a></li>
        <li><a href="javascript:void(0)"><img src="<%=cp %>/imal/data/image_main/btn_top_order.png" alt="장바구니" /><em>0</em></a></li>
      </ul>
    </div>

    <nav>
      <div id="gnb">
        <div class="inner">
          <ul>
            <li><a href="javascript:void(0)" id="gnbCLose"><span class="ico_bg"></span><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="내비게이션 닫기" /></a></li>
            <li class="mobile-only"><a href="javascript:void(0)"><img src="https://casa.co.kr/images/common/logo_new.gif" alt="casaliving" /></a></li>
            <li class="mobile-only"><a href="javascript:void(0)"><span class="ico_bg"></span><img src="https://casa.co.kr/images/common/btn_top_login.png" alt="로그인" class="mobile-only"/></a></li>
          </ul>
          <ul>
            <li><a class="hash-btn" href="javascript:void(0)">&#35; BEST</a></li>
            <li><a class="hash-btn" href="javascript:void(0)">&#35; NEW</a></li>
          </ul>
          <div>
            <ul class="gnb-1">
              <li>
                <h3 class="menu">CLOTHS</h3>
                <ul class="snb">
                  <li><a href="javascript:void(0)">자켓</a></li>
                  <li><a href="javascript:void(0)">상의</a></li>
                  <li><a href="javascript:void(0)">하의</a></li>
                </ul>
              </li>
              <li>
                <h3 class="menu">BAG</h3>
              </li>
              <li>
                <h3 class="menu">SHOES</h3>
              </li>
              <li>
                <h3 class="menu">ACC</h3>
                <ul class="snb">
                  <li><a href="javascript:void(0)">시계</a></li>
                  <li><a href="javascript:void(0)">지갑</a></li>
                </ul>
              </li>
            </ul>
            <ul class="gnb-2">
              <li><h3 class="menu"><a href="javascript:void(0)">magazine</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">event</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">notice</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">qna</a></h3></li>
            </ul>
            <div class="gnb-image"><a href="javascript:void(0)"><img src="https://casa.co.kr/UploadFiles/Promotion/3/14/16472461415220.jpg" alt="베르판" /></a></div>      
          </div>    
        </div>
      </div>
    </nav>
 <!-- 검색창 -->
    <div class="search-container">
      <div class="search-wrapper">
        <div id="searchClose">
          <img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="검색창 닫기">
        </div>
        <div class="search-zone">
          <input type="search" placeholder="검색어를 입력해주세요" id="input_txt"/>
          <img src="https://casa.co.kr/images/common/btn_top_search.png" alt="검색" />
        </div>
        <span class="sub-tit">추천 검색어</span>
        <ul class="keyword-zone">
          <li><a href="javascript:void(0)" class="keyword">&#35;겨울</a></li>
          <li><a href="javascript:void(0)" class="keyword">&#35;니트</a></li>
          <li><a href="javascript:void(0)" class="keyword">&#35;신발</a></li>
          <li><a href="javascript:void(0)" class="keyword">&#35;패딩</a></li>
          <li><a href="javascript:void(0)" class="keyword">&#35;장갑</a></li>
        </ul>
      </div>
    </div>


  </header>
  
  
  
  <main>
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href="javascript:void(0)">
            <img src="https://www.casa.co.kr/UploadFiles/Brand/8/9/15653280645192.jpg" alt="노몬" />
            <span class="line"></span>
            <div class="main-text">
              <img src="https://www.casa.co.kr/UploadFiles/Brand/8/9/15653280645030.png" alt="노몬" />
              <span class="main-tit">시간을 표현하는 가구</span>
              <button class="primary">Shop now</button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="javascript:void(0)">
            <img src="https://www.casa.co.kr/UploadFiles/Brand/11/5/16045319127942.png" alt="폰타나 아르떼" />
            <span class="line"></span>
            <div class="main-text">
              <img src="https://www.casa.co.kr/UploadFiles/Brand/11/5/16045318275150.png" alt="폰타나 아르떼" />
              <span class="main-tit">시대를 초원하는 유리와 빛</span>
              <button class="primary">Shop now</button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="javascript:void(0)">
            <img src="https://www.casa.co.kr/UploadFiles/Brand/8/24/16297889079682.jpg" alt="킨토" />
            <span class="line"></span>
            <div class="main-text">
              <img src="https://www.casa.co.kr/UploadFiles/Brand/8/24/16297832614840.png" alt="킨토" />
              <span class="main-tit">건강한 식탁에서 시작되는 하루</span>
              <button class="primary">Shop now</button>
            </div>
          </a>
        </div>
      </div>
      <div class="swiper-pagination"></div>
      <div class="slide-play">
        <span class="material-symbols-outlined" id="play-btn" style="fill: 1;">play_arrow</span>
        <span class="material-symbols-outlined" id="stop-btn">pause</span>
      </div>
    </div>
  </main>

  <script>
    var mainSwiper1 = new Swiper('main .swiper-container', {
      effect: 'fade',
      slidesPerView: 1,
      speed: 3000,
      loop: true,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
      pagination: {
        el: "main .swiper-pagination",
        clickable: true,
      },
    });

    $(document).ready(function(){
      $('#play-btn').on('click', function () {
        mainSwiper1.autoplay.start();
        return false;
      });

      $('#stop-btn').on('click', function () {
        mainSwiper1.autoplay.stop();
        return false;
      });
    });
  </script>

  

<!-- 하단 -->
  <div class="links">
    <ul>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/instaLogo.png" alt="인스타그램" /></a></li>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/youtubeLogo.png" alt="유튜브" /></a></li>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/kakaoChannelLogo.png" alt="카카오톡채널" /></a></li>
    </ul>
  </div>

  <footer>

    <div class="inner">
      <ul class="fnb">
        <li><a href="javascript:void(0)">아이몰 소개</a></li>
        <li><a href="javascript:void(0)">개인정보취급방침</a></li>
        <li><a href="javascript:void(0)">이용약관</a></li>
      </ul>
      <div>
        <ul class="low">
          <li><a href="javascript:void(0)">(주)아이몰</a></li>
          <li><a href="javascript:void(0)">대표자 : 강민성, 권지은, 박진혁, 양설희, 홍지혁</a></li>
          <li><a href="javascript:void(0)">개인정보책임자 : cs@imal.co.kr</a></li>
          <li><a href="javascript:void(0)">사업자번호 : 111-22-33333</a></li>
          <li><a href="javascript:void(0)">통신판매업신고 제2001-서울서초-00591호</a></li>
          <li><a href="javascript:void(0)">사업자정보확인</a></li>
        </ul>
        <ul class="customer">
          <li><strong>CS CENTER</strong></li>
          <li><a href="javascript:void(0)"><strong>1644-0406</strong></a></li>
          <li>09:00~16:30 <strong>MON-FRI</strong></li>
          <li>12:00~13:10 <strong>LUNCH TIME</strong></li>
          <li>WEEKEND / HOLIDAY <strong>OFF</strong></li>
        </ul>
      </div> 
    </div>
  </footer>



  <div id="to-top">
    <span class="material-symbols-outlined">arrow_upward</span>
  </div>



</body>


</html>
  
  
  
  
  