<%@page import="java.util.Enumeration"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	MemberVO memId = (MemberVO)session.getAttribute("memId");
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");

	//session.removeAttribute("memberVO");

//세션 정보 확인
// Enumeration e = session.getAttributeNames();

// while(e.hasMoreElements()){
// 	String val = (String)e.nextElement();
	
// 	out.print("val : " + val);
	
	
// }	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 마이페이지</title>

<script src="resources/plugins/jquery/jquery-3.6.1.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/3.2.1/jquery.serializejson.min.js"></script>	
<!-- 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




<script>
//이미지 첨부파일 업로드 미리보기 
function preview() {
	  let frame = document.getElementById('imgFrame');
	  frame.src=URL.createObjectURL(event.target.files[0]);
	}
</script>	


</head>
<body>





	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />

		<div id="content" class="mypage-wrap">

			<!-- 제목   -->
			<div class="join_top_txt">
				<strong>나의 정보 수정</strong>
				<p>대표 프로필 사진과 프로필 정보를 수정 하실 수 있습니다.</p>
			</div>
			<!--  //제목   -->
		
		
			
			
			

			<form id="mypageModify" method="post"  action="/tour/mypageModify.do" enctype="multipart/form-data">

				<input type="hidden" name="memId" value="<%=mv.getMemId()%>">
				<div class="profile_item_wrap">
					<!-- 프로필 사진 -->
					<div class="profile_e_wrap form-group">
						<p class="tit">프로필 사진</p>
					
		
						
					 <div class="profile_myimg"> 

				 		<%if(mv.getAtchFile()==null || "".equals(mv.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
							<img id="imgFrame" src="resources/images/profile_bg.png" alt="프로필 사진">
						<%}else{%> <!-- 첨부파일이 있을 경우 -->
							<img id="imgFrame" src="<%= mv.getAtchFile() %>" alt="">
						<%}%> 
					 	
					</div> 
					
					<%if(mv.getAtchFile()==null || "".equals(mv.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
						<input onchange="preview()" id="largefileupload-file-select" class="largefileupload-input" type="file" name="atchFile">
						<%}else{%> <!-- 첨부파일이 있을 경우 -->
						<input onchange="preview()" id="largefileupload-file-select" class="largefileupload-input" type="file" name="atchFile">
					<%}%>
					
				
	
					</div>
					<!--  // 프로필 사진 -->

					<!-- 회원정보 수정   -->
					<div class="profile_e_wrap form-group">
						<p class="tit">
							회원정보 수정 <span class="info_tt">‘<em class="pink">*</em>’는
								필수입력 항목입니다.
							</span>
						</p>

						<div class="form-group">
							<label for="memId" class="col-form-label">아이디</label> 
							<input id="memId" name="memId" class="form-control" type="text" disabled="" value="<%=mv.getMemId() %>" maxlength="11" >
						</div>

						<div class="form-group">
							<label for="memNm" class="col-form-label">이름 <em class="pink">*</em></label> 
							
							<%-- <%if(mv.getMemNm()==null || "".equals(mv.getMemNm())){%>
								<input id="memNm" name="memNm" value=" " class="form-control" type="text" maxlength="20">
							<%}else { %>
								<input id="memNm" name="memNm" value="<%=mv.getMemNm()%>" class="form-control" type="text" maxlength="20">
							<%} %> --%>
							<input id="memNm" name="memNm" value="<%=mv.getMemNm()%>" class="form-control" type="text" maxlength="20" required >
						
						</div>

						<div class="form-group">
							<label for="memTel" class="col-form-label">휴대폰 번호</label> 
							<%-- <%if(mv.getMemTel()==null || "".equals(mv.getMemTel())){%> <!-- 번호 없을 경우 -->	
								<input id="memTel" name="memTel" class="form-control" type="text" value=" " maxlength="13">
							<%}else { %>
								<input id="memTel" name="memTel" class="form-control" type="text" value="<%=mv.getMemTel()%>" maxlength="13">
							<%} %> --%>
						
							<input id="memTel" name="memTel" class="form-control" type="text" value="<%=mv.getMemTel()%>" maxlength="13" required>
						

						</div>

						<div class="form-group">
							<label for="memEmail" class="col-form-label">이메일 <em
								class="pink">*</em>
							</label> 
							<input type="text" id="memEmail" name="memEmail" value="<%=mv.getMemEmail()%>" class="form-control" maxlength="50" required>
						</div>


						<div class="form-group">
							<label for="regno" class="col-form-label">주민번호</label>
							<div class="flex">
								<input id="regno" name="regno" class="form-control" type="text"
									disabled="" value="<%=mv.getMemRegno1()%>"> <span
									class="dash">-</span> <input id="regno2" name="regno2"
									class="form-control" type="text" disabled=""
									value="<%=mv.getMemRegno2()%>">
							</div>
						</div>

						 <div class="form-group inputHalf">
							<label for="memAddr" class="col-form-label">주소</label> 
							<div class="flex">
								<%if(mv.getMemAddr()==null || "".equals(mv.getMemAddr())){%> <!--  주소 없을 경우 -->	
									<input type="text"  id="address_kakao" name="memAddr" class="form-control" placeholder="주소를 입력해주세요." value=" " readonly >
								<%}else{%>
									<input type="text"  id="address_kakao" name="memAddr" class="form-control" placeholder="주소를 입력해주세요." value="<%=mv.getMemAddr()%>" readonly >
								<%}%>
								
								<%if(mv.getMemAddr2()==null || "".equals(mv.getMemAddr2())){%> <!--  주소 없을 경우 -->	
									<input name="memAddr2" class="form-control" type="text" value=" " maxlength="200">
								<%}else{%>
									<input name="memAddr2" class="form-control" type="text" value="<%=mv.getMemAddr2()%>" maxlength="200">
								<%}%>
								
							</div>
						</div>
					</div>
					<!--// 회원정보 수정   -->
				

					<!-- 비밀번호 변경 -->
					<div class="profile_e_wrap profile_pw">
						<p class="tit">
							비밀번호 변경<span class="sm_txt">비밀번호 변경시에 입력해주세요. </span>
						</p>
						<div class="form-group">
							<label for="current_password" class="col-form-label">현재
								비밀번호</label> <input id="originMemPw" name="originMemPw" type="password" class="form-control"
								autocomplete="off" placeholder="현재 비밀번호를 입력하세요." maxlength="20" value="">
						</div>
						<div class="form-group">
							<label for="pw1">비밀번호</label>
							<input name="memPw" type="password" id="pw1" placeholder="비밀번호를 입력해주세요." title="비밀번호" value=""  />
							<p class="validate_txt">※ 영문, 특수문자(!,@,#,$,%)를 포함하고 6 ~ 16자 이내로 입력해 주세요.</p>
							<p id="errPass1" class="errPass"></p>
						</div>
						<div class="form-group">
							<label for="pw2">비밀번호 확인</label>
							<input type="password" id="pw2" name="pw2" placeholder="비밀번호를 재입력해주세요." title="비밀번호 확인" value=""   />
							<p id="errPass2" class="errPass"></p>
						</div>
					</div> 
					<!-- // 비밀번호 변경 -->

					
				</div>
				<!-- 수정완료 버튼  -->
				<button type="button" id="btnEdit" class="btn btn-pink btnEdit">수정완료</button>
					
				
			</form>

		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
<script>


//현재비밀번호 수정 
$(document).ready(function(){

	$("#pw1").keyup(function() {
		
		if('<%=memberVO.getMemPw() %>' == $('#originMemPw').val()) {
			$('input[name=memPw]').focus();
		}else {
			alert('현재 비밀번호와 일치하지 않습니다.');
			$('input[name=originMemPw]').focus();
		}
		
	});
	
<%-- 
	$("#pw2").keyup(function() {
		
		if('<%=memberVO.getMemPw() %>' == $('#pw1').val()) {
			alert('기존 비밀번호와 일치합니다.');
			$('input[name=pw1]').focus();
		}else {
			$('input[name=pw2]').focus();
		}
		
	});
	 --%>
	
	
	
	$("#btnEdit").click(function() {

		
		if($('input[name=memPw]').val() != $('input[name=pw2]').val()){
			alert('비밀번호가 다릅니다');
			return; //이거 종료 되고 submit이 안됨 
		}


		
  	  if('<%=memberVO.getMemPw() %>' == document.getElementById('pw1').value) {
  		  alert('기존에 존재하는 비밀번호입니다. 다시 설정해주세요');
  		  return;
  	  }

		if(confirm("정말 수정하시겠습니까?") == true){
	        alert("수정되었습니다");
	        $('#mypageModify').submit();
		} else {
				alert("수정을 취소하였습니다.");
				return location.href = "/tour/mypageModify.do?memId=<%=mv.getMemId() %> ";
		}
	
});
	
	

	
});
	



</script>

<script>
window.onload = function(){	


	
	
	

	//비밀번호 확인에 대한 결과를 얻기위해 주민등록번호 탭으로 이동되었을때 결과를 보여주도록 이벤트를 설정하였음
	document.querySelector('#pw2').addEventListener('keyup',function(){
		
		var pw = document.getElementById('pw1').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;
        
        for(var i=0;i<SC.length;i++){
        	
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1; //특수문자 적용한 상태일 때 코드
            }
            
//          비밀번호 갯수 체크 방법
            if(pw.length < 6 || pw.length > 16){
    			//window.alert('비밀번호는 6글자 이상, 16글자이하로 입력하세요');
    			//document.getElementById('pw').value='';
    				 document.getElementById('errPass1').style.display = "block";
    				 document.getElementById('errPass1').innerHTML='비밀번호는 6글자 이상 16글자 이하로 입력하세요';
                     document.getElementById('errPass1').style.color='red';
                     document.getElementById('pw1').focus();
             } else {
            	 document.getElementById('errPass1').style.display = "block";
    				 document.getElementById('errPass1').innerHTML='사용가능한 비밀번호입니다.';
                     document.getElementById('errPass1').style.color='green';
                     document.getElementById('pw2').focus();
             }  
        	
        }
           
      //특수문자 포함 여부 확인
      if(!check_SC) {
    	  // alert("특수문자(!,@,#,$,%)중 하나를 입력하세요");
    	  document.getElementById('errPass1').style.display = "block";
    	  document.getElementById('errPass1').innerHTML='특수문자(!,@,#,$,%)중 하나를 입력하세요';
          document.getElementById('errPass1').style.color='red';
          
      }
      
    //비밀번호확인 일치 여부 확인
      if(document.getElementById('pw1').value !='' && document.getElementById('pw2').value!=''){
    	
    	  
    	  
    	  if(document.getElementById('pw1').value == document.getElementById('pw2').value){
    		  document.getElementById('errPass2').style.display = "block";
              document.getElementById('errPass2').innerHTML='비밀번호가 일치합니다.'
              document.getElementById('errPass2').style.color='green';
          } else {
        	  document.getElementById('errPass2').style.display = "block";
              document.getElementById('errPass2').innerHTML='비밀번호가 일치하지 않습니다.';
              document.getElementById('errPass2').style.color='red';
              document.getElementById('pw2').focus();
          }

    	  
    	 
      } 
    
    
	});
    
  	//주소 API) 카카오 //
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=memAddr2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
  	
}


</script>

</body>
</html>