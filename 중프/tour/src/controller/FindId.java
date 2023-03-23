package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TourMemberDaoImpl;
import service.TourMemberServiceImpl;
import vo.MemberVO;

//아이디 찾기
@MultipartConfig
@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	
	TourMemberServiceImpl service = TourMemberServiceImpl.getService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/logIn/findId.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		String memNm = req.getParameter("memNm");
		String memTel = req.getParameter("memTel");
		   System.out.println("memNm" + memNm + "memTel : " + memTel );
		   
		   MemberVO memberVO = new MemberVO();
		   memberVO.setMemNm(memNm);
		   memberVO.setMemTel(memTel);
		   System.out.println(memberVO);
		   
		   //1) 아디찾기
		   String findId = service.findId(memberVO);
		   System.out.println("findId -> memberVO : " + findId);
		   
		   if(findId != null && findId.length() > 0) {
			   req.getSession().setAttribute("findId", findId);
		   }else {
			   req.getSession().setAttribute("findId", "NOID");
			   System.out.println("else으로 들어옴");
		   }
		   
		   req.getRequestDispatcher("/login.do").forward(req, resp);
		
	}
	
}
