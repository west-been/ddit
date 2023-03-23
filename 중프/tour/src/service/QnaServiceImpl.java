package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IQnaDao;
import dao.QnaDaoImpl;
import dao.TourMyBaitsDao;
import vo.QnaVO;

public class QnaServiceImpl extends TourMyBaitsDao implements IQnaService{

	//싱글톤
	private IQnaDao qnaDao;
	private static QnaServiceImpl qnaService;

	private QnaServiceImpl() {
		qnaDao = QnaDaoImpl.getInstance();
	}

	public static IQnaService getInstance() {
		if(qnaService == null) {
			qnaService = new QnaServiceImpl();
		}
		return qnaService;
	}


	//회원이 쓰는 문의글 등록
	@Override
	public int insertQna(QnaVO qv) {
		int cnt = qnaDao.insertQna(qv);
		if(cnt>0) {

		}
		return cnt;
	}

	//관리자가 쓰는 답변 등록
	@Override
	public int insertReply(QnaVO qv) {
		int cnt = qnaDao.insertReply(qv);
		if(cnt>0) {

		}return cnt;

	}

	// 문의글 있는 번호(코드)로 확인
	@Override
	public boolean checkQna(String qnaCode) {

		boolean exist = qnaDao.checkQna(qnaCode);
		return exist;
	}



	// 회원이 수정하는 문의글
	@Override
	public int updateQna(QnaVO qv) {
		int cnt = qnaDao.updateQna(qv);
		return cnt;

	}

	// 관리자가 수정하는 답변글
	@Override
	public int updateReply(QnaVO qv) {

		int cnt = qnaDao.updateReply(qv);
		return cnt;
	}


	// 회원이 삭제하는 문의글
	@Override
	public int deleteQna(String qnaCode) {
		int cnt = qnaDao.deleteQna(qnaCode);
		return cnt;
	}

	//  관리자가 삭제하는 답변글
	@Override
	public int deleteReply(QnaVO qv) {
		
		int cnt = qnaDao.deleteReply(qv);
		return cnt;

	}


	// 전체 qna 글 목록 조회
	@Override
	public List<QnaVO> selectAllQna(Map<String, Object> map) {

		List<QnaVO> qnaList = qnaDao.selectAllQna(map);

		return qnaList;

	}

	// qna 글 상세 조회
	@Override
	public QnaVO selectQna(String qnaCode) {

		return qnaDao.selectQna(qnaCode);
	}

	@Override
	public int countList() {

		int cnt = 0;
		try {
			cnt = qnaDao.countList();		
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		return cnt;
	}


}