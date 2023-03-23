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
import javax.servlet.http.HttpSession;

import common.FileUploadServiceImpl;
import common.IFileUploadService;
import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;

@MultipartConfig
@WebServlet("/mypageModify.do")
public class MypageModify extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//파라미터 값 조회
		String memId = req.getParameter("memId");
		
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		MemberVO  mv = service.getMember(memId);


		
		req.setAttribute("mv", mv);
		
		// 화면 처리
		RequestDispatcher disp = req.getRequestDispatcher("/WEB-INF/views/mypage/mypageModify.jsp");
		disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
	
		//파라미터값 가져오기
		String memId = req.getParameter("memId");
		String memNm = req.getParameter("memNm");
		String memTel = req.getParameter("memTel");
		String memAddr = req.getParameter("memAddr");
		String memAddr2 = req.getParameter("memAddr2");
		String memEmail = req.getParameter("memEmail");
		String memPw = req.getParameter("memPw"); //form에 있는 name값을 받아서 memPW에 저장해둠
		
		//서비스 객체 생성하기
		IMemberService service = MemberServiceImpl.getService();
		MemberVO mv = new MemberVO();
		
		MemberVO originMemberInfo = service.getMember(memId); //기존 Id 
		
		mv.setMemId(memId);
		mv.setMemNm(memNm);
		mv.setMemTel(memTel);
		mv.setMemAddr(memAddr);
		mv.setMemAddr2(memAddr2);
		mv.setMemEmail(memEmail);
		
		boolean check = true;
		
		if(memPw.equals("")) { //현재 비밀번호(name="memPw")에 아무것도 안적혀있으면 
			mv.setMemPw(originMemberInfo.getMemPw()); //mv에 저장되어있는 기존 pw값을 넘겨주고 
		}else { //현재 비밀번호에 뭔가 적혀있으면 
			String originMemPw = req.getParameter("originMemPw"); // 기존 비밀번호를 name으로 받아서 req에 저장해둔걸 꺼내서  
			if(originMemberInfo.getMemPw().equals(memPw)) { //기존비밀번호와 현재비밀버호가 같으면 
				// 비밀번호 입력 잘함
				mv.setMemPw(memPw); //mv의 memPw에  넘겨서 저장해주기 
			}else {
				// 비밀번호 다름
				check = false;
			}
		}
		
		//비밀번호가 같으면
		if(check) { //check가 true가 넘어올 경우에만 실행 
			FileUploadServiceImpl fileService = new FileUploadServiceImpl();
			boolean result = fileService.saveAtchFilePhoto(req, mv.getAtchFile());

			if(result) {
				mv.setAtchFile(fileService.getFilePath());
				
				//헤더 프로필사진 
				MemberVO vo = (MemberVO) req.getSession().getAttribute("memberVO");
				vo.setAtchFile(fileService.getSavePath());
				req.getSession().setAttribute("memberVO", vo);
				req.getSession().setAttribute("profileUrl", URLEncoder.encode(fileService.getSavePath(), "utf-8"));
			}
			
			//비밀번호 임시 저장
			String tempPw = mv.getMemPw();
			mv.setMemPw("");
			//DB에 저장됨
			int cnt = service.modifyMember(mv);
			
			mv.setMemPw(tempPw);
			
			resp.sendRedirect(req.getContextPath() + "/mypage.do?memId=" + memId);
		//비밀번호가 다르면
		}else {
			//새로운 비밀번호로 세팅
			mv.setMemPw(memPw);
			
			//DB에 저장됨
			int cnt = service.modifyMember(mv);
			//세션 종료
			HttpSession session = req.getSession();
			session.invalidate();
			
			resp.sendRedirect(req.getContextPath() + "/login.do");
		}
		

		
		
//		if(memPw.equals("")) {//비밀번호 유지
//			resp.sendRedirect(req.getContextPath() + "/mypage.do?memId=" + memId);
//		}else {//비밀번호 변경
//			resp.sendRedirect(req.getContextPath() + "/login.do");
//		}
		
		
		
	
	}
	
}

