package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.QnaVO;

public interface IQnaDao {

	// 회원 문의글 등록
	public int insertQna(QnaVO qv);
	
	// 관리자 답변 등록
	public int insertReply(QnaVO qv);
	
	// 글 번호로 글 여부 확인
	public boolean checkQna(String qnaCode);
	
	// 회원 문의글 수정
	public int updateQna(QnaVO qv);
	
	// 관리자 답변 수정
	public int updateReply(QnaVO qv);
	
	// 회원 문의글 삭제
	public int deleteQna(String qnaCode);
	
	// 관리자 답변 삭제
	public int deleteReply(QnaVO qv);
	

	// 글 목록 조회
	public List<QnaVO> selectAllQna(Map<String, Object> map);
	
	
	//글 상세 조회
	public QnaVO selectQna(String qnaCode);
	
	
	public int countList()  throws SQLException;
	
	
}

