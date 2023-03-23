package service;

import java.util.List;
import java.util.Map;

import vo.NoticeVO;

/**
 * 컨트롤러의 요청을 받아 처리하는 서비스의 Interface.
 * @author PC-18
 *
 */
public interface INoticeService {




	/**
	 * 공지사항 글을 새로 등록하기 위한 메서드
	 * @param nv 등록할 데이터가 저장된 NoticeVO객체
	 * @return 새글 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registNotice(NoticeVO nv);

	/**
	 * 주어진 글 번호가 존재하는지 여부를 알아내기 위한 메서드
	 * @param noticeCode 확인대상 공지사항 글 번호
	 * @return 해당 공지사항 글 번호가 있으면 true, 없으면 false
	 */
	public boolean checkNotice(String noticeCode);


	/**
	 * 주어진 공지사항 번호에 해당하는 게시글을 알아내기 위한 메서드
	 * @param noticeCode 확인대상 공지사항 번호
	 * @return 해당 공지사항 번호에 맞는 공지사항 글
	 */
	public NoticeVO getNotice(String noticeCode);

	
	/**
	 * 공지사항 글 클릭시 조회수가 올라가는 메서드
	 * @param nv update할 정보가 들어있는 NoticeVO객체
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int updateHits(NoticeVO nv);



	/**
	 * 공지사항 글을 수정하기 위한 메서드
	 * @param nv update할 회원정보가 들어있는 NoticeVO객체
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int modifyNotice(NoticeVO nv);


	/**
	 * 공지사항 번호를 매개변수로 받아서 해당 글을 삭제하는 메서드
	 * @param noticeCode 삭제할 공지사항 번호
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int removeNotice(String noticeCode);

	/**
	 * 전체 공지사항 목록을 조회하기 위한 메서드
	 * @return 공지사항 목록을 담고 있는 List타입의 객체
	 */
	public List<NoticeVO> selectAllNotice(Map<String,Object> map);


	/**
	 * NoticeVO에 담긴 데이터를 이용하여 글을 검색하는 메서드
	 * @param nv 공지사항을 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<NoticeVO> searchNotice(NoticeVO nv);



	public int countList();
	
	
	//메인 공지사항 
	public List<NoticeVO> NoticeAll(Map<String,Object> map);


}
