<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>ITWILL MALL</title>
   
  <link rel="icon" type="image/x-icon" href="<%=cp %>/imal/data/logo/itmal.png" />
  
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
   <link rel="stylesheet" href="<%=cp%>/imal/data/article.css">
    
   <!-- 장바구니 담기 성공 경고문 -->
   <script type="text/javascript">
   
   function sendIt() {
	
	   alert("장바구니담기 성공!");
	   
}
   
   </script>
 <!-- 검색창 기능 -->
  <script type="text/javascript">
  
  function parseType(type) {
	   
	  var f2 = document.myForm2;
	  var str = f2.searchValue.value;
	  
	  switch (type) {

	   case 1:
		   type = '워치'

			   break;
	   case 2:
		   type = '모자'
   
			   break;
	   case 3:
		   type = '재킷'
	  
			   break;
	   case 4:
		   type = '지갑'
			   
			   break;   
	   case 5:
		   type = '벨트'
			
			   break;   
	   default:
		   
	   }
	   
	 f2.searchValue.value = type;

  }
  
  function sendIt2() {
	  
	  var f2 = document.myForm2;
	  
	  f2.action = "<%=cp %>/itmall/goodslist2.do";
	  
	  f2.submit();
	
}
  
  </script>    
     
</head>

<body>

<!-- 상단 메뉴바 -->

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
		        
			        <a href="<%=cp%>/itmall/mypage.do">
			        	<img src="<%=cp %>/imal/data/image_main/btn_top_login.png" alt="회원정보수정" />
			        </a>
		        	
		        	<!-- 로그아웃사진 -->
				       <li id="search-btn" style="margin-right: 15px;"> 
					       <a href="<%=cp%>/itmall/logout.do">
					       <img src="<%=cp %>/imal/data/image_main/btn_top_logout.png" alt="로그아웃" />
					       </a>
				       </li>
				       
				        <li>
				        	<a href="javascript:location.href='<%=cp%>/itmall/mybag.do'"><img src="<%=cp %>/imal/data/image_main/btn_top_order.png" alt="장바구니" />
							</a>
				        </li>
		        	
		        </c:otherwise>
		        
	        </c:choose>
        
        </li>
        
       
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
            
            <!-- 
            <ul class="gnb-2">
              <li><h3 class="menu"><a href="javascript:void(0)">magazine</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">event</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">notice</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">qna</a></h3></li>
            </ul>
            -->
            <div class="gnb-image"><a href="javascript:void(0)"><img src="<%=cp%>/imal/data/image_main/celine_1.jpg" alt="베르판" /></a></div>      
          </div>    
        </div>
      </div>
    </nav>
 <!-- 검색창 -->
    <form action="<%=cp %>/itmall/goodslist2.do" method="post" name="myForm2">
    <div class="search-container">

      <div class="search-wrapper">
        <div id="searchClose">
          <img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="검색창 닫기" style="width: 28px; height=25px;" >
        </div>
        <div class="search-zone">

          <input type="text" placeholder="검색어를 입력해주세요" id="input_txt" name="searchValue" value=""/>
         
          <img src="https://casa.co.kr/images/common/btn_top_search.png" alt="검색" 
          onclick="sendIt2();"/>
          
          <input type="submit" value="검색" style="display: none;"/>
         
        </div>
        <span class="sub-tit">추천 검색어</span>
        <ul class="keyword-zone">
          <li value="1"  onclick="parseType(1);"><a href="javascript:void(0)" class="keyword">&#35;워치</a></li>
          <li value="2"  onclick="parseType(2);"><a href="javascript:void(0)" class="keyword">&#35;모자</a></li>
          <li value="3"  onclick="parseType(3);"><a href="javascript:void(0)" class="keyword">&#35;재킷</a></li>
          <li value="4"  onclick="parseType(4);"><a href="javascript:void(0)" class="keyword">&#35;지갑</a></li>
          <li value="5"  onclick="parseType(5);"><a href="javascript:void(0)" class="keyword">&#35;벨트</a></li>
        </ul>
      </div>
    </div>
</form>


  </header>

<!-- 메인 article -->

