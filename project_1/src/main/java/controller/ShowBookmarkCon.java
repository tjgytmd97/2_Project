package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;

@WebServlet("/ShowBookmarkCon")
public class ShowBookmarkCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[ShowBookmarkCon]");

		// post 방식의 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 1. 세션 받아오기(id받아오기)
		HttpSession session = request.getSession();
		Member membervo = (Member) session.getAttribute("membervo");

		// 전역변수로 선언해주기
		Connection conn = null;

		PreparedStatement psmt02 = null;

		ResultSet rs02 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("클래스파일 로딩 도전!");

			String url = "jdbc:mysql://project-db-stu.ddns.net:3307/suncheon_0825_5";
			String dbid = "suncheon_0825_5";
			String dbpw = "smhrd5";
			conn = DriverManager.getConnection(url, dbid, dbpw);

			// db 연결확인
			if (conn != null) {
				System.out.println("DB 연결 성공");
			} else {
				System.out.println("DB 연결 실패");
			}

			// 로그인한 회원이 북마크 한 상태인지 체크
			String sql02 = "select certi_name from bookmark where member_num=?";
			String member_num = Integer.toString(membervo.getNum());

			psmt02 = conn.prepareStatement(sql02);
			psmt02.setString(1, member_num);

			rs02 = psmt02.executeQuery();

			ArrayList<String> markNameList = new ArrayList<String>();

			while (rs02.next()) {
				String nm = rs02.getString("certi_name");

				markNameList.add(nm);
			}

			session.setAttribute("markNames", markNameList);
			response.sendRedirect("login_calendar.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (psmt02 != null)
					psmt02.close();
				if (conn != null)
					conn.close();
				if (rs02 != null)
					rs02.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}