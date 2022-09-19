<%@page import="domain.Certificate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Original - Lifestyle Blog Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<!-- 마이켈린더 -->  
    <link href='./fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
	<script src='./fullcalendar-5.11.3/lib/main.js'></script>
	
	<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          contentHeight: 600,//캘린더 크기 설정
          editable: true,//수정 여부
          locale:'ko',
          dateClick: function() {
        	    alert('a day has been clicked!');
        	  },
          events: [
        	  
        	  <%
        	  ArrayList<Certificate> test = (ArrayList)session.getAttribute("myCertiDate");
              
              %>
              <% for (Certificate vo : test){%>
            	{   <% if(vo.getCerti_prctc_test_start_date() == null){%>
            				title : '<%= vo.getCerti_name() %>',
            		<%} else{%>
            				title : '<%= vo.getCerti_name() %>필기',
            		<%}%>
          		  start : '<%= vo.getCerti_hndw_test_start_date() %>',
          		  end : '<%= vo.getCerti_hndw_test_end_date() %>',
          		  color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
          	  },
           <% } %>
	           <% for (Certificate vo : test){%>
	           {
	           title  : '<%= vo.getCerti_name() %>실기',
	           start  : '<%= vo.getCerti_prctc_test_start_date() %>',
	           end : '<%= vo.getCerti_prctc_test_end_date() %>',
	           color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	         	},
	     <% } %>
            {
              title  : 'event3',
              start  : '2010-01-09T12:30:00',
              allDay : false // will make the time show
            }
          ]
        ,eventClick:function(info){
            window.location.href(info.event.url);
            }
        });
        calendar.render();
        
      });
      
	</script>
	<!-- modal js-->
<script src="./js/certi_modal.js" type="module"></script>

<style>
.YM {
	height: 15%;
	width: 100%;
}

