package controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.ReviewServiceImpl;
import vo.ReviewVO;

@MultipartConfig
@WebServlet("/reviewUpdate.do")
public class ReviewUpdate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String revCode = req.getParameter("revCode");
		
		ReviewServiceImpl revService = ReviewServiceImpl.getService();
		ReviewVO rv = revService.getReview(revCode);
		
		
		req.setAttribute("rv", rv);
		
		req.getRequestDispatcher("/WEB-INF/views/review/reviewUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String revCode = req.getParameter("revCode");
		String revTitle = req.getParameter("revTitle");
		String revContent = req.getParameter("revContent");;
		String score = req.getParameter("score");
		String atchFile = req.getParameter("atchFile");
		
		ReviewServiceImpl revService = ReviewServiceImpl.getService();
		ReviewVO rv = new ReviewVO();
		
		IFileUploadService fileService = new FileUploadServiceImpl();
		boolean isOk = fileService.saveAtchFilePhoto(req, rv.getAtchFile());
		
		if(isOk) {
		rv.setAtchFile(fileService.getSavePath());
		}
		
		rv.setScore(score);
		rv.setRevCode(revCode);
		rv.setRevTitle(revTitle);
		rv.setRevContent(revContent);
		
		int cnt = revService.updateReview(rv);
		
		resp.sendRedirect(req.getContextPath() + "/review.do");

		
	}
}
