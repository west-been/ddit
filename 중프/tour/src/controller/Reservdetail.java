package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ITourReservationService;
import service.ReviewServiceImpl;
import service.TourReservationServiceImpl;
import vo.ReviewVO;
import vo.TourVO;

@WebServlet("/reservdetail.do")
public class Reservdetail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String tourCode = req.getParameter("tourCode");
		
		ITourReservationService tourService = TourReservationServiceImpl.getService();
		ReviewServiceImpl reviewService = ReviewServiceImpl.getService();
		
		
		TourVO tv = tourService.getTour(tourCode);
		 
		ReviewVO rv = reviewService.scoreAvg(tourCode);
		List<ReviewVO> reviewList = reviewService.tourReview(tourCode);
		
		
		req.setAttribute("tv", tv);
		req.setAttribute("rv", rv);
		req.setAttribute("reviewList", reviewList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/views/reservation/reservdetail.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
























