package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQnaService;
import service.QnaServiceImpl;
import vo.QnaVO;

//요청 파라미터 : {"bo_table":"notice","sca":"","sop":"and","sfl":"wr_subject","stx":"검색어"}
// qna 목록
@WebServlet("/qna.do")
public class Qna extends HttpServlet {

	public Qna() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		int currentPage = 1; // 현재 페이지 값
		currentPage  
		= req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		// 서비스 객체 생성하기
		IQnaService qnaService = QnaServiceImpl.getInstance();
		
		int count = qnaService.countList(); //전체 글 갯수
		int perPage = 4; // 한 화면에 출력할 페이지수
		int perList = 5; // 한 페이지에 출력할 글 갯수
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		

	
// 검색 요청 파라미터 처리
		String bo_table = req.getParameter("bo_table");
		String sca = req.getParameter("sca");
		String sop = req.getParameter("sop");
		String sfl = req.getParameter("sfl");
		String stx = req.getParameter("stx");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		map.put("bo_table", bo_table);
		map.put("sca", sca);
		map.put("sop", sop);
		map.put("sfl", sfl);
		map.put("stx", stx);		
		
		
		
		List<QnaVO> qnaList = qnaService.selectAllQna(map);
		
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("cPage", currentPage);

		
		// 글 목록 화면 처리하기
		RequestDispatcher dispatcher 
		= req.getRequestDispatcher("/WEB-INF/views/qna/qna.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
}
