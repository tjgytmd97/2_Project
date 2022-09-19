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

import domain.Comment;

@WebServlet("/CommentCon")
public class CommentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[CommentCon]");

		// 0. post 방식의 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
		int num = Integer.parseInt(request.getParameter("num"));
		String certi_num = request.getParameter("certi_num");
		String datetime = request.getParameter("datetime");
		String message = request.getParameter("message");
		String member_userid = request.getParameter("id");
		
		// 전역변수로 선언해주기
		Connection conn = null;
		PreparedStatement psmt = null;
		PreparedStatement psmt2 = null;
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
			
			String sql = "insert into comment(comm_datetime, certi_num, member_num, comm_text, member_userid) values(?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, datetime);
			psmt.setString(2, certi_num);
			psmt.setInt(3, num);
			psmt.setString(4, message);
			psmt.setString(5, member_userid);
			int cnt = psmt.executeUpdate();
			
			sql = "select * from comment where certi_num=?";
			psmt2 =  conn.prepareStatement(sql);
			psmt2.setString(1, certi_num);
			rs = psmt2.executeQuery();

			if ((cnt > 0) && (rs.next() == true)) {
				int unum = rs.getInt(1); 
				String udatetime = rs.getString(2); 
				String ucerti_num = rs.getString(3); 
				int umember_num = rs.getInt(4); 
				String umessage = rs.getString(5);  
				String uid= rs.getString(5);  
				
				Comment commentvo = new Comment(unum, udatetime, ucerti_num, umember_num, umessage, uid);
				
				HttpSession session = request.getSession();
				session.setAttribute("commentvo", commentvo);
				
				System.out.println("댓글 추가 성공");
				response.sendRedirect("login_certi_outline.jsp");
			} else {
				System.out.println("sql문 실행 실패!!!");
			}			

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
	}

}
