<%@page import="common.FileUploadServiceImpl"%>
<%@page import="common.IFileUploadService"%>
<%@page import="vo.AdminVO"%>
<%@page import="vo.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width" />
<title>대전오슈</title>


<link rel="stylesheet" type="text/css" href="resources/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/owl/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/owl/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/font.css">
<link rel="stylesheet" type="text/css" href="resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="resources/css/cmpt.css">
<link rel="stylesheet" type="text/css" href="resources/css/content.css">
<link rel="stylesheet" type="text/css" href="resources/css/board.css">



<script src="resources/plugins/jquery/jquery-3.6.1.min.js"></script>
<script src="resources/plugins/jquery/jquery-ui.min.js"></script>
<script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="resources/plugins/owl/owl.carousel.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/common.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>


<div id="wrap">

	<header id="header" class="">

		<div class="wrap">
			<div class="ciLogo">
				<h1>
					<a href="/tour/index.do" target="_self" title="대전관광 로고">메인바로가기</a>
				</h1>
			</div>

			<!-- GNB s -->
			<div class="gnb">
				<div class="gnbTopWrap">
					<div class="utilwrap">
						<ul>
							<%if(memberVO != null){ %>
							<li class="hdstcut profile-wrap">
								<div class="profile">
									<%if(memberVO.getAtchFile()==null || "".equals(memberVO.getAtchFile())){%>
										<img src=" resources/images/profile_bg.png" alt="프로필 사진">
									<%}else{%> 
										<img id="profile" src="<%= memberVO.getAtchFile() %>" alt="">
									<%}%>
								</div> 
								<span><%=memberVO.getMemNm() %>님 안녕하세요</span>
							</li>
							<li class="hdstcut"><a href= "<%=request.getContextPath()%>/logout.do">
							로그아웃 </a></li>
							<li class="hdstcut"><a href= "mypage.do?memId=<%=memberVO.getMemId()%>" >마이페이지 </a></li> 
							<% } else if(adminVO != null)  {%>
							<li class="hdstcut profile-wrap">
								<div class="profile">
								
									<%if(adminVO.getAtchFile()==null || "".equals(adminVO.getAtchFile())){%>
										<img src="resources/images/profile_bg.png" alt="프로필 사진">
									<%}else{%> 
										<img id="profile" src="<%= adminVO.getAtchFile() %>" alt="">
									<%}%>
								</div>
									<span><%=adminVO.getAdminNm() %>님 안녕하세요</span>
								
							</li>
							<li class="hdstcut"><a href= "<%=request.getContextPath()%>/logout.do">로그아웃 
							</a></li>
							<li class="hdstcut"><a href= "mypageAdmin.do?adminId=<%=adminVO.getAdminId()%>" >마이페이지 </a></li> 
							<% }else{ %>
							<li class="hdstcut"><a href= "<%=request.getContextPath()%>/login.do">로그인 </a></li>
							<li class="hdstcut"><a href= "<%=request.getContextPath()%>/join.do">회원가입 </a></li>
							<%} %>
							<li class="hdsns">
								<ul>
									<li class="blog"><a href="https://blog.naver.com/daejeontour" target="_blank">블로그</a> </li>
									<li class="fb"><a href="https://www.facebook.com/daejeontourism" target="_blank">페이스북</a></li>
									<li class="insta"><a href="https://www.instagram.com/daejeontourism/" target="_blank">인스타그램</a></li>
									<li class="ytb"><a href="https://www.youtube.com/channel/UCzRPq736TUcnIIDdfapXXZw" target="_blank">유튜브</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- <div class="gnbBtn">
						<a href="javascript:void(0)"> <span>메뉴열기</span>
							<div></div>
							<div></div>
							<div></div>
						</a>
					</div> -->
				</div>
	
				<ol class="depth1">
					<li class="" style=""><a href="<%=request.getContextPath()%>/introduce.do"><span>관광지소개</span></a>
						<ol class="depth2" style="left: 678.898px;">
							<li><a href="<%=request.getContextPath()%>/introduce.do"><span>관광지소개</span></a></li>
							<li><span><a href="<%=request.getContextPath()%>/randomTour.do">랜덤여행추천</a></span></li>
						</ol>
						<div class="gnbBg" style=""></div></li>

					<li class="" style=""><a href="/tour/reserv.do"><span>관광지예약</span></a>
						<ol class="depth2" style="left: 851.75px;">
							<li><span><a href="<%=request.getContextPath()%>/reserv.do">관광지예약</a></span></li>
							<%if(memberVO != null){%>
							<li><span><a href="mypage.do?memId=<%=memberVO.getMemId()%>">예약확인</a></span></li>
							<%}else{%>
							<li><span><a href="<%=request.getContextPath()%>/login.do">예약확인</a></span></li>							
							<% } %>
							<%-- <li><span><a href="javascript:void(0);">예약취소</a></span></li> --%>
							<li><span><a href="/tour/review.do	">여행리뷰</a></span></li>
						</ol>
						<div class="gnbBg" style=""></div></li>

					<%-- <li class="" style=""><a href="<%=request.getContextPath()%>/bus.do"><span>여행도우미</span></a>
						<ol class="depth2" style="left: 678.898px;">
							<li><span><a href="<%=request.getContextPath()%>/bus.do">대전버스노선</a></span></li>
							<li><span><a href="<%=request.getContextPath()%>/randomTour.do">랜덤여행추천</a></span></li>
						</ol>
						<div class="gnbBg" style=""></div></li> --%>
						
					<li class="" style="">
							
							<%if(memberVO != null){ %>
							<a href="<%=request.getContextPath()%>/event.do"><span>축제/행사소개</span></a>
							<%}else if(adminVO != null)  {%>
							<a href="<%=request.getContextPath()%>/adminEvent.do"><span>축제/행사소개</span></a>
							<% }else { %>
							<a href="<%=request.getContextPath()%>/event.do"><span>축제/행사소개</span></a>
							<%} %>
							
							<ol class="depth2" style="left: 851.75px;">
							
								<% if(adminVO != null)  {%>
									<li><span><a href="<%=request.getContextPath()%>/adminEvent.do">축제/행사소개</a></span></li>
								<% }else { %>
									<li><span><a href="<%=request.getContextPath()%>/event.do">축제/행사소개</a></span></li>
								<%} %>
							
							</ol>

					<li class="" style="">

							<a href="<%=request.getContextPath()%>/notice.do"><span>알림마당</span></a>
							<ol class="depth2" style="left: 851.75px;">
								<li><span><a href="<%= request.getContextPath() %>/notice.do">공지사항</a></span></li>


							<% if(adminVO != null)  {%>
								<li><span><a href="<%=request.getContextPath()%>/adminPhoto.do">갤러리</a></span></li>
							<% }else { %>
								<li><span><a href="<%=request.getContextPath()%>/photo.do">갤러리</a></span></li>
							<%} %>

								<li><span><a href="<%=request.getContextPath()%>/qna.do">문의게시판</a></span></li>
								<% if(memberVO != null)  {%>
								<li><span><a href="<%=request.getContextPath()%>/survey.do">설문조사</a></span></li>
								<% }else { %>
								<li><span><a href="<%=request.getContextPath()%>/login.do">설문조사</a></span></li>
								<%} %>
							</ol>
	
							<div class="gnbBg" style=""></div></li>
				</ol>
			</div>
			<!-- GNB e -->
		</div>
	</header>


	<div class="wrap wtheWrap">
         <div class="tourWther">
             <div class="wthertxt">
                 <span>대전시</span>
                 <!-- <span id="day">01.01(토)</span> -->
             </div>
             <div class="wtherview">
                 <div id="wth" class="wtherimg w02"></div>
                 <span id="tmp" class="temper">12</span>
             </div>
         </div>
		<div class="tourWther travMap">
			<a href="<%=request.getContextPath()%>/introduce.do">
				<div class="wthertxt">
					<span>Travel Map</span>
				</div>
				<div class="wtherview">
				</div>
			</a>
        </div>
    </div>	
    
    <div class="topBtn on"></div>


</body>
</html>