.tbl_cal {
	height: 70%;
	width: 90%;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

p {
	margin-top: 10px;
}

.container {
	width: 50%;
}

.modal-btn-box {
	width: 100%;
	text-align: center;
}

.modal-btn-box button {
	display: inline-block;
	width: 150px;
	height: 50px;
	background-color: #ffffff;
	border: 1px solid #e1e1e1;
	cursor: pointer;
	padding-top: 8px;
}

.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 1000px;
	background-color: #ffffff;
	border-radius: 10px;
	overflow: hidden;
	background-color: #264db5;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
	z-index:1000;
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.head-title {
	font-size: 38px;
	font-style: italic;
	font-weight: 700;
	letter-spacing: -3px;
	text-align: center;
}

.popup-body {
	width: 100%;
	background-color: #ffffff;
}

.body-content {
	width: 100%;
	padding: 30px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	height: 400px;
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn {
	display: inline-flex;
	width: 100%;
	height: 100%;
	float: left;
	justify-content: center;
	align-items: center;
	color: #ffffff;
	cursor: pointer;
	border-right: 1px solid #3b5fbf;
}

</style>
</head>
<body>
	<!-- 헤더고정 -->
	<div id="login_header"></div>

	<script>
        async function fetchHtmlAsText(url) {
            return await (await fetch(url)).text();
        }

        async function importPage(target) {
            document.querySelector('#' + target).innerHTML = await fetchHtmlAsText(target + '.jsp');
        }
        importPage("login_header")
        

    </script>
	<!-- 헤더고정 끝 -->

	<div class="row align-items-end" style="margin-left: 50px;">
		<!-- 달력 -->
		<div id="calendar" style="height: 920px; width: 60%; margin-bottom: auto; margin-right: auto;"></div>
		<!-- 취득 자격증 구현(수정) -->
		<div class="sidebar-widget-area" style="margin: 50px 200px 50px 1px;">
			<div style="margin-bottom: 50px;">
				<div class="container">
					<div class="modal-btn-box">
						<button type="button" id="modal-open">취득자격증</button>
					</div>
					<div class="popup-wrap" id="popup">
						<div class="popup">
							<div class="popup-head">
								<span class="head-title">자격증 추가</span>
							</div>
							<div class="popup-body">
								<div class="body-content">
									<div class="body-titlebox">
										<details>
											<summary>정보통신</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="ICDL">ICDL</button>
												<button type="submit" name="certi_name" value="SW코딩자격">SW코딩자격
												</button>
												<button type="submit" name="certi_name" value="리눅스마스터1급">리눅스마스터1급</button>
												<button type="submit" name="certi_name" value="리눅스마스터2급">리눅스마스터2급
												</button>
												<button type="submit" name="certi_name" value="무선설비기능사">무선설비기능사
												</button>
												<button type="submit" name="certi_name" value="무선설비기사">무선설비기사
												</button>
												<button type="submit" name="certi_name" value="무선설비산업기사">무선설비산업기사
												</button>
												<button type="submit" name="certi_name" value="방송통신기능사">방송통신기능사
												</button>
												<button type="submit" name="certi_name" value="방송통신기사">방송통신기사
												</button>
												<button type="submit" name="certi_name" value="방송통신산업기사">방송통신산업기사
												</button>
												<button type="submit" name="certi_name" value="전자계산기조직응용기사">전자계산기조직응용기사
												</button>
												<button type="submit" name="certi_name" value="전파전자통신기능사">전파전자통신기능사
												</button>
												<button type="submit" name="certi_name" value="전파전자통신기사">전파전자통신기사
												</button>
												<button type="submit" name="certi_name" value="전파전자통신산업기사">전파전자통신산업기사
												</button>
												<button type="submit" name="certi_name" value="정보기기운용기능사">정보기기운용기능사
												</button>
												<button type="submit" name="certi_name" value="정보처리기능사">정보처리기능사
												</button>
												<button type="submit" name="certi_name" value="정보처리기사">정보처리기사
												</button>
												<button type="submit" name="certi_name" value="정보처리산업기사">정보처리산업기사
												</button>
												<button type="submit" name="certi_name" value="정보통신기사">정보통신기사
												</button>
												<button type="submit" name="certi_name" value="정보통신기술사">정보통신기술사
												</button>
												<button type="submit" name="certi_name" value="정보통신산업기사">정보통신산업기사
												</button>
												<button type="submit" name="certi_name" value="컴퓨터시스템응용기술사">컴퓨터시스템응용기술사
												</button>
												<button type="submit" name="certi_name" value="코딩능력마스터2급">코딩능력마스터2급
												</button>
												<button type="submit" name="certi_name" value="통신기기기능사">통신기기기능사
												</button>
												<button type="submit" name="certi_name" value="통신선로기능사">통신선로기능사
												</button>
												<button type="submit" name="certi_name" value="통신선로산업기사">통신선로산업기사
												</button>
												<button type="submit" name="certi_name" value="통신설비기능장">통신설비기능장
												</button>
												<button type="submit" name="certi_name" value="파이썬마스터">파이썬마스터2급
												</button>
												<button type="submit" name="certi_name" value="파이썬마스터">파이썬마스터3급
												</button>
											</div>
										</details>
										<details>
											<summary>네트워크 및 보안</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="CCIE">CCIE
												</button>
												<button type="submit" name="certi_name" value="CCNA">CCNA
												</button>
												<button type="submit" name="certi_name" value="CCNP">CCNP
												</button>
												<button type="submit" name="certi_name" value="CCT">CCT
												</button>
												<button type="submit" name="certi_name" value="ERP 정보관리사">ERP
													정보관리사</button>
												<button type="submit" name="certi_name" value="인터넷정보관리사1급">인터넷정보관리사1급
												</button>
												<button type="submit" name="certi_name" value="인터넷정보관리사2급">인터넷정보관리사2급
												</button>
												<button type="submit" name="certi_name" value="인터넷정보관리사3급">인터넷정보관리사3급
												</button>
												<button type="submit" name="certi_name" value="인터넷정보관리사전문가">인터넷정보관리사전문가
												</button>
												<button type="submit" name="certi_name" value="정보관리기술사">정보관리기술사
												</button>
												<button type="submit" name="certi_name" value="정보보안기사">정보보안기사
												</button>
												<button type="submit" name="certi_name" value="정보보안산업기사">정보보안산업기사
												</button>
											</div>
										</details>
									</div>
								</div>
								<div class="body-content">
									<div class="body-titlebox">
										<details>
											<summary>데이터베이스</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="DA전문가">DA전문가
												</button>
												<button type="submit" name="certi_name" value="DA준전문가">DA준전문가
												</button>
												<button type="submit" name="certi_name"
													value="DSAC 데이터 사이언티스트 능력인증자격">DSAC 데이터 사이언티스트
													능력인증자격</button>
												<button type="submit" name="certi_name" value="SQL전문가">SQL전문가
												</button>
												<button type="submit" name="certi_name" value="SQL개발자">SQL개발자
												</button>
												<button type="submit" name="certi_name" value="데이터분석 전문가">데이터분석
													전문가</button>
												<button type="submit" name="certi_name" value="데이터분석 준전문가">데이터분석
													준전문가</button>
												<button type="submit" name="certi_name" value="빅데이터분석기사">빅데이터분석기사
												</button>
											</div>
										</details>
										<details>
											<summary>웹디자인</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="CAD 실무능력평가">CAD
													실무능력평가</button>
												<button type="submit" name="certi_name" value="GTQ(그래픽기술자격)">GTQ(그래픽기술자격)
												</button>
												<button type="submit" name="certi_name" value="디지털영상편집1급">디지털영상편집1급
												</button>
											</div>
										</details>
									</div>
								</div>
								<div class="body-content">
									<div class="body-titlebox">
										<details>
											<summary>클라우드</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="AWS">AWS
												</button>
												<button type="submit" name="certi_name" value="AZURE">AZURE
												</button>
												<button type="submit" name="certi_name" value="GCP">GCP
												</button>
												<button type="submit" name="certi_name"
													value="NAVER CLOUD PLATFORM Certified Associate">NAVER
													CLOUD PLATFORM Certified Associate</button>
												<button type="submit" name="certi_name"
													value="NAVER CLOUD PLATFORM Certified Expert">NAVER
													CLOUD PLATFORM Certified Expert</button>
												<button type="submit" name="certi_name"
													value="NAVER CLOUD PLATFORM Certified Professional">NAVER
													CLOUD PLATFORM Certified Professional</button>
												<button type="submit" name="certi_name" value="OCA">OCA
												</button>
												<button type="submit" name="certi_name" value="OCM">OCM
												</button>
												<button type="submit" name="certi_name" value="OCP">OCP
												</button>
											</div>
										</details>
										<details>
											<summary>공용</summary>
											<div class="body-contentbox">
												<button type="submit" name="certi_name" value="IEQ(인터넷윤리자격)">IEQ(인터넷윤리자격)
												</button>
												<button type="submit" name="certi_name" value="IT Plus">IT
													Plus</button>
												<button type="submit" name="certi_name"
													value="PAC(프레젠테이션능력인증자격)">PAC(프레젠테이션능력인증자격)</button>
												<button type="submit" name="certi_name" value="디지털정보활용능력">디지털정보활용능력
												</button>
												<button type="submit" name="certi_name" value="사무자동화산업기사">사무자동화산업기사
												</button>
												<button type="submit" name="certi_name" value="엑셀플러스">엑셀플러스
												</button>
												<button type="submit" name="certi_name" value="워드프로세서">워드프로세서
												</button>
												<button type="submit" name="certi_name" value="정보기술자격(ITQ)">정보기술자격(ITQ)
												</button>
												<button type="submit" name="certi_name" value="컴퓨터활용능력">컴퓨터활용능력
												</button>
												<button type="submit" name="certi_name" value="파워포인트플러스">파워포인트플러스
												</button>
												<button type="submit" name="certi_name" value="한글플러스">한글플러스
												</button>
											</div>
										</details>
									</div>
								</div>
								<div class="popup-foot">
								<span class="pop-btn close" id="close">확인</span>
								</div>
							</div>
						</div>
					</div>
					<div class="widget-content"
						style="border: 1px solid black; width: 300px;">
						<!-- Single Blog Post -->
						<div
							class="single-blog-post d-flex align-items-center widget-post">
							<!-- Post Content -->
							<div class="post-content">
								<h4>
									<a href="#" class="post-headline">자격증1</a>
								</h4>
							</div>
						</div>
						<!-- Single Blog Post -->
						<div
							class="single-blog-post d-flex align-items-center widget-post">
							<!-- Post Content -->
							<div class="post-content">
								<h4>
									<a href="#" class="post-headline">자격증2</a>
								</h4>
							</div>
						</div>
					</div>
				</div>
         <div style="margin-bottom: 50px;">
            <h2 class="title">디데이</h2>
            <div class="widget-content"
               style="border: 1px solid black; width: 300px;">
               <!-- Single Blog Post -->
               <div class="single-blog-post d-flex align-items-center widget-post">
                  <!-- Post Content -->
                  <%
                     String hName = (String)session.getAttribute("hName");
                     String pName = (String)session.getAttribute("pName");
                     
                     int hDdays = (int)session.getAttribute("hDdays");
                     int pDdays = (int)session.getAttribute("pDdays");
                  %>
                  
                  <div class="post-content">
                     <h5>필기</h5>
                     <h4>
                        <%-- <a href="#" class="post-headline"><%=hName%> 필기날짜 : <%= formatter.format(hndwMin)%></a> --%>
                        <a href="#" class="post-headline"><%=hName%>  D-<%= hDdays%></a>
                     </h4>
                  </div>
               </div>
               <!-- Single Blog Post -->
               <div class="single-blog-post d-flex align-items-center widget-post">
                  <!-- Post Content -->
                  <div class="post-content">
                  <h5>실기</h5>
                     <h4>
                        <a href="#" class="post-headline"><%=pName%>  D-<%= pDdays%></a>
                        <%-- <a href="#" class="post-headline"><%=pName%> 실기날짜 : <%= formatter.format(prctcMin)%></a> --%>
                     </h4>
                  </div>
               </div>
            </div>
         </div>
				<div style="margin-bottom: 50px;">
					<h2 class="title">자격증 추천</h2>
					<div class="widget-content"
						style="border: 1px solid black; width: 300px;">
						<!-- Single Blog Post -->
						<div
							class="single-blog-post d-flex align-items-center widget-post">
							<!-- Post Content -->
							<div class="post-content">
								<h4>
									<a href="#" class="post-headline">추천1</a>
								</h4>
							</div>
						</div>
						<!-- Single Blog Post -->
						<div
							class="single-blog-post d-flex align-items-center widget-post">
							<!-- Post Content -->
							<div class="post-content">
								<h4>
									<a href="#" class="post-headline">추천2</a>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>
</html>