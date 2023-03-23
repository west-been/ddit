package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.PhotoVO;;

/**
 * 실제 DB와 연결해서 SQL문을 수행 후 결과를 작성하여 서비스에 전달하는 DAO의 Interface
 */
public interface IPhotoDao {
	/**
	 * PhotoVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * 
	 * @param pv DB에 insert할 데이터가 저장된 PhotoVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int insertPhoto(PhotoVO pv);

	/**
	 * 사진코드의 존재여부에 대한 메서드
	 * 
	 * @param photoCode 확인대상 사진코드
	 * @return 해당 사진코드가 있으면 true, 없으면 false
	 */
	public boolean checkPhoto(String photoCode);

	/**
	 * 주어진 사진코드에 해당하는 사진정보를 알아내기 위한 메서드
	 * 
	 * @param photoCode 확인대상 사진코드
	 * @return 해당 사진코드에 맞는 사진정보
	 */
	public PhotoVO getPhoto(String photoCode);

	/**
	 * 하나의 photoVO 객체를 이용하여 DB정보를 update하는 메서드
	 * 
	 * @param pv update할 사진정보가 들어있는 PhotoVO 객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int updatePhoto(PhotoVO pv);

	/**
	 * 사진코드를 매개변수로 받아서 해당 사진을 삭제하는 메서드
	 * 
	 * @param photoCode 삭제할 사진코드
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨
	 */
	public int deletePhoto(String photoCode);

	/**
	 * DB 테이블에 존재하는 전체 갤러리 목록을 조회하기 위한 메서드
	 * 
	 * @param map
	 * @return 갤러리 목록을 담고 있는 List타입의 객체
	 */
	public List<PhotoVO> selectAllPhoto(Map<String, Object> map);

	/**
	 * PhotoVO에 담긴 데이터를 이용하여 사진을 검색하는 메서드
	 * 
	 * @param pv 사진정보를 검색하기 위한 메서드
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<PhotoVO> searchPhoto(Map<String, Object> map);
	
	/**
	 * PhotoVO에 담긴 데이터를 이용하여 사진을 검색하는 메서드
	 * 
	 * @param pv 사진정보를 검색하기 위한 메서드
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<PhotoVO> search(Map<String, Object> map);

	public int photoCountList() throws SQLException;
	
	/**
	 * 갤러리 글 선택 시 조회수가 올라가는 메서드
	 * @param pv 
	 * @return
	 */
	public int updateHits(PhotoVO pv);
	
	/**
	 * 사용자 갤러리에 사진 띄우는 메서드
	 * @param map
	 * @return
	 */
	public List<PhotoVO> memberPhoto(Map<String, Object> map);
	
	
	//메인 갤러리 출력 
	public List<PhotoVO> PhotoAll(Map<String, Object> map);
	

}
