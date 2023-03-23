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

import service.TourReservationServiceImpl;
import vo.TourVO;

//요청 파라미터 : {"bo_table":"notice","sca":"","sop":"and","sfl":"wr_subject","stx":"검색어"}
@WebServlet("/reserv.do")
public class Reservation extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Reservation() {
		 super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		//현재 페이지 값 (default 1page)
				int currentPage = 1;
				
				currentPage 
					= req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
				
				//Service객체 필요 
				TourReservationServiceImpl service = TourReservationServiceImpl.getService();

				
				
				//전체 글갯수 가져오기
				int count = service.countList();
//				//한 화면에 출력할 페이지 수
				int perPage = 4;
//				
//				//한 페이지에 출력할 글 갯수
				int perList = 5;
//				
//				//전체 페이지 수 구하기 = (공식: 전체 글 갯수/페이지 당 글 갯수)
				//double형으로 소수점을 발생시켜 연산해야 정상적인 값을 얻는다.
				int totalPage = (int) Math.ceil((double)count / (double)perList);
				//System.out.print(totalPage);
				
				//페이지에 표시될 게시글의 start/end값 구하기
				//( start공식: (현재페이지-1)-한페이지에출력할글갯수+1 )
				
				// 현재 페이지 1일 때 : (1 - 1) * 5 + 1 = 1
				// 현재 페이지 2일 때 : (2 - 1) * 5 + 1 = 6
				// 현재 페이지 3일 때 : (3 - 1) * 5 + 1 = 11
				// 현재 페이지 4일 때 : (4 - 1) * 5 + 1 = 16
				int start = (currentPage - 1) * perList + 1;
				
				//( end공식: start-한페이지에출력할글갯수-1 )
				
				// 현재 페이지 1일 때 : 1 + 5 - 1 = 5
				// 현재 페이지 2일 때 : 6 + 5 - 1 = 10
				// 현재 페이지 3일 때 : 11 + 5 - 1 = 15
				// 현재 페이지 4일 때 : 16 + 5 - 1 = 20
				// 현재 페이지 5일 때 : 21 + 5 - 1 = 25
				int end = start + perList - 1;
				//전체 글갯수보다 게시글의 끝 값이 더 클 경우, 처리
				if(end > count) end = count;
				
				//화면에 보여질 페이지 번호 구하기
				//(startPage공식: ((현재페이지-1)/화면출력페이지수*화면출력페이지수)+1 )
				
				//1page일때 : ((1-1) / 4 * 4) + 1 = 1
				//2page일때 : ((2-1) / 4 * 4) + 1 = 1
				//3page일때 : ((3-1) / 4 * 4) + 1 = 1
				//4page일때 : ((4-1) / 4 * 4) + 1 = 1
				//5page일때 : ((5-1) / 4 * 4) + 1 = 5
				//6page일때 : ((6-1) / 4 * 4) + 1 = 5
				//7page일때 : ((7-1) / 4 * 4) + 1 = 5 ...
				int startPage = ((currentPage - 1) / perPage * perPage) + 1;
				
				//(endPage공식: startPage + 화면출력페이지수 - 1)
				
				//4page일때 : 1 + 4 - 1 = 4
				//5page일때 : 5 + 4 - 1 = 8
				//6page일때 : 5 + 4 - 1 = 8
				//7page일때 : 5 + 4 - 1 = 8
				//8page일때 : 5 + 4 - 1 = 8
				//9page일때 : 11 + 4 - 1 = 14
				int endPage = startPage + perPage - 1;
				//totalPage보다 endPage의 값이 더 클 경우, 처리
				if(endPage > totalPage) endPage = totalPage;
				
				String bo_table = req.getParameter("bo_table");
				String sca = req.getParameter("sca");
				String sop = req.getParameter("sop");
				String sfl = req.getParameter("sfl");
				String stx = req.getParameter("stx");
				String arraySort = req.getParameter("arraySort");
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				
				map.put("bo_table", bo_table);
				map.put("sca", sca);
				map.put("sop", sop);
				map.put("sfl", sfl);
				map.put("stx", stx);
				map.put("arraySort", arraySort);
				
				List<TourVO> list = service.tourList(map);
				
				req.setAttribute("list", list);
				req.setAttribute("sPage", startPage);
				req.setAttribute("ePage", endPage);
				req.setAttribute("ttPage", totalPage);
				req.setAttribute("cPage", currentPage);
		
		
		RequestDispatcher disp = req.getRequestDispatcher("WEB-INF/views/reservation/reservation.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
