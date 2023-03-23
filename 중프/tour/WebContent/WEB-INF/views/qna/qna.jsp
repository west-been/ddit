<%@page import="vo.AdminVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.QnaVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//    String pageFile = request.getParameter("page");

List<QnaVO> qnaList = (List<QnaVO>)request.getAttribute("qnaList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");	// 세션은 계속 유지되니 속성값 삭제
MemberVO id = (MemberVO) session.getAttribute("memberVO");
AdminVO id2 = (AdminVO) session.getAttribute("adminVO");
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>문의답변</title>


</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<!-- 검색 -->
			<div class="search_wrap">
				<!-- 게시판 검색 시작 { -->
				<div class="bo_sch_wrap">
					<fieldset class="bo_sch">
					
						<form name="fsearch" method="get" id="searchForm" action="/tour/qna.do">
							<div class="input-group">
								<div class="select-group">
									<input type="hidden" name="bo_table" value="qna"> 
									<input type="hidden" name="sca" value="">
									<input type="hidden" name="sop" value="and">
									<!--  <label for="sfl" class="sound_only"></label> -->
								<div class="select-inner">
									<select name="sfl" id="sfl">
										<option value="wr_subject">제목</option>
										<option value="wr_content">내용</option>
										<option value="wr_subject||wr_content">제목+내용</option>
									</select> 
									<i class="arr"></i>
								</div>
								<div class="input-wrap">
									<input type="text" name="stx" value="" required="" id="stx"
										class="sch_input" size="25" maxlength="20"
										placeholder=" 검색어를 입력해주세요">
									<button type="submit" class="sch_btn btn">
										<i class ="fa fa-search" aria-hidden="true">검색</i>
									</button>	
								</div>
									
							</div>
							
							
							<a href="/tour/qna.do" class="btn btn-total">
								전체보기
							</a>
						
							</div>
						</form>
					</fieldset>
				</div>
			</div>
			<!--글 목록 -->
			<c:set var="currentPage" value="${requestScope.cPage}" />
			<div class="board_body">
				<div class="">
					<table class="table_01 txt_c">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">문의 상태</th>
							</tr>
						</thead>

						<tbody>
							<%-- 반복되는 공지 리스트 가져오기 --%>
							<c:forEach var="qnaList" items="${requestScope.qnaList}"
								varStatus="stts">
								<tr class=" ">
									<td class="td_num2">${qnaList.qnaCode}</td>

									<td class="board_tit ellipsis txt_l">
										<a 
 									 <%if(id2==null || "".equals(id2)){%>									
										href="<%=request.getContextPath() %>/qnaDetail.do?qnaCode=${qnaList.qnaCode}"
										<%}else if(id==null || "".equals(id)){ %>
										href="<%=request.getContextPath() %>/replyDetail.do?qnaCode=${qnaList.qnaCode}"
										<% }%>
											>${qnaList.qnaTitle}</a></td>

									<td class="td_date">${qnaList.qnaDate}</td>
									<td class="td_date">${qnaList.qnaStatus}</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
				
				<!-- 작성하기 버튼 -->
				<%if(id==null || "".equals(id)){%>
				
					 <%}else{%>
					<div class="contac">
						<a href="/tour/qnaWrite.do" class="btn btn-blue"
						
						>작성하기</a>
			<% } %>
					</div>
				
				
			</div>
			<!-- ---------------------------------------------------------------------------- -->
			<%-- <div class="paginate">
				<c:set var="currentPage" value="${requestScope.cPage}" />
				현재페이지:<c:out value="${currentPage}" />
 --%>
				<%-- 페이지 영역 --%>
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
		<!-- //paginate -->

	</div>


	</div>
	<jsp:include page="../../includes/footer.jsp" />
	</div>



	<script>
	
//페이지 번호 클릭이벤트
$(".paging").on('click',function(){
	// alert($(this).text());
	location.href="/tour/qna.do?pageNo=" + $(this).text();
});

let currentPage;
// 이전버튼 클릭이벤트
$(".prev").on('click', function(){
	if(${currentPage} == 1){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} - 1;
	} location.href="/tour/qna.do?pageNo=" + currentPage;
}); 

// 다음버튼 클릭이벤트
$(".next").on('click', function(){
	if(${currentPage} == ${requestScope.ttPage}){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} + 1;
	} location.href="/tour/qna.do?pageNo=" + currentPage;
}); 
</script>






</body>
</html>