<%@page import="java.util.List"%>
<%@page import="vo.ReviewVO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO) session.getAttribute("memberVO");
List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");
ReviewVO rv = (ReviewVO) request.getAttribute("rv");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<!-- <h2 class="h2-tit">리뷰</h2> -->

			<!-- 작성하기 목록 -->
			<div class="wrap">
				<div class="dataReqst mb0">
					<span>*은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
								<span>관광지명*</span>
								<%=rv.getTourNm()%>
							</div>
						</li>

						<li class="pwd">
							<div class="">
								<span>제목*</span>
								<%=rv.getRevTitle()%>
							</div>
						</li>
						<li class="pwd">
							<div class="">
								<span>평점*</span>
								<%=rv.getScore()%>점
							</div>
						</li>
						<li class="pwd">
							<div class="">
								<span>작성자*</span>
								<%=rv.getMemId()%>
							</div>
						</li>


						<li class="pwd">
							<div class="">
								<span>내용*</span>
								<%=rv.getRevContent()%>
							</div>
						</li>

						<li class="img-wrap"><img src="<%=rv.getAtchFile()%>">

						</li>
					</ul>
				</div>
			</div>


			<div class="btn-wrap">
				<!-- 					<a -->
				<%-- 						<%if (mv == null || "".equals(mv)) {%> href="/tour/login.do" --%>
				<%-- 						<%} else {%> href="reviewUpdate.do?revCode=<%=rv.getRevCode()%>" class="btn btn-line">수정하기</a> --%>
				<!-- 					<a id= "insert_btn" class="btn btn-line">삭제하기</a> -->
				<%-- 					<% --%>
				<!-- 			} -->
				<%-- 					%> --%>
				<!-- 					<a href="/tour/review.do"  class="btn btn-blue">목록</a>  -->


				<%
					if (mv != null) {
				%>
				<%
					if (mv.getMemId().equals(rv.getMemId())) {
				%>
				<a href="reviewUpdate.do?revCode=<%=rv.getRevCode()%>"
					class="btn btn-line">수정하기</a> 
					<a id="insert_btn"class="btn btn-line">삭제하기</a> 
				<%
					}
				%>
				<%
					}
				%>
				<a href="/tour/review.do" class="btn btn-blue">목록</a>

			</div>




		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
	<script>
	$("#insert_btn").click(function(){
	    if(confirm("정말 삭제하시겠습니까 ?") == true){
	        alert("삭제되었습니다");
	        location.href="/tour/reviewDelete.do?revCode=<%=rv.getRevCode()%>";
							} else {
								alert("삭제를 취소하였습니다.");
								return location.href = "/tour/review.do";
							}
						});
	</script>
</body>
</html>