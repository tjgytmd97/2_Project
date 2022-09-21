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
import domain.Member;


@WebServlet("/AfterBookmarkCon")
public class AfterBookmarkCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    System.out.println("[AfterBookmarkCon]");
        
	     // post 방식의 한글 인코딩
	     request.setCharacterEncoding("UTF-8");
	     
	     // 세션 받아오기(id받아오기)
	     HttpSession session = request.getSession();
	     Certificate certificatevo = (Certificate) session.getAttribute("certificatevo");
	     int rowCnt =  0;
	     
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

	        //북마크 certi로 보내기
	        String sql ="UPDATE certificate SET certi_bookmark_cnt=(select count(*) from bookmark where certi_name=?) WHERE certi_name = ?";
	        
	        psmt =  conn.prepareStatement(sql);
	        String str_rowCnt = Integer.toString(rowCnt);
	        psmt.setString(1, certificatevo.getCerti_name());
	        psmt.setString(2, certificatevo.getCerti_name());
	        
	        System.out.println("str_rowCnt : "+str_rowCnt);
	        System.out.println("certificatevo.getCerti_name() : "+certificatevo.getCerti_name());

	        int cnt = psmt.executeUpdate();

			if (cnt > 0) {
				response.sendRedirect("BeforeBookmarkCon");
			} else {
				System.out.println("sql문 실행 실패");
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
		
	}

}
