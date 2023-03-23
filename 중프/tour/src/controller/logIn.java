package controller;

//////////////////////////////
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.TourMemberServiceImpl;
import vo.AdminVO;
import vo.MemberVO;

@WebServlet("/login.do")
public class logIn extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/views/logIn/login.jsp").forward(req, resp);

	}

	// 요청파라미터 : {"id":"a001","password","1234"}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TourMemberServiceImpl service = TourMemberServiceImpl.getService();

		String id = req.getParameter("id");
		String password = req.getParameter("password");
		System.out.println("id : " + id + ", password : " + password);

		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(id);
		memberVO.setMemPw(password);

		AdminVO adminVO = new AdminVO();
		adminVO.setAdminId(id);
		adminVO.setAdminPw(password);

		// 1) 일반 회원 로그인
		memberVO = service.loginMember(memberVO);

		// 2)관리자 로그인
		adminVO = service.adminlogin(adminVO);

		if (memberVO != null) {
			HttpSession session = req.getSession();
			session.setAttribute("memberVO", memberVO);
			resp.sendRedirect("/tour/index.do");
			
			memberVO.getAtchFile();
		}
		else if (adminVO != null) {
			
			HttpSession session = req.getSession();
			session.setAttribute("adminVO", adminVO);
			resp.sendRedirect("/tour/index.do");
			
			adminVO.getAtchFile();

			
		} else if(memberVO == null || adminVO == null){
			req.getSession().setAttribute("msg1", "2");
			req.getSession().setAttribute("msg", "비밀번호 실패");
			resp.sendRedirect("/tour/login.do");
		}
		
	}
}