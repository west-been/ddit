package controller;

import java.io.IOException;
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
import vo.MemberVO;

@MultipartConfig
@WebServlet("/mypageModifyPw.do")
public class MypageModifyPw extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String memId = req.getParameter("memId");
		
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		MemberVO  mv = service.getMember(memId);


		
		req.setAttribute("mv", mv);
		
		// 화면 처리
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageModifyPw.jsp");
		disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
	
		//파라미터값 가져오기
		String memId = req.getParameter("memId");
		String memPw = req.getParameter("memPw");
	
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		MemberVO mv = new MemberVO();
		
		IFileUploadService fileService = new FileUploadServiceImpl();
		boolean result = fileService.saveAtchFilePhoto(req, mv.getAtchFile());

		mv.setMemId(memId);
		mv.setMemPw(memPw);
		
		if(result) {
			mv.setAtchFile(fileService.getSavePath());
		}

		
		//int cnt = service.modifyMember(mv);
		int cnt = service.updateMemberPw(mv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg ="실패 ";
		}
		
		
		
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/mypage.do?memId=" + memId);
		
	
	}
	
}

