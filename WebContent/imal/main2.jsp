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
  <title>IMAL</title>
  <link rel="icon" type="image/x-icon" href="<%=cp%>/imal/data/logo/itmal.png" />
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
        <a href="<%=cp%>/itmall/main.do"/><img src="<%=cp %>/imal/data/logo/imal_logo.png" alt="itwillmall"/></a>
      </h1>
      <ul class="gnb-sub">
        <li id="search-btn"><a href="javascript:void(0)"><img src="<%=cp %>/imal/data/image_main/btn_top_search.png" alt="상품검색" /></a></li>
        <li style="margin-right: 15px;">
        
	        <c:choose>
	        
		        <c:when test="${empty sessionScope.customInfo.userId }">
			        <a href="<%=cp%>/itmall/login.do">
			        	<img src="<%=cp %>/imal/data/image_main/btn_top_loginkey.png" alt="로그인" />
			        </a>
		        </c:when>
		        
		        <c:otherwise>
		        
			        <a href="<%=cp%>/itmall/updated.do">
			        	<img src="<%=cp %>/imal/data/image_main/btn_top_login.png" alt="회원정보수정" />
			        </a>
		        	
		        	<!-- 로그아웃사진 -->
				       <li id="search-btn" style="margin-right: 15px;"> 
					       <a href="<%=cp%>/itmall/logout.do">
					       <img src="<%=cp %>/imal/data/image_main/btn_top_logout.png" alt="로그아웃" />
					       </a>
				       </li>
		        	
		        </c:otherwise>
		        
	        </c:choose>
        
        </li>
        <li><a href="javascript:location.href='<%=cp%>/itmall/mybag.do'"><img src="<%=cp %>/imal/data/image_main/btn_top_order.png" alt="장바구니" /><em>0</em></a></li>
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
                <h3 class="menu">CLOTHES</h3>
                <ul class="snb">
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=jacket">자켓</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=top">상의</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=bottom">하의</a></li>
                </ul>
              </li>
              <li>
                <h3 class="menu"><a href="<%=cp%>/itmall/goodslist.do?cate=bag">BAG</a></h3>
              </li>
              <li>
                <h3 class="menu"><a href="<%=cp%>/itmall/goodslist.do?cate=shoes">SHOES</a></h3>
              </li>
              <li>
                <h3 class="menu">ACC</h3>
                <ul class="snb">
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=watch">시계</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=cap">모자</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=socks">양말</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=wallet">지갑</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=belt">벨트</a></li>
                </ul>
              </li>
            </ul>
            
            <ul class="gnb-2">
              <li><h3 class="menu"><a href="javascript:void(0)">magazine</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">event</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">notice</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">qna</a></h3></li>
            </ul>
            <div class="gnb-image"><a href="javascript:void(0)"><img src="<%=cp%>/imal/data/image_main/wooyoungmi.jpg" alt="베르판" /></a></div>      
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
            <img src="<%=cp%>/imal/data/image_main/chanel_1.jpg" alt="샤넬" />
            <span class="line"></span>
            <div class="main-text">
              <img src="<%=cp%>/imal/data/image_main/chanel_logo.png" alt="샤넬" />
              <span class="main-tit"></span>
              <button class="primary">shop now</button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="javascript:void(0)">
            <img src="<%=cp%>/imal/data/image_main/celine_3.jpg" alt="셀린느" />
            <span class="line"></span>
            <div class="main-text">
              <img src="https://www.casa.co.kr/UploadFiles/Brand/11/5/16045318275150.png" alt="셀린느" />
              <span class="main-tit"></span>
              <button class="primary">shop now</button>
            </div>
          </a>
        </div>
        <div class="swiper-slide">
          <a href="javascript:void(0)">
            <img src="<%=cp%>/imal/data/image_main/celine_2.jpg" alt="셀린느" />
            <span class="line"></span>
            <div class="main-text">
              <img src="https://www.casa.co.kr/UploadFiles/Brand/8/24/16297832614840.png" alt="셀린느" />
              <span class="main-tit"></span>
              <button class="primary">shop now</button>
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


  <article class="products" data-aos="fade-up" data-aos-offset="300" data-aos-easing="ease-in-sine" data-aos-duration="1500">
  <h2>&#35;MD'S PICK</h2>
    <ul class="product-menu">
      <li class="on"><h4 class="menu">CLOTHES</h4></li>
      <li><h4 class="menu">BAG</h4></li>
      <li><h4 class="menu">SHOES</h4></li>
      <li><h4 class="menu">ACC</h4></li>
    </ul>
    <div class="product">
      <div class="swiper-container on">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp %>/imal/data/image_main/isabelmarant-c-1_3_1.jpg" alt="MOBILY 로고 스웻셔츠" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              <a href="<%=cp%>/itmall/article.do?goods_num=182"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">ISABEL MARANT</span>
              <span class="prod-name">MOBILY 로고 스웻셔츠</span>
              <span class="prod-price">467,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp %>/imal/data/image_main/maisonkitsune-c-1_1.jpg" alt="Women Chillax Fox Patch Adjusted R-Neck Cardigan" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              <a href="<%=cp%>/itmall/article.do?goods_num=184"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">MAISON KITSUNE</span>
              <span class="prod-name">Women Chillax Fox Patch Adjusted R-Neck Cardigan</span>
              <span class="prod-price">460,750 <del>485,000</del></span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/isabelmarant-c-2_1_1.jpg" alt="MILEY 로고 후드 스웻셔츠" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              <a href="<%=cp%>/itmall/article.do?goods_num=183"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">ISABEL MARANT</span>
              <span class="prod-name">MILEY 로고 후드 스웻셔츠</span>
              <span class="prod-price">490,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/wooyoungmi-c-2_1_1.jpg" alt="블루 레더 패치 니트" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              <a href="<%=cp%>/itmall/article.do?goods_num=185"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">WOOYOUNGMI</span>
              <span class="prod-name">블루 레더 패치 니트</span>
              <span class="prod-price">580,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/patagonia-c-1_1.jpg" alt="Men's Classic Retro-X® Jacket" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">PATAGONIA</span>
              <span class="prod-name">Men's Classic Retro-X® Jacket</span>
              <span class="prod-price">263,200 <del>329,000</del></span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/danton-c-1_1.jpg" alt="Men Inner Down Crewneck Jacket" />
              </a>
              <div class="pic-hover">
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">DANTON</span>
              <span class="prod-name">Men Inner Down Crewneck Jacket</span>
              <span class="prod-price">299,250 <del>315,000</del></span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/andyou-c-1_2.jpg" alt="알파카 블렌드 발마칸 코트" />
              </a>
              <div class="pic-hover">
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">AND YOU</span>
              <span class="prod-name">TRAFALGAR Volume sleeve wool coat (Camel)</span>
              <span class="prod-price">458,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/systemhomme-c-1_2_1.jpg" alt="알파카 블렌드 발마칸 코트" />
              </a>
              <div class="pic-hover">
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">SYSTEM HOMME</span>
              <span class="prod-name">알파카 블렌드 발마칸 코트</span>
              <span class="prod-price">644,000 <del>920,000</del></span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="more-btn">
              <a href="javascript:void(0)">
                <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-plus-empty-128.png" alt="더보기" />
              </a>
              <span class="sub-tit">더보기</span>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/loewe-b-5_1.jpg" alt="미니 해먹 드로우스트링 백" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=186"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">LOEWE</span>
              <span class="prod-name">미니 해먹 드로우스트링 백</span>
              <span class="prod-price">2,900,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/dior-b-1_1_1.jpg" alt="LADY DIOR 스몰 백" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
            	 <a href="<%=cp%>/itmall/article.do?goods_num=187"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">DIOR</span>
              <span class="prod-name">LADY DIOR 스몰 백</span>
              <span class="prod-price">7,300,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/pxg-b-1_1_1.jpg" alt="FAIRWAY LITE CADDY BAG" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=188"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">PXG</span>
              <span class="prod-name">FAIRWAY LITE CADDY BAG</span>
              <span class="prod-price">799,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/bottegaveneta-b-1_1.jpg" alt="미니 조디 백" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=201"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">BOTEGA BENETA</span>
              <span class="prod-name">미니 조디 백</span>
              <span class="prod-price">3,470,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/cos-b-1_1.jpg" alt="퀄티드 미니 백" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=210"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">COS</span>
              <span class="prod-name">퀄티드 미니 백</span>
              <span class="prod-price">79,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/rimowa-b-1_1.jpg" alt="Original 컴팩트" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=214"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">RIMOWA</span>
              <span class="prod-name">Original 컴팩트</span>
              <span class="prod-price">1,740,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/dior-b-2_1.jpg" alt="DIOR BOOK TOTE 미니 백" />
              </a>
              <div class="pic-hover">
                <ul>
                  <li class="link_01"><a href="javascript:void(0)"></a></li>
                </ul>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">DIOR</span>
              <span class="prod-name">DIOR BOOK TOTE 미니 백</span>
              <span class="prod-price">3,200,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/chanel-b-2_1.jpg" alt="미니 플랩 백" />
              </a>
              <div class="pic-hover">
                <ul>
                  <li class="link_01"><a href="javascript:void(0)"></a></li>
                </ul>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">CHANEL</span>
              <span class="prod-name">미니 플랩 백</span>
              <span class="prod-price">6,370,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="more-btn">
              <a href="<%=cp%>/itmall/goodslist.do?cate=bag">
                <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-plus-empty-128.png" alt="더보기" />
              </a>
              <span class="sub-tit">더보기</span>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/balenciaga-s-1_1.jpg" alt="SPEED RECYCLED 니트 트레이너" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=189"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">BALENCIAGA</span>
              <span class="prod-name">SPEED RECYCLED 니트 트레이너</span>
              <span class="prod-price">1,090,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/dior-s-1_1_1.jpg" alt="J'ADIOR 슬링백 펌프스" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=190"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">DIOR</span>
              <span class="prod-name">J'ADIOR 슬링백 펌프스</span>
              <span class="prod-price">1,450,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/chanel-s-1_1.jpg" alt="CHANEL 발레리나 플랫" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=191"></a>
                
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">CHANEL</span>
              <span class="prod-name">CHANEL 발레리나 플랫</span>
              <span class="prod-price">1,220,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/gfore-s-1_4_1.jpg" alt="LIMITED EDITION KILTIE DURF(WOMEN)" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
              	<a href="<%=cp%>/itmall/article.do?goods_num=192"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">G/FORE</span>
              <span class="prod-name">LIMITED EDITION KILTIE DURF(WOMEN)</span>
              <span class="prod-price">498,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/ugg-s-1_1_1.jpg" alt="스웨이드 레더 미니 부츠 (클래식 울트라 미니)" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=193"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">UGG</span>
              <span class="prod-name">스웨이드 레더 미니 부츠 (클래식 울트라 미니)</span>
              <span class="prod-price">218,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/maisonmargiela-s-1_1.jpg" alt="독일군 남성 스니커즈" />
              </a>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=211"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">MAISON MARGIELA</span>
              <span class="prod-name">독일군 남성 스니커즈</span>
              <span class="prod-price">690,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/commedesgarcons-s-1_1.jpg" alt="Converse Red Heart Chuck 70 Low" />
              </a>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=212"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">COMME DES GARCONS</span>
              <span class="prod-name">Converse Red Heart Chuck 70 Low</span>
              <span class="prod-price">198,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/nike-s-1_1.jpg" alt="덩크 로우" />
              </a>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=213"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">NIKE</span>
              <span class="prod-name">덩크 로우</span>
              <span class="prod-price">129,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="more-btn">
              <a href="<%=cp%>/itmall/goodslist.do?cate=shoes">
                <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-plus-empty-128.png" alt="더보기" />
              </a>
              <span class="sub-tit">더보기</span>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp %>/imal/data/image_main/iwc-a-1_1.jpg" alt="파일럿 워치 크로노그래프 41" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=194"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">IWC</span>
              <span class="prod-name">파일럿 워치 크로노그래프 41</span>
              <span class="prod-price">11,200,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp %>/imal/data/image_main/cartier-a-1_1.jpg" alt="탱크 머스트 워치 (small)" />
              </a>
              <span class="best-icon">best</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=195"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">CARTIER</span>
              <span class="prod-name">탱크 머스트 워치 (small)</span>
              <span class="prod-price">3,990,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/cartier-a-2_1.jpg" alt="탱크 프랑세즈 워치 (small)" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=196"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">CARTIER</span>
              <span class="prod-name">탱크 프랑세즈 워치 (small)</span>
              <span class="prod-price">4,980,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/rolex-a-1_1.jpg" alt="DATEJUST 41" />
              </a>
              <span class="best-icon">limit</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=197"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">ROLEX</span>
              <span class="prod-name">DATEJUST 41</span>
              <span class="prod-price">13,440,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/maisonmargiela-a-1_1.jpg" alt="23SS 남성 반지갑" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=198"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">MAISON MARGIELA</span>
              <span class="prod-name">23SS 남성 반지갑</span>
              <span class="prod-price">454,700</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/bottegaveneta-a-1_1.jpg" alt="신용카드 케이스" />
              </a>
              <span class="best-icon">new</span>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=199"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">BOTEGA BENETA</span>
              <span class="prod-name">신용카드 케이스</span>
              <span class="prod-price">490,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/polo-a-1_1.jpg" alt="폴로 베어 리브 니트 비니" />
              </a>
              <div class="pic-hover">
                <a href="<%=cp%>/itmall/article.do?goods_num=200"></a>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">POLO RALPH LAUREN</span>
              <span class="prod-name">폴로 베어 리브 니트 비니</span>
              <span class="prod-price">119,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="product-pic">
              <a class="obj" href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/emis-a-1_1.jpg" alt="NEW LOGO EMIS CAP GREEN" />
              </a>
              <div class="pic-hover">
                <ul>
                  <li class="link_01"><a href="javascript:void(0)"></a></li>
                </ul>
              </div>
            </div>
            <div class="product-info">
              <span class="brand-icon">EMIS</span>
              <span class="prod-name">NEW LOGO EMIS CAP GREEN</span>
              <span class="prod-price">38,000</span>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="more-btn">
              <a href="javascript:void(0)">
                <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-plus-empty-128.png" alt="더보기" />
              </a>
              <span class="sub-tit">더보기</span>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </article>

  <script>
    $(document).ready(function(){
      // product 상품 hover 
      $('.product-pic').hover(function(){
        $(this).find('.pic-hover').stop().fadeIn();
      }, function(){
        $(this).find('.pic-hover').stop().fadeOut();
      });

      // like button
      $('span.like-icon').on('click', function(){

        if($(this).hasClass('active')){
          $(this).removeClass('active');
        } else {
          $(this).addClass('active');
        }
      });

      // product 메뉴, 슬라이드 연동
      $('.product-menu li').on('click', function(){
        $(this).addClass('on').siblings().removeClass('on');

        if($('.product-menu> :nth-child(1)').hasClass('on')) {
          $('.product> :nth-child(1)').addClass('on').siblings().removeClass('on');
        } else if($('.product-menu> :nth-child(2)').hasClass('on')) {
          $('.product> :nth-child(2)').addClass('on').siblings().removeClass('on');
        } else if($('.product-menu> :nth-child(3)').hasClass('on')) {
          $('.product> :nth-child(3)').addClass('on').siblings().removeClass('on');
        } else {
          $('.product> :nth-child(4)').addClass('on').siblings().removeClass('on');
        }

      });
    });


    var swiper = new Swiper('.product .swiper-container', {
      autoHeight: false,
      slidesPerView: 1.5,
      spaceBetween: 20,
      pagination: {
        el: ".product .swiper-pagination",
        clickable: true,
      },
      breakpoints: {
        640: {
          slidesPerView: 2,
          spaceBetween: 10,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 10,
        },
        1024: {
          slidesPerView: 4,
          spaceBetween: 10,
        },
      },      
    });
  </script>
  


  <article class="magazine" data-aos="fade-up" data-aos-offset="300" data-aos-easing="ease-in-sine" data-aos-duration="1000" data-aos-once="true">
    <div>
      <h2>Magazine</h2>
      <span class="sub-tit">ROW부터 HiGH까지</span>
    </div>
    <div class="inner">
      <div class="magazine-main">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <div class="magazine-pic">
                <a href="javascript:void(0)">
                  <img src="<%=cp%>/imal/data/image_main/celine_4.jpg" alt="한낮의 부드러운 빛" />
                </a>
              </div>
            </div>
            <div class="swiper-slide">
              <div class="magazine-pic">
                <a href="javascript:void(0)">
                  <img src="<%=cp%>/imal/data/image_main/celine_5.jpg" alt="석양 아래의 그늘에서" />
                </a>
              </div>
            </div>
          </div>
          <!-- <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div> -->
        </div>
      </div>
      <div class="magazine-sub">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <a href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/dior_1.jpg" alt="팔리사드 라운지 체어, 하이 (3colors)" />
              </a>
            </div>
            <div class="swiper-slide">
  
              <a href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/dior_2.jpg" alt="오프라인 아웃도어 다이닝 체어_화이트" />
              </a>
            </div>
            <div class="swiper-slide">
              <a href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/loewe-b-1_2.jpg" alt="핫 메시 라운지 체어_내추럴 옐로우" />
              </a>
            </div>
            <div class="swiper-slide">
              <a href="javascript:void(0)">
                <img src="<%=cp%>/imal/data/image_main/celine_4.jpg" alt="피콜리나 비치 체어_아주르블루(AK)" />
              </a>
            </div>
          </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>
    </div>
  </article>

  <script>
    var mainSwiper = new Swiper('.magazine-main .swiper-container', {
      slidesPerView: 1,
      spaceBetween: 20,
      speed: 800,
      navigation: {
        prevEl: '.magazine .swiper-button-prev',
        nextEl: '.magazine .swiper-button-next',
      },
    });
    
    var subSwiper = new Swiper('.magazine-sub .swiper-container', {
      // resistanceRatio: 0,
      slidesPerView: 2,
      spaceBetween: 20,
      speed: 1000,
    });

    mainSwiper.controller.control = subSwiper;
    subSwiper.controller.control = mainSwiper;
  </script>


  <article class="show" data-aos="fade-up" data-aos-offset="300" data-aos-easing="ease-in-sine" data-aos-duration="1000" data-aos-once="true">
    <h2>Show</h2>
    <div class="inner">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide show-con">
            <ul class="show-in">
              <li class="show-pic">
                <img src="<%=cp%>/imal/data/image_main/wooyoungmi.jpg" alt="FUMIRIUM" />
              </li>
              <li class="show-desc">
                <h5>FUMIRIUM</h5>
                <div class="show-text">Hazy mental hearler</div>
                <button class="primary"><a href="javascript:void(0)">Shop now</a></button>
              </li>
              <li class="pc-only show-pic2">
                <img src="https://www.casa.co.kr/show/fumirium/images/data13_obj03.jpg" alt="FUMIRIUM" />
              </li>
            </ul>
          </div>
          <div class="swiper-slide show-con">
            <ul class="show-in">
              <li class="show-pic">
                <img src="<%=cp%>/imal/data/image_main/nike-1.jpg" alt="Ton" />
              </li>
              <li class="show-desc">
                <h5>Ton</h5>
                <div class="show-text">Hand-crafted for generations</div>
                <button class="primary"><a href="javascript:void(0)">Shop now</a></button>
              </li>
              <li class="pc-only show-pic2">
                <img src="https://www.casa.co.kr/show/ton/images/data08_obj04.jpg" alt="Ton" />
              </li>
            </ul>
          </div>
          <div class="swiper-slide show-con">
            <ul class="show-in">
              <li class="show-pic">
                <img src="<%=cp%>/imal/data/image_main/nike-2.jpg" alt="Sika-design" />
              </li>
              <li class="show-desc">
                <h5>Sika-design</h5>
                <div class="show-text">A proud Tradtion of craftmanship since 1942</div>
                <button class="primary"><a href="javascript:void(0)">Shop now</a></button>
              </li>
              <li class="pc-only show-pic2">
                <img src="https://www.casa.co.kr/show/sika/images/data08_obj03.jpg" alt="Sika-design" />
              </li>
            </ul>
          </div>
          <div class="swiper-slide show-con">
            <ul class="show-in">
              <li class="show-pic">
                <img src="<%=cp%>/imal/data/image_main/nike-3.jpg" alt="Carl hansen&Son" />
              </li>
              <li class="show-desc">
                <h5>Carl hansen&Son</h5>
                <div class="show-text">덴마크 오리지널 디자인의 <br class="pc-only" /> 성숙한 멋</div>
                <button class="primary"><a href="javascript:void(0)">Shop now</a></button>
              </li>
              <li class="pc-only show-pic2">
                <img src="https://www.casa.co.kr/show/chs/images/data08_obj02.jpg" alt="Carl hansen&Son" />
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-pagination" style="bottom: 2rem !important;"></div>
  </article>

  <script>
    var swiper = new Swiper('.show .swiper-container', {
      slidesPerView: 1,
      spaceBetween: 50,
      speed: 5000,
      loop: true,
      loopAddtionalSlides: 1,
      // autoplay: {
      //   delay: 5000,
      //   disableOnInteraction: false,
      // },
      pagination: {
        el: ".show .swiper-pagination",
        clickable: true,
      },      
      breakpoints: {
        768: {
          autoplay: false,
        },
      },
    });
  </script>
 

  <article class="notice">
    <div>
      <h2>Notice</h2>
      <button class="primary"><a href="javascript:void(0)">more</a></button>
    </div>
    <ul class="notice-zone">
      <li>
        <span class="notice-icon">공지</span>
        <a href="javascript:void(0)">[IMAL스토어 1주년] 쇼핑지원금 이벤트 5주 차 당첨자 발표</a>
        <span class="notice-date pc-only">2022.11.23</span>
      </li>
      <li>
        <span class="notice-icon">공지</span>
        <a href="javascript:void(0)">[IMAL스토어 1주년] 쇼핑지원금 이벤트 4주 차 당첨자 발표</a>
        <span class="notice-date pc-only">2022.11.16</span>
      </li>
      <li>
        <span class="notice-icon">공지</span>
        <a href="javascript:void(0)">[IMAL스토어 1주년] 쇼핑지원금 이벤트 3주 차 당첨자 발표</a>
        <span class="notice-date pc-only">2022.11.09</span>
      </li>
      <li>
        <span class="notice-icon">공지</span>
        <a href="javascript:void(0)">[IMAL스토어 1주년] 쇼핑지원금 이벤트 2주 차 당첨자 발표</a>
        <span class="notice-date pc-only">2022.11.02</span>
      </li>
      <li>
        <span class="notice-icon">공지</span>
        <a href="javascript:void(0)">[IMAL스토어 1주년] 쇼핑지원금 이벤트 1주 차 당첨자 발표</a>
        <span class="notice-date pc-only">2022.10.25</span>
      </li>
    </ul>
  </article>

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
          <li><a href="javascript:void(0)">통신판매업신고 제2023-서울서초-00111호</a></li>
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

<!-- 
  <div class="pop-up">
    <div class="inner" id="divpop1">
      <div>
        <span><input type="checkbox" name="chkbox" id="todaycloseyn" value="Y"> 오늘하루보지않기</span>
        <span id="popClose" onclick="javascript:closeWin(1);">
          <img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="팝업 닫기">
        </span>
      </div>
      <div class="pop-pic">
        <img src="https://www.casa.co.kr/images/content/icon_join_benfit01.png" alt="10%" />
        <img src="https://www.casa.co.kr/images/content/join_benefit01_obj.png" alt="welcome to CSLV" />
      </div>
      
      
      <div class="pop-txt">
        <p class="pop-tit">신규가입 쿠폰 혜택과 함께 <br/> 즐거운 쇼핑을 시작해보세요</p>
        <p class="pop-desc">쿠폰은 회원가입 완료 후 자동 발급됩니다. <br/> 유효기간 : 발급일로 부터 3개월</->
        <button class="pop-btn"><a href="javascript:void(0)">가입하고 쿠폰 확인하기</a></button>
      </div>
      
    </div>
  </div>
 -->

</body>


</html>