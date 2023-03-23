<%@page import="vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");
MemberVO mv = (MemberVO) session.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>리뷰게시판</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
		
		
		<!-- 검색 -->
			<div class="search_wrap">
				<!-- 게시판 검색 시작 { -->
				<div class="bo_sch_wrap">
					<fieldset class="bo_sch">
					
						<form name="fsearch" method="get" id="searchForm" action="/tour/review.do">
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
							
							
							<a href="/tour/review.do" class="btn btn-total">
								전체보기
							</a>
						
							</div>
						</form>
					</fieldset>
				</div>
			</div>
			<!-- <h2 class="h2-tit">리뷰목록</h2> -->
			<c:set var="currentPage" value="${requestScope.cPage}" />
			<div class="table2">
				<table>
					<thead>
						<tr>
							<th scope="col" style="font-weight: bold; ">번호</th>
							<th scope="col" style="font-weight: bold; ">관광지명</th>
							<th scope="col" style="font-weight: bold; ">제목</th>
							<th scope="col" style="font-weight: bold; ">작성일</th>
							<th scope="col" style="font-weight: bold; ">작성자</th>
							<th scope="col" style="font-weight: bold; ">조회수</th>
						</tr>
					</thead>

					<c:forEach var="reviewList" items="${requestScope.reviewList}"
						varStatus="stts">
						<tbody>
							<tr>
								<td>${reviewList.revCode}</td>
								<td><a href="/tour/reviewDetail.do?revCode=${reviewList.revCode}">
								${reviewList.tourNm}</a></td>
								<td><a href="/tour/reviewDetail.do?revCode=${reviewList.revCode}">
								${reviewList.revTitle}</a></td>
								<td>${reviewList.revDate}</td>
								<td>${reviewList.memId}</td>
								<td>${reviewList.revHits}</td>
								<%-- 							<td>${list. }</td> --%>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>


			<div class="contac" style="text-align: right;">
				<!-- 				<a href="/tour/reviewWrite.do">작성하기</a> -->
<!-- 				<a -->
<%-- 				<%if (mv == null || "".equals(mv)) {%> --%>
<!-- 				href="/tour/login.do" -->
<%-- 				<%} else {%> --%>
<!-- 				href="/tour/reviewWrite.do" -->
<%-- 				<%}%> --%>
<!-- 				class="btn btn-line">작성하기</a> -->
				
			
				<div>
						<%if (mv == null || "".equals(mv)) {%> 
						<%} else {%>

					<a href="/tour/reviewWrite.do" class="btn btn-blue">작성하기</a>

					<%
						}
					%>
				</div>		
				
				
				
				
			</div>
			<div class="pagelist">
				<c:set var="currentPage" value="${requestScope.cPage}" />
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

		<jsp:include page="../../includes/footer.jsp" />
	</div>
	<script>
	
const pageLength = ${requestScope.ttPage}
getData = () => {
	const{currentPage, itemPerPage, totalItem, DataList} = this.state
	console.log(currentPage)
	axios.get()
	
}	
	
	
	
	
	
//페이지 번호 클릭이벤트
$(".paging").on('click',function(){
	// alert($(this).text());
	location.href="/tour/review.do?pageNo=" + $(this).text();
});

let currentPage;
// 이전버튼 클릭이벤트
$(".prev").on('click', function(){
	if(${currentPage} == 1){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} - 1;
	} location.href="/tour/review.do?pageNo=" + currentPage;
}); 

// 다음버튼 클릭이벤트
$(".next").on('click', function(){
	if(${currentPage} == ${requestScope.ttPage}){
		currentPage = ${currentPage};
	} else{
		currentPage = ${currentPage} + 1;
	} location.href="/tour/review.do?pageNo=" + currentPage;
}); 
</script>
</body>
</html>