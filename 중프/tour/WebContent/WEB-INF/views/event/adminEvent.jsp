<%@page import="vo.EventVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<EventVO> evList = (List<EventVO>) request.getAttribute("EventVO");
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
	
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>축제/행사 | 대전오슈</title>


</head>
<body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									action="/tour/adminEvent.do">
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
										<a href="/tour/adminEvent.do" class="btn btn-total"> 전체보기 </a>
									</div>
								</form>
							</fieldset>
					</div>
					</div>
					<!-- // 검색  -->


					
					
							
				
<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- 게시판 목록(반복) -->
						<div class="board_body notice">
							<div class="">
								<table class="table_01 txt_c">
									<colgroup>
										<col style="width: 70px">
										<col style="width: 200px">
										<col style="width: 70px">
										<col style="width: 104px">
										<col style="width: 70px">
									</colgroup>

									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">축제명</th>
											<th scope="col">축제장소</th>
											<th scope="col">작성자</th>
											<th scope="col">주체</th>
										</tr>

										<c:forEach var="selectAllEvent"
											items="${requestScope.selectAllEvent}" varStatus="stts">
											<tr>
												<td>${selectAllEvent.eventCode }</td>
												<td><a
													href="adminEventDetail.do?eventCode=${selectAllEvent.eventCode}">${selectAllEvent.eventNm}</a></td>
												<td>${selectAllEvent.eventLocation }</td>
												<td>${selectAllEvent.adminId}</td>
												<td>${selectAllEvent.eventHost}</td>
											</tr>
										</c:forEach>

									</thead>
								</table>

							</div>
							<!-- class="tbWrap" -->
						</div>
						<!-- class="dftboard notice" -->
		
<!-- --------------------------------------------------------------------------------------------------------- -->
					<div class="contac">
							<a href="/tour/adminEventWrite.do" class="btn btn-blue">게시글 작성</a>
						</div>
				

				<%-- 	<%
						if (msg.equals("성공")) {
					%>

					<script>
						alert("정상적으로 처리되었습니다.");
					</script>

					<%
						}
					%>
 --%>
					<script>
						$(".wrtng > a").click(function() {
							$("#mode").val("form");
							$("#searchForm").submit();
						});
					</script>

			
<!-- --------------------------------------------------------------------------------------------------------- -->
<!--  페이징  -->
					<div id="pagelist">
						
						<c:set var="currentPage" value="${requestScope.cPage}" />
						<span class="current">현재페이지:
						<c:out value="${currentPage}" />
						</span>
			  
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
					<!-- // 페이징   -->
<!-- --------------------------------------------------------------------------------------------------------- -->
<script>
	
//페이지 번호 클릭이벤트
$(".paging").on('click',function(){
location.href="/tour/adminEvent.do?pageNo=" + $(this).text();});

let currentPage;
// 이전버튼 클릭이벤트
$(".prev").on('click', function(){
	if(${currentPage} == 1){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} - 1;
	} location.href="/tour/adminEvent.do?pageNo=" + currentPage;}); 

// 다음버튼 클릭이벤트
$(".next").on('click', function(){
	if(${currentPage} == ${requestScope.ttPage}){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} + 1;
	} location.href="/tour/adminEvent.do?pageNo=" + currentPage;}); 
</script>
<!-- --------------------------------------------------------------------------------------------------------- -->
		<jsp:include page="../../includes/footer.jsp" />
	</div> <!-- id="content" -->
	</div> <!-- id="sub" -->
<!-- --------------------------------------------------------------------------------------------------------- -->
</body>
</html>