<%@page import="vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EventVO ev = (EventVO)request.getAttribute("ev");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>축제/행사상세 | 대전오슈</title>

</head>
<!-- --------------------------------------------------------------------------------------------------------- -->
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<!-- --------------------------------------------------------------------------------------------------------- -->
			<!-- 상세페이지 목록 -->
			<div class="post_wrap">
					<h2 id="bo_v_title" class="post_tit">
						<span class="bo_v_tit"><%=ev.getEventNm()%></span>
					</h2>
					<div class="post_info">
						<ul>
							<li>장소 :  <%=ev.getEventLocation()%></li>
							<li>주최 : <%=ev.getEventHost()%></li>
							<li>기간 : <%=ev.getEvertPeriod()%></li>
							<li>문의전화 : <%=ev.getEventTel()%></li>
						</ul>
					</div>
					
					<section id="bo_v_atc" class="post_con">
						<div id="bo_v_con">
							<img src="<%=ev.getAtchFile()%>">
						</div>
					</section>	
				</div>
		


<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 버튼 -->
							<%-- <div class="postBttm">
						<div class="goList">
							<a href="/tour/adminEvent.do">목록</a> <a
								href="adminEventUpdate.do?eventCode=<%=ev.getEventCode()%>">수정하기</a> 
								<a href="adminDelete.do?eventCode=<%=ev.getEventCode()%>">삭제하기</a>
						</div>
					</div> --%>
							<form id="bbsForm" action="/tour/adminDelete.do">
									<div class="contac">
										<div class="inner">
											<a href="adminEventUpdate.do?eventCode=<%=ev.getEventCode()%>" class="btn btn-line">수정</a>
											<a id="delet" href="adminDelete.do?eventCode=<%=ev.getEventCode()%>" class="btn btn-line">삭제</a>
											<a href="/tour/adminEvent.do" class="btn btn-blue">목록</a> 
										</div>
									</div>
							</form>

								<script>
									/* $(".contac").click(function() {
										location.href = location.href;
									}); */

									$("#delet").click(function() {
										var ctext = "게시글을 삭제합니다. 확실합니까?"

										if (confirm(ctext) == true) {
											$("#bbsForm").submit();
										}else {
											return false;
										}
									});
									
									
								</script>
								
					
					
				
			
			</div>
			<!-- --------------------------------------------------------------------------------------------------------- -->
			<jsp:include page="../../includes/footer.jsp" />

		</div>
	</div>
	<!-- --------------------------------------------------------------------------------------------------------- -->

</body>
</html>