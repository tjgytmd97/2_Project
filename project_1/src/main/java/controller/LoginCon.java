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

import domain.Member;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[LoginCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
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
			
			if(conn != null)
			{
				System.out.println("DB 연결 성공");
			}
			else
			{
				System.out.println("DB 연결 실패");
			}
			
			String sql = "select * from member where member_userid=? and member_pw=?";
			psmt =  conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next() == true)
			{
				int unum = rs.getInt(1); 
				String uid = rs.getString(2); 
				String uname = rs.getString(3); 
				String upw = rs.getString(4);  
				String uemail = rs.getString(5); 
			
				Member membervo = new Member(unum, uid, uname, upw, uemail);
				
				HttpSession session = request.getSession();
				session.setAttribute("membervo", membervo);

				System.out.println("로그인성공");
				response.sendRedirect("login_index.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
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
		
	} // service method 끝

}
