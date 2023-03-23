<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- //비밀번호 찾기 아이디 공지 -->

<% 
String pmsg = (String)session.getAttribute("pmsg");
	if(pmsg.equals("실패")) { %>
		<script> alert('비밀번호 매칭 실패') </script>

<% } else { %>
		<script> alert('새로운 비밀번호를 설정해주세요') </script>
<% } %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 디자인 주소 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/yejicopy.css" />
</head>
<script>

	//////////////////비밀번호 관련/////////////////////////////
window.onload = function(){	
	//비밀번호 확인에 대한 결과를 얻기위해 주민등록번호 탭으로 이동되었을때 결과를 보여주도록 이벤트를 설정하였음
	document.querySelector('#pw2').addEventListener('keyup',function(){
       
		var pw = document.getElementById('pw').value;
         var SC = ["!","@","#","$","%"];
         var check_SC = 0;

         for(var i=0;i<SC.length;i++){
             if(pw.indexOf(SC[i]) != -1){
                 check_SC = 1; //특수문자 적용한 상태일 때 코드
             }
//         비밀번호 갯수 체크 방법
         if(pw.length < 6 || pw.length > 16){
			//window.alert('비밀번호는 6글자 이상, 16글자이하로 입력하세요');
			//document.getElementById('pw').value='';
				 document.getElementById('errPass1').innerHTML='비밀번호는 6글자 이상 16글자 이하로 입력하세요';
                 document.getElementById('errPass1').style.color='red';
         } else {
				 document.getElementById('errPass1').innerHTML='사용가능한 비밀번호입니다.';
                 document.getElementById('errPass1').style.color='green';
         	}
         
         }
         
         //특수문자 포함 여부 확인
         if(!check_SC) {
			 // alert("특수문자(!,@,#,$,%)중 하나를 입력하세요");
        	 document.getElementById('errPass1').innerHTML='특수문자(!,@,#,$,%)중 하나를 입력하세요';
             document.getElementById('errPass1').style.color='red';
         }
         
         
        //비밀번호확인 일치 여부 확인
         if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
             if(document.getElementById('pw').value == document.getElementById('pw2').value){
                 document.getElementById('errPass2').innerHTML='비밀번호가 일치합니다.'
                 document.getElementById('errPass2').style.color='green';
             }
             else {
                 document.getElementById('errPass2').innerHTML='비밀번호가 일치하지 않습니다.';
                 document.getElementById('errPass2').style.color='red';
             }
         }
        
	});
	
}
 </script>

<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">



			<div class="sub_cont" id="container">
				<div class="inner login-container">
					

					<form id="memberVO" action="/tour/findPwRe.do" method="post">
						<input type="hidden" id="LGD_MID" name="LGD_MID" value="">
						<input type="hidden" id="LGD_AUTHONLYKEY" name="LGD_AUTHONLYKEY"
							value=""> <input type="hidden" id="LGD_PAYTYPE"
							name="LGD_PAYTYPE" value=""> <input type="hidden"
							name="rec_cert" id="rec_cert" value=""> <input
							type="hidden" name="certNum" id="certNum" value="">

						<!-- mypage_wrap -->
						<div class="mypage_wrap bor">
							<h3 class="tit mb20">비밀번호 재설정</h3>
							<p class="desc mb100"> 비밀번호를 재설정합니다.</p>
						
							<!-- signup -->
							<div class="signup2 mb20">
								
								<div class="table2 responsive-type">
									<table>
										<caption>비밀번호 찾기를 위한 입력폼입니다.</caption>
										<colgroup>
											<col style="width: 25%">
											<col style="width: 75%">
										</colgroup>

										<tbody>

											<tr>
												<th scope="row" class="vtop"><label for="pw">비밀번호</label></th>
												<td><input type="password" id="pw" name="memPw"
													placeholder="비밀번호를 입력합니다." value="" maxlength="20" requirde />
													<p>※ 영문,특수문자(!,@,#,$,%)를 포함하고 6~16자 이내로 입력해 주세요.</p>
													<p id="errPass1"></p></td>
											</tr>

											<tr>
												<th scope="row" class="vtop"><label for="pw2">비밀번호
														확인</label></th>
												<td><input type="password" id="pw2" name="pw2"
													placeholder="비밀번호를 재입력해주세요." requirde />
													<p id="errPass2"></p>
											</tr>
										</tbody>
									</table>
									<!-- //table -->
								</div>

								<div id="check_fail_msg" class="red mt10"
									style="text-align: center;"></div>
								<ul class="btn_area before_check">
									<li class="list_btn">
									<input type="submit" class="btn btn-blue" value="확인" /></li>
								</ul>
							</div>

							<div class="signup success_check" style="display: none"></div>
						</div>
						<!-- //mypage_wrap -->
						<div>
							<input type="hidden" name="_csrf"
								value="37c4fb5c-ee8f-4cde-82ec-5d4118f6cdf1">
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