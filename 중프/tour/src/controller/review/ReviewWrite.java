package controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.IReviewService;
import service.ReviewServiceImpl;
import service.TourReservationServiceImpl;
import vo.ReviewVO;
import vo.TourVO;

@MultipartConfig
@WebServlet("/reviewWrite.do")
public class ReviewWrite extends HttpServlet{


	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TourReservationServiceImpl service = TourReservationServiceImpl.getService();
		
		int start = 1;
		int end = service.countList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<TourVO> list = service.tourList(map);
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("WEB-INF/views/review/reviewWrite.jsp").forward(req, resp);
		
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 값 
		req.setCharacterEncoding("utf-8");	
		resp.setCharacterEncoding("utf-8");	

		String tourNm = req.getParameter("tourNm");
		String revTitle = req.getParameter("revTitle");
		String memId = req.getParameter("memId");
		// 	String replyDate = req.getParameter("replyDate");
		String revContent = req.getParameter("revContent");
		String atchFile = req.getParameter("atchFile");
		String score = req.getParameter("score");
		
		IReviewService revService = ReviewServiceImpl.getService();
		ReviewVO rv = new ReviewVO();
		IFileUploadService fileService = new FileUploadServiceImpl();
		boolean isOk = fileService.saveAtchFilePhoto(req, rv.getAtchFile());
		
		if(isOk) {
			rv.setAtchFile(fileService.getSavePath());
		}
		
		
		rv.setTourNm(tourNm);
		rv.setRevTitle(revTitle);
		// qv.setReplyDate(replyDate);
		rv.setMemId(memId);
		rv.setRevContent(revContent);
		rv.setScore(score);

		
		int cnt = revService.reviewWrite(rv);
		String msg = "";
		if(cnt>0){
			msg="성공";
		} else {
			msg = "실패";
		}
			

		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect("/tour/review.do");
	}
	
}


