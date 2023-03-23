package service;

import java.util.List;

import com.sun.org.apache.bcel.internal.generic.RETURN;

import dao.TourMemberDaoImpl;
import vo.AdminVO;
import vo.MemberVO;

public class TourMemberServiceImpl implements TourMemberService {

	private static TourMemberServiceImpl service;
	private TourMemberDaoImpl dao;

	private TourMemberServiceImpl() {
		dao = TourMemberDaoImpl.getDao();
	}

	public static TourMemberServiceImpl getService() {
		if (service == null)
			service = new TourMemberServiceImpl();
		return service;
	}

	// 아이디 체크
	@Override
	public int idCheck(String memId) {
		return this.dao.idCheck(memId);
	}

	// 회원 로그인
	@Override
	public MemberVO loginMember(MemberVO mv) {
		return this.dao.loginMember(mv);
	}
	
	// 관리자 로그인
	@Override
	public AdminVO adminlogin(AdminVO adminVO) {
		return this.dao.adminlogin(adminVO);
	}

	// 회원 가입
	@Override
	public int joinMember(MemberVO mv) {
		return this.dao.joinMember(mv);
	}

	public static TourMemberService getInstance() {
		if (service == null) {
			service = new TourMemberServiceImpl();
		}
		return service;
	}

	// 아이디찾기
	@Override
	public String findId(MemberVO mv) {
		return this.dao.findId(mv);
	}

	// 비밀번호찾기
	@Override
	public MemberVO findPw(MemberVO mv) {
		return this.dao.findPw(mv);
	}

	// 비밀번호 재설정
	@Override
	public int findPwRe(MemberVO mv) {
		return this.dao.findPwRe(mv);
	}
}
