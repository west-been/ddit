package controller;

import java.io.IOException;

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

@WebServlet("/reservationPayfinish.do")
public class reservationPayfinish extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/reservation/reservationPayfinish.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String resStatus = req.getParameter("paymentResult");
		String resCode = req.getParameter("reservCode");
		System.out.println("resCode:" + resCode);
		
		HttpSession session = req.getSession();
		
		MemberVO mv = (MemberVO)session.getAttribute("memberVO");
		
		ITourReservationService tourService = TourReservationServiceImpl.getService();
		ReservationVO rv = tourService.getReserv(resCode);
		rv.setResStatus(resStatus);
		rv.setResCode(resCode);
		int cnt = tourService.updateResStatus(rv);
		
		String paymentMsg= "";
		if(cnt > 0) {
			// 성공
			paymentMsg = "성공";
			
		} else {
			// 실패
			paymentMsg = "실패";
		}
		req.getSession().setAttribute("paymentMsg", paymentMsg);
		resp.sendRedirect(req.getContextPath() + "/mypage.do?memId="+mv.getMemId());
	}
}
