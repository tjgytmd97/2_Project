<%@page import="domain.Member"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="domain.Certificate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- 모두의 자격증 -->
<title>Original - Lifestyle Blog Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- (삽입)버튼 크키 조정 -->	
<style type="text/css">
.getCerti{
	width : 50px;
	height: 50px;
}


</style>	
	
</head>

<body>
	<% 
		// 1. 세션에 저장된 로그인 정보 가져오기
		// 형변환(다운캐스팅) 해주기
		String id = (String)session.getAttribute("id");
	
		// 세션에 저정된 vo 가져오기
		Certificate vo = (Certificate)session.getAttribute("vo");
	%>
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

	<!-- ##### Single Blog Area Start ##### -->
	<div class="single-blog-wrapper section-padding-0-100">

		<!-- Single Blog Area  -->
		<div class="single-blog-area blog-style-2 mb-50">
			<div class="single-blog-thumbnail">
				<img src="img/bg-img/b5.jpg" alt="">
				<div class="post-tag-content">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="post-date">
									<a href="#">12 <span>march</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- 자격증 상세정보표시(수정) -->
				<div class="col-12 col-lg-9">
					<!-- Single Blog Area  -->
					<div class="single-blog-area blog-style-2 mb-50">
						<!-- Blog Content -->
						<div class="single-blog-content">
							<div class="line"></div>
							<h4>
							<!-- (삽입) -->
								<form id="certi_send" action ="GetCertiCon">
									<a href="#" class="post-headline mb-0"><%= vo.getCerti_name()%> </a>
								</form>
								<!-- (삽입)취득 자격증 icon -->
								<a type="submit" onclick="document.getElementById('certi_send').submit();">
								<%
									// 1. 세션에서 아이디 정보 가져와서
									// 2. select * from member해서 세션 id와 일치하는 id의 member_num를 가져온다.
									// 3. select * from certificate limit 1해서 페이지자격증이름과 일치하는 이름의 certi_num를 (제일 위 하나만) 가져온다(자격증정보)
									// 4. select * from get_certificate를 리스트로 뽑아내서 
									

											
									// 5. if member_num과 certi_num이 같은 get_num이 get_num이 있다면 TURE
									// 6. 아니면 false
									
									System.out.println("[취득 자격증 정보 확인 중]");
									
								// post 방식의 한글 인코딩
								request.setCharacterEncoding("UTF-8");
								
								// 데이터 가져오기(파라미터 수집)
								//String id = request.getParameter("id");
								//String pw = request.getParameter("pw");
								
								// 전역변수로 선언해주기
								Connection conn = null;
								PreparedStatement psmt = null;
								ResultSet rs = null;
												
								try {
									Class.forName("com.mysql.jdbc.Driver");
									System.out.println("클래스파일 로딩 도전!");

									String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
									String dbid = "suncheon_0825_5";
									String dbpw = "smhrd5";
									conn = DriverManager.getConnection(url, dbid, dbpw);
											
									// db 연결확인
									if(conn != null)
									{
										System.out.println("DB 연결 성공");
									}
									else
									{
										System.out.println("DB 연결 실패");
									}
									
									// member_num = select member_num from member where member_userid = ?
									// certi_num = select certi_num from certificate where certi_name= ? limit 1;
									
									
									// get_num = select get_num from get_certificate where certi_num = ? and membenum= ?																		
									
									// 계속 수정해야하는 부분 sql문
									String sql01 = "select member_num from member where member_userid = ?";
									String sql02 = "select certi_num from certificate where certi_name= ? limit 1";
									
									psmt =  conn.prepareStatement(sql01);
									//psmt.setString(1, id);
									//psmt.setString(2, pw);
									
									rs = psmt.executeQuery();
									
									if(rs.next() == true)
									{
										String uid = rs.getString(1); //rs.getString("id"); 왁 같음
										String upw = rs.getString(2); //rs.getString(2); 왁 같음
									
										//Member vo = new Member(uid, upw);
										
										session = request.getSession();
										session.setAttribute("id", uid);
										session.setAttribute("vo", vo);

										System.out.println("로그인성공");
										response.sendRedirect("login_index.html");
									}
									else
									{
										response.sendRedirect("index.html");
									}
											
								} catch (Exception e) {
									e.printStackTrace();
								} finally {
									try {
										if(psmt != null) psmt.close();
										if(conn != null) conn.close();
										if(rs != null) rs.close();
									} catch (Exception e2) {
												e2.printStackTrace();
									}
								}
									
									
									
									
									if(false){
										
								%>
									<img alt="" src="img/btn-img/medal_gray.png" class = getCerti title="내가 취득한 자격증에 추가">
								<%} else{
									
								%>
									<img alt="" src="img/btn-img/medal.png" class = getCerti title="내가 취득한 자격증">
								<%} %>
								</a>
								
							</h4>
							<div class="post-meta mb-50">
								<p>
									사이트 이름 <a href="#">자격증 접수 페이지 연결!</a>
								</p>
							</div>
							<p><%= vo.getCerti_outline()%></p>
						</div>
					</div>

					<!-- 댓글보기 기능 구현 (수정)-->
					<div class="comment_area clearfix mt-70">
						<h5 class="title">Comments</h5>

						<ol>
							<!-- 댓글내용(수정) -->
							<li class="single_comment_area">
								<div class="comment-content d-flex">
									<div class="comment-meta">
										<a href="#" class="post-date">날짜</a>
										<p>
											<a href="#" class="post-author">서효승</a>
										</p>
										<p>정보처리기사 기출문제 공유좀요 ㅜㅜ.</p>
									</div>
								</div>
							</li>
						</ol>
					</div>

					<!-- 댓글달기 기능 구현(수정) -->
					<div class="post-a-comment-area mt-70">
						<h5>댓글달기</h5>
						<!-- Reply Form -->
						<form action="#" method="post">
							<div class="row">
								<div class="col-12">
									<div class="group">
										<textarea name="message" id="message" required></textarea>
										<span class="highlight"></span> <span class="bar"></span> <label>댓글</label>
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class="btn original-btn">확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Single Blog Area End ##### -->

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