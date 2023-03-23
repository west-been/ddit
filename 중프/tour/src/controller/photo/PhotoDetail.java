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

@WebServlet("/photoDetail.do")
public class PhotoDetail<ModelAndView> extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 파라미터값 조회
		String photoCode = request.getParameter("photoCode");

		// 서비스 객체 생성
		IPhotoService ptService = PhotoServiceImpl.getInstance();

		// 전달 파라미터를 VO에 저장
		PhotoVO pv = ptService.getPhoto(photoCode);

		ptService.updateHits(pv);

		// 글 상세보기 조회
		request.setAttribute("pv", pv);

		// JSP에 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("WEB-INF/views/photo/photoDetail.jsp");
		disp.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
