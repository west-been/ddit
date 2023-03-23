<%@page import="vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% AdminVO id = (AdminVO) session.getAttribute("AdminVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리작성 | 대전오슈</title>

</head>
<!-- --------------------------------------------------------------------------------------------------------- -->
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 작성하기 목록 -->
			<form id="bbsForm" name="photoVO" action="/tour/photoWrite.do"
				method="post" enctype="multipart/form-data">
				<div class="wrap">
					<div class="dataReqst half">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li>
								<div class="">
									<span>제목*</span> <input type="text" name="photoTitle" value="" />
								</div>
							</li>

							<li class="pwd">
								<div class="">
									<span>작성자*</span> <input type="text" name="adminId" value="admin1" />
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
						</div>
					
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
						<a href="/tour/adminPhoto.do">돌아가기</a>
						<button type="submit" class="contac">작성하기</button>
					</div>
				</div>
			</form> -->
<!-- --------------------------------------------------------------------------------------------------------- -->

				</form>
                        <div class="contac"> 
                        	<a href="/tour/adminPhoto.do" class="btn btn-line">취소</a>
                        	<a href="javascript:void(0);" class="btn btn-blue saveBtn" >등록하기</a>
                        </div>
						<script>
							/*  $(".goList").click(function () {
								location.href = location.href; 
							});  */

						    $(".saveBtn").click( function (evt) {
						    	evt.preventDefault();
						    	if (!$.trim($('input[name=photoTitle]').val())) {
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
								}
						    	if(!$('input[name=atchFile]').val()){
						    		alert("이미지를 첨부하세요.");
						    	}else{
								var ctext = "갤러리를 작성합니다. 확실합니까?"
								if ( confirm(ctext) ) { $("#bbsForm").submit(); }	
						    	}							
						    });
						   
						</script> 
                   
<!-- --------------------------------------------------------------------------------------------------------- -->
		</div> <!-- id="content" -->
	</div> <!-- id="sub" -->
	<jsp:include page="../../includes/footer.jsp" />
<!-- --------------------------------------------------------------------------------------------------------- -->
</body>
</html>