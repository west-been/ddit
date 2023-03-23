<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 대전오슈</title>

<!-- 디자인 주소 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/yejicopy.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/3.2.1/jquery.serializejson.min.js"></script>	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<style>
div.main{ position: relative; padding: 20px; }
div.main input{ width: 300px; height: 30px; background-color: black; border: 0; color: white; text-indent: 10px; }
div.main i{ position: absolute; left: 75%; top: 27px; color: orange; }
</style>

<script type="text/javascript">
$(function(){
	$("#dupChk").on("click",function(){
		
		let memId = $("#memId").val();		
		
// 		alert(memId);
		
		if(memId==""){
			alert("아이디를 입력해주세요");
			return;
		}
		
		//가상 폼 생성
		let formData = new FormData();
		//<input type="text" name="id" value="z002" />
		formData.append("id", $("#memId").val());
		
		console.log("formData : " + formData);
		//dataType : 응답 데이터 타입
		//보낼 데이터
		//아작났어유.피씨다탔어
		$.ajax({
			url:"/tour/idCheck.do?id="+$("#memId").val(),
            method: "GET",
            //data: formData,
            dataType: 'text',
           // processData: false,
            success: function (result) {
                console.log("completed!!!! >> " , result);
                //1 : 중복되었음. null : 중복안됨(등록가능)
                if(result > 0){ // result가 1일때 true..
                	$("#btnSubmit").attr("disabled",true);
                	swal('아이디 중복!', "이미 사용 중인 아이디입니다.", 'warning')
                }else{
                	$("#btnSubmit").removeAttr("disabled");
                	swal('사용 가능!', "사용 가능한 아이디입니다.", 'success')
                }
            },
            error: function () {
                alert("fail~~")
            }
        });
// 		$.ajax({
// 			url:"/tour/idCheck.do",
// 			dataType:"json",
// 			data:formData,
// 			type:"get",
// 			success:function(result){
// 				console.log("result : " + JSON.stringify(result));
// 			}
// 		});
	});
});
</script>

<script>

	//////////////////비밀번호 관련/////////////////////////////
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
	
	



	

<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
		
		<!----------------------- 내용 들어갑니다 ----------------------->
			<div class="sub_cont " id="container">
				<div class="inner login-container">
					<!-- signup -->
					<form id="memberForm" name="memberVO" action="/tour/join.do" method="post">
					
					
					<div class="join_wrap bor">
						
						<h3 class="tit mb20">정보입력</h3>
						<p class="desc mb100">우리 지금, 대전가요! 대한민국의 중심으로 통하는 길 </p>
	
							
							<div class="signup2">
								<p class="stit">필수 입력 정보</p>
								<div class="table2"> <!-- <div class="table2 responsive-type mb50"> -->
									<table>
										<colgroup>
											<col style="width: 20%">
											<col style="width: 80%">
										</colgroup>
										
										<tbody>
											<tr>
												<th scope="row"><label for="id">이름</label></th><td>
												<div class="w_box">
													<div class="w384">
														<input id="name" name="memNm" title="이름" placeholder="이름을 입력해주세요." type="text" value="" maxlength="5" required />
											</tr>
											
											<tr>
												<th scope="row"><label for="id">아이디</label></th>
												<td>
													<div class="w_box">
														<div class="w384">
															<input id="memId" name="memId" title="아이디" placeholder="아이디를 입력해주세요." type="text"  value="" 
															required pattern="[a-zA-Z][a-zA-Z0-9]{3,}"  required />
															<p id ="disp"></p>
														</div>
														<div>
															<input type="button" value="중복확인" id="dupChk" class="btn btn-blue">
 															<input type="hidden" class="btn_ty_m2_c3" name = "idDuplication" vlaue = "idUncheck">
														</div>
													</div>
													<p>※ 아이디는 4 ~ 20 자리로 알파벳 소문자 와 숫자만 사용하실 수 있습니다.</p>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="pw">비밀번호</label></th>
												<td><input name="memPw" type="password" id="pw" placeholder="비밀번호를 입력해주세요." title="비밀번호"  required />
													<p>※ 영문, 특수문자(!,@,#,$,%)를 포함하고 6 ~ 16자 이내로 입력해 주세요.</p>
													<p id="errPass1"></p>
											</tr>
											<tr>
												<th scope="row"><label for="pw2">비밀번호 확인</label></th>
												<td><input type="password" id="pw2" name="pw2" placeholder="비밀번호를 재입력해주세요." title="비밀번호 확인"  required />
													<p id="errPass2"></p>
											</tr>
											<tr>
												<th scope="row"><label for="ph1">주민 등록번호</label></th><td>
												<div class="w_box">
													<div class="flex">
														<input id="memRegno1" name="memRegno1" title="주민번호" placeholder="생년월일" type="text" value=""  required />
													<span class="dash">-</span>  <input id="memRegno2" name="memRegno2" title="주민번호"  type="text" value="" >
													</div>
												</div>
											</tr>
											
											<tr>
												<th scope="row"><label for="ph1">휴대전화번호</label></th><td>
												<div class="w_box">
													<div class="w384">
														<input id="id" name="memTel" title="핸드폰번호" placeholder="'-'를 제외하고 입력해주세요." type="text" value=""  required />
														</div></div>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td>
													<div class="w_box">
														<div class="w100">
<!-- 															<label for="email" class="hidden" >이메일</label>  -->
															<input id="email" name="memEmail" title="이메일" type="text" value="" maxlength="1000" placeholder="이메일을 입력해주세요" required />
														</div>
													</div>
														<p id="errPass3"></p>
												</td>
											</tr>
											
											<tr>
            									<th>주소</th>
           										<td><input type="text" id="address_kakao" name="memAddr" placeholder="주소를 입력해주세요." readonly/></td>
       						   				</tr>
        									<tr>
		            							<th>상세 주소</th>
		            							<td><input type="text" name="memAddr2" placeholder="상세주소를 입력해주세요." /></td>
        									</tr>
											
											<tr>
												<th scope="row">정보수신</th>
												<td class="pd30">
													<div class="radio_box mb30">
														<span class="r_tit">SMS</span> 
															<label><input type="radio" class="radio" name="smsYn" value="Y" ><em></em><span>받음</span></label> 
															<label> <input type="radio" class="radio" name="smsYn" value="N"><em></em><span>받지 않음</span></label>
													</div>
													<div class="radio_box">
														<span class="r_tit">이메일</span> 
														<label>
															<input type="radio" class="radio" name="emailYn" value="Y" ><em></em><span>받음</span></label> 
														<label>
															<input type="radio" class="radio" name="emailYn" value="N"><em></em><span>받지 않음</span></label>
													</div>
													<p>※ 예약 내용 수신 등의 필수 내용은 수신여부와 관계없이 발송됩니다.</p>
												</td>
											</tr>
										</tbody>
									</table> <!-- //table -->
								</div>
							</div> <!-- //signup2 -->
					</div> <!-- //join_wrap -->
					
					<ul class="btn_area long">
						<li class="list_btn">
							<input type="submit" id="btnSubmit" class="btn btn-blue"  value = "가입하기" disabled />
						
						</li>
					</ul> 
					</form> <!-- //signup -->
				</div>
			</div> <!-- id  container 끝 -->
		</div> <!-- id content 끝 -->
		<jsp:include page="../../includes/footer.jsp" />
	</div>

</body>
</html>