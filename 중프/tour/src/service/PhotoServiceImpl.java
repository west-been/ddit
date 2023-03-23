package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.IPhotoDao;
import dao.PhotoDaoImpl;
import dao.TourMyBaitsDao;
import vo.NoticeVO;
import vo.PhotoVO;

public class PhotoServiceImpl implements IPhotoService {

	// 싱글톤
	private static IPhotoService ptService;
	private IPhotoDao ptDao;

	public PhotoServiceImpl() {
		ptDao = PhotoDaoImpl.getInstance();
	}

	public static IPhotoService getInstance() {
		if (ptService == null) {
			ptService = new PhotoServiceImpl();
		}
		return ptService;
	}

	@Override
	public int registPhoto(PhotoVO pv) {
		int cnt = ptDao.insertPhoto(pv);
		return cnt;
	}

	@Override
	public boolean checkMember(String photoCode) {
		boolean exist = ptDao.checkPhoto(photoCode);
		return exist;
	}

	@Override
	public PhotoVO getPhoto(String photoCode) {

		return ptDao.getPhoto(photoCode);
	}

	@Override
	public int modifyPhoto(PhotoVO pv) {
		int cnt = ptDao.updatePhoto(pv);
		return cnt;
	}

	@Override
	public int removePhoto(String photoCode) {
		int cnt = ptDao.deletePhoto(photoCode);
		return cnt;
	}

	@Override
	public List<PhotoVO> selectAllPhoto(Map<String, Object> map) {
		List<PhotoVO> ptList = ptDao.selectAllPhoto(map);
		return ptList;
	}

	@Override
	public int photoCountList() {
		int cnt = 0;
		try {
			cnt = ptDao.photoCountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<PhotoVO> searchPhoto(Map<String, Object> map) {
		List<PhotoVO> ptList = ptDao.searchPhoto(map);
		return ptList;
	}
	
	@Override
	public List<PhotoVO> search(Map<String, Object> map) {
		List<PhotoVO> photoList = ptDao.search(map);
		return photoList;
	}

	@Override
	public int updateHits(PhotoVO pv) {
		int cnt = ptDao.updateHits(pv);
		return cnt;
	}

	@Override
	public List<PhotoVO> memberPhoto(Map<String, Object> map) {
		List<PhotoVO> ptList = ptDao.memberPhoto(map);
		return ptList;
	}

	
	//메인 파일 출력 
	@Override
	public List<PhotoVO> PhotoAll(Map<String, Object> map) {
		List<PhotoVO> ptList = ptDao.PhotoAll(map);
		return ptList;
	}



}
