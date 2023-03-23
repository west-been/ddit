package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.PhotoVO;

public class PhotoDaoImpl extends TourMyBaitsDao implements IPhotoDao {

	private static IPhotoDao ptDao;

	public PhotoDaoImpl() {
	}

	public static IPhotoDao getInstance() {
		if (ptDao == null) {
			ptDao = new PhotoDaoImpl();
		}
		return ptDao;
	}

	@Override
	public int photoCountList() throws SQLException {
		return selectOne("photo.photoCountList", null);
	}

	@Override
	public int insertPhoto(PhotoVO pv) {
		return insert("photo.insertPhoto", pv);
	}

	@Override
	public boolean checkPhoto(String photoCode) {
		boolean isExist = false;
		int cnt = (int) selectOne("photo.checkPhoto", photoCode);

		if (cnt > 0) {
			isExist = true;
		}
		return isExist;
	}

	@Override
	public PhotoVO getPhoto(String photoCode) {
		return selectOne("photo.selectDetailPhoto", photoCode);
	}

	@Override
	public int updatePhoto(PhotoVO pv) {
		return update("photo.updatePhoto", pv);
	}

	@Override
	public int deletePhoto(String photoCode) {
		return delete("photo.deletePhoto", photoCode);
	}

	@Override
	public List<PhotoVO> selectAllPhoto(Map<String, Object> map) {
		return selectList("photo.selectAllPhoto", map);
	}

	@Override
	public List<PhotoVO> searchPhoto(Map<String, Object> map) {
		return selectList("photo.searchPhoto", map);
	}
	// 사용자화면 검색
	@Override
	public List<PhotoVO> search(Map<String, Object> map) {
		return selectList("photo.search", map);
	}

	@Override
	public int updateHits(PhotoVO pv) {
		return update("photo.updateHits", pv);
	}

	@Override
	public List<PhotoVO> memberPhoto(Map<String, Object> map) {
		return selectList("photo.memberPhoto", map);
	}

	
	//메인 갤러리 출력 
	@Override
	public List<PhotoVO> PhotoAll(Map<String, Object> map) {
		return selectList("photo.PhotoAll", map);
	}



}
