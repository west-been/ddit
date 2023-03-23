<%@page import="vo.AdminVO"%>
<%@page import="vo.PhotoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PhotoVO> ptList = (List<PhotoVO>)request.getAttribute("ptList");
PhotoVO pv = (PhotoVO)request.getAttribute("pv");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>갤러리상세 | 대전오슈</title>

</head>
<!-- --------------------------------------------------------------------------------------------------------- -->
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 상세페이지 목록 -->
			
			
			
				<div class="post_wrap">
					<h2 id="bo_v_title" class="post_tit">
						<span class="bo_v_tit"><%=pv.getPhotoTitle()%></span>
					</h2>
					<div class="post_info">
						<ul>
							<li>기간 :  <%=pv.getPhotoDate()%></li>
							<li>작성자 : <%=pv.getAdminId()%></li>
							<li>조회수 :<%=pv.getPhotoHits() + 1%></li>
						</ul>
					</div>
					
					<section id="bo_v_atc" class="post_con">
						<div id="bo_v_con">
							<img src="<%=pv.getAtchFile()%>">
						</div>
					</section>
				</div>
			


<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 버튼 -->
 					<%-- <div class="postBttm">
						<div class="goList">
							<a href="/tour/adminPhoto.do">목록</a> <a
								href="photoUpdate.do?photoCode=<%=pv.getPhotoCode()%>">수정하기</a>
							<a href="photoDelete.do?photoCode=<%=pv.getPhotoCode()%>">삭제하기</a>
						</div>
					</div> --%>
			
	<form id="bbsForm" action="/tour/photoDelete.do">

						<div class="contac">
							<a href="photoUpdate.do?photoCode=<%=pv.getPhotoCode()%>" class="btn btn-line">수정</a>
							<a href="photoDelete.do?photoCode=<%=pv.getPhotoCode()%>" class="btn btn-line deleteBtn">삭제</a>
							<a href="/tour/adminPhoto.do" class="btn btn-blue">목록</a>
						</div>
						
							
                        	
						<script>
							/* $(".goList").click(function () {
								location.href = location.href; 
							}); */

						    $(".deleteBtn").click( function () {
								var ctext = "게시글을 삭제합니다. 확실합니까?"
			
								if ( confirm(ctext) == true) { 
									$("#bbsForm").submit(); 
									
								}else{
									return false;
								}
						    });
						</script> 
                 		
						</form>
			
<!-- --------------------------------------------------------------------------------------------------------- -->
		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
<!-- --------------------------------------------------------------------------------------------------------- -->
</body>
</html>