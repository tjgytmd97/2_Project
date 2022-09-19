<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
                  System.out.println("\n\n[login_calendar.jsp]");
          		// 1. 값 가져오기
          		// 2. 자격증 번호, 자격증 이름, 필기 / 실기 시험 시작일
          		// 3. 현재 날짜에서 제일 가까운 날짜 2개 가져오기
          		// 3-1. 현재 이후 날짜에서 제일 작은 거(if(now<date){제일 작은거})
          		// 4. 그 날짜가 어떤 자격증의 필기인지 실기인지 알아야 함
          		
          		//사용자가 북마크 한 자격증 정보들
          		
          		ArrayList<Certificate> list = (ArrayList)session.getAttribute("myCertiDate");
          	
          		//현재 시스템 시간
          		//date를 문자열로 바꾸기
          		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

          		Date now = new Date();
          		String formatedNow = formatter.format(now);
          		
          		now = formatter.parse(formatedNow);
          		
          		Date hndwDate = new Date();
          		Date prctcDate = new Date();
          		
          		int hIndex = 0;
          		int pIndex = 0;
          		
          		String hName = "";
          		String pName = "";
          		
          		long hCal = 0;
				int hDdays =0; 
  				long pCal = 0;
  				int pDdays = 0;
  				
  				String hShowDday ="";
  				String pShowDday ="";
          		
          		String lineDate = "9999-12-31";
          		Date hndwMin = new Date();
          		Date prctcMin = new Date();
          		
          			for(int i=0; i<list.size();i++){
		          			if(list.get(i).getCerti_hndw_test_start_date()!=null)
		          			{
		          					hndwDate = formatter.parse(list.get(i).getCerti_hndw_test_start_date());
		
		          					System.out.println("hndwDate : "+hndwDate);
		          					System.out.println("prctcDate : "+prctcDate);
		          					if(hndwDate.after(now))
		          					{
		          						//이후 날짜들
		          							hndwMin = formatter.parse(lineDate);
		
		          						//hndwDate
		          					if(hndwDate.before(hndwMin)){
		          						hndwMin = hndwDate;
		          						hIndex = i;
		          						
		          						 hName = list.get(hIndex).getCerti_name();
			          					 hCal = hndwMin.getTime() - now.getTime();
			          					 hDdays = (int) (hCal / ( 24*60*60*1000));
			          					hShowDday = hName+" D-"+hDdays;
		          						//System.out.println("필기인덱스 : "+i);
		          					}
		          				}
		          					else{
		          						//System.out.println(formatter.format(hndwDate)+"\n이전날짜 입니다\n\n");
		          					}
		          					
		          					
		          			}
		          			
		          			if(list.get(i).getCerti_prctc_test_start_date()!=null)
		          			{
		          				// 현재 이후 날짜 구하기
		          					prctcDate =formatter.parse(list.get(i).getCerti_prctc_test_start_date());
		
		          					if(prctcDate.after(now))
		          					{
		          							prctcMin = formatter.parse(lineDate);
		          						
		          					if(prctcDate.before(prctcMin)){
		          						prctcMin = prctcDate;
		          						pIndex = i;
		          						
		          						pName = list.get(pIndex).getCerti_name();
			              				 pCal = prctcMin.getTime() - now.getTime();
			              				 pDdays = (int) (pCal / ( 24*60*60*1000));
			              				 pShowDday = pName+" D-"+pDdays;
		          						//System.out.println("실기인덱스 : "+i);
		          					}
		          				}
		          					else{
		          						//System.out.println(formatter.format(prctcDate)+"\n이전날짜 입니다\n\n");
		          					} 
		          					
		          			}	
          		} 

          				//System.out.println("hDdays : " + hDdays);
          				//System.out.println("pDdays : " + pDdays);
          				
          				
          				
