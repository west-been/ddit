package service;

import java.util.List;
import java.util.Map;

import dao.IQnaDao;
import dao.ITourMemberDao;
import dao.TourMemberDaoImpl;
import vo.AdminVO;
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;

public class MemberServiceImpl implements IMemberService{
	
	private ITourMemberDao memDao;
	private static MemberServiceImpl memService;
	
	
	private MemberServiceImpl() {
		memDao = TourMemberDaoImpl.getDao();
	}
	public static MemberServiceImpl getService() {
		if(memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}
	

	//마이페이지 회원정보 조회 
	@Override
	public MemberVO getMember(String memId) {
		return memDao.getMember(memId);
	}

	//기존 비밀번호와 같은지 다른지 체킹
	@Override
	public int mypagePwCheck(MemberVO mv) {
		return memDao.mypagePwCheck(mv);
	}
	
	//마이페이지 회원정보 수정 
	@Override
	public int modifyMember(MemberVO mv) {
		
		int cnt = memDao.updateMember(mv);
		return cnt;
	}
	
	//마이페이지 회원탈퇴
	@Override
	public int removeMember(String memId) {
		int cnt = memDao.deleteMember(memId);
		return cnt;
	}

	//마이페이지 문의내역
	@Override
	public List<ReservationVO> selectMypageReserv(String memId) {
		List<ReservationVO> list = null;
		
		try {
			list  = memDao.selectMypageReserv(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//마이페이지에서 문의내역을 확인하기 위한 메서드 
	@Override
	public List<QnaVO> mypageQnaList(String memId) {
		List<QnaVO> list = null;
		
		try {
			list = memDao.mypageQnaList(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//마이페이지 관리자 로그인 
	@Override
	public AdminVO getAdminLogin(String adminId) {
		return memDao.getAdminLogin(adminId);
	}
	
	//마이페이지 관리자 문의내역 조회 
	@Override
	public List<QnaVO> getAdminQna(String adminId) {
		List<QnaVO> list = null;
		
		try {
			list = memDao.getAdminQna(adminId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//마이페이지 관리자 예약내역 조회 
	@Override
	public List<ReservationVO> getAdminReserv(String adminId) {
		List<ReservationVO> list = null;
		try {
			list = memDao.getAdminReserv(adminId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	//마이페이지 관리자 정보 수정 
	@Override
	public int updateAdmin(AdminVO av) {
		int cnt = memDao.updateAdmin(av);
		return cnt;
	}
	
	//마이페이지 비밀번호 수정 
	@Override
	public int updateMemberPw(MemberVO mv) {
		int cnt = memDao.updateMemberPw(mv);
		return cnt;
	}
	


}
