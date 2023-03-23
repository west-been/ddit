package service;
//틀의 개념

import java.util.List;
import java.util.Map;

import vo.AdminVO;
import vo.MemberVO;
import vo.QnaVO;
import vo.ReservationVO;


/**
 * 컨트롤러의 요청을 받아 처리하는 서비스의 Interface.
 * @author PC-09
 *
 */
public interface IMemberService {

   
      /**
       * 주어진 회원ID가 존재하는 지 여부를 알아내기 위한 메서드
       * @param memId 확인대상 회원ID
       * @return 해당 회원 ID가 있으면 true, 없으면 false
       */
      public MemberVO getMember(String memID);
 
      /**
       * 회원정정보를 수정하기 위한 메서드
       * @param mv update할 회원 정보가 들어있는 MemberVO
       * @return 작업성공 : 1 ,작업실패 : 0
       */
      public int modifyMember(MemberVO mv);
      
      /**
       * 회원 ID를 매개변수로 받아서 해당 회원 정보를 삭제하는 메세드
       * @param memId 삭제할 회원 ID
       * @return 작업성공: 1, 작업실패: 0
       * 
       */
      public int removeMember(String memId);

      /**
       * 마이페이지에서 해당 회원의 예약내역을 확인하기 위한 메서드 
       * @param memId
       * @return
       */
      public List<ReservationVO> selectMypageReserv(String memId);
      
      
      /**
       * 마이페이지에서 해당 회원의 문의내역을 확인하기 위한 메서드
       * @param memId
       * @return
       */
      public List<QnaVO> mypageQnaList(String memId);
      
      
      //마이페이지 관리자 로그인 
      public AdminVO getAdminLogin(String adminId);
      
      //마이페이지 관리자 회원정보 수정 	  
      public int updateAdmin(AdminVO av);
      
      
      //마이페이지 관리자 문의내역 조회 
      public List<QnaVO> getAdminQna(String adminId);

      //마이페이지 관리자 예약 내역 조회 
      public List<ReservationVO> getAdminReserv(String adminId);
      
      
      //마이페이지 비밀번호 변경 
      public int updateMemberPw(MemberVO mv);

      //기존 비밀번호와 같은지 다른지 체킹
      public int mypagePwCheck(MemberVO mv);
      



}