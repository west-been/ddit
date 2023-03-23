package dao;

import java.util.List;
import java.util.Map;

import vo.AdminVO;
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;


//틀의 개념
/**
 * 실제 DB와 연결해서 SQL문을 수행후 결과를 작성하여 서비스에 전달하는 DAO의 Interface.
 * 
 * @author PC-09
 *
 */
public interface ITourMemberDao {

	/**
	 * MemberVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * 
	 * @param mv DB에 insert할 데이터가 저장된 MemberVO객체
	 * @return DB 작업이 성공하면 1이상의 값이 반환됨
	 * 
	 * 
	 */
	public int insertMember(MemberVO mv);

	/**
	 * 주어진 회원ID가 존재하는 지 여부를 알아내기 위한 메서드
	 * 
	 * @param memId 확인대상 회원ID
	 * @return 해당 회원 ID가 있으면 true, 없으면 false
	 */

	public boolean checkMember(String memId);

	/**
	 * 하나의 MemberVO객체를 이용하여 DB 정보를 update하는 메서드
	 * 
	 * @param mv update할 회원 정보가 들어있는 MemberVO
	 * @return 해당 회원ID에 맞는 회원정보
	 */

	public MemberVO getMember(String memId);

	/**
	 * 하나의 MemberVO객체를 이용하여 DB 정보를 update하는 메서드
	 * 
	 * @param mv update할 회원 정보가 들어있는 MemberVO
	 * @return 작업성공 : 1 ,작업실패 : 0
	 */

	public int updateMember(MemberVO mv);

	/**
	 * 
	 * 회원 ID를 매개변수로 받아서 해당 회원 정보를 삭제하는 메세드
	 * 
	 * @param memId 삭제할 회원 ID
	 * @return 작업성공: 1, 작업실패: 0
	 * 
	 */

	public int deleteMember(String memId);

	/**
	 * DB에 테이블에 존재하는 전체 회원정보를 조회하기 위한 메서드
	 * 
	 * @return 회원정보를 담고 있는 List타입의 객체
	 */
	public List<MemberVO> selectAllMember();

	/**
	 * MemberVO에 담긴 데이를 이용하여 회원정보를 검색하는 메서드
	 * 
	 * @param mv 회원정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고있는 List타입의 객체
	 */

	public List<MemberVO> searchMember(MemberVO mv);

	//회원 로그인
	public MemberVO loginMember(MemberVO mv);
	
	//관리자 로그인
	public AdminVO adminlogin(AdminVO av);
	
	//회원 가입
	public int joinMember(MemberVO mv);

	//아이디 체크
	public int idCheck(String memId);
	
	//아이디 찾기 
	public String findId(MemberVO mv);
	
	//비밀번호 찾기
	public MemberVO findPw(MemberVO mv);
	
	//비밀번호 재설정
	public int findPwRe(MemberVO mv);
	
	
	/////////////////// 마이페이지 ///////////////////////
	
	//마이페이지 "관리자" 정보 수정 
	public int updateAdmin(AdminVO av);
	
	// 마이페이지 관리자 로그인
	public AdminVO getAdminLogin(String adminId);

	//마이페이지에서 예약내역 조회
	public List<ReservationVO> selectMypageReserv(String memId);
	
	//마이페이지에서 문의내역 조회
	public List<QnaVO> mypageQnaList(String memId);
	
	//마이페이지 "관리자" qna 전체 조회 
	public List<QnaVO> getAdminQna(String adminId);
	
	//마이페이지 "관리자" 예약내역 전체 조회 
	public List<ReservationVO> getAdminReserv(String adminId);
	
	//마이페이지 비밀번호 수정 
	public int updateMemberPw(MemberVO mv);

	//기존 비밀번호와 같은지 다른지 체킹
	public int mypagePwCheck(MemberVO mv);
	
	
	
	
}