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


@WebServlet("/BeforeBookmarkCon")
public class BeforeBookmarkCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean mark_check = false;
        
     System.out.println("\n\n[BeforeBookmarkCon]");
        
     // post 방식의 한글 인코딩
     request.setCharacterEncoding("UTF-8");
     
     //1. 세션 받아오기(id받아오기)
     HttpSession session = request.getSession();
     Member membervo = (Member)session.getAttribute("membervo");
     Certificate certificatevo = (Certificate) session.getAttribute("certificatevo");
     
     // 전역변수로 선언해주기
     Connection conn = null;
     
     PreparedStatement psmt01 = null;
     PreparedStatement psmt02 = null;
     
     ResultSet rs01 = null;
     ResultSet rs02 = null; 
     
     int rowCnt = 0;
     
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
        
        // 계속 수정해야하는 부분 sql문
        // 북마크 개수 확인 sql문
        String sql01 = "select count(*) from bookmark where certi_name=?";                     
        
        psmt01 =  conn.prepareStatement(sql01);
        psmt01.setString(1, certificatevo.getCerti_name());
        rs01 = psmt01.executeQuery();
       
        if(rs01.next() == true)
        {
         	rowCnt = rs01.getInt(1);
         	System.out.println("rs01실행 성공!!");
         	System.out.println("rowCnt : "+rowCnt);
        }
        else
        {
           System.out.println("실패");
        }
        
        
        //로그인한 회원이 북마크 한 상태인지 체크
        String sql02 ="select * from bookmark where member_num=? and certi_num = ?";
        String member_num = Integer.toString(membervo.getNum());
        
        System.out.println("member_num : " + member_num);
        System.out.println("certi_num : " + certificatevo.getCerti_num());
        
        psmt02 =  conn.prepareStatement(sql02);
        psmt02.setString(1, member_num);
        psmt02.setString(2, certificatevo.getCerti_num());
        
        System.out.println("member_num : "+member_num);
        System.out.println("certificatevo.getCerti_num() : "+certificatevo.getCerti_num());
        
        rs02 = psmt02.executeQuery();        
        
        if(rs02.next() == true)
        {
            System.out.println("rs02실행 성공!!");
            mark_check = true; 
        }
        else
        {
           System.out.println("실패");
        }
        
       	session.setAttribute("mark_check", mark_check);
       	session.setAttribute("rowCnt", rowCnt);
        
        response.sendRedirect("login_certi_outline.jsp");
        
        
     } catch (Exception e) {
        e.printStackTrace();
     } finally {
        try {
           if(psmt01 != null) psmt01.close();
           if(psmt02 != null) psmt02.close();           
           if(conn != null) conn.close();
           if(rs01 != null) rs01.close();
           if(rs02 != null) rs02.close();          
        } catch (Exception e2) {
                 e2.printStackTrace();
        }
     }
	}

}
