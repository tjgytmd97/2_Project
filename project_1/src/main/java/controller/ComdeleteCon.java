package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComdeleteCon")
public class ComdeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ComdeleteCon]");
		
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
				
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			// 동적로딩: 해당 경로의 클래스를 실행해서 JVM이 Driver에 로딩한다. 
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
			
			// sql준비
			String sql = "delete from comment where comm_num=?";
			psmt =  conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			// sql 실행
			int cnt = psmt.executeUpdate();
			
			if(cnt>0)
			{
				System.out.println("삭제성공");
				// sql문 실행 성공시 Main.jsp로 이동
				response.sendRedirect("login_certi_outline.jsp");
			}
			else
			{
				// sql문 실행 실패시
				System.out.println("sql문 실행 실패!!!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// DB 연결해제는 필수
			try {
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
