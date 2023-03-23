package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.websocket.Transformation;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.ITourReservationService;
import service.TourReservationServiceImpl;
import sun.java2d.pipe.SpanShapeRenderer.Simple;
import vo.TourVO;

@MultipartConfig
@WebServlet("/reservationAdd.do")
public class ReservationAdd extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/reservation/reservationAdd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("왔다");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		TourVO tv = new TourVO();
		
		String tourNm = request.getParameter("tourNm");      
		String tourLocation = request.getParameter("tourLocation");
		String tourRegion = request.getParameter("tourRegion") ;  
		String tourTel = request.getParameter("tourTel");     
		String tourSeason = request.getParameter("tourSeason");  
		String tourCategory = request.getParameter("tourCategory");
		String tourInfo = request.getParameter("tourInfo");    
		String tourPrice = request.getParameter("tourPrice");   
		String tourCapacity1 = request.getParameter("tourCapacity");   
		String adminId = request.getParameter("adminId");     
		String startTime = request.getParameter("startTime");     
		String endTime = request.getParameter("endTime");       
		String startDate = request.getParameter("startDate");     
		String endDate = request.getParameter("endDate");       
		

		int tourCapacity = Integer.parseInt(tourCapacity1);
		
		
		
		ITourReservationService trService = TourReservationServiceImpl.getService();
		IFileUploadService fileService = new FileUploadServiceImpl();
		
		fileService.saveAtchFilePhoto(request, tv.getAtchFile());
		
		
		tv.setTourNm(tourNm);
		tv.setTourLocation(tourLocation);
		tv.setTourRegion(tourRegion);
		tv.setTourTel(tourTel);
		tv.setTourSeason(tourSeason);
		tv.setTourCategory(tourCategory);
		tv.setTourInfo(tourInfo);
		tv.setTourPrice(tourPrice);
		tv.setTourCapacity(tourCapacity);
		tv.setAdminId(adminId);
		tv.setStartTime(startTime);
		tv.setEndTime(endTime);
		tv.setStartDate(startDate);
		tv.setEndDate(endDate);
		tv.setAtchFile(fileService.getSavePath());
		
		int cnt = trService.insertSpot(tv);
		
		String msg = "";
		
		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		//세션객체의 msg 속성의 값에 msg 값 넣기
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/reserv.do");
	}

}
