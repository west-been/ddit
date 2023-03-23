package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.INoticeDao;
import dao.NoticeDaoImpl;
import dao.TourMyBaitsDao;
import vo.NoticeVO;

public class NoticeServiceImpl extends TourMyBaitsDao implements INoticeService {

	//싱글톤1번
	private INoticeDao noticeDao;
	private static NoticeServiceImpl noticeService;


	//싱글톤2번
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
	}
	//싱글톤3번
	public static INoticeService getInstance() {
		if(noticeService ==null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}


	@Override
	public int registNotice(NoticeVO nv) {
		
		int cnt = noticeDao.insertNotice(nv);

		if(cnt > 0) {
		}
		return cnt;
	}

	@Override
	public boolean checkNotice(String noticeCode) {

		boolean exist = noticeDao.checkNotice(noticeCode);

		return exist;
	}

	@Override
	public NoticeVO getNotice(String noticeCode) {

		return noticeDao.getNotice(noticeCode);
	}

	@Override
	public int modifyNotice(NoticeVO nv) {
		
		int cnt = noticeDao.updateNotice(nv);

		return cnt;
	}

	@Override
	public int removeNotice(String noticeCode) {
		int cnt = noticeDao.deleteNotice(noticeCode);

		return cnt;
	}

	@Override
	public List<NoticeVO> selectAllNotice(Map<String,Object> map) {

		List<NoticeVO> noticeList = noticeDao.selectAllNotice(map);

		return noticeList;
	}

	@Override
	public List<NoticeVO> searchNotice(NoticeVO nv) {
		List<NoticeVO> noticeList = noticeDao.searchNotice(nv);

		return noticeList;
	}
	
	@Override
	public int countList() {
		int cnt = 0;
		try {
			cnt = noticeDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	// 조회수
	@Override
	public int updateHits(NoticeVO nv) {
	
		int cnt = noticeDao.updateHits(nv);
		
		return cnt;
	}
	
	//메인 공지사항 
	@Override
	public List<NoticeVO> NoticeAll(Map<String, Object> map) {
		List<NoticeVO> noticeList = noticeDao.NoticeAll(map);
		return noticeList;
	}
	
	

}
