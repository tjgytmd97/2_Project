<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- 모두의 자격증 -->
    <title>Original - Lifestyle Blog Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
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
            {
              title  : 'event2',
              start  : '2022-09-05',
              end    : '2022-09-07'
            },
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
    
    
	<style>
		.YM{
			height: 15%;
			width: 100%;
		}
		.tbl_cal{
			height: 70%;
			width: 90%;
		}
	
	</style>
	
</head>

<body>
    <!-- 헤더고정 -->
    <div id="header"> </div>
    <script>
        async function fetchHtmlAsText(url) {
            return await (await fetch(url)).text();
        }

        async function importPage(target) {
            document.querySelector('#' + target).innerHTML = await fetchHtmlAsText(target + '.html');
        }
        importPage("header")

    </script>
    <!-- 헤더고정 끝 -->


	<div class="row align-items-end" style="margin-left: 50px;">
		<!-- 달력 -->
		<div id="calendar" style="height: 920px; width: 60%; margin-bottom: auto; margin-right: auto;"></div>
		<!--  ................................................................................................................ -->
		<%
		// post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		// 데이터 가져오기
		// 파라미터 수집
		String id = request.getParameter("id");
		
		
		// JDBC 코드
		Connection conn = null;
		PreparedStatement psmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement psmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement psmt3 = null;
		ResultSet rs3 = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("클래스파일 로딩도전!");
			
			
			String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
			String dbid = "suncheon_0825_5";
			String dbpw = "smhrd5";
			conn = DriverManager.getConnection(url, dbid, dbpw);
			
			
			if(conn != null) {
				System.out.println("DB연결성공!!");
			}else {
				System.out.println("DB연결실패!!");
			}
			
			// 계속 수정할 부분!!!! SQL문!!
			String sql1 = "select * from news where news_num < 4 limit 0,1;";
			String sql2 = "select * from news where news_num < 4 limit 1,1;";
			String sql3 = "select * from news where news_num < 4 limit 2,1;";
			
			psmt1 = conn.prepareStatement(sql1);
			psmt2 = conn.prepareStatement(sql2);
			psmt3 = conn.prepareStatement(sql3);
			
			
			// select --> executeQuery()
			// 테이블 정보를 가져올때 마치 표처럼 담는 형태 -> ResultSet
			rs1 = psmt1.executeQuery();
			rs2 = psmt2.executeQuery();
			rs3 = psmt3.executeQuery();
			%>
		<!-- 뉴스 구현(수정) -->
		<div class="sidebar-widget-area">
			<h5 class="title" style="margin-right: 500px;">뉴스</h5>
			<div class="widget-content">
				<div class="single-blog-post d-flex align-items-center widget-post">
					<div class="post-content">
						<% 
                    		out.print("<h3>");
                    		if(rs1.next() == true){
                    		String media = rs1.getString("news_media");
                        	out.print(media);
                        	out.print("</h3>");
                        	String src = rs1.getString("news_img");
                        	out.print("<img src="+ src +">");
                        	out.print("<h4>");
                        	String url1 = rs1.getString("news_url");
                        	out.print("<a target='_blank' href='"+ url1 +"' class='post-headline'>");
                        	String title = rs1.getString("news_title");
                        	out.print(title);
                        	out.print("</a>");
                        	out.print("</h4>");
                    	} %>
					</div>
				</div>

				<div class="widget-content">
					<div class="single-blog-post d-flex align-items-center widget-post">
						<div class="post-content">
							<% 
                    		out.print("<h3>");
                    		if(rs2.next() == true){
                    		String media2 = rs2.getString("news_media");
                        	out.print(media2);
                        	out.print("</h3>");
                        	String src2 = rs2.getString("news_img");
                        	out.print("<img src="+ src2 +">");
                        	out.print("<h4>");
                        	String url2 = rs2.getString("news_url");
                        	out.print("<a target='_blank' href='"+ url2 +"' class='post-headline'>");
                        	String title2= rs2.getString("news_title");
                        	out.print(title2);
                        	out.print("</a>");
                        	out.print("</h4>");
                    	} %>
						</div>
					</div>

					<div class="widget-content">
						<div
							class="single-blog-post d-flex align-items-center widget-post">
							<div class="post-content">
								<% 
                    		out.print("<h3>");
                    		if(rs3.next() == true){
                    		String media3 = rs3.getString("news_media");
                        	out.print(media3);
                        	out.print("</h3>");
                        	String src3 = rs3.getString("news_img");
                        	out.print("<img src="+ src3 +">");
                        	out.print("<h4>");
                        	String url3 = rs3.getString("news_url");
                        	out.print("<a target='_blank' href='"+ url3 +"' class='post-headline'>");
                        	String title3 = rs3.getString("news_title");
                        	out.print(title3);
                        	out.print("</a>");
                        	out.print("</h4>");
                    	} %>
							</div>
						</div>
					</div>
				</div>
				<%	
		} catch (Exception e) {
			// Exception --> 모즌 종류의 오류를 다 잡을 수 있는 큰개념의 오류
			
			// 오류의 내용 보여주기 -> console창에서 확인
			e.printStackTrace();
		} finally {
			// 도중에 오류가 나더라도 DB연결해제는 꼭 실행할 수 있도록
			try {
				if(psmt1 != null) {
					psmt1.close();
				}
				if(conn != null) {
					conn.close();
				}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	
	%>
				<!-- 추천 자격증 구현 끝! -->
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