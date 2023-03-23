package service;

import java.util.List;
import java.util.Map;

import vo.QnaVO;

/**
 * 컨트롤러의 요청을 받아 처리하는 서비스의 Interface.
 * @author PC-18
 *
 */
public interface IQnaService {

	/**
	 * qna "문의"글을 새로 등록하기 위한 메서드
	 * @param qv 등록할 데이터가 저장된 QnaVO 객체
	 * @return 새글 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int insertQna(QnaVO qv);
	
	
	/**
	 * reply "답변"글을 새로 등록하기 위한 메서드
	 * @param qv 등록할 데이터가 저장된 QnaVO 객체
	 * @return 새글 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int insertReply(QnaVO qv);
	
	/**
	 * 주어진 글 번호가 존재하는지 여부를 알아내기 위한 메서드
	 * @param qnaCode 확인대상 공지사항 글 번호
	 * @return 해당 문의글 번호가 있으면 true, 없으면 false
	 */
	public boolean checkQna(String qnaCode);
	
	
	/**
	 * "문의"글을 수정하기 위한 메서드
	 * @param qv update할 문의글이 들어있는 QnaVO객체
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int updateQna(QnaVO qv);

	
	/**
	 * "답변"글을 수정하기 위한 메서드
	 * @param qv update할 문의글이 들어있는 QnaVO객체
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int updateReply(QnaVO qv);
	
	
	
	/**
	 * 문의글 번호를 매개변수로 받아서 해당 글을 삭제하는 메서드
	 * @param qnaCode 삭제할 "문의"글 번호
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int deleteQna(String qnaCode);

	
	
	/**
	 * 문의글 번호를 매개변수로 받아서 해당 글을 삭제하는 메서드
	 * @param qnaCode 삭제할 "답변"글 번호
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int deleteReply(QnaVO qv);
	
	
	/**
	 * 전체 문의글 목록을 조회하기 위한 메서드
	 * @return 문의글 목록을 담고 있는 List타입의 객체
	 */
	public List<QnaVO> selectAllQna(Map<String, Object> map);

	/**
	 * 주어진 문의글 번호에 해당하는 상세 내용을 조회하기 위한 메서드
	 * @param qnaCode 확인대상 문의글 번호
	 * @return 해당 문의글 번호에 맞는 문의글
	 */
	public QnaVO selectQna(String qnaCode);
	
	
	public int countList();
	
	
	
}
