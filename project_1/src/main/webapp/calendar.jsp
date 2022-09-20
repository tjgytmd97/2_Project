<%@page import="domain.Certificate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
          dayMaxEvents: true,
          events: [
        	  
        	  <%
        	  ArrayList<Certificate> test = (ArrayList)session.getAttribute("allCertiDate");
              
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
              //for(Certificate vo : test){
                 //System.out.println(vo.getCerti_name());
                 //System.out.println(vo.getCerti_prctc_test_start_date());
                 
              //}
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
        	/* 수정해야할부분 */
            window.location.href(info.event.url);
            }
        });
        calendar.render();
        
      });
      
	</script>	


<style>
.YM {
	height: 15%;
	width: 100%;
}

.tbl_cal {
	height: 70%;
	width: 90%;
}
</style>

</head>

<body>
	<!-- 헤더고정 -->
	<div id="header"></div>
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
		<!-- 추천 자격증 구현(수정) -->

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
		<div class="sidebar-widget-area" style="bottom: 170px;">
			<h5 class="title" style="margin-right: 500px;">추천 자격증</h5>

			<div class="widget-content">
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