/*           				if(hName!=null)
          				{
          					hShowDday = hName+" D-"+hDdays;
          				}
          				if(pName!=null)
          				{
          					pShowDday = pName+" D-"+pDdays;
          				} */
                  %>
                  
                  <div class="post-content">
                     <h5>필기</h5>
                     <h4>
                        <%-- <a href="#" class="post-headline"><%=hName%> 필기날짜 : <%= formatter.format(hndwMin)%></a> --%>
                        <a href="#" class="post-headline"><%=hShowDday%></a>
                     </h4>
                  </div>
               </div>
               <!-- Single Blog Post -->
               <div class="single-blog-post d-flex align-items-center widget-post">
                  <!-- Post Content -->
                  <div class="post-content">
                  <h5>실기</h5>
                     <h4>
                        <a href="#" class="post-headline"><%=pShowDday%></a>
                        <%-- <a href="#" class="post-headline"><%=pName%> 실기날짜 : <%= formatter.format(prctcMin)%></a> --%>
                     </h4>
                  </div>
               </div>
            </div>
         </div>
		<%
		// post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		// 데이터 가져오기
		// 파라미터 수집
		/* String certi_name = request.getParameter("certi_name"); */

		// JDBC 코드
		Connection conn = null;
		PreparedStatement psmt1 = null;
		PreparedStatement psmt2 = null;
		PreparedStatement psmt3 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("클래스파일 로딩도전!");

			String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
			String dbid = "suncheon_0825_5";
			String dbpw = "smhrd5";
			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("DB연결성공!!");
			} else {
				System.out.println("DB연결실패!!");
			}

			// 계속 수정할 부분!!!! SQL문!!
			String sql1 = "select distinct certi_name,certi_bookmark_cnt from (select certi_name, certi_bookmark_cnt, row_number() over (order by certi_bookmark_cnt desc)  from certificate) t limit 0,1;";
			String sql2 = "select distinct certi_name,certi_bookmark_cnt from (select certi_name, certi_bookmark_cnt, row_number() over (order by certi_bookmark_cnt desc)  from certificate) t limit 1,1;";
			String sql3 = "select distinct certi_name,certi_bookmark_cnt from (select certi_name, certi_bookmark_cnt, row_number() over (order by certi_bookmark_cnt desc)  from certificate) t limit 2,1;";
			psmt1 = conn.prepareStatement(sql1);
			psmt2 = conn.prepareStatement(sql2);
			psmt3 = conn.prepareStatement(sql3);

			// select --> executeQuery()
			// 테이블 정보를 가져올때 마치 표처럼 담는 형태 -> ResultSet
			rs1 = psmt1.executeQuery();
			rs2 = psmt2.executeQuery();
			rs3 = psmt3.executeQuery();
		%>
         
				<div style="margin-bottom: 50px;">
					<h2 class="title">자격증 추천</h2>
					<div class="widget-content"
						style="border: 1px solid black; width: 300px;">
						<form action="SearchCon3">
					<!-- Single Blog Post 폼테그 실험중 -->
					<input type="hidden" name="kind" id="kind" value="" />
					<div class="single-blog-post d-flex align-items-center widget-post">

						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline sub1">
									<%
									if (rs1.next() == true) {
										String name1 = rs1.getString("certi_name");
										out.print(name1);
									}
									%>
								</a>
							</h4>
						</div>
					</div>

					<!-- Single Blog Post -->
					<!-- <form action="SearchCon">
	                Single Blog Post 폼테그 실험중
	                <input type="hidden" name="kind" id="kind" value="" /> -->
					<div class="single-blog-post d-flex align-items-center widget-post">

						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline sub2">
									<%
									if (rs2.next() == true) {
										String name2 = rs2.getString("certi_name");
										out.print(name2);
									}
									%>
								</a>
							</h4>
						</div>
					</div>
					<!-- </form> -->
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">

						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline sub3">
									<%
									if (rs3.next() == true) {
										String name3 = rs3.getString("certi_name");
										out.print(name3);
									}
									%>
								</a>
							</h4>
						</div>
					</div>
			</div>
		</div>
		</form>
		<%
		// 회원 정보 가져왔을때 처리할일 -> 회면에 출력출력!
		// rs.next() --> true인 경우에 정보를 볼 수 있다!
		/* if(rs1.next() == true && rs2.next() == true && rs3.next() == true) {
			String name1 = rs1.getString("certi_name");
			String name2 = rs2.getString("certi_name");
			String name3 = rs3.getString("certi_name");
			out.print(name1);
			out.print(name2);
			out.print(name3);
			
		}else{
			out.print("검색된 ID가 없습니다!🤪");
		} */

		} catch (Exception e) {
		// Exception --> 모즌 종류의 오류를 다 잡을 수 있는 큰개념의 오류

		// 오류의 내용 보여주기 -> console창에서 확인
		e.printStackTrace();
		} finally {
		// 도중에 오류가 나더라도 DB연결해제는 꼭 실행할 수 있도록
		try {
			if (psmt1 != null && psmt2 != null && psmt3 != null) {
				psmt1.close();
				psmt2.close();
				psmt3.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
		}
		%>




		<!-- ...................................................................................................... -->

		<!-- 추천 자격증 구현 끝! -->
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
	<script type="text/javascript">
				$('.sub1').click(function () {
					   var hello = $(this).text();
				        $('#kind').val(hello.trim());
				        $('form').submit();
				});
				$('.sub2').click(function () {
					   var hello = $(this).text();
				        $('#kind').val(hello.trim());
				        $('form').submit();
				});
				$('.sub3').click(function () {
					   var hello = $(this).text();
				        $('#kind').val(hello.trim());
				        $('form').submit();
				});
	</script>
</body>
</html>