<%@page import="vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageFile = request.getParameter("page");	
	EventVO ev = (EventVO)request.getAttribute("ev");
%>


<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

				<div class="post_wrap">
					<h2 id="bo_v_title" class="post_tit">
						<span class="bo_v_tit"> <%=ev.getEventNm()%></span>
					</h2>
					<div class="post_info">
						<ul>
							<li>장소 :  <%=ev.getEventLocation()%></li>
							<li>주최 : <%=ev.getEventHost()%></li>
							<li>문의전화 : <%=ev.getEventTel()%></li>
						</ul>
					</div>
					
					<section id="bo_v_atc" class="post_con">
						<div id="bo_v_con">
							<img src="<%=ev.getAtchFile()%>">
						</div>
					</section>
				</div>

			<div class="btn_wrap txt_r">
				<a href="/tour/event.do" class="btn btn-blue">목록</a>
			</div>


			<jsp:include page="../../includes/footer.jsp" />
		</div>
</div>