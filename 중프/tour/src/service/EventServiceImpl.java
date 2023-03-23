package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.EventDaoImpl;
import dao.IEventDao;
import vo.EventVO;

public class EventServiceImpl implements IEventService {

	// 싱글톤
	private static IEventService evService;
	private IEventDao evDao;

	public EventServiceImpl() {
		evDao = EventDaoImpl.getInstance();
	}

	public static IEventService getInstance() {
		if (evService == null) {
			evService = new EventServiceImpl();
		}
		return evService;
	}

	@Override
	public int registEvent(EventVO ev) {
		int cnt = evDao.insertEvent(ev);
		return cnt;
	}

	@Override
	public boolean checkEvent(String eventCode) {
		boolean exist = evDao.checkEvent(eventCode);
		return exist;
	}

	@Override
	public EventVO getEvent(String eventCode) {
		return evDao.getEvent(eventCode);
	}

	@Override
	public int modifyEvent(EventVO ev) {
		int cnt = evDao.updateEvent(ev);
		return cnt;
	}

	@Override
	public int removeEvent(String eventCode) {
		int cnt = evDao.deleteEvent(eventCode);
		return cnt;
	}

	@Override
	public List<EventVO> selectAllEvent(Map<String, Object> map) {
		List<EventVO> evList = evDao.selectAllEvent(map);
		return evList;
	}

	@Override
	public List<EventVO> searchEvent(Map<String, Object> map) {
		List<EventVO> evList = evDao.searchEvent(map);
		return evList;
	}

	@Override
	public int countList() {
		int cnt = 0;
		try {
			cnt = evDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateHits(EventVO ev) {
		int cnt = evDao.updateHits(ev);
		return cnt;
	}

	
	//사용자 상세화면 => 관리자와 같이 사용
//	@Override
//	public List<EventVO> selectEvent(String eventCode) {
//		
//		List<EventVO> selectEvent = evDao.selectEvent(eventCode);
//		return selectEvent;
//		
//	}

	//메인 이벤트
	@Override
	public List<EventVO> EventAll(Map<String, Object> map) {
		List<EventVO> evList = evDao.EventAll(map);
		return evList;
	}

}
