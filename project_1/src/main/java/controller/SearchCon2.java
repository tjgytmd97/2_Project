package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Certificate;

@WebServlet("/SearchCon2")
public class SearchCon2 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("[SearchCon2]");

      request.setCharacterEncoding("UTF-8");
      String certi_name = request.getParameter("certi_name");

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

         if (rs.next() == true) {
        	 
        	// 필요한 데이터 가져오기 
        	String certi_num1 = rs.getString(1);
            String certi_name1 = rs.getString(2);
            String certi_category1 = rs.getString(3);
            String certi_year1 = rs.getString(4);
            String certi_rnd1 = rs.getString(5);
            String certi_outline1 = rs.getString(6);
            String certi_instt1 = rs.getString(7);
            String certi_instt_url1 = rs.getString(8);
            String certi_fee1 = rs.getString(9);
            String certi_acq_mthd1 = rs.getString(10);
            String certi_qlf1 = rs.getString(11);
            String certi_related1 = rs.getString(12);
            String certi_testId_issue_start_date1 = rs.getString(13);
            String certi_testId_issue_end_date1 = rs.getString(14);
            String certi_hndw_rcp_start_date1 = rs.getString(15);
            String certi_hndw_rcp_end_date1 = rs.getString(16);
            String certi_hndw_test_start_date1 = rs.getString(17);
            String certi_hndw_test_end_date1 = rs.getString(18);
            String certi_hndw_pass_start_date1 = rs.getString(19);
            String certi_hndw_pass_end_date1 = rs.getString(20);
            String certi_doc_submit_start_date1 = rs.getString(21);
            String certi_doc_submit_end_date1 = rs.getString(22);
            String certi_prctc_rcp_start_date1 = rs.getString(23);
            String certi_prctc_rcp_end_date1 = rs.getString(24);
            String certi_prctc_test_start_date1 = rs.getString(25);
            String certi_prctc_test_end_date1 = rs.getString(26);
            String certi_final_pass_start_date1 = rs.getString(27);
            String certi_final_pass_end_date1 = rs.getString(28);
            int certi_bookmark_cnt1 = rs.getInt(29);
            System.out.println("test");
            
            // Certificate.java에서 객체 만들기
            // 객체 선언해주기 
            Certificate certificatevo = new Certificate(certi_num1, certi_name1, certi_category1, certi_year1, certi_rnd1, 
            		certi_outline1, certi_instt1, certi_instt_url1, certi_fee1, certi_acq_mthd1, certi_qlf1, certi_related1, 
            		certi_testId_issue_start_date1, certi_testId_issue_end_date1, certi_hndw_rcp_start_date1, certi_hndw_rcp_end_date1, 
            		certi_hndw_test_start_date1, certi_hndw_test_end_date1, certi_hndw_pass_start_date1, certi_hndw_pass_end_date1, 
            		certi_doc_submit_start_date1, certi_doc_submit_end_date1, certi_prctc_rcp_start_date1, certi_prctc_rcp_end_date1, 
            		certi_prctc_test_start_date1, certi_prctc_test_end_date1, certi_final_pass_start_date1, certi_final_pass_end_date1, 
            		certi_bookmark_cnt1);
            
            
			HttpSession session = request.getSession();			
			session.setAttribute("certificatevo", certificatevo);
            
            System.out.println("데이터가져오기 성공");
			response.sendRedirect("BeforeBookmarkCon");
            
         } else {
            
         }

      } catch (Exception e) {
         // Exception -> 모든 종류의 오류를 잡을 수 있는 큰 개념의 오류
         // 오류의 내용 보여주기 -> console 창에서 확인
         e.printStackTrace();
      } finally {
         // 오류가 나더라도 DB 연결해제는 필수
         try {
            if (psmt != null)
               psmt.close();
            if (conn != null)
               conn.close();

         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }

   }

}