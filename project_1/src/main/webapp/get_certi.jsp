<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
*{
font-size: 25px
}

nav {
  width: 16.6%;
  float: left;
}
ul { padding: 0; }
li {
  list-style: none;
  line-height: 40px;
}
a {
  display: block; /* 중요 */
  text-decoration: none;
  color: #616161;
  text-align: center;
}
.snd_menu { background: #efefef; }
.trd_menu { background: #ddd; }
.sub_menu { display: none; } /* 서브메뉴들 숨김 */

.selec { background: #c45; color: #efefef; }
</style>
</head>

<body>
<nav>
  <ul id="main_menu">
    <li><a href="#">정보통신</a>
    <ul class="snd_menu sub_menu" >
      <li><a href="GetCertiCon?certiname=ICDL">ICDL</a></li>
      <li><a href="GetCertiCon?certiname=SW코딩자격">SW코딩자격</a></li>
      <li><a href="GetCertiCon?certiname=리눅스마스터1급">리눅스마스터1급</a></li>
      <li><a href="GetCertiCon?certiname=리눅스마스터2급">리눅스마스터2급</a></li>
      <li><a href="GetCertiCon?certiname=무선설비기능사">무선설비기능사</a></li>
      <li><a href="GetCertiCon?certiname=무선설비산업기사">무선설비산업기사</a></li>
      <li><a href="GetCertiCon?certiname=방송통신기능사">방송통신기능사</a></li>
      <li><a href="GetCertiCon?certiname=방송통신기사">방송통신기사</a></li>
      <li><a href="GetCertiCon?certiname=방송통신산업기사">방송통신산업기사</a></li>
      <li><a href="GetCertiCon?certiname=전자계산기조직응용기사">전자계산기조직응용기사</a></li>
      <li><a href="GetCertiCon?certiname=전파전자통신기능사">전파전자통신기능사</a></li>
      <li><a href="GetCertiCon?certiname=전파전자통신기사">전파전자통신기사</a></li>
      <li><a href="GetCertiCon?certiname=전파전자통신산업기사">전파전자통신산업기사</a></li>
      <li><a href="GetCertiCon?certiname=정보기기운용기능사">정보기기운용기능사</a></li>
      <li><a href="GetCertiCon?certiname=정보처리기능사">정보처리기능사</a></li>
      <li><a href="GetCertiCon?certiname=정보처리기사">정보처리기사</a></li>
      <li><a href="GetCertiCon?certiname=정보처리산업기사">정보처리산업기사</a></li>
      <li><a href="GetCertiCon?certiname=정보통신기사">정보통신기사</a></li>
      <li><a href="GetCertiCon?certiname=정보통신기술사">정보통신기술사</a></li>
      <li><a href="GetCertiCon?certiname=정보통신산업기사">정보통신산업기사</a></li>
      <li><a href="GetCertiCon?certiname=컴퓨터시스템응용기술사">컴퓨터시스템응용기술사</a></li>
      <li><a href="GetCertiCon?certiname=코딩능력마스터2급">코딩능력마스터2급</a></li>
      <li><a href="GetCertiCon?certiname=통신기기기능사">통신기기기능사</a></li>
      <li><a href="GetCertiCon?certiname=통신선로기능사">통신선로기능사</a></li>
      <li><a href="GetCertiCon?certiname=통신선로산업기사">통신선로산업기사</a></li>
      <li><a href="GetCertiCon?certiname=통신설비기능장">통신설비기능장</a></li>
      <li><a href="GetCertiCon?certiname=파이썬마스터1급">파이썬마스터1급</a></li>
      <li><a href="GetCertiCon?certiname=파이썬마스터2급">파이썬마스터2급</a></li>
      <li><a href="GetCertiCon?certiname=파이썬마스터3급">파이썬마스터3급</a></li>
    </ul>
    
    </li>
    </ul>
    </nav>
    
<nav>
  <ul id="main_menu">
    <li><a href="#">네트워크 및 보안</a>
	    <ul class="snd_menu sub_menu">
	    <li><a href="GetCertiCon?certiname=CCIE">CCIE</a></li>
	    <li><a href="GetCertiCon?certiname=CCNA">CCNA</a></li>
	    <li><a href="GetCertiCon?certiname=CCNP">CCNP</a></li>
	    <li><a href="GetCertiCon?certiname=CCT">CCT</a></li>
	    <li><a href="GetCertiCon?certiname=ERP 정보관리사">ERP 정보관리사</a></li>
	    <li><a href="GetCertiCon?certiname=인터넷정보관리사1급">인터넷정보관리사1급</a></li>
	    <li><a href="GetCertiCon?certiname=인터넷정보관리사2급">인터넷정보관리사2급</a></li>
	    <li><a href="GetCertiCon?certiname=인터넷정보관리사3급">인터넷정보관리사3급</a></li>
	    <li><a href="GetCertiCon?certiname=인터넷정보관리사전문가">인터넷정보관리사전문가</a></li>
	    <li><a href="GetCertiCon?certiname=정보관리기술사">정보관리기술사</a></li>
	    <li><a href="GetCertiCon?certiname=정보보안기사">정보보안기사</a></li>
	    <li><a href="GetCertiCon?certiname=정보보안산업기사">정보보안산업기사</a></li>
	    </ul>
	</li>
	</ul>
	</nav>
	
	<nav>
	<ul id="main_menu">
    <li><a href="#">데이터베이스</a>
    	<ul class="snd_menu sub_menu">
	    	<li><a href="GetCertiCon?certiname=DA전문가">DA전문가</a></li>
	    	<li><a href="GetCertiCon?certiname=DA준전문가">DA준전문가</a></li>
	    	<li><a href="GetCertiCon?certiname=DSAC 데이터 사이언티스트 능력인증자격">DSAC 데이터 사이언티스트 능력인증자격</a></li>
	    	<li><a href="GetCertiCon?certiname=SQL전문가">SQL전문가</a></li>
	    	<li><a href="GetCertiCon?certiname=SQL개발자">SQL개발자</a></li>
	    	<li><a href="GetCertiCon?certiname=데이터분석 전문가">데이터분석 전문가</a></li>
	    	<li><a href="GetCertiCon?certiname=데이터분석 준전문가">데이터분석 준전문가</a></li>
	    	<li><a href="GetCertiCon?certiname=빅데이터분석기사">빅데이터분석기사</a></li>
	    </ul>
	</li>
	</ul>
	</nav>
	<nav>
	<ul id="main_menu">
    <li><a href="#">웹디자인</a>
    	<ul class="snd_menu sub_menu">
    		<li><a href="GetCertiCon?certiname=CAD 실무능력평가">CAD 실무능력평가</a></li>
    		<li><a href="GetCertiCon?certiname=GTQ(그래픽기술자격)">GTQ(그래픽기술자격)</a></li>
    		<li><a href="GetCertiCon?certiname=디지털영상편집1급">디지털영상편집1급</a></li>
	    </ul>
	</li>
	</ul>
	</nav>
	
	<nav>
	<ul id="main_menu">
    <li><a href="#">클라우드</a>
        <ul class="snd_menu sub_menu">
        	<li><a href="GetCertiCon?certiname=AWS">AWS</a></li>
        	<li><a href="GetCertiCon?certiname=AZURE">AZURE</a></li>
        	<li><a href="GetCertiCon?certiname=GCP">GCP</a></li>
        	<li><a href="GetCertiCon?certiname=NAVER CLOUD PLATFORM Certified Associate">NAVER CLOUD PLATFORM Certified Associate</a></li>
        	<li><a href="GetCertiCon?certiname=NAVER CLOUD PLATFORM Certified Expert">NAVER CLOUD PLATFORM Certified Expert</a></li>
        	<li><a href="GetCertiCon?certiname=NAVER CLOUD PLATFORM Certified Professional">NAVER CLOUD PLATFORM Certified Professional</a></li>
        	<li><a href="GetCertiCon?certiname=OCA">OCA</a></li>
        	<li><a href="GetCertiCon?certiname=OCM">OCM</a></li>
        	<li><a href="GetCertiCon?certiname=OCP">OCP</a></li>
	    </ul>
	</li>
	</ul>
	</nav>
	
	<nav>
	<ul id="main_menu">
	    <li><a href="#">공용</a>
        <ul class="snd_menu sub_menu">
        	<li><a href="GetCertiCon?certiname=IEQ(인터넷윤리자격)">IEQ(인터넷윤리자격)</a></li>
        	<li><a href="GetCertiCon?certiname=IT Plus">IT Plus</a></li>
        	<li><a href="GetCertiCon?certiname=PAC(프레젠테이션능력인증자격)">PAC(프레젠테이션능력인증자격)</a></li>
        	<li><a href="GetCertiCon?certiname=디지털정보활용능력">디지털정보활용능력</a></li>
        	<li><a href="GetCertiCon?certiname=사무자동화산업기사">사무자동화산업기사</a></li>
        	<li><a href="GetCertiCon?certiname=엑셀플러스">엑셀플러스</a></li>
        	<li><a href="GetCertiCon?certiname=워드프로세서">워드프로세서</a></li>
        	<li><a href="GetCertiCon?certiname=정보기술자격(ITQ)">정보기술자격(ITQ)</a></li>
        	<li><a href="GetCertiCon?certiname=컴퓨터활용능력">컴퓨터활용능력</a></li>
        	<li><a href="GetCertiCon?certiname=파워포인트플러스">파워포인트플러스</a></li>
        	<li><a href="GetCertiCon?certiname=한글플러스">한글플러스</a></li>
	    </ul>
	</li>
  </ul>
</nav>
<script type="text/javascript">
$(document).ready(function(){
	  
	  $('#main_menu > li > a').click(function(){
	    $(this).next($('.snd_menu')).slideToggle('fast');
	  })
	  $('.snd_menu > li > a').click(function(e){
	    e.stopPropagation();
	    $(this).next($('.trd_menu')).slideToggle('fast');
	  })
	  
	  // 버튼 클릭 시 색 변경
	  $('li > a').focus(function(){
	    $(this).addClass('selec');
	  })
	  $("li > a").blur(function(){
	    $(this).removeClass('selec');
	  })
	  
	})
</script>
</body>
</html>