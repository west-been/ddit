<%@page import="vo.AdminVO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//    String pageFile = request.getParameter("page");

List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
NoticeVO nv = (NoticeVO)request.getAttribute("nv");
AdminVO id = (AdminVO) session.getAttribute("adminVO");
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
	
	
			<div id="bo_v_top">
				<ul class="btn_bo_user bo_v_com">
					<!-- <li><a href="/tour/notice.do"
						class="btn_b01 btn" title="목록"><i class="fa fa-list"
							aria-hidden="true"></i><span class="sound_only">목록</span></a></li> -->
				</ul>

				<script>
            jQuery(function ($) {
                // 게시판 보기 버튼 옵션
                $(".btn_more_opt.is_view_btn").on("click", function (e) {
                    e.stopPropagation();
                    $(".more_opt.is_view_btn").toggle();
                });
                $(document).on("click", function (e) {
                    if (!$(e.target).closest('.is_view_btn').length) {
                        $(".more_opt.is_view_btn").hide();
                    }
                });
            });
        </script>
			</div>
			<%-- 제목 부분 --%>
			<div class="post_wrap">
				<h2 id="bo_v_title" class="post_tit">
					<span class="bo_v_tit"> <%= nv.getNoticeTitle() %></span>
				</h2>
				<div class="post_info">
					<ul>
						<li>작성자 : <span class="sv_member"><%= nv.getAdminId() %><br></span></li>
						<li>작성일 : <%= nv.getNoticeDate() %></li>
						<li>조회수 : <%= nv.getNoticeHits()+1 %></li>
					</ul>
				</div>
			</div>

			<%-- 내용 부분 --%>

			<section id="bo_v_atc" class="post_con">
				<div id="bo_v_img"></div>

				<%-- 본문 내용 시작 --%>
				<div id="bo_v_con">
					<%= nv.getNoticeContent() %> 
					<div id="bo_v_share"></div>
				</div>
				<%-- 본문 내용 끝 --%>
			</section>

			<%--다음. 목록--%>
			  <ul class="btn_wrap txt_r">
             <%if(id==null || "".equals(id)){%>
             <li><a href="/tour/notice.do"
               class="btn btn-blue" title="목록">목록</a></li>
            <%}else{%>
            <li ><a class="btn btn-line"
               href="/tour/noticeUpdate.do?noticeCode=<%= nv.getNoticeCode() %>">수정</a></li>
            <li ><a id= "insert_btn" class="btn btn-line">삭제</a></li>
            <li><a href="/tour/notice.do"
               class="btn btn-blue" title="목록">목록</a></li>
            <% } %>
         </ul> 
				
        
         </div>
         
		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
	
	<script >
	$("#insert_btn").click(function(){
	    if(confirm("정말 삭제하시겠습니까 ?") == true){
	        alert("삭제되었습니다");
	        location.href="noticeDelete.do?noticeCode=<%=nv.getNoticeCode()%>" 
	    }
	    else{
	    	alert("삭제를 취소하였습니다.");
	        return location.href="/tour/notice.do";
	    }
	});
	</script>
	
	

</body>
</html>

