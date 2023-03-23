package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.EventVO;

public class EventDaoImpl extends TourMyBaitsDao implements IEventDao {

	private static IEventDao evDao;
	
	public EventDaoImpl() {
	}

	public static IEventDao getInstance() {
		if (evDao == null) {
			evDao = new EventDaoImpl();
		}
		return evDao;
	}

	@Override
	public int insertEvent(EventVO ev) {
		return insert("event.inserEvent", ev);
	}

	@Override
	public boolean checkEvent(String eventCode) {
		boolean isExist = false;
		int cnt = (int) selectOne("event.checkEvent", eventCode);
		if (cnt > 0) {
			isExist = true;
		}
		return isExist;
	}

	@Override
	public EventVO getEvent(String eventCode) {
		return selectOne("event.selectDetailEvent", eventCode);
	}

	@Override
	public int updateEvent(EventVO ev) {
		return update("event.updateEvent", ev);
	}

	@Override
	public int deleteEvent(String eventCode) {
		return delete("event.deleteEvent", eventCode);
	}

	@Override
	public List<EventVO> selectAllEvent(Map<String, Object> map) {
		return selectList("event.selectAllEvent", map);
	}

	@Override
	public List<EventVO> searchEvent(Map<String, Object> map) {
		return selectList("event.searchEvent", map);
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("event.eventCountList", null);
	}

	@Override
	public int updateHits(EventVO ev) {
		return update("event.updateHits", ev);
	}

	
	//사용자 상세 => 관리자와 같이 사용
//	@Override
//	public List<EventVO> selectEvent(String eventCode) {
//		return selectList("event.selectEvent", eventCode);
//	}
	
	//이벤트 메인 
	@Override
	public List<EventVO> EventAll(Map<String, Object> map) {
		return selectList("event.EventAll", map);
	}
	


}
