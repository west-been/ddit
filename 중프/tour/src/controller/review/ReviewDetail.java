package controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewServiceImpl;
import vo.ReviewVO;

@WebServlet("/reviewDetail.do")
public class ReviewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String revCode = req.getParameter("revCode");

		ReviewServiceImpl revService = ReviewServiceImpl.getService();

		ReviewVO rv = revService.getReview(revCode);
		
		revService.updateHits(rv);

		req.setAttribute("rv", rv);

		// JSP에게 포워딩 처리
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/review/reviewDetail.jsp");
		disp.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
