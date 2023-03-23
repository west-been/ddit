package controller.photo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IPhotoService;
import service.PhotoServiceImpl;
import vo.PhotoVO;

@WebServlet("/photoHits.do")
public class PhotoHits extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String photoCode = request.getParameter("photoCode");

		IPhotoService ptService = PhotoServiceImpl.getInstance();

//		PhotoVO pv = ptService.getPhoto(photoCode);
		
		PhotoVO pv = new PhotoVO();
		pv.setPhotoCode(photoCode);

		System.out.println("pv : " + pv);
		
		ptService.updateHits(pv);

		request.setAttribute("pv", pv);

		RequestDispatcher disp = request.getRequestDispatcher("WEB-INF/views/photo/photo.jsp");
		disp.forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/photo.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
//		String photoHits = request.getParameter("photoHits");
		//1 증가 시킬 대상 기본키
		String photoCode = request.getParameter("photoCode");

		IPhotoService ptService = PhotoServiceImpl.getInstance();
		PhotoVO pv = new PhotoVO();
		pv.setPhotoCode(photoCode);
		
		System.out.println("pv : " + pv);

		int cnt = ptService.updateHits(pv);
		response.sendRedirect(request.getContextPath() + "/photo.do");

	}

}
