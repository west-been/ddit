package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ITourReservationService;
import service.TourReservationServiceImpl;
import vo.MemberVO;
import vo.ReservationVO;
import vo.TourVO;

@WebServlet("/reserveach.do")
public class reservationEach extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String tourCode = req.getParameter("tourCode");
		
		ITourReservationService tourService = TourReservationServiceImpl.getService();
		
		TourVO tv = tourService.getTour(tourCode);
		
		// 관광지 운영일자가 현재일자를 넘겼을경우 예약가능인원을 0으로 만들어 예약불가 상태로 만들어버림
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 
		Date date = null;
		try {date = new Date(dateFormat.parse(tv.getEndDate()).getTime());} catch (ParseException e) {e.printStackTrace();} 
		Date today = null;
		try {today = new Date(dateFormat.parse(todayfm).getTime());} catch (ParseException e) {e.printStackTrace();}
		 
		//compareTo메서드를 통한 날짜비교
		int compare = date.compareTo(today); 
		
		String dateEndMsg = "";
		if(compare<0) {
			int cnt = tourService.checkTourEndDate(tv);
			if(cnt > 0) {
				dateEndMsg = "변경성공";
				req.getSession().setAttribute("dateEndMsg", dateEndMsg);
				
				req.setAttribute("tv", tv);
				
				RequestDispatcher disp = req.getRequestDispatcher("/reserv.do");
				disp.forward(req, resp);
			}
		} else {
			req.setAttribute("tv", tv);
			
			RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/reservation/reservationEach.jsp");
			disp.forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String paymentAmount = req.getParameter("paymentAmountVal");
		String reservationCnt = req.getParameter("cntVal");
		String tourCode = req.getParameter("tourCode");
		String useMileage =req.getParameter("useMileage");
		
		HttpSession session = req.getSession();
		
		ITourReservationService tourReservationService = TourReservationServiceImpl.getService();
		
		MemberVO mv = (MemberVO)session.getAttribute("memberVO");
		ReservationVO rv = new ReservationVO();
		rv.setResPrice(paymentAmount);
		rv.setResQty(reservationCnt);
		rv.setMemId(mv.getMemId());
		rv.setTourCode(tourCode);
		rv.setUseMileage(useMileage);
		
		TourVO tv = tourReservationService.getTour(tourCode); 
		String reservMsg="";
		boolean check = tourReservationService.countReservation(rv);
		if(!check) {
			
			int cnt = tourReservationService.reservationTour(rv);
			reservMsg= "";
			if(cnt > 0) {
				// 성공
				reservMsg = "성공";
				
			} else {
				// 실패
				reservMsg = "실패";
			}
			tourReservationService.updateMileage(rv);
			tourReservationService.updateTourCapacity(tv);
			String resCode = tourReservationService.getResCode(rv);
			rv.setResCode(resCode);
			resp.sendRedirect(req.getContextPath() + "/reservcompletion.do?resCode="+rv.getResCode()+"&tourCode="+rv.getTourCode());
		} else{
			reservMsg = "예약실패";
			req.getSession().setAttribute("reservMsg", reservMsg);
			resp.sendRedirect(req.getContextPath() + "/mypage.do?memId="+mv.getMemId());
		}
		
		
	}
}





























