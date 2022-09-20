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

import domain.Certificate;
import domain.Member;


@WebServlet("/MyCertiDateCon")
public class MyCertiDateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String DateCheck(String str) {
		try {
			if(str!=null) {
					String month =null;
					String day = null;
					
					if(str.contains("23.")||str.contains("21.")) {
						String[] strArr = str.split("[.]");
						month = strArr[1];
						day =  strArr[2];
						
						if(str.contains("23.")) {
							str = "2023-"+ month + "-" + day;
			        	}
						else if(str.contains("21.")) {
							str = "2021-"+ month+"-" + day;
						}
					}
		        	else
		        	{
		        		String[] strArr = str.split("[.]");
						month = strArr[0];
						day =  strArr[1];
	
						if(month.length()==1)
						{
							month = "0"+month;
						}
						if(day.length()==1)
						{
							day = "0"+day;
						}
						str = "2022-"+month+"-"+day;
		        	}
				
			}
		}
		catch(IndexOutOfBoundsException e) {str=null;}
		return str;
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    System.out.println("\n\n[MyCertiDateCon]");
	    	    
	    	     // post 방식의 한글 인코딩
	    	     request.setCharacterEncoding("UTF-8");
	    	     
	    	     //1. 세션 받아오기(id받아오기)
	    	     HttpSession session = request.getSession();
	    	     Member membervo = (Member)session.getAttribute("membervo");
	    	     Certificate certificatevo = (Certificate) session.getAttribute("certificatevo");
	    	     
	    	     // 전역변수로 선언해주기
	    	     Connection conn = null;
	    	     
	    	     PreparedStatement psmt01 = null;
	    	     
	    	     ResultSet rs01 = null;
	    	     
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
	    	        // 전체 자격증 날짜 조회 sql문
	    	        String sql01 = "select * from certificate where certi_name "
	    	        				+"in (select certi_name from bookmark where member_num = ?)";     
	    	        
	    	        psmt01 =  conn.prepareStatement(sql01);
	    	        psmt01.setInt(1, membervo.getNum());
//	    	        psmt01.setString(1, "6");
	    	        
	    	        rs01 = psmt01.executeQuery();
	    	        
	    	        ArrayList<Certificate> myList = new ArrayList<Certificate>();
	    	        
	    	        while(rs01.next())
	    	        {
	    	        	String certi_num = rs01.getString(1);
	    	        	String certi_name = rs01.getString(2);
	    	        	
	    	        	String certi_hndw_rcp_start_date = rs01.getString("certi_hndw_rcp_start_date");
	    	        	certi_hndw_rcp_start_date = DateCheck(certi_hndw_rcp_start_date);
	    	        	       	
	    				String certi_hndw_rcp_end_date = rs01.getString("certi_hndw_rcp_end_date"); 
	    				certi_hndw_rcp_end_date = DateCheck(certi_hndw_rcp_end_date);

	    				String certi_hndw_test_start_date = rs01.getString("certi_hndw_test_start_date"); 
	    				certi_hndw_test_start_date = DateCheck(certi_hndw_test_start_date);
	    				
	    				String certi_hndw_test_end_date = rs01.getString("certi_hndw_test_end_date"); 
	    				certi_hndw_test_end_date = DateCheck(certi_hndw_test_end_date);
	    				
	    				String certi_hndw_pass_start_date = rs01.getString("certi_hndw_pass_start_date"); 
	    				certi_hndw_pass_start_date = DateCheck(certi_hndw_pass_start_date);
	    				
	    				String certi_hndw_pass_end_date = rs01.getString("certi_hndw_pass_end_date"); 
	    				certi_hndw_pass_end_date = DateCheck(certi_hndw_pass_end_date);
	    				
	    				String certi_prctc_rcp_start_date = rs01.getString("certi_prctc_rcp_start_date"); 
	    				certi_prctc_rcp_start_date = DateCheck(certi_prctc_rcp_start_date);
	    				
	    				String certi_prctc_rcp_end_date = rs01.getString("certi_prctc_rcp_end_date"); 
	    				certi_prctc_rcp_end_date = DateCheck(certi_prctc_rcp_end_date);
	    				
	    				String certi_prctc_test_start_date = rs01.getString("certi_prctc_test_start_date"); 
	    				certi_prctc_test_start_date =  DateCheck(certi_prctc_test_start_date);
	    				
	    				String certi_prctc_test_end_date = rs01.getString("certi_prctc_test_end_date");
	    				certi_prctc_test_end_date = DateCheck(certi_prctc_test_end_date);
	    				
	    				String certi_final_pass_start_date = rs01.getString("certi_final_pass_start_date");
	    				certi_final_pass_start_date = DateCheck(certi_final_pass_start_date);
	    				
	    				String certi_final_pass_end_date = rs01.getString("certi_final_pass_end_date");
	    				certi_final_pass_end_date = DateCheck(certi_final_pass_end_date);
	    	        	
	    	        	
	    				myList.add(new Certificate(certi_num, certi_name, certi_hndw_rcp_start_date, certi_hndw_rcp_end_date, 
	    	        			certi_hndw_test_start_date, certi_hndw_test_end_date, certi_hndw_pass_start_date, certi_hndw_pass_end_date, 
	    	        			certi_prctc_rcp_start_date, certi_prctc_rcp_end_date, certi_prctc_test_start_date, certi_prctc_test_end_date, 
	    	        			certi_final_pass_start_date, certi_final_pass_end_date));
	    				
//	    	         	System.out.println("rs01실행 성공!!");

	    	        }
	    	        
	    	        session.setAttribute("myCertiDate", myList);

//	             	for(Certificate certi: myList) {
//	         		System.out.println("이름 : "+ certi.getCerti_name());
//	         		System.out.println(" 필기원서접수 시작: " + certi.getCerti_hndw_rcp_start_date());
//	         	}
	             	
	    	        response.sendRedirect("login_calendar.jsp");
	    	        
	    	     } catch (Exception e) {
	    	        e.printStackTrace();
	    	     } finally {
	    	        try {
	    	           if(psmt01 != null) psmt01.close();
	    	           if(conn != null) conn.close();
	    	           if(rs01 != null) rs01.close();
	    	        } catch (Exception e2) {
	    	                 e2.printStackTrace();
	    	        }
	    	     }
		
		
	}

}
