<%@page import="java.util.List"%>
<%@page import="vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageFile = request.getParameter("page");
	
	EventVO ev = (EventVO) request.getAttribute("ev");

	List<EventVO> eventList = (List<EventVO>)request.getAttribute("selectAllEvent");

%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title> 축제/행사 | 대전오슈</title>

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<div class="contents">
				<div class="wrap">
				
					<!-- 검색  -->
					<div class="search_wrap">
					<div class="bo_sch_wrap">
					<fieldset class="bo_sch">

								<form name="fsearch" method="get" id="searchForm"
									action="/tour/event.do">
									<div class="input-group">
										<div class="select-group">
											<input type="hidden" name="bo_table" value="event"> <input
												type="hidden" name="sca" value=""> <input
												type="hidden" name="sop" value="and">
											<!--  <label for="sfl" class="sound_only"></label> -->



											<div class="select-inner">
												<select name="sfl" id="sfl">
													<option value="wr_subject">제목</option>
													<option value="wr_host">장소</option>
													<option value="wr_subject||wr_content">제목+장소</option>
												</select> <i class="arr"></i>
											</div>


											<div class="input-wrap">
												<input type="text" name="stx" value="" required="" id="stx"
													class="sch_input" size="25" maxlength="20"
													placeholder=" 검색어를 입력해주세요">
												<button type="submit" class="sch_btn btn">
													<i class="fa fa-search" aria-hidden="true">검색</i>
												</button>
											</div>

										</div>
										<a href="/tour/event.do" class="btn btn-total"> 전체보기 </a>
									</div>
								</form>
							</fieldset>
					</div>
					</div>
					<!-- // 검색  -->

				
					<div class="GlistWrap">

						<ul class="dftGlist">
						
							
							<c:forEach var="selectAllEvent" items="${requestScope.selectAllEvent}" varStatus="stts">
							<li>
								<a href="eventDetail.do?eventCode=${selectAllEvent.eventCode}">
										<div class="thumWrap">
											
											<img src="${selectAllEvent.atchFile}">
										</div>
										<div class="gtxtWrap">
										<p>${selectAllEvent.eventHost }</p>
											<span> ${selectAllEvent.eventNm}</span>
											<ul>
												<li class="gtime"><span>${selectAllEvent.evertPeriod}</span></li>
												<%-- <li class="gview"><span>${selectAllEvent.eventHost }</span></li> --%>
											</ul>
										</div>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
					
					
					
					<!--  페이징  -->
					<div id="pagelist" class="pagelist">
						<c:set var="currentPage" value="${requestScope.cPage}" />
						
						<span class="current">현재페이지:<c:out value="${currentPage}" /></span>
			  
			    		<%-- 페이지영역 --%>
						<div id="pagelist">
							<ul class="pager">
								<li><a class="prev" href="#">Prev</a></li>
							</ul>
		
							<ul class="pagination pager">
								<c:forEach var="i" begin="${requestScope.sPage}"
									end="${requestScope.ePage}">
									<c:if test="${currentPage == i}">
										<li class="active"><a class="paging" href="#">${i}</a></li>
									</c:if>
		
									<c:if test="${currentPage != i}">
										<li><a class="paging" href="#">${i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							
							<ul class="pager">
								<li><a class="next" href="#">Next</a></li>
							</ul>
						</div>
					</div>
					
				

				</div>
			</div>
			
			

		</div>


		<jsp:include page="../../includes/footer.jsp" />

	</div>
	
<script>
	
//페이지 번호 클릭이벤트
$(".paging").on('click',function(){
	// alert($(this).text());
	location.href="/tour/event.do?pageNo=" + $(this).text();
});

let currentPage;
// 이전버튼 클릭이벤트
$(".prev").on('click', function(){
	if(${currentPage} == 1){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} - 1;
	} location.href="/tour/event.do?pageNo=" + currentPage;
}); 

// 다음버튼 클릭이벤트
$(".next").on('click', function(){
	if(${currentPage} == ${requestScope.ttPage}){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} + 1;
	} location.href="/tour/event.do?pageNo=" + currentPage;
}); 
</script>
     	
	
	
</body>
</html>