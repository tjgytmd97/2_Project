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

import domain.Bookrmark;


@WebServlet("/BookmarkCon")
public class BookmarkCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[BookmarkCon]");
		// post 방식의 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 가져오기(파라미터 수집)
		String bookmark = request.getParameter("bookmark");
		
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
			
			// 계속 수정해야하는 부분 sql문
			String sql = "select * from bookrmark where certi_name=?";
			psmt =  conn.prepareStatement(sql);
			psmt.setString(1, bookmark);
			
			rs = psmt.executeQuery();
			
			if(rs.next() == true)
			{
				String name = rs.getString(2); 
				
				Bookrmark bookrmarkvo = new Bookrmark(name);
				
				HttpSession session = request.getSession();
				session.setAttribute("certi_name", name);
				session.setAttribute("bookrmarkvo", bookrmarkvo);

				System.out.println("즐겨찾기 성공");
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
