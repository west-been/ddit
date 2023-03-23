package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.QnaVO;

public class QnaDaoImpl extends TourMyBaitsDao implements IQnaDao {

	//싱글톤
	private static IQnaDao qnaDao;
	private QnaDaoImpl() {
	}
	public static IQnaDao getInstance() {
		if(qnaDao == null) {
			qnaDao = new QnaDaoImpl();
		}
		return qnaDao;
	}

	@Override
	public int insertQna(QnaVO qv) {

		return insert("qna.insertQna", qv);
	}

	@Override
	public int insertReply(QnaVO qv) {
		return insert("qna.insertReply", qv);
	}

	@Override
	public boolean checkQna(String qnaCode) {
		boolean isExist = false;

		int cnt = (int) selectOne("qna.checkQna", qnaCode);

		if(cnt > 0 ) {
			isExist = true;
		}
		return isExist;
	}

	@Override
	public int updateQna(QnaVO qv) {
		return update("qna.updateQna", qv);
	}

	@Override
	public int updateReply(QnaVO qv) {
		return update("qna.updateReply", qv);
	}

	@Override
	public int deleteQna(String qnaCode) {
		return delete("qna.deleteQna", qnaCode);
	}

	@Override
	public int deleteReply(QnaVO qv) {
		return update("qna.deleteReply", qv);
	}

	@Override
	public List<QnaVO> selectAllQna(Map<String, Object> map) {
		return selectList("qna.selectAllQna", map);
	}

	@Override
	public QnaVO selectQna(String qnaCode) {

		return selectOne("qna.selectQna", qnaCode);
	}

	@Override
	public int countList() throws SQLException {
		
		return selectOne("qna.countList", null);
	}

}
