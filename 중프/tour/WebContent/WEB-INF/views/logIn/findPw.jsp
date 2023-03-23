<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 디자인 주소 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/yejicopy.css" />
</head>
<body>
   <div id="sub">
      <jsp:include page="../../includes/header.jsp" />
      <jsp:include page="../../includes/subVisual.jsp" />
      <div id="content">

         <div class="sub_cont" id="container">
            <div class="inner login-container">
              

               <form id="memberVO" action="/tour/findPw.do" method="post">
                  <input type="hidden" id="LGD_MID" name="LGD_MID" value="">
                  <input type="hidden" id="LGD_AUTHONLYKEY" name="LGD_AUTHONLYKEY" value=""> 
                  <input type="hidden" id="LGD_PAYTYPE" name="LGD_PAYTYPE" value=""> 
                  <input type="hidden" name="rec_cert" id="rec_cert" value=""> 
                  <input type="hidden" name="certNum" id="certNum" value="">
                  
                <div class="mypage_wrap bor">
                     <div class="signup2 mb20">
                     	<h3 class="tit mb20">비밀번호 찾기</h3>
                        <p class="desc mb100"> 등록된 정보 확인 및 본인인증 후 비밀번호를 재설정 하실 수 있습니다. </p>
                        <div class="table2 responsive-type">
                           <table>
                              <caption>비밀번호 찾기를 위한 입력폼입니다.</caption>
                              <colgroup>
                                 <col style="width: 25%">
                                 <col style="width: 75%">
                              </colgroup>
                              
                              <tbody>
                                 <tr>
                                    <th scope="row" class="vtop"><label for="id">아이디</label></th>
                                    <td><input id="memId" name="memId" placeholder="아이디를 입력해주세요." type="text" value="" maxlength="20">
                                       <p class="red" id="id_msg">아이디를 입력해주세요.</p></td>
                                 </tr>
                                 <tr>
                                    <th scope="row" class="vtop"><label for="memNm">이름</label></th>
                                    <td><input id="memNm" name="memNm" placeholder="이름을 입력해주세요." type="text" value="" maxlength="20">
                                       <p class="red" id="memNm_msg">이름을 입력해주세요.</p></td>
                                 </tr>
                                 <tr id="ROW_hphone">
                                    <th scope="row" class="vtop"><label for="hp">휴대폰  번호</label></th>
                                    <td><input type="text" id="memTel" name="memTel" placeholder="‘-’ 을 빼고 입력 해 주십시오." class="phoneCheck">
                                       <p class="red" id="hp_msg">휴대폰 번호를 입력해주세요.</p></td>
                                 </tr>
                              </tbody>
                           </table>
                           <!-- //table -->
                           <div class="btn-wrap center">
                           	<input type="submit" class="btn btn-blue" value="비밀번호 찾기"/>
                           </div>
                        </div>

                        <div id="check_fail_msg" class="red mt10" style="text-align: center;"></div>
                       
                     </div>
                     <div class="signup success_check" style="display: none"> </div>
                  </div>
                  <!-- //mypage_wrap -->
               </form>
            </div>
            <!-- //inner -->
         </div>
      </div>
      <jsp:include page="../../includes/footer.jsp" />
   </div>
</body>
</html>