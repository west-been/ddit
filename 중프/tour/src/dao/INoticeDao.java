package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.NoticeVO;

public interface INoticeDao {

	

	
	/**
	 * NoticeVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * 
	 * @param mv DB에 insert할 데이터가 저장된 NoticeVO객체
	 * @return DB 작업이 성공하면 1이상의 값이 반환됨
	 * 
	 * 
	 */
	public int insertNotice(NoticeVO nv);

	

	/**
	 * 공지사항이 존재하는 지 여부를 알아내기 위한 메서드
	 * 
	 * @param noticeCode 확인대상 공지사항 번호
	 * @return 해당 noticeCode가 있으면 true, 없으면 false
	 */
	public boolean checkNotice(String noticeCode);

	
	
	/**
	 * 공지사항 글 클릭시 조회수가 올라가는 메서드
	 * @param nv update할 회원정보가 들어있는 NoticeVO객체
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int updateHits(NoticeVO nv);
	
	
	
	
	
	
	/**
	 * 하나의 NoticeVO객체를 이용하여 DB 정보를 update하는 메서드
	 * 
	 * @param nv update할 회원 정보가 들어있는NoticeVO
	 * @return 작업성공 : 1 ,작업실패 : 0
	 */
	public int updateNotice(NoticeVO nv);


	
	
	/**
	 * 
	 * 공지사항 번호를 매개변수로 받아서 해당 공지사항을 삭제하는 메세드
	 * 
	 * @param noticeCode 삭제할 공지사항 번호
	 * @return 작업성공: 1, 작업실패: 0
	 * 
	 */
	public int deleteNotice(String noticeCode);

	
	
	
	/**
	 * DB에 테이블에 존재하는 전체 공지사항 글 목록을 조회하기 위한 메서드
	 * 
	 * @return 공지사항 목록를 담고 있는 List타입의 객체
	 */
	public List<NoticeVO> selectAllNotice(Map<String,Object> map);

	
	
	
	/**
	 * NoticeVO에 담긴 데이터를 이용하여 공지사항을 검색하는 메서드
	 * 
	 * @param nv 공지사항 정보(제목, 내용)을 검색하기 위한 데이터
	 * @return 검색된 결과를 담고있는 List타입의 객체
	 */

	public List<NoticeVO> searchNotice(NoticeVO nv);



	public int countList() throws SQLException;



	
	/**
	 * DB에 테이블에 존재하는 공지사항 글 상세내용을 조회하기 위한 메서드
	 * @param noticeCode 조회할 글을 noticeCode로 찾음
	 */
	public NoticeVO getNotice(String noticeCode);
	
	
	//메인 공지사항 
	public List<NoticeVO> NoticeAll(Map<String,Object> map);


}
