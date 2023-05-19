<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<script type="text/javascript" src="<%=cp%>/imal/data/util.js"></script>
<script type="text/javascript" src="<%=cp%>/imal/data/script.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css"></style>
<!-- 주소찾기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
  
  function sendIt(){
		
		var f = document.myForm;
		
		str = f.userPwd.value;
		str = str.trim();
		if (!str) {
			alert("비밀번호를 입력하세요");
			f.userPwd.focus();
			return;
		}
		f.userPwd.value =str;
		
		str = f.userName.value;
		str = str.trim();
		if(!str){
			alert("이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		f.userName.value = str;
		
		str = f.userTel.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요.");
			f.userTel.focus();
			return;
		}
		f.userTel.value = str;
		
		str = f.userAddr_detail.value;
		if (!str) {
			alert("상세주소를 입력하세요");
			f.userAddr_detail.focus();
			return;
		}
		f.userAddr_detail.value =str;
		
		
		
		f.action = "<%=cp%>/itmall/updated_ok.do";
		f.submit();
		
	}
  
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
  
  <main>
 
 <form action="" method="post" name="myForm" > 

  <article class="join-us">
    <h2 align="center">회원정보 수정</h2>

    <div class="content-box">
      <h3>회원정보 입력</h3>

      <div>
        <input type="hidden" name="userId" value="${sessionScope.customInfo.userId }">
      </div>

      <p class="essential">비밀번호</p>
      <div>
        <input type="text" placeholder="비밀번호를 입력해주세요" name="userPwd"value="${lodto.userPwd}">
      </div>
		
      <p class="essential">이름</p>
      <div>
        <input type="text" placeholder="이름을 입력해주세요" name="userName" value="${lodto.userName}">
      </div>


      <p class="essential">휴대전화</p>
      <div>
        <input type="text" placeholder="숫자만 입력해주세요" name="userTel" value="${lodto.userTel}">
      </div>
		
	<div class="birth">
      
      <p>주소</p>
	  <input id="address_kakao" type="text" name="userAddr" placeholder="도로명, 지번, 건물명 검색" readonly />
      <p class="essential">상세주소</p>
      <label>
        <input type="text" placeholder="상세주소를 써주세요" name="userAddr_detail" >
      </label>
      
      <script>
      window.onload = function(){
    	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
    	        //카카오 지도 발생
    	        new daum.Postcode({
    	            oncomplete: function(data) { //선택시 입력값 세팅

    	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
    	                document.querySelector("input[name=userAddr_detail]").focus(); //상세입력 포커싱
    	          
    	 			 }
    	        }).open();
    	    });
    	}
      </script>
        
	</div>	
		

      <div class="birth">
        <p>생년월일</p>
        <div>
          <select name="yy" id="year"></select> 년
          <select name="mm" id="month"></select> 월
          <select name="dd" id="day"></select> 일
        </div>
      </div>


	<div class="agree">
        <p></p>
        <div class="checkbox_group">
          <input type="hidden">
          <hr />
          <div>
            <input type="hidden"><input type="hidden"> <input type="hidden">
          </div>
        </div>

        <button class="black-btn" onclick="sendIt();">회원정보 수정</button>

      </div>

    </div>

    </article>

</form>

</main>

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
  
  
  
  
  