<%@page import="vo.AdminVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.TourVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<TourVO> tourList = (List<TourVO>)request.getAttribute("tourList");
	MemberVO id = (MemberVO)session.getAttribute("memberVO");
	
	String dateEndMsg = session.getAttribute("dateEndMsg") == null ?
			"" : (String) session.getAttribute("dateEndMsg");
	session.removeAttribute("dateEndMsg");
	
	AdminVO id2 = (AdminVO) session.getAttribute("adminVO");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>관광지예약 | 대전오슈</title>

<%
	if(dateEndMsg.equals("변경성공")){
%>

<script>
	alert('죄송합니다. 해당 관광지의 운영기간이 초과되어 예약이 불가합니다.');
</script>
<%
	}
%>

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		
		
		
		<div id="content">
		
			<div class="search_wrap">
				<!-- 게시판 검색 시작 { -->
				<div class="bo_sch_wrap">
					<fieldset class="bo_sch">
						<form name="fsearch" method="get" id="searchForm" action="/tour/reserv.do">
							<div class="input-group">
								<div class="select-group">
									<input type="hidden" name="bo_table" value="qna"> <input
										type="hidden" name="sca" value=""> <input type="hidden"
										name="sop" value="and">
									<!--  <label for="sfl" class="sound_only"></label> -->
									<div class="select-inner">
										<select name="arraySort" id="arraySort">
											<option value="as_basic">정렬기준</option>
											<option value="as_subjectAsc">제목(가나다)</option>
											<option value="as_subjectDesc">제목(다나가)</option>
											<option value="as_priceDesc">비용(고가 순)</option>
											<option value="as_priceAsc">비용(저가 순)</option>
											<option value="as_capacityDesc">예약가능인원(많은 순)</option>
											<option value="as_capacityAsc">예약가능인원(적은 순)</option>
										</select> 
										<i class="arr firstIcon"></i>
										<select name="sfl" id="sfl">
											<option>검색기준</option>
											<option value="wr_subject">제목</option>
											<option value="wr_content">내용</option>
											<option value="wr_location">주소</option>
											<!-- <option value="wr_subject||wr_content">제목+내용</option> -->
										</select> 
										<i class="arr" secondIcon></i>
									</div>	
									<div class="input-wrap">
										<input type="text" name="stx" value="" id="stx"
											class="sch_input" size="25" maxlength="20"
											placeholder=" 검색어를 입력해주세요">
									
										<button type="submit" class="sch_btn btn">
											<i class ="fa fa-search" aria-hidden="true">검색</i>
										</button>
									</div>	
									
								</div>	
								<a href="/tour/reserv.do" class="btn btn-total">
									<i class="fa fa-search" aria-hidden="true">전체보기</i>
								</a>
							</div>	
						</form>
					</fieldset>
				</div>
			</div>
		
		<c:set var="currentPage" value="${requestScope.cPage}"/>
			<div id="tour_list">
				<ul class="tour_list">
					<c:forEach var="list" items="${requestScope.list}" varStatus="stts">
					<c:set var="color" value="${list.tourCapacity}"/>
					<li>
					<c:choose>
						<c:when test="${color == 0}">
							<div class="tour_info">
						</c:when>
						<c:otherwise>
							<div class="tour_info ing">
						</c:otherwise>
					</c:choose>
							<div class="title_wrap">
								<a href="/tour/reservdetail.do?tourCode=${list.tourCode}" class="title">${list.tourNm}</a>
							</div>

							<div class="info_cont">
								<dl>
									<dt>주소</dt>
									<dd>${list.tourLocation}</dd>
								</dl>
								<dl>
									<dt>비용</dt>
									<c:set var="price" value="${list.tourPrice}"/>
									<c:choose>
										<c:when test="${price == 0 }">
										<dd>무료</dd>
										</c:when>
										<c:otherwise>
										<dd>${list.tourPrice} 원</dd>
										</c:otherwise>
									</c:choose>
								</dl>
								<dl>
									<dt>운영시간</dt>
									<dd>${list.startTime} ~ ${list.endTime}</dd>
								</dl>
								<dl>
									<dt>운영기간</dt>
									<dd>
										${list.startDate} ~ ${list.endDate}
									</dd>
								</dl>
							</div>
						</div>
						<div class="tour_reserv">
							<div class="seat">
								<c:choose>
									<c:when test="${color == 0}">
								<span class="st_num_end"><em>신청마감</em></span>		
									</c:when>
									<c:otherwise>
								<span class="st_num"><em>${list.tourCapacity}</em> <i>명 신청가능</i> </span>
										
									</c:otherwise>
								</c:choose>
							</div>
							<ul class="p_btn">
								<c:choose>
									<c:when test="${color == 0}">
									</c:when>
									<c:otherwise>
										<li><a
											<%if(id==null || "".equals(id)){%>
											href="/tour/login.do"
											<%}else{%>
											href="/tour/reserveach.do?tourCode=${list.tourCode}"
											<% } %>
											class="btn btn-line">바로 예약하기</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</li>
					</c:forEach>

				</ul>
				<!-- //tour_list -->
				
				
						
				 <%if(id2==null || "".equals(id2)){%>
				<div>
					 <%}else{%>
				<div class="btn-wrap"><a href ="/tour/reservationAdd.do" class="btn btn-blue">관광지추가</a></div>
		<%}%>
			</div>
			
				
				
	<c:if test="${fn:length(list) > 4}">
				<div id="pagelist" class="paginate">

				<c:set var="currentPage" value="${requestScope.cPage}"/>
       	<span class="current">현재페이지: <c:out value="${currentPage}" /></span>
       	
       	
       	
      <%-- 페이지영역 --%>
      <div id="pagelist">
	    <ul class="pager">
		  <li><a class="prev" href="#">Prev</a></li>
		</ul>
		<ul class="pagination pager">
		  <c:forEach var="i" begin="${requestScope.sPage}" end="${requestScope.ePage}">
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
	</c:if>

				</div>
				<!-- //paginate -->
				
		
			
			
			
			
		</div>
		
		<jsp:include page="../../includes/footer.jsp" />
	</div>

<script>
	
//페이지번호 클릭이벤트
$(".paging").on('click',function(){
	//alert($(this).text());
	location.href="/tour/reserv.do?pageNo=" + $(this).text(); 
});


let currentPage;
// 이전버튼 클릭이벤트
$(".prev").on('click',function(){
	if( ${currentPage} == 1 ){
		currentPage = ${currentPage};
	}else{
		currentPage = ${currentPage} - 1;	
	}
	location.href="/tour/reserv.do?pageNo=" + currentPage;
});

// 다음버튼 클릭이벤트
$(".next").on('click',function(){
	if( ${currentPage} == ${requestScope.ttPage} ){
		currentPage = ${currentPage};
	}else{
		currentPage = ${currentPage} + 1;	
	}
	location.href="/tour/reserv.do?pageNo=" + currentPage;
});	
	
</script>
</body>
</html>