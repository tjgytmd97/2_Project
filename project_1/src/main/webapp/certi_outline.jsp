<%@page import="domain.Certificate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<title>자격증 상세 페이지</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>


</head>

<body>
	<%
	Certificate certificatevo = (Certificate) session.getAttribute("certificatevo");
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

	<div class="single-blog-wrapper section-padding-0-100">

		<div class="container">
			<div class="row">
				<!-- 자격증 상세정보표시(수정) -->
				<div class="col-12 col-lg-9">
					<div class="single-blog-area blog-style-2 mb-50">
						<div class="single-blog-content">
							<div class="line"></div>
							<h4>
								<h2><%=certificatevo.getCerti_name()%></h2>
							</h4>
							<div class="post-meta mb-50">
								<p style="font-size: large;">
									<a style="font-size: 15px;" target="_blank"
										href="<%=certificatevo.getCerti_instt_url()%>"><%=certificatevo.getCerti_instt()%><img src="./img/linklogo.jpg" width=30px;></a>								
								</p>
							</div>
<hr style="border: solid 0.5px; margin-bottom:50px">
							<h5 style="font-weight:bold;">자격증 정보</h5>
							<p style="font-size: 15px;"><%=certificatevo.getCerti_outline()%></p>
							<div style="padding-bottom:15px">
								<span style="font-weight:bold;">가격 :</span>
								<span><%= certificatevo.getCerti_fee()%> </span>
							</div>
							<div>
								<%
								String certi_name = certificatevo.getCerti_name();
								Connection conn = null;
								PreparedStatement psmt = null;
								PreparedStatement psmt2 = null;
								ResultSet rs = null;

								try {

									// 2. 동적로딩: 해당 경로의 클래스를 실행해서 JVM이 Driver에 로딩한다.
									Class.forName("com.mysql.jdbc.Driver");
									System.out.println("클래스파일 로딩 도전!");

									String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
									String dbid = "suncheon_0825_5";
									String dbpw = "smhrd5";
									conn = DriverManager.getConnection(url, dbid, dbpw);

									if (conn != null) {
										System.out.println("DB 연결 성공");
									} else {
										System.out.println("DB 연결 실패");
									}

									// sql문 세팅
									String sql = "select * from certificate where certi_name=?";
									psmt = conn.prepareStatement(sql);
									psmt.setString(1, certi_name);

									rs = psmt.executeQuery();

									out.print("<table style='width: 1000px;'>");
									out.print("<tr>");
									out.print("<th style='padding-top:10px;'>회차</th>");
									out.print("<th style='padding-top:10px;'>필기 원서 접수 기간</th>");
									out.print("<th style='padding-top:10px;'>필기 시험 기간</th>");
									out.print("<th style='padding-top:10px;'>필기 시험 발표일</th>");
									out.print("</tr>");
																		
									while (rs.next()) {
										String certi_rnd1 = rs.getString(5);		

										String certi_hndw_rcp_start_date1 = rs.getString(15);
										String certi_hndw_rcp_end_date1 = rs.getString(16);

										String certi_hndw_test_start_date1 = rs.getString(17);
										String certi_hndw_test_end_date1 = rs.getString(18);

										String certi_hndw_pass_start_date1 = rs.getString(19);
										String certi_hndw_pass_end_date1 = rs.getString(20);

										out.print("<tr>");
										out.print("<td style='padding-top:10px;'>" + certi_rnd1 + "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_hndw_rcp_start_date1 + "~" + certi_hndw_rcp_end_date1
										+ "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_hndw_test_start_date1 + "~" + certi_hndw_test_end_date1
										+ "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_hndw_pass_start_date1 + "~" + certi_hndw_pass_end_date1
										+ "</td>");
										out.print("</tr>");
									}

									out.print("<tr>");
									out.print("<th style='padding-top:50px;'>회차</th>");
									out.print("<th style='padding-top:50px;'>실기 원서 접수 기간</th>");
									out.print("<th style='padding-top:50px;'>실기 시험 기간</th>");
									out.print("<th style='padding-top:50px;'>최종 합격 발표일</th>");
									out.print("</tr>");
									
									String sql2 = "select * from certificate where certi_name=?";
									psmt2 = conn.prepareStatement(sql2);
									psmt2.setString(1, certi_name);

									rs = psmt2.executeQuery();

									while (rs.next()) {
										String certi_rnd1 = rs.getString(5);
										
										String certi_prctc_rcp_start_date1 = rs.getString(23);
										String certi_prctc_rcp_end_date1 = rs.getString(24);

										String certi_prctc_test_start_date1 = rs.getString(25);
										String certi_prctc_test_end_date1 = rs.getString(26);

										String certi_final_pass_start_date1 = rs.getString(27);
										String certi_final_pass_end_date1 = rs.getString(28);

										out.print("<tr>");
										out.print("<td style='padding-top:10px;'>" + certi_rnd1 + "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_prctc_rcp_start_date1 + "~" + certi_prctc_rcp_end_date1
										+ "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_prctc_test_start_date1 + "~" + certi_prctc_test_end_date1
										+ "</td>");
										out.print("<td style='padding-top:10px;'>" + certi_final_pass_start_date1 + "~" + certi_final_pass_end_date1
										+ "</td>");
										out.print("</tr>");
									}

									out.print("</table>");

								} catch (Exception e) {
									// Exception -> 모든 종류의 오류를 잡을 수 있는 큰 개념의 오류
									// 오류의 내용 보여주기 -> console 창에서 확인
									e.printStackTrace();
								} finally {
									// 오류가 나더라도 DB 연결해제는 필수
									try {
										if (psmt != null) {
											psmt.close();
											psmt2.close();
										}
										if (conn != null)
											conn.close();

									} catch (Exception e2) {
										e2.printStackTrace();
									}
								}
								%>
							</div>
						</div>
					</div>

					
