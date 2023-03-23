package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.AdminVO;
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;


public class TourMemberDaoImpl extends TourMyBaitsDao implements ITourMemberDao {

	private static TourMemberDaoImpl dao;
	
	
	public static TourMemberDaoImpl getDao() {
		if(dao == null) dao = new TourMemberDaoImpl();
		return dao;
	}
	
	@Override
	public int insertMember(MemberVO mv) {
		return insert("member.insertMember",mv);
	}

	@Override
	public boolean checkMember(String memId) {
		boolean isExist = false;
		int cnt = (int) selectOne("member.checkMember", memId);
		
		if(cnt > 0) {
			isExist = true;
		}
		
		return isExist;
	}

	@Override
	public MemberVO getMember(String memId) {
		return selectOne("member.selectMember", memId);
	}

	//기존 비밀번호와 같은지 다른지 체킹
	@Override
	public int mypagePwCheck(MemberVO mv) {
		return update("member.mypagePwCheck",mv);
	}
	
	@Override
	public int updateMember(MemberVO mv) {
		return update("member.updateMember",mv);
	}

	@Override
	public int deleteMember(String memId) {
		return delete("member.deleteMember",memId);
	}

	@Override
	public List<MemberVO> selectAllMember() {
		return selectList("member.selectAllMember", null);
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) {
		return selectList("member.searchMember",mv);
	}
	
	//아이디 체크
	@Override
	public int idCheck(String memId) {
		return selectOne("member.idCheck", memId);
	}
	
	//회원 로그인
	@Override
	public MemberVO loginMember(MemberVO mv) {
		return selectOne("member.loginMember",mv);
	}
	
	//관리자 로그인
	public AdminVO adminlogin(AdminVO adminVO) { 
		 return selectOne("member.adminlogin",adminVO); 
	}
	 
	
	//회원 가입
	public int joinMember(MemberVO mv) {
		return insert("member.joinMember",mv);
	}
	
	//아이디찾기
	public String findId(MemberVO mv) {
		return selectOne("member.findId",mv);
	}
	
	//비밀번호 찾기
	public MemberVO findPw(MemberVO mv) {
		return selectOne("member.findPw",mv);
	}

	//비밀번호 재설정
	public int findPwRe(MemberVO mv) {
		return update("member.findPwRe", mv);
	}
	/////////////////  마이페이지  /////////////////////
	
	//마이페이지 예약내역 조회
	public List<ReservationVO> selectMypageReserv(String memId) {
		return selectList("reservation.selectMypageReserv", memId);
	}

	
	//마이페이지 문의내역 조회 
	@Override
	public List<QnaVO> mypageQnaList(String memId) {
		return selectList("qna.selectMypageQna", memId);
	}

	//마이페이지 관리자 로그인 
	  @Override 
	  public AdminVO getAdminLogin(String adminId) { 
		  return selectOne("member.mypageAdminlogin",adminId); 
	  }
	 
	//마이페이지 "관리자" 문의내역 조회 
	@Override
	public List<QnaVO> getAdminQna(String adminId) {
		return selectList("member.adminSelectMypageQna",adminId);
	}
	
	//마이페이지 "관리자" 예약내역 전체 조회 
	@Override
	public List<ReservationVO> getAdminReserv(String adminId) {
		return selectList("member.adminSelectMypageReserv", adminId);
	}


	//마이페이지 관리자 정보 수정 
	@Override
	public int updateAdmin(AdminVO av) {
		return update("member.updateAdmin", av);
	}

	//마이페이지 비밀번호 수정 
	@Override
	public int updateMemberPw(MemberVO mv) {
		return update("member.updateMemberPw",mv);
	}



	




}
