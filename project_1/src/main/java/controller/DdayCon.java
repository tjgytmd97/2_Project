package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Certificate;


@WebServlet("/DdayCon")
public class DdayCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * // 1. 값 가져오기 // 2. 자격증 번호, 자격증 이름, 필기 / 실기 시험 시작일 // 3. 현재 날짜에서 제일 가까운 날짜 2개
		 * 가져오기 // 3-1. 현재 이후 날짜에서 제일 작은 거(if(now<date){제일 작은거}) // 4. 그 날짜가 어떤 자격증의
		 * 필기인지 실기인지 알아야 함
		 * 
		 * //사용자가 북마크 한 자격증 정보들 HttpSession session = request.getSession();
		 * ArrayList<Certificate> list = (ArrayList)session.getAttribute("myCertiDate");
		 * 
		 * //현재 시스템 시간 //date를 문자열로 바꾸기 SimpleDateFormat formatter = new
		 * SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * Date now = new Date(); String formatedNow = formatter.format(now);
		 * 
		 * now = formatter.parse(formatedNow);
		 * 
		 * Date hndwDate = new Date(); Date prctcDate = new Date();
		 * 
		 * String hString = "없음"; String pString = "없음";
		 * 
		 * int hIndex = 0; int pIndex = 0;
		 * 
		 * String hName = ""; String pName = "";
		 * 
		 * long hCal = 0; int hDdays =0; long pCal = 0; int pDdays = 0;
		 * 
		 * String lineDate = "9999-12-31"; Date hndwMin = new Date(); Date prctcMin =
		 * new Date();
		 * 
		 * for(int i=0; i<list.size();i++){
		 * if(list.get(i).getCerti_hndw_test_start_date()!=null) { hndwDate =
		 * formatter.parse(list.get(i).getCerti_hndw_test_start_date());
		 * 
		 * System.out.println("hndwDate : "+hndwDate);
		 * System.out.println("prctcDate : "+prctcDate); if(hndwDate.after(now)) { //이후
		 * 날짜들 hndwMin = formatter.parse(lineDate);
		 * 
		 * //hndwDate if(hndwDate.before(hndwMin)){ hndwMin = hndwDate; hIndex = i;
		 * //System.out.println("필기인덱스 : "+i); } } else{
		 * //System.out.println(formatter.format(hndwDate)+"\n이전날짜 입니다\n\n"); }
		 * 
		 * hName = list.get(hIndex).getCerti_name(); hCal = hndwMin.getTime() -
		 * now.getTime(); hDdays = (int) (hCal / ( 24*60*60*1000)); }
		 * 
		 * if(list.get(i).getCerti_prctc_test_start_date()!=null) { // 현재 이후 날짜 구하기
		 * prctcDate =formatter.parse(list.get(i).getCerti_prctc_test_start_date());
		 * 
		 * if(prctcDate.after(now)) { prctcMin = formatter.parse(lineDate);
		 * 
		 * if(prctcDate.before(prctcMin)){ prctcMin = prctcDate; pIndex = i;
		 * //System.out.println("실기인덱스 : "+i); } } else{
		 * //System.out.println(formatter.format(prctcDate)+"\n이전날짜 입니다\n\n"); } pName =
		 * list.get(pIndex).getCerti_name(); pCal = prctcMin.getTime() - now.getTime();
		 * pDdays = (int) (pCal / ( 24*60*60*1000));
		 * 
		 * } }
		 * 
		 * System.out.println("hDdays : " + hDdays); System.out.println("pDdays : " +
		 * pDdays);
		 * 
		 * 
		 * session.setAttribute("hName", hName); session.setAttribute("pName", pName);
		 * session.setAttribute("hDdays", hDdays); session.setAttribute("pDdays",
		 * pDdays);
		 * 
		 * response.sendRedirect("login_calendar.jsp");
		 */
	}
	
}