<fmt:formatNumber var="price" value="${dto.price }" pattern=",000"/>


    <article class="product">

        <section>

            <img src="${imagePath }/${dto.saveFilename}"
                alt="대체사진" style="margin-right: 50px;">

        </section>


        <section>

            <div>
                <h4 style="font-size: 20pt;">${dto.content }</h4>

            </div>

            <h4 style="font-size: 25pt;">${dto.title }</h4>

            <div>
                <h4 style="font-size: 30pt;">${price }&nbsp;원</h4>
            </div>

            <div class="shippinginfo">
                <p>배송기간<span style="margin-right: 3px;">2일 후</span></p>
                <p>배송비<span>무료배송</span></p>
                <p>배송방법<span>택배배송</p>
                <p>제품코드<span>${dto.goods_num }${dto.content }</span></p>
            </div>

            <div>
               
            </div>

            <div>
                <h2>총 구매가</h2>
                <h2>${price }&nbsp;원</h2>
            </div>

            <div class="btns">
            <!-- 로그인 안되어 있으면 로그인 창으로 보낼거임 -->
            
            <c:choose>
            	<c:when test="${! empty sessionScope.customInfo.userId }">
                <a href="<%=cp %>/itmall/payment.do?check=${dto.goods_num}"><button>결제하기</button></a>
                <a href="<%=cp %>/itmall/inMyBag.do?goods_num=${dto.goods_num}"><button onclick="sendIt();">장바구니</button></a>
                </c:when>
                <c:otherwise>
                <a href="<%=cp %>/itmall/login.do"><button>결제하기</button></a>
                <a href="<%=cp %>/itmall/login.do"><button>장바구니</button></a>
                </c:otherwise>
            </c:choose>  
               
            </div>



        </section>

    </article>
    


    <article class="productinfo">

        <h4>상품필수정보</h4>

        <div>
            <div class="productinfo_01">
                <ul>
                    <li>제품명</li>
                    <li>모델명</li>
                    <li>크기 / 중량</li>
                    <li>색상</li>
                    <li>구성품</li>
                    <li>주요 소재/재질</li>
                    <li>사용연령 또는 체중범위</li>
                    <li>동일모델의 출시년월</li>
                </ul>
                <ul>
                    <li>*상세페이지 참조</li>
                    <li>*상세페이지 참조</li>
                    <li>*상세페이지 참조</li>
                    <li>해당사항 없음</li>
                    <li>해당사항 없음</li>
                </ul>
            </div>

            <div class="productinfo_02">
                <ul>
                    <li>제조자 / 제조국</li>
                    <li>판매자 / 수입자</li>
                    <li>취급방법 및 취급시 주의사항/</li>
                    <li>안전표시(주의,경고 등)</li>
                    <li>배송/설치비용</li>
                    <li>품질보증기준</li>
                    <li>AS/책임자와 전화번호</li>
                </ul>
                <ul>
                    <li>${dto.content }/ 대한민국</li>
                    <li>(주)${dto.content }/ -</li>
                    <li>*상세페이지 참조</li>
                    <li>무료배송 (단, 도서산간지역 제외)</li>
                    <li>소비자분쟁해결기준에 따라 1년 무상 A/S</li>
                    <li>(단, 보증기간 내라도 고객 귀책 사유일 경우 제외)</li>
                    <li>고객센터 1577-5670</li>
                </ul>
            </div>
        </div>

        <div class="moreview">
            <button>더보기<img src="https://www.iloom.com/img/mobile/btn/more_open.png" alt=""></button>
        </div>
    </article>
    
<!-- choose써서 cate별로 다른 내용이 밑에 나오게 -->

<c:choose>

	<c:when test="${dto.cate=='shoes' }">

    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>A FEEL FOR EVERY YOU</h3>
                <p>몸과 마음이 좋아하는 나만의 다양한 움직임을 시작해보세요.
					머리부터 발끝까지 모든 감각들을 깨워<br/> 
					기분 좋은 하루를 보낼 수 있는 에너지를 만들 수 있어요.<br/>
					지금 나를 위한 모든 가능성을 느껴보세요.</p>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>끝없는 실험 </h3>
                <p>믿을 수 없을 만큼 놀라운 쿠셔닝과 부드러운 착화감을 하나의 신발로!<br/>
                	매 순간 최상의 러닝을 경험해보세요.
                </p>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>더 높은 점프, 더 빠른 방향 전환.</h3>
                <p>유연하고 안정적인 트레이닝화로<br/>
                 매 순간 최고의 퍼포먼스를 발휘해보세요.
               
            </div>
        </section>


    </article>
    
    </c:when>
    
    <c:when test="${dto.cate=='jacket' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="" style="height: 550px;">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="" style="height: 550px;">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="" style="height: 550px;">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
    
    <c:when test="${dto.cate=='watch' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="" >
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="" >
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="" >
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
     <c:when test="${dto.cate=='cap' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
     <c:when test="${dto.cate=='bag' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
     <c:when test="${dto.cate=='socks' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
     <c:when test="${dto.cate=='wallet' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
    
         <c:when test="${dto.cate=='belt' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
    
     <c:when test="${dto.cate=='top' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
    
    <c:when test="${dto.cate=='bottom' }">
    
    <article class="descriptions">

        <section class="con1">
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}1.jpg" alt="">
            <div>
                <h3>캐주얼한 디자인</h3>
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}2.jpg" alt="">
            <div>
                <h3>트렌디한 디자인 </h3>
                
            </div>
        </section>

        <section>
            <img src="<%=cp %>/imal/data/image_main/${dto.cate}3.jpg" alt="">
            <div>
                <h3>디테일함이 돋보이는 디자인</h3>
              
            </div>
        </section>

    </article>
    
    </c:when>
    
</c:choose>

</body>

</html>