<hr style="border: solid 0.5px;">
               <!-- 댓글보기 기능 구현 (수정)-->
               <div class="comment_area clearfix mt-70">
                  <h5 style="font-weight:bold; margin-bottom:10px;">댓글</h5>
                  <ol>
                     <!-- 댓글내용(수정) -->
                     <li class="single_comment_area">
                        <div class="comment-content d-flex">
                           <div class="comment-meta">
                              <!-- <a href="#" class="post-date">날짜</a>
                              <p>
                                 <a href="#" class="post-author">서효승</a>
                              </p> -->
                              <%                               	
                              	String certi_num = certificatevo.getCerti_num();
								Connection conn1 = null;
								PreparedStatement psmt3 = null;
								ResultSet rs1 = null;
								
								try {
									Class.forName("com.mysql.jdbc.Driver");
							         System.out.println("클래스파일 로딩 도전!");

							         String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
							         String dbid = "suncheon_0825_5";
							         String dbpw = "smhrd5";
							         conn1 = DriverManager.getConnection(url, dbid, dbpw);

							         if (conn1 != null) {
							            System.out.println("DB 연결 성공");
							         } else {
							            System.out.println("DB 연결 실패");
							         }
									// sql문 세팅
  									String sql = "select * from comment where certi_num=?";
  									psmt3 = conn1.prepareStatement(sql);
  									psmt3.setString(1, certi_num);

  									rs1 = psmt3.executeQuery();
  									out.print("<table style='width: 1000px;'>");
  									out.print("<tr>");
  									out.print("<th style='padding-top:10px;'>작성자</th>");
  									out.print("<th style='padding-top:10px;'>시간</th>");
  									out.print("<th style='padding-top:10px;'>내용</th>");
  									out.print("</tr>");
  																		
  									while (rs1.next()) {
  										String member_id1 = rs1.getString(6);
  										String comm_datetime1 = rs1.getString(2);
  										String comm_text1 = rs1.getString(5);

  										out.print("<tr>");
  										out.print("<td style='padding-top:10px;'> " + member_id1 + "</td>");
  										out.print("<td style='padding-top:10px;'> " + comm_datetime1 + "</td>");
  										out.print("<td style='padding-top:10px;'> " + comm_text1 + "</td>");
  									}  									
  									out.print("</table>");
								} catch (Exception e) {
  									e.printStackTrace();
  								} finally {
  									try {
  										if (psmt3 != null) {
  											psmt3.close();
  										}
  										if (conn1 != null)
  											conn1.close();

  									} catch (Exception e2) {
  										e2.printStackTrace();
  									}
  								}
                              
                              %>
                           </div>
                        </div>
                     </li>
                  </ol>
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