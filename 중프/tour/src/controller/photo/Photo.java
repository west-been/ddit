package controller.photo;

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

import service.IPhotoService;
import service.PhotoServiceImpl;
import vo.PhotoVO;

@WebServlet("/photo.do")
public class Photo extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		//페이징 
		int currentPage = 1; // 현재 페이지 값
		currentPage  = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		//파라미터 값 조회
		String pv = req.getParameter("pv");
		
		// 조회수를 위해 추가함
		String photoCode = req.getParameter("photoCode");
		
		//서비스 객체 생성하기
		IPhotoService service = PhotoServiceImpl.getInstance();
		
		//페이징
		int count = service.photoCountList(); //전체 글 갯수
		int perPage = 4; // 한 화면에 출력할 페이지수
		int perList = 9; // 한 페이지에 출력할 글 개수
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;

		//검색 요청 파라미터 처리
		String stx = req.getParameter("stx");
		String sfl = req.getParameter("sfl");

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("stx", stx);
		map.put("sfl", sfl);

//		map.put("bo_table", bo_table);
//		map.put("sca", sca);
//		map.put("sop", sop);
		
		List<PhotoVO> selectAllPhoto = service.selectAllPhoto(map);
		req.setAttribute("selectAllPhoto", selectAllPhoto);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("cPage", currentPage);
		
		// 메인화면에 띄우기
		List<PhotoVO> PhotoAll = service.PhotoAll(map);
		req.setAttribute("PhotoAll", PhotoAll);
		req.setAttribute("pv", pv);

		// 조회수를 위해 추가함
		PhotoVO pv2 = service.getPhoto(photoCode);
		service.updateHits(pv2);
		req.setAttribute("pv2", pv2);
		
		//화면 처리하기 
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/photo/photo.jsp");
		disp.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}


