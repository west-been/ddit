package service;

import vo.AdminVO;
import vo.MemberVO;

public interface TourMemberService {

	public static TourMemberService getinstance() {
		return null;
	}
	// 회원 로그인
	public MemberVO loginMember(MemberVO mv);

	//관리자 로그인
	public AdminVO adminlogin (AdminVO av);
	
	// 회원가입
	public int joinMember(MemberVO mv);

	// 아이디 체크
	public int idCheck(String memId);

	// 아이디 찾기
	public String findId(MemberVO mv);
	
	// 비밀번호 찾기
	public MemberVO findPw(MemberVO mv);
	
	//비밀번호 재설정
	public int findPwRe(MemberVO mv);
	

}
