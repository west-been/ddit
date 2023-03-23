<%@page import="vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AdminVO id = (AdminVO) session.getAttribute("AdminVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>축제/행사작성 | 대전오슈</title>

</head>
<body>

<div id="sub">
      <jsp:include page="../../includes/header.jsp" />
      <jsp:include page="../../includes/subVisual.jsp" />
      <div id="content">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 작성하기 목록 -->
			<form id="bbsForm" name="EventVO" action="/tour/adminEventWrite.do"
				method="post" enctype="multipart/form-data">
				<div class="wrap">
					<div class="dataReqst half mb0">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li class="pwd">
								<div class="">
									<span>작성자*</span> <input type="text" name="adminId" value="admin1" />
								</div>
							</li>
							
							<li>
								<div class="">
									<span>축제명*</span> <input type="text" name="eventNm" value="" />
								</div>
							</li>

							
							<li class="pwd">
								<div class="">
									<span>축제장소*</span> <input type="text" name="eventLocation" value="" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>주체*</span> <input type="text" name="eventHost" value="" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>축제기간*</span> <input type="text" name="eventPeriod" value="" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>문의전화*</span> <input type="text" name="eventTel" value="" />
								</div>
							</li>

							<li class="pwd">
								<div class="">
									<span>비밀번호*</span> <input type="password" name="password"
										id="password" maxlength="4" class="pwInput" value="">
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>비밀번호 확인*</span> <input type="password" name="password2"
										id="password2" maxlength="4" class="pwInput" value="">
								</div>
							</li>
						</ul>
						
						<div class="dataReqst mb0">
						<ul>
						<li class="">
								<div class="">
									<span>첨부파일*</span>
									<input type="file" name="atchFile">
								</div>
							</li>
							</ul>
							</div>
						
					</div>
				</div>

				<!-- 첨부파일 예시입니다.  -->
				<!-- <h1>FileUpload 테스트</h1>
				작성자<input type="text" name="fileWriter"><br> 
				파일<input type="file" name="atchFile"><br> 
				파일설명<br/>
				<textarea name="fileDescription" rows="5" cols="30"></textarea>
				<br />
				<br /> <input type="submit" value="업로드"> -->

<!-- 				<div class="postBttm">
					<div class="goList">
						<a href="/tour/adminEvent.do">돌아가기</a>
						<button type="submit" class="contac">작성하기</button>
					</div>
				</div>-->
<!-- --------------------------------------------------------------------------------------------------------- -->
			</form> 
					
						<div class="contac">
							<a href="/tour/adminEvent.do" class="btn btn-line">취소</a>
							<a href="javascript:void(0);" class="btn btn-blue saveBtn">등록하기</a>
							<a href="javascript:void(0);" class="btn btn-blue total">전체 등록</a>
						</div>

						<script>
							/* $(".goList").click(function () {
								location.href = location.href; 
							}); */

						    $(".saveBtn").click( function (evt) {
						    	evt.preventDefault();
						    	if (!$.trim($('input[name=adminId]').val())) {
									alert("작성자를 입력해 주세요.");
									$('input[name=adminId]').focus();
									return false;
								} else if ($('input[name=eventNm]').val() == "") {
									alert("축제명을 입력해 주세요.");
									$('input[name=eventNm]').focus();
									return false;
								} else if ($('input[name=eventLocation]').val() == "") {
									alert("축제장소를 입력해 주세요.");
									$('input[name=eventLocation]').focus();
									return false;
								} else if ($('input[name=eventHost]').val() == "") {
									alert("주체를 입력해 주세요.");
									$('input[name=eventHost]').focus();
									return false;
								} else if ($('input[name=eventPeriod]').val() == "") {
									alert("축제기간을 입력해 주세요.");
									$('input[name=eventPeriod]').focus();
									return false;
								} else if ($('input[name=eventTel]').val() == "") {
									alert("전화번호를 입력해 주세요.");
									$('input[name=eventTel]').focus();
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
								}
						    	if(!$('input[name=atchFile]').val()){
						    		alert("이미지를 첨부하세요.");
						    	}else{
								var ctext = "축제/행사 게시글을 작성합니다. 확실합니까?"
								if ( confirm(ctext) ) {
									$("#bbsForm").submit(); }	
						    	}							
						    });
						   
						</script> 
						
						<script>
						$('.total').click(function () {
							$('input[name=eventNm]').attr('value',"2023 대전맨몸마라톤");
							$('input[name=eventLocation]').attr('value',"엑스포과학공원");
							$('input[name=eventHost]').attr('value',"(주)맥키스컴퍼니");
							$('input[name=eventPeriod]').attr('value',"2023. 1. 1(일) 11시 11분 11초");
							$('input[name=eventTel]').attr('value',"042-580-1855");
						});
					
						
					
						
						</script>
              
<!-- --------------------------------------------------------------------------------------------------------- -->
      </div>
      <jsp:include page="../../includes/footer.jsp" />
   </div>

</body>
</html>