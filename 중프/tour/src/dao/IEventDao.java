package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.EventVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행 후 결과를 작성하여 서비스에 전달하는 DAO의 Interface
 */
public interface IEventDao {
	/**
	 * EventVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * 
	 * @param ev DB에 insert할 데이터가 저장된 EventVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int insertEvent(EventVO ev);

	/**
	 * 축제코드의 존재여부에 대한 메서드
	 * 
	 * @param eventCode 확인대상 축제코드
	 * @return 해당 축제코드가 있으면 true, 없으면 false
	 */
	public boolean checkEvent(String eventCode);

	/**
	 * 주어진 축제코드에 해당하는 축제정보를 알아내기 위한 메서드(관리자)
	 * 
	 * @param eventCode 확인대상 축제코드
	 * @return 해당 축제코드에 맞는 축제정보
	 */
	public EventVO getEvent(String eventCode);

	/**
	 * 하나의 eventVO 객체를 이용하여 DB정보를 update하는 메서드
	 * 
	 * @param ev update할 축제정보가 들어있는 EventVO 객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int updateEvent(EventVO ev);

	/**
	 * 축제코드를 매개변수로 받아서 해당 게시글을 삭제하는 메서드
	 * 
	 * @param eventCode 삭제할 사진코드
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int deleteEvent(String eventCode);

	/**
	 * DB 테이블에 존재하는 전체 축제 목록을 조회하기 위한 메서드
	 * 
	 * @param map
	 * @return 축제 목록을 담고 있는 List타입의 객체
	 */
	public List<EventVO> selectAllEvent(Map<String, Object> map);

	/**
	 * EventVO에 담긴 데이터를 이용하여 축제 게시글을 검색하는 메서드
	 * 
	 * @param ev 축제정보를 검색하기 위한 메서드
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<EventVO> searchEvent(Map<String, Object> map);

	
	//사용자 게시글 수 
	public int countList() throws SQLException;

	/**
	 * 축제글 선택 시 조회수가 올라가는 메서드
	 * 
	 * @param ev
	 * @return
	 */
	public int updateHits(EventVO ev);
	
	
//	사용자 상세 => 관리자와 같이 사용
//	public List<EventVO> selectEvent(String eventCode);
	
	//이벤트 메인
	public List<EventVO> EventAll(Map<String, Object> map);

	
	
}
