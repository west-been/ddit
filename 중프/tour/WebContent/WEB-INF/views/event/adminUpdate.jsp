<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EventVO ev = (EventVO)request.getAttribute("ev");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type = "text/javascript" src="/js/jquery.min.js"></script>
<title>축제/행사수정 | 대전오슈</title>


</head>
<body>
<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 수정페이지 목록 -->
			<form id="bbsForm" name="" action="/tour/adminEventUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="eventCode" value="<%=ev.getEventCode()%>">
				<input type="hidden" name="atchFile" value="<%=ev.getAtchFile()%>">
				
				<div class="wrap">
				
						
				<div class="dataReqst mb">
				<span>*은 필수입력사항입니다.</span>
							<ul>
							<li>
								<div class="">
									<span>축제명*</span> <input type="text" name="eventNm" value="<%=ev.getEventNm() %>" />
								</div>
							</li>
							</ul>
					</div>
							
				
				
					<div class="dataReqst half mb0">
					
						<ul>
							<li class="pwd">
								<div class="">
									<span>축제장소*</span> <input type="text" name="eventLocation" value="<%=ev.getEventLocation() %>" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>주체*</span> <input type="text" name="eventHost" value="<%=ev.getEventHost() %>" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>축제기간*</span> <input type="text" name="eventPeriod" value="<%=ev.getEvertPeriod() %>" />
								</div>
							</li>
							
							<li class="pwd">
								<div class="">
									<span>문의전화*</span> <input type="text" name="eventTel" value="<%=ev.getEventTel() %>" />
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
					
						<div class="contac">
							<a href="/tour/adminEvent.do" class="btn btn-line">취소</a>
							<a href="javascript:void(0);" class="btn btn-blue editBtn">수정</a>
						</div>
										
				</div>
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 버튼 -->
<!-- 				<div class="postBttm">
					<div class="goList">
						<a href="/tour/adminEvent.do">돌아가기</a>
						<button type="submit" class="contac">수정하기</button>
					</div>
				</div> -->

                        	
						<script>
							/* $(".goList").click(function () {
								location.href = location.href; 
							}); */

						    $(".editBtn").click( function (evt) {
						    	evt.preventDefault();
						    	if (!$.trim($('input[name=eventNm]').val())) {
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
						    	
								var ctext = "축제/행사 게시판을 수정합니다. 확실합니까?"
								if ( confirm(ctext)) { 
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