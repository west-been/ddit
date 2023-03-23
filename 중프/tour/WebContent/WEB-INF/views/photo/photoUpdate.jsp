<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="vo.PhotoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PhotoVO pv = (PhotoVO)request.getAttribute("pv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리수정 | 대전오슈</title>

</head>
<!-- --------------------------------------------------------------------------------------------------------- -->
<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 수정페이지 목록 -->
			<form id="bbsForm" name="" action="/tour/photoUpdate.do" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="photoCode" value="<%=pv.getPhotoCode()%>"> 
				<input type="hidden" name="atchFile" value="<%=pv.getAtchFile()%>">
					
				<div class="wrap">
					<div class="dataReqst mb">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li>
								<div class="">
									<span>제목*</span> <input type="text" name="photoTitle"
										value="<%=pv.getPhotoTitle()%>" />
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
									<span>첨부파일</span>
									<input type="file" name="atchFile">
								</div>
							</li>
						</ul>
				</div>
					
					
					
					
				</div>
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 버튼 -->
 				<!-- <div class="postBttm">
					<div class="goList">
						<a href="/tour/adminPhoto.do">돌아가기</a>
						<button type="submit" class="contac">수정하기</button>
					</div>
				</div> -->
<!-- --------------------------------------------------------------------------------------------------------- -->

				
                       <div class="contac"> 
                       		<a href="/tour/adminPhoto.do" class="btn btn-line">취소</a>
                        	<a href="javascript:void(0);" class="btn btn-blue editBtn">수정</a>
                        </div>
                        
                        
						<script>
							/* $(".goList").click(function () {
								location.href = location.href; 
							});*/
						    $(".editBtn").click( function (evt) {
						    	evt.preventDefault();
						    	if (!$.trim($('input[name=photoTitle]').val())) {
									alert("제목을 입력해 주세요.");
									$('input[name=photoTitle]').focus();
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
								var ctext = "갤러리를 수정합니다. 확실합니까?"
							
								if ( confirm(ctext) ) { 
									$("#bbsForm").submit(); 
								alert("정상적으로 수정되었습니다.");
									}
						    });
						</script> 
                 
			</form>
<!-- --------------------------------------------------------------------------------------------------------- -->
		</div> <!-- id="content" -->
	</div> <!-- id="sub" -->
	<jsp:include page="../../includes/footer.jsp" />
<!-- --------------------------------------------------------------------------------------------------------- -->
</body>
</html>