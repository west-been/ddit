package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/reservcompletion.do")
public class reservationCompletion extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String tourCode = req.getParameter("tourCode");
		String resCode = req.getParameter("resCode");
		String resStatus = req.getParameter("resStatus");
		
		ITourReservationService tourService = TourReservationServiceImpl.getService();
		
		if(tourCode!=null) {
			TourVO tv = tourService.getTour(tourCode);			
			req.setAttribute("tv", tv);
			
		}
		if(resCode!=null) {
			ReservationVO rv = tourService.getReserv(resCode);
			req.setAttribute("rv", rv);
			if(resStatus!=null) {
				rv.setResStatus(resStatus);			
			}
		}
		
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/reservation/reservationCompletion.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String resCode = req.getParameter("resCode");
		HttpSession session = req.getSession();
		ITourReservationService tourService = TourReservationServiceImpl.getService();
		MemberVO mv = (MemberVO)session.getAttribute("memberVO");
		ReservationVO rv = tourService.getReserv(resCode);
		
		int cancelTour = tourService.updateCancelTourCapacity(resCode);

		int cnt=0;
		int refundMileage = 0;
		if(rv.getResStatus().equals("결제대기")){
			tourService.returnMileage(rv);
		} else {
			refundMileage = Integer.parseInt(rv.getUseMileage()) + Integer.parseInt(rv.getResPrice());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", mv.getMemId());
			map.put("refundMileage", refundMileage);
			
			tourService.refundMileage(map);
		}
		cnt = tourService.cancelReserv(resCode);
		
		String cancelMsg= "";
		if(cnt > 0) {
			// 성공
			cancelMsg = "성공";
		} else {
			// 실패
			cancelMsg = "실패";
		}
		
		req.getSession().setAttribute("cancelMsg", cancelMsg);
		resp.sendRedirect(req.getContextPath() + "/mypage.do?memId="+mv.getMemId());
	}
}
