package service;

import java.util.List;
import java.util.Map;

import vo.NoticeVO;
import vo.PhotoVO;

/**
 * 컨트롤러의 요청을 받아 처리하는 서비스의 Interface
 */
public interface IPhotoService {
	/**
	 * 게시물을 등록하기 위한 메서드
	 * 
	 * @param pv DB에 등록할 데이터가 저장된 PhotoVO객체
	 * @return 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registPhoto(PhotoVO pv);

	/**
	 * 사진코드의 존재여부 메서드
	 * 
	 * @param PhotoCode 확인하려는 사진코드
	 * @return 해당 코드가 있으면 true, 없으면 false
	 */
	public boolean checkMember(String photoCode);

	/**
	 * 찾으려는 코드와 같은 게시물을 가져오는 메서드
	 * 
	 * @param PhotoCode 확인대상 사진코드
	 * @return 해당 사진코드에 맞는 정보
	 */
	public PhotoVO getPhoto(String photoCode);

	/**
	 * 게시글을 수정하기 위한 메서드
	 * 
	 * @param pv 수정할 사진정보가 들어있는 PhotoVO객체
	 * @return 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int modifyPhoto(PhotoVO pv);

	/**
	 * 사진코드를 매개변수로 받아서 해당 게시글을 삭제하는 메서드
	 * 
	 * @param PhotoCode
	 * @return
	 */
	public int removePhoto(String photoCode);

	/**
	 * 전체 갤러리 목록을 조회하기 위한 메서드
	 * 
	 * @return 갤러리 목록을 담고 있는 List타입의 객체
	 */
	public List<PhotoVO> selectAllPhoto(Map<String, Object> map);

	/**
	 * PhotoVO에 담긴 데이터를 이용하여 게시물을 검색하는 메서드, 관리자만 사용
	 * 
	 * @param pv 사진정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 List 타입의 객체
	 */
	public List<PhotoVO> searchPhoto(Map<String, Object> map);
	
	/**
	 * PhotoVO에 담긴 데이터를 이용하여 게시물을 검색하는 메서드, 사용자화면
	 * 
	 * @param pv 사진정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 List 타입의 객체
	 */
	public List<PhotoVO> search(Map<String, Object> map);

	public int photoCountList();

	public int updateHits(PhotoVO pv);

	public List<PhotoVO> memberPhoto(Map<String, Object> map);
	
	//메인 갤러리 출력 
	public List<PhotoVO> PhotoAll(Map<String, Object> map);
	

}
