
<%@page import="vo.AdminVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	AdminVO av = (AdminVO) request.getAttribute("av");
	
	
	//MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 마이페이지</title>

<!-- 주소 API -->
<script src="resources/plugins/jquery/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


window.onload = function(){	
	//비밀번호 확인에 대한 결과를 얻기위해 이동되었을때 결과를 보여주도록 이벤트를 설정하였음
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
				 document.getElementById('errPass1').style.display = "block";
				 document.getElementById('errPass1').innerHTML='비밀번호는 6글자 이상 16글자 이하로 입력하세요';
                 document.getElementById('errPass1').style.color='red';
         } else {
        	 document.getElementById('errPass1').style.display = "block";
				 document.getElementById('errPass1').innerHTML='사용가능한 비밀번호입니다.';
                 document.getElementById('errPass1').style.color='green';
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
         if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
             if(document.getElementById('pw').value == document.getElementById('pw2').value){
            	 document.getElementById('errPass2').style.display = "block";
                 document.getElementById('errPass2').innerHTML='비밀번호가 일치합니다.'
                 document.getElementById('errPass2').style.color='green';
             }
             else {
            	 document.getElementById('errPass2').style.display = "block";
                 document.getElementById('errPass2').innerHTML='비밀번호가 일치하지 않습니다.';
                 document.getElementById('errPass2').style.color='red';
             }
         }
        
	});

  	//주소 API) 카카오 //
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=adminAdd2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
	
	
}

//현재비밀번호 수정 
$(document).ready(function(){
	//alert($('#adminPw').val()); 
	<%--  alert(<%=adminVO.getAdminPw() %>); --%>

	$("#btnEdit").click(function() {
		if('<%=adminVO.getAdminPw() %>' != $('#adminPw').val()) {
			alert('현재 비밀번호와 일치하지 않습니다.');
			$('input[name=originAdminPw]').focus();
		}else if(confirm("정말 수정하시겠습니까?")) {
			$('#mypageModify').submit();
		}
	});
});


</script>

<script>
//이미지 첨부파일 업로드 미리보기 
function preview() {
	  let frame = document.getElementById('imgFrame');
	  frame.src=URL.createObjectURL(event.target.files[0]);
	}
</script>	




