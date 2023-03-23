package controller.photo;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.IPhotoService;
import service.PhotoServiceImpl;
import vo.PhotoVO;

//트래블라운지란?의 [작성하기]버튼을 클릭하여 게시물 등록(POST방식)

@MultipartConfig
@WebServlet("/photoWrite.do")
public class PhotoWrite extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/photo/photoWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("왔다");
		
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		PhotoVO pv = new PhotoVO();
		
		String photoTitle = req.getParameter("photoTitle");
		String adminId = req.getParameter("adminId");		
		
		IPhotoService ptService = PhotoServiceImpl.getInstance();
		IFileUploadService fileService = new FileUploadServiceImpl();
		
		//PhotoVO [photoCode=null, atchFileCode=null
		//, adminId=null, photoNum=0, photoTitle=null, photoDate=null, photoHits=0, atchFile=null]
		
//		if(pv.getAtchFile()==null) {
//			pv.setAtchFile("D:\\A_TeachingMaterial\\03_HighJava\\workspace\\tour\\WebContent\\resources\\images\\uploadPhoto");
//		}
		
		fileService.saveAtchFilePhoto(req, pv.getAtchFile());
		
		
		pv.setPhotoTitle(photoTitle);
		pv.setAdminId(adminId);
		pv.setAtchFile(fileService.getSavePath());
		
		
		
		//오라클에 insert
		int cnt = ptService.registPhoto(pv);
		
		System.out.println("PhotoWrite -> cnt : " + cnt);
		
		String msg = "";
		
		// 잘 됐는지 확인
		if (cnt > 0) {
			// 성공
			msg = "성공";
		} else {
			// 실패
			msg = "실패";
		}
		//세션객체의 msg 속성의 값에 msg 값 넣기
		req.getSession().setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/adminPhoto.do");
	}

}
