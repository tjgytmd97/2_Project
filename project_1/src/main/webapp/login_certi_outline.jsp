<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="domain.Member"%>
<%@page import="domain.Comment"%>
<%@page import="domain.Certificate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!-- 현재시간 가져오기 -->
<%
   Date nowTime = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session = "true" %>
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

<!-- (삽입)버튼 크키 조정 -->   
<style type="text/css">
.getCerti_img{
   width : 50px;
   height: 50px;
}
.boormark_img{
   width : 45px;
   height: 45px;
}


</style>

</head>

<body>
   <% 
      // 세션에 저정된 vo 가져오기
      Certificate certificatevo = (Certificate)session.getAttribute("certificatevo");
      Member membervo = (Member)session.getAttribute("membervo");
      Comment commentvo = (Comment)session.getAttribute("commentvo");
   %>
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

   <div class="single-blog-wrapper section-padding-0-100">

      <div class="container">
         <div class="row">
            <!-- 자격증 상세정보표시(수정) -->
            <div class="col-12 col-lg-9">
               <div class="single-blog-area blog-style-2 mb-50">
                  <div class="single-blog-content">
                     <div class="line"></div>
                     <!-- (삽입) -->
						<h1><%= certificatevo.getCerti_name()%><a id = "bookmark_btn" href="BookmarkCon" onclick="click_bookmark()" style="text-decoration: none; position: absolute;">
                        <%
                           	//위 두개 세션에서 가져오기
							boolean mark_check = (boolean)session.getAttribute("mark_check");
							int rowCnt =  (int)session.getAttribute("rowCnt");
                        
	                        if(mark_check==false)
	                        {
	                        	out.println("<img  class = 'boormark_img' alt='' src='img/btn-img/star_gray.png' title='즐겨찾기하기'>");
	                        }
	                        else
	                        {
	                        	out.println("<img  class = 'boormark_img' alt='' src='img/btn-img/star.png' title='즐겨찾기취소'>");
	 						}  	
 						%>
 						<span><%= rowCnt%></span>
                        </a></h1>
  <%--                       <!-- (삽입)취득 자격증 icon -->
                           <a id = "get_btn" href="GetCertiCon" onclick="click_get_btn()">
                        <%
                        	boolean check = false;
                        	
                           // 1. 세션에서 아이디 정보 가져와서
                           // 2. select * from member해서 세션 id와 일치하는 id의 member_num를 가져온다.
                           // 3. select * from certificate limit 1해서 페이지자격증이름과 일치하는 이름의 certi_num를 (제일 위 하나만) 가져온다(자격증정보)
                           // 4. select * from get_certificate를 리스트로 뽑아내서 
                           // 5. (중복이면 insert안하게)if member_num과 certi_num이 같은 get_num이 get_num이 있다면 TURE
                           // 6. 아니면 false
                           
                           System.out.println("[\n\n취득 자격증 정보 확인 중]");
                           
                        // post 방식의 한글 인코딩
                        request.setCharacterEncoding("UTF-8");
                        
                        //1. 세션 받아오기(id받아오기)
                        Member member = (Member)session.getAttribute("membervo");
                        String member_userid = member.getId();
                        
                        //2. 세션 생성하기(자격증명 가져오기)
                        String certi_name = certificatevo.getCerti_name();
                        
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
                           // 취득 자격증 표시해주려고 하는 select문
                           String sql = "select * from get_certificate where member_num="
                        		   		+"(select member_num from member where member_userid = ?)"
                        		   		+"and certi_num = (select certi_num from certificate where certi_name= ? limit 1)";

                           psmt =  conn.prepareStatement(sql);
                           psmt.setString(1, member_userid);
                           psmt.setString(2, certi_name);
                           
                           rs = psmt.executeQuery();
                           
                           if(rs.next() == true)
                           {
                              String unumber = rs.getString("member_num");
                              String cnumber = rs.getString("certi_num");
                              
                              System.out.println("rs실행 성공!!");
                              
                              check = true;
                           }
                           else
                           {
                              System.out.println("실패");
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
                   		
                        if(check==false)
                        {
                        	out.println("<img class = 'getCerti_img' alt='' src='img/btn-img/medal_gray.png' title='내가 취득한 자격증에 추가'>");
                        }
                        else
                        {
                        	out.println("<img  class = 'getCerti_img' alt='' src='img/btn-img/medal.png' title='내가 취득한 자격증 취소'>");
 						}%>

                        </a> --%>
                           <!-- (삽입)즐겨찾기 icon --> 
                           
							
                        
                          
                          
                        <!-- 버튼들 끝 -->
                        
                     </h4>
                     <div class="post-meta mb-50">
                        <p style="font-size:large;">
                           <a style="font-size:15px; " target="_blank" href="<%= certificatevo.getCerti_instt_url() %>"> <%= certificatevo.getCerti_instt() %></a>
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
  								
  									while (rs1.next()) {
  										String member_id1 = rs1.getString(6);
  										String comm_datetime1 = rs1.getString(2);
  										String comm_text1 = rs1.getString(5);
  										String delname = membervo.getId();
  										int delnum = rs1.getInt(1);
  										out.print("<div style='width:500px;>");
  										out.print("<span style='font-size:20px'>"+ member_id1 + "</span>"+"<br>");
  										out.print("<span style='font-size:20px'>" + comm_text1 +"</span>"+"<br>");
  										out.print("<span style='font-size:13px;'>"+comm_datetime1+"</span><br>");
  										if(delname.equals(member_id1))
  										{		
  											out.print("<form action='ComdeleteCon' method='post' style='text-aline:right;'>");
  											out.print("<input type='hidden' name='num' value='"+delnum+"'>");
  						                    out.print("<button type='submit' style='border: none; width:50px; font-family:'맑은 고딕';'>삭제</button>");
  											out.print("</form>");
  										}  	
  										out.print("</div>");
  										out.print("<hr style='background:black;'>");
  																			 										
  									} 
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

              <!-- 댓글달기 기능 구현(수정) -->
               <div class="post-a-comment-area mt-70">
                  <h5>댓글달기</h5>
                  <!-- Reply Form -->
                  <form action="CommentCon" method="post">
                     <input type="hidden" name="num" value="<%=membervo.getNum()%>">
                     <input type="hidden" name="certi_num" value="<%=certificatevo.getCerti_num()%>">
                     <input type="hidden" name="datetime" value="<%=(String)sf.format(nowTime)%>">
                     <input type="hidden" name="id" value="<%=membervo.getId()%>">
                  <div style="margin-bottom: 50px">
                     <span style="font-size:13px"><%=membervo.getId()%></span>
                  </div>
                     <div class="row">
                        <div class="col-12">
                           <div class="group">
                              <textarea style="font-size: 0.95em;" name="message" id="message" required ></textarea>
                              <span class="highlight"></span> <span class="bar"></span> <label style="font-size: 15px;">댓글입력</label>
                           </div>
                        </div>
                     </div>
                     <div class="col-12">
                        <button type="submit" class="btn original-btn">확인</button>
                     </div>
                  </form>
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
	<!-- 자격증 체크/취소 js -->
	<script src="js/get_certi_or_bookmark.js"></script>
</body>
</html>