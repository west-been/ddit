<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
               
               <form name ="findscreen" id="memberVO" action="/tour/findId.do" method="post">
                  
                  <!-- mypage_wrap -->
                  <div class="mypage_wrap bor">
                  
                  	<h3 class="tit">아이디 찾기</h3>
               		<p class="desc mb70">회원가입 시 등록하신 정보를 입력해 주시기 바랍니다.</p>

                  
                     <!-- signup -->
                     <div class="signup2">
                       
                        <div class="table2 responsive-type">
                           <table>
                              <caption>아이디 찾기를 위한 입력폼입니다.</caption>
                              <colgroup>
                                 <col style="width: 25%">
                                 <col style="width: 75%">
                              </colgroup>
                              <tbody>
                                 <tr>
                                    <th scope="row" class="vtop"><label for="name">이름</label></th>
                                    <td><input type="text" id="memNm" name="memNm" placeholder="이름을 입력해주세요." title="이름을 입력해주세요.">
                                       <p class="red" id="name_msg">이름을 입력해주세요.</p></td>
                                 </tr>
                                 <tr id="ROW_hphone">
                                    <th scope="row" class="vtop"><label for="ihidNum">휴대폰 번호</label></th>
                                    <td><input type="text" id="memTel" name="memTel" placeholder="‘-’ 을 빼고 입력 해 주십시오." class="phoneCheck" title="‘-’ 을 빼고 입력 해 주십시오.">
                                       <p class="red" id="ihidNum_msg">휴대폰 번호를 입력해주세요.</p></td>
                                 </tr>
                                 <tr id="findResultDiv" style="display: none">
                                    <td colspan="2" style="text-align: center"><p class="green" id="errPass"></p></td>
                                 </tr>
                              </tbody>
                           </table>
                           <!-- //table -->
                        </div>
                        <div class="btn-wrap center">
                         	<input type="submit" class="btn btn-blue" value="아이디찾기"/>
                         </div>
                     </div>
                     <!-- //signup -->
                  </div>
                  <!-- //mypage_wrap -->

                  <div>
                     <input type="hidden" name="_csrf"
                        value="683a30b5-5b84-4f10-89c6-5268ea4d5c84">
                  </div>
               </form>
            </div>
            <!-- //inner -->
         </div>
      </div>
      <jsp:include page="../../includes/footer.jsp" />
   </div>
</body>
</html>