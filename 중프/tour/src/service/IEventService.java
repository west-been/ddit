package service;

import java.util.List;
import java.util.Map;

import controller.event.Event;
import vo.EventVO;

/**
 * 컨트롤러의 요청을 받아 처리하는 서비스의 Interface
 */
public interface IEventService {
	/**
	 * 게시물을 등록하기 위한 메서드
	 * 
	 * @param ev DB에 등록할 데이터가 저장된 EventVO객체
	 * @return 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registEvent(EventVO ev);

	/**
	 * 축제코드의 존재여부 메서드
	 * 
	 * @param eventCode 확인하려는 축제코드
	 * @return 해당 코드가 있으면 true, 없으면 false
	 */
	public boolean checkEvent(String eventCode);

	/**
	 * 찾으려는 코드와 같은 게시물을 가져오는 메서드
	 * 
	 * @param eventCode 확인대상 축제코드
	 * @return 해당 축제코드에 맞는 정보
	 */
	public EventVO getEvent(String eventCode);

	/**
	 * 게시글을 수정하기 위한 메서드
	 * 
	 * @param ev 수정할 축제정보가 들어있는 EventVO 객체
	 * @return 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int modifyEvent(EventVO ev);

	/**
	 * 축제코드를 매개변수로 받아서 해당 게시글을 삭제하는 메서드
	 * 
	 * @param eventCode
	 * @return
	 */
	public int removeEvent(String eventCode);

	/**
	 * 전체 축제목록을 조회하기 위한 메서드
	 * 
	 * @param map
	 * @return 갤러리 목록을 담고 있는 List 타입의 객체
	 */
	public List<EventVO> selectAllEvent(Map<String, Object> map);

	/**
	 * EventVO에 담긴 데이터를 이용하여 게시물을 검색하는 메서드
	 * 
	 * @param ev 축제정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 list타입의 객체
	 */
	public List<EventVO> searchEvent(Map<String, Object> map);

	/**
	 * 전체 게시물 개수를 나타내는 메서드
	 * 
	 * @return
	 */
	//게시글 갯수
	public int countList();

	/**
	 * 게시물 조회수를 나타내는 메서드
	 * 
	 * @param ev
	 * @return
	 */
	public int updateHits(EventVO ev);
	
	//사용자 상세 화면 => 관리자와 같이 사용
//	public List<EventVO> selectEvent(String eventCode);
	
	
	//메인 이벤트 
	public List<EventVO> EventAll(Map<String, Object> map);
	
	
	
}
