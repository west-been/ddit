<%@page import="vo.MemberVO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="vo.TourVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	String pageFile = request.getParameter("page");
%> --%>
<%
	List<TourVO> tourList = (List<TourVO>)request.getAttribute("tourList");
	TourVO tv = (TourVO)request.getAttribute("tv");
	ReviewVO rv = (ReviewVO)request.getAttribute("rv");
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
	MemberVO id = (MemberVO)session.getAttribute("memberVO");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<div id="sub">
			<jsp:include page="../../includes/header.jsp" />
			<jsp:include page="../../includes/subVisual.jsp" />
			
			<div id="content">
			
			
				<div class="product-top clearfix">
					<div class="slide-side">
						<img src="<%= tv.getAtchFile() %>" alt="">
<!--  						<img src="/resources/images/reservation/ico_chk.png" alt="">  -->
					</div>
					<div class="right-side">
						<%-- <span class="product-top-tit">${list[tourCode-1].tourNm}</span> --%>
						<span class="product-top-tit"><%=tv.getTourNm()%></span>
						
							<ul class="line-list product-tbl">
								<li>
						
									  <p><%=tv.getTourInfo() %></p>
									  <ul class="extra-info">
										  <li>
										  <strong>지역</strong> <%=tv.getTourRegion() %></li>
										  <li>
										  <strong>전화번호</strong> <%=tv.getTourTel() %></li>
										  <li>
										  <strong>금액</strong>
										  <%if(tv.getTourPrice().equals("0")){%>
										  	무료
										  <%} else{%>
										  <%=tv.getTourPrice()%> 원
										  <%} %></li>
										  <li>
										  	<strong>개장 시간</strong> <%=tv.getStartTime() %> ~ <%=tv.getEndTime() %></li>
										  <li><strong>개장 기간</strong> <%=tv.getStartDate() %> ~ <%=tv.getEndDate() %></li>
									  </ul>
								</li>	
							</ul>
							
							<%if(tv.getTourCapacity()==0){%>
								<a class="btn btn-line btnend">예약마감</a>
							<%}else{ %>
								<a
										<%if(id==null || "".equals(id)){%>
										href="/tour/login.do"
										<%}else{%>
										href="/tour/reserveach.do?tourCode=<%=tv.getTourCode() %>"
										<% } %>
										class="btn btn-line">바로 예약하기</a>
							<%} %>
						
					</div>
				</div>
				
				
				
				<!-- 문의내역확인 -->
				<div class="table2">
					<table class="center">
						<colgroup>
							<col style="auto" />
							<col style="width: 15%" />
							<col style="width: 18%" />
							<col style="width: 10%" />
							<col style="width: 10%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">평점</th>
<%-- 								<%=rv.getScoreAvg() %>/5 --%>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${requestScope.reviewList}" varStatus="stts">
							<tr>
								<td><a href="reviewDetail.do?revCode=${list.revCode}" >${list.revTitle}</a></td>
								<td>${list.memId}</td>
								<td>${list.revDate}</td>
								<td>${list.revHits}</td>
								<td>${list.score}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		
			</div>
			
			
			
			
		
		<jsp:include page="../../includes/footer.jsp" />
		</div>
		