<script>
	/*  $(".goList").click(function () {
		location.href = location.href; 
	});  */

	<%-- alert( );
	
    $("#btnEdit").click( function (evt) {
    	evt.preventDefault();
    	if (!($('#originMemPw').val()  == (<%=memberVO.getMemPw() %>) )) {
			alert("제목을 입력해 주세요.");
			$('input[name=photoTitle]').focus();
			return false;
		} else if ($('input[name=adminId]').val() == "") {
			alert("작성자를 입력해 주세요.");
			$('input[name=adminId]').focus();
			return false;
		} else if ($('input[name=password]').val() == "") {
			alert("비밀번호를 입력해 주세요.");
			$('input[name=password]').focus();
			return false;
		}  else if ($('input[name=password2]').val() == "") {
			alert("비밀번호확인을 입력해주세요.");
			$('input[name=password2]').focus();
			return false;
		} else if ($('input[name=password2]').val() != $('input[name=password]').val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$('input[name=password2]').focus();
			return false;
		}else{	
		var ctext = "정말 수정하시겠습니까?"
		if ( confirm(ctext) ) { $('#mypageModify').submit();}	
    	}
    	
    	
    	
    	
    }); --%>

    
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

			<form id="mypageModify" method="post"  action="/tour/mypageAdminModify.do" enctype="multipart/form-data">
				<input type="hidden" name="adminId" value="<%=av.getAdminId()%>">
				<div class="profile_item_wrap">
					<!-- 프로필 사진 -->
					<div class="profile_e_wrap form-group">
						<p class="tit">프로필 사진</p>
						
			
						 <div class="profile_myimg"> 
						 
						  <%if(av.getAtchFile()==null || "".equals(av.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
								<img id="imgFrame"  src="  resources/images/profile_bg.png" alt="프로필 사진">
							<%}else{%> <!-- 첨부파일이 있을 경우 -->
								<img id="imgFrame"  src="<%= av.getAtchFile() %>" alt="">
							<%}%>
						 </div>

						 <%if(av.getAtchFile()==null || "".equals(av.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
							<input onchange="preview()"  id="largefileupload-file-select" class="largefileupload-input" type="file" name="atchFile">
						<%}else{%> <!-- 첨부파일이 있을 경우 -->
							<input onchange="preview()"  id="largefileupload-file-select" class="largefileupload-input" type="file" name="atchFile">
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
							<input id="adminId" name="adminId" class="form-control" type="text" disabled="" value="<%=av.getAdminId()%>" maxlength="11">
						</div>

						<div class="form-group">
							<label for="memNm" class="col-form-label">이름 <em class="pink">*</em></label> 
							
							<%if(av.getAdminNm()==null || "".equals(av.getAdminNm())){%>
								<input id="adminNm" name="adminNm" value=" " class="form-control" type="text" maxlength="20">
							<%}else { %>
								<input id="adminNm" name="adminNm" value="<%=av.getAdminNm()%>" class="form-control" type="text" maxlength="20">
							<%} %>
						
						</div>

						<div class="form-group">
							<label for="adminTel" class="col-form-label">휴대폰 번호</label> 
							<%if(av.getAdminTel()==null || "".equals(av.getAdminTel())){%> <!-- 번호 없을 경우 -->	
								<input id="adminTel" name="adminTel" class="form-control" type="text" value=" " maxlength="13">
							<%}else { %>
								<input id="adminTel" name="adminTel" class="form-control" type="text" value="<%=av.getAdminTel()%>" maxlength="13">
							<%} %>
						
						</div>

						<div class="form-group">
							<label for="adminEmail" class="col-form-label">이메일 <em
								class="pink">*</em>
							</label> 
							<input type="text" id="adminEmail" name="adminEmail" value="<%=av.getAdminEmail()%>" class="form-control" maxlength="50">
						</div>



						 <div class="form-group inputHalf">
							<label for="adminAddr" class="col-form-label">주소</label> 
							<div class="flex">
								<%if(av.getAdminAddr()==null || "".equals(av.getAdminAddr())){%> <!--  주소 없을 경우 -->	
									<input type="text"  id="address_kakao" name="adminAddr" class="form-control" placeholder="주소를 입력해주세요." value=" " readonly >
								<%}else{%>
									<input type="text"  id="address_kakao" name="adminAddr" class="form-control" placeholder="주소를 입력해주세요." value="<%=av.getAdminAddr()%>" readonly >
								<%}%>
								
								<%if(av.getAdminAdd2()==null || "".equals(av.getAdminAdd2())){%> <!--  주소 없을 경우 -->	
									<input name="adminAdd2" class="form-control" type="text" value=" " maxlength="200">
								<%}else{%>
									<input name="adminAdd2" class="form-control" type="text" value="<%=av.getAdminAdd2()%>" maxlength="200">
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
								비밀번호</label> <input id="adminPw" name="originAdminPw" type="password" class="form-control"
								autocomplete="off" placeholder="현재 비밀번호를 입력하세요." maxlength="20" value="">
						</div>

						<div class="form-group">
							<label for="pw">비밀번호</label>
							<input name="adminPw" type="password" id="pw" placeholder="비밀번호를 입력해주세요." title="비밀번호"  value="" />
							<p class="validate_txt">※ 영문, 특수문자(!,@,#,$,%)를 포함하고 6 ~ 16자 이내로 입력해 주세요.</p>
							<p id="errPass1" class="errPass"></p>
						</div>
						<div class="form-group">
							<label for="pw2">비밀번호 확인</label>
							<input type="password" id="pw2" name="pw2" placeholder="비밀번호를 재입력해주세요." title="비밀번호 확인" value="" />
							<p id="errPass2" class="errPass"></p>
						</div>
		
						 
					</div> 
					<!-- // 비밀번호 변경 -->

					<!-- 수정완료 버튼  -->
					<button type="button" id="btnEdit" class="btn btn-pink btnEdit">수정완료</button>
			
				</div>
			</form>

		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>


</body>
</html>