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

import domain.Certificate;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      System.out.println("[SearchCon]");

      // 0. post 방식의 인코딩
      request.setCharacterEncoding("UTF-8");

      /////// 데이터 가져오기
      String certi_name = request.getParameter("certi_name");

      // 전역변수로 선언해주기
      Connection conn = null;
      PreparedStatement psmt = null;
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

         if (rs.next() == true) {
            String certi_name1 = rs.getString("certi_name");
            String certi_outline1 = rs.getString("certi_outline");
            
            Certificate vo = new Certificate(certi_name1, certi_outline1);
            System.out.println(certi_outline1);
            System.out.println("데이터가져오기 성공");
            response.sendRedirect("certi_outline.html");
            
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