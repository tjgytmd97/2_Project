package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Certificate;
import domain.Member;

@WebServlet("/BookmarkCon")
public class BookmarkCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	public void valueNullCheck(PreparedStatement psmt,int n,String str) throws SQLException {
//		if(str.isEmpty())
//		{
//			System.out.println("함수비었음");
//			psmt.setString(n, "*");
//		}
//		else
//		{
//			psmt.setString(n, str);
//		}
//	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[BookmarkCon]");
		// post 방식의 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 데이터 가져오기(파라미터 수집)
		String bookmark = request.getParameter("bookmark");

		// 전역변수로 선언해주기
		Connection conn = null;
		PreparedStatement psmt = null;

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

			// 1. 세션에서 회원정보 가져오기
			// 2. 세션에서 자격증정보 가져오기
			// 3. 자격증 이름, 날짜들, 회원 insert select

			// 세션 가져오기
			HttpSession session = request.getSession();

			Certificate certificatevo = (Certificate) session.getAttribute("certificatevo");
			String cnum = certificatevo.getCerti_num();

			Member membervo = (Member) session.getAttribute("membervo");
			String unum = Integer.toString(membervo.getNum());

			// 계속 수정해야하는 부분 sql문
			String sql = "INSERT INTO "
					+ "bookmark(certi_name, certi_hndw_rcp_start_date, certi_hndw_rcp_end_date, certi_hndw_test_start_date ,certi_hndw_test_end_date,"
					+ "certi_hndw_pass_start_date ,certi_hndw_pass_end_date, certi_doc_submit_start_date,certi_doc_submit_end_date, certi_prctc_rcp_start_date, "
					+ "certi_prctc_rcp_end_date, certi_prctc_test_start_date, certi_prctc_test_end_date, certi_final_pass_start_date, certi_final_pass_end_date, "
					+ "certi_num, member_num) "
					+ "SELECT ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? FROM dual "
					+ "where NOT EXISTS (SELECT certi_num, member_num FROM bookmark "
					+ "WHERE certi_num = ? AND member_num = ?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, certificatevo.getCerti_name());
			psmt.setString(2, certificatevo.getCerti_hndw_rcp_start_date());
			psmt.setString(3, certificatevo.getCerti_hndw_rcp_end_date());
			psmt.setString(4, certificatevo.getCerti_hndw_test_start_date());
			psmt.setString(5, certificatevo.getCerti_hndw_test_end_date());
			psmt.setString(6, certificatevo.getCerti_hndw_pass_start_date());
			psmt.setString(7, certificatevo.getCerti_hndw_pass_end_date());
			psmt.setString(8, certificatevo.getCerti_doc_submit_start_date());
			psmt.setString(9, certificatevo.getCerti_doc_submit_end_date());
			psmt.setString(10, certificatevo.getCerti_prctc_rcp_start_date());
			psmt.setString(11, certificatevo.getCerti_prctc_rcp_end_date());
			psmt.setString(12, certificatevo.getCerti_prctc_test_start_date());
			psmt.setString(13, certificatevo.getCerti_prctc_test_end_date());
			psmt.setString(14, certificatevo.getCerti_final_pass_start_date());
			psmt.setString(15, certificatevo.getCerti_final_pass_end_date());
			psmt.setString(16, cnum);
			psmt.setString(17, unum);
			psmt.setString(18, cnum);		
			psmt.setString(19, unum);

			int cnt = psmt.executeUpdate();

			// 6. 실행 후 처리
			if (cnt > 0) {
				// sql문 실행 성공
				System.out.println("sql문 실행 성공!!!");
				response.sendRedirect("BeforeBookmarkCon");

			} else {
				// sql문 실행 실패시
				System.out.println("sql문 실행 실패!!!");
				response.sendRedirect("BeforeBookmarkCon");
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