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

import service.IReviewService;
import service.ReviewServiceImpl;
import vo.ReviewVO;

@MultipartConfig
@WebServlet("/review.do")
public class Review extends HttpServlet{


	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		// 서비스 객체 생성하기
		
		
		int currentPage = 1; // 현재 페이지 값
		currentPage  
		= req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		ReviewServiceImpl reviewService = ReviewServiceImpl.getService(); 
		 
		int count = reviewService.countList();
		int perPage = 4; // 한 화면에 출력할 페이지수
		int perList = 5; // 한 페이지에 출력할 글 개수
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		String bo_table = req.getParameter("bo_table");
		String sca = req.getParameter("sca");
		String sop = req.getParameter("sop");
		String sfl = req.getParameter("sfl");
		String stx = req.getParameter("stx");
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		map.put("bo_table", bo_table);
		map.put("sca", sca);
		map.put("sop", sop);
		map.put("sfl", sfl);
		map.put("stx", stx);
		
		
		List<ReviewVO> reviewList = reviewService.selectAllReview(map);
		
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("cPage", currentPage);

		
		// 글 목록 화면 처리하기
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/review/review.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}


