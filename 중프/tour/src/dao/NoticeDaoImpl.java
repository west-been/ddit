package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.NoticeVO;

public class NoticeDaoImpl extends TourMyBaitsDao implements INoticeDao {

	private static INoticeDao noticeDao;

	private NoticeDaoImpl() {
	}

	public static INoticeDao getInstance() {
		if(noticeDao == null) {
			noticeDao = new NoticeDaoImpl();
		}
		return noticeDao;
	}
	
	@Override
	public int countList() throws SQLException {
		
		return selectOne("notice.countList", null);
	}

	@Override
	public int insertNotice(NoticeVO nv) {
		//nv.setNoticeCode(null);
		return insert("notice.insertNotice", nv);
	}

	@Override
	public boolean checkNotice(String noticeCode) {

		boolean isExist = false;

		int cnt = (int)selectOne("notice.checkNotice", noticeCode);

		if(cnt > 0 ) {
			isExist = true;
		}
		return isExist;
	}

	@Override
	public NoticeVO getNotice(String noticeCode) {
		return selectOne("notice.selectNotice", noticeCode);
	}

	@Override
	public int updateNotice(NoticeVO nv) {

		return update("notice.updateNotice", nv);
	}

	@Override
	public int deleteNotice(String noticeCode) {

		return delete("notice.deleteNotice", noticeCode);
	}

	@Override
	public List<NoticeVO> selectAllNotice(Map<String,Object> map) {
		return selectList("notice.selectAllNotice", map);
	}

	@Override
	public List<NoticeVO> searchNotice(NoticeVO nv) {
		return selectList("notice.searchNotice", nv);
	}
	
	
// 조회수
	@Override
	public int updateHits(NoticeVO nv) {
		return update("notice.updateHits", nv);
	}

	//메인공지사항
	@Override
	public List<NoticeVO> NoticeAll(Map<String, Object> map) {
		return selectList("notice.NoticeAll", map); 
	}





}
