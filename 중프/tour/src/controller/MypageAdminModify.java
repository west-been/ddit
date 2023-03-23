package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.IMemberService;
import service.MemberServiceImpl;
import vo.AdminVO;
import vo.MemberVO;

@MultipartConfig
@WebServlet("/mypageAdminModify.do")
public class MypageAdminModify extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String adminId = req.getParameter("adminId");
		
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		AdminVO  av = service.getAdminLogin(adminId);

		req.setAttribute("av", av);
		
		// 화면 처리
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageAdminModify.jsp");
		disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
	
		//파라미터값 가져오기
		String adminId = req.getParameter("adminId");
		String adminNm = req.getParameter("adminNm");
		String adminTel = req.getParameter("adminTel");
		String adminAddr = req.getParameter("adminAddr");
		String adminAdd2 = req.getParameter("adminAdd2");
		String adminEmail = req.getParameter("adminEmail");
		String adminPw = req.getParameter("adminPw");
		
		
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		AdminVO av = new AdminVO();
		
		
		AdminVO originAdminInfo = service.getAdminLogin(adminId); //기존 Id 
		
		av.setAdminId(adminId);
		av.setAdminNm(adminNm);
		av.setAdminTel(adminTel);
		av.setAdminAddr(adminAddr);
		av.setAdminAdd2(adminAdd2);
		av.setAdminEmail(adminEmail);
		
		boolean check = true;

		if(adminPw.equals("")) { 
			av.setAdminPw(originAdminInfo.getAdminPw());
		}else {
			String originAdminPw =  req.getParameter("originAdminPw");
			if(originAdminInfo.getAdminPw().equals(originAdminPw)){
				av.setAdminPw(adminPw);
			}else {
				check = false;
			}
		}
		
		
		if(check) {
			FileUploadServiceImpl fileService = new FileUploadServiceImpl();
			boolean result = fileService.saveAtchFilePhoto(req, av.getAtchFile());

			if(result) {
				av.setAtchFile(fileService.getFilePath());
				
				AdminVO vo = (AdminVO) req.getSession().getAttribute("adminVO");
				vo.setAtchFile(fileService.getSavePath());
				req.getSession().setAttribute("adminVO", vo);
				req.getSession().setAttribute("profileUrl", URLEncoder.encode(fileService.getSavePath(), "utf-8"));
				
				
			}
			int cnt = service.updateAdmin(av);
			
		}else {
			
		}
		
		resp.sendRedirect(req.getContextPath() + "/mypageAdmin.do?adminId=" + adminId);
		
	
	}
	
}

