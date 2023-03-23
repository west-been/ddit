package controller.photo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import service.IPhotoService;
import service.PhotoServiceImpl;
import vo.PhotoVO;

@MultipartConfig // 사진첨부할 때 필수
@WebServlet("/photoUpdate.do")
public class PhotoUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파라미터 값 조회
		String photoCode = request.getParameter("photoCode");
		
		// 서비스 객체 생성
		IPhotoService ptService = PhotoServiceImpl.getInstance();
		PhotoVO pv = ptService.getPhoto(photoCode);

		// 보관
		request.setAttribute("pv", pv);

		// jsp에게 넘김
		request.getRequestDispatcher("/WEB-INF/views/photo/photoUpdate.jsp").forward(request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 파라미터 값 가져오기
		// 기본키인 코드값으로 구별해야하므로 작성
		String photoCode = request.getParameter("photoCode"); 
		String photoTitle = request.getParameter("photoTitle");
		String atchFile = request.getParameter("atchFile");
		
		// update할 서비스객체 생성
		IPhotoService ptService = PhotoServiceImpl.getInstance();
		PhotoVO pv = new PhotoVO();
		
		
		
			FileUploadServiceImpl fileService = new FileUploadServiceImpl();
			boolean result = fileService.saveAtchFilePhoto(request, pv.getAtchFile());
			
			if(result) {
				pv.setAtchFile(fileService.getFilePath());
			}
		
		
		//fileService.saveAtchFilePhoto(request, pv.getAtchFile());

		pv.setPhotoCode(photoCode);
		pv.setPhotoTitle(photoTitle);
		//pv.setAtchFile(fileService.getSavePath());
		int cnt = ptService.modifyPhoto(pv);

		// 오라클에 insert

		
		
		response.sendRedirect(request.getContextPath() + "/adminPhoto.do");

/*		if (msg.equals("성공")) {

			response.sendRedirect("/tour/adminPhoto.do");
		} else {
			response.sendRedirect("/tour/adminPhoto.do");

		}*/

	}

}
