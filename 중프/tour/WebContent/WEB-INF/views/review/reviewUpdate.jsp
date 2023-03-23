<%@page import="vo.TourVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.ReviewVO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO)session.getAttribute("memberVO");
	ReviewVO rv = (ReviewVO)request.getAttribute("rv");
	List<TourVO> tourList = (List<TourVO>)request.getAttribute("tourList");
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
			<!-- <h2 class="h2-tit">리뷰수정</h2> -->

			<!-- 작성하기 목록 -->
			<form id="bbsForm" name="ReviewVO" action="reviewUpdate.do"
				method="post" enctype="multipart/form-data">
				<div class="wrap">
					<div class="dataReqst mb0">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li>
								<div class="">
									<span>관광지명*</span>
									 <input type="text" name="tourNm" value="<%=rv.getTourNm() %>"  list="depList"/>
									<datalist id="depList">
								<c:forEach var="list" items="${requestScope.list}" varStatus="stts">
										<option value="${list.tourNm}"></option>
								</c:forEach>
									</datalist>
									
								</div>
							</li>

							<li class="pwd">
								<div class="">
									<span>제목*</span> <input type="text" name="revTitle" value="<%=rv.getRevTitle() %>"/>
								</div>
							</li>
							<li class="pwd">
								<div class="">
									<span>작성자*</span> <input type="text" name="memId" value="<%=mv.getMemId() %>"/>
								</div>	
							</li>
							<li class="">
								<div>
									<span>평점*</span>
									<div id="star" class="stars">
										<!-- 부모 -->
										<a href="javascript:void(0);" value="1" class="on">★</a>
										<!-- 자식들-->
										<a href="javascript:void(0);" value="2" class="on">★</a> 
										<a href="javascript:void(0);" value="3" class="on">★</a> 
										<a href="javascript:void(0);" value="4">★</a>
										<a href="javascript:void(0);" value="5">★</a>
									
									</div>
								</div>
							</li>
														
							<li class="">
								<div class="">
									<span>내용*</span> 
									<textarea type="text" name="revContent" value=""><%=rv.getRevContent() %></textarea>
								</div>
							</li>
						

							<li class="">
							<div>
								<span>첨부파일*</span>
								<input type="file" name="atchFile" value ="<%=rv.getAtchFile() %>"/>
								 <%-- <img src="<%=rv.getAtchFile()%>" style="float: none; width: 130px;margin-top: 15px; ">  --%>
							</div>
							</li>
							

						
						</ul>
						<input type= hidden name="revCode" value="<%=rv.getRevCode()%>">
					</div>
				</div>
			<input type = "hidden" name ="score" value = ""> 
				<div class="btn-wrap">
					
					<button type="submit" class="btn btn-line" id = "insert_btn">수정하기</button>
				<a href="/tour/review.do" class="btn btn-blue">목록</a>
				</div>
			</form>



		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
	<script >
	$("#insert_btn").click(function(){
	        alert("수정되었습니다");
	        location.href ="/tour/reviewDetail.do?revCode=<%=rv.getRevCode()%>";
	});
	

	$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
	 var Rscore = $(this).attr("value");
	 $('input[name=score]').attr('value',Rscore); 
	 });
	</script>
</body>
</html>