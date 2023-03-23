package controller.photo;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IPhotoService;
import service.PhotoServiceImpl;

@MultipartConfig
@WebServlet("/photoDelete.do")
public class PhotoDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 삭제 요청 사진코드 매개값으로 가져옴
		String photoCode = request.getParameter("photoCode");
		
		IPhotoService ptService = PhotoServiceImpl.getInstance();

		// 리턴 값 반환
		int cnt = ptService.removePhoto(photoCode);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/adminPhoto.do");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
