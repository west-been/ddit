<%@page import="vo.SurveyVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.AdminVO"%>
<%@page import="vo.QnaVO"%>
<%@page import="vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

MemberVO memVO = (MemberVO)request.getAttribute("mv");
AdminVO av = (AdminVO)request.getAttribute("av");
List<ReservationVO>  rvList = (List<ReservationVO>)request.getAttribute("rvList");
List<QnaVO> qvList = (List<QnaVO>) request.getAttribute("qvList");
List<SurveyVO> surveyList = (List<SurveyVO>) request.getAttribute("surveyList");

String profile =  (String) session.getAttribute("profileUrl");
session.removeAttribute("profileUrl");

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />

		<div id="content" class="mypage-wrap">






	<div class="mypage-view">

			<div class="profile-group">	
				<%if(av.getAtchFile()==null || "".equals(av.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
					<img src="  resources/images/profile_bg.png" alt="프로필 사진">
				<%}else{%> <!-- 첨부파일이 있을 경우 -->
					<img src="<%= av.getAtchFile() %>" alt="">
				<%}%>
			</div>


			<!--  table2-->
			<div class="table2">
				<table>
					<caption></caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 20%">
						<col style="width: 30%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td><%=av.getAdminId() %></td>
							<th scope="row">이름</th>
							<td><%=av.getAdminNm() %></td>
						</tr>
						<tr>
							<th scope="row">휴대전화번호</th>
							<td><%=av.getAdminTel()%></td>
							<th scope="row">이메일</th>
							<td><%=av.getAdminEmail()%></td>
						</tr>
						<tr>
							<th scope="row">주소<%=av.getAdminAdd2() %></th>
							<td colspan="3">

								<%if(av.getAdminAddr()==null || "".equals(av.getAdminAddr())){%> <!--  주소 없을 경우 -->	
										
								<%}else{%>
									<%=av.getAdminAddr()%> 
								<%}%>	
									
							
								<%if(av.getAdminAdd2()==null || "".equals(av.getAdminAdd2())){%> <!--  주소 없을 경우 -->	
										
								<%}else{%>
									<%=av.getAdminAdd2()%> 
								<%}%>
							
							</td>
						</tr> 

					</tbody>
				</table>
			</div>
	</div>			
			
			<div class="btn-wrap">
				<a href="mypageAdminModify.do?adminId=<%=av.getAdminId()%>" class="btn btn-blue">회원정보수정</a> 
			</div>


			<!-- 문의내역확인 -->
			 <div class="box-group">
				<h3>문의내역</h3>
				<a href="<%=request.getContextPath()%>/qna.do" class="btn-more">더보기 +</a>
				<div class="table2">
					<table>
						<colgroup>
							<col style="width: 15%" />
							<col style="auto" />
							<col style="width: 10%" />
							<col style="width: 18%" />
							<col style="width: 10%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No.</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">답변</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="qv" items="${requestScope.qvList}" varStatus="stts">
							<tr>
								<td>${qv.qnaCode}</td>
								<td><a href="replyDetail.do?qnaCode=${qv.qnaCode}&adminId=${av.adminId}">${qv.qnaTitle}</a></td>
								<td>${qv.memId}</td>
								<td>${qv.qnaDate}</td>
								<td>${qv.qnaStatus}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div> 
			<div class="box-group">
				<h3>예약내역</h3>
				<div class="table2">
					<table>
						<thead>
							<tr>
								<th scope="col">예약번호</th>
								<th scope="col">관광지명</th>
								<th scope="col">예약일지</th>
								<th scope="col">방문일자</th>
								<th scope="col">예약자명</th>
								<th scope="col">예약상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rv" items="${requestScope.rvList}" varStatus="stts">
							<tr>
								<td>${rv.resCode}</td>
								<td>${rv.tourNm}</td>
								<td>${rv.resDate}</td>
								<td>${rv.visitDate}</td>
								<td>${rv.memId}</td>
								<td>${rv.resStatus}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div> 
			<div class="box-group">
				<h3>설문내역</h3>
				<div class="table2">
					<table>
						<thead>
							<tr>
								<th scope="col">회원ID</th>
								<th scope="col">1번 설문</th>
								<th scope="col">2번 설문</th>
								<th scope="col">3번 설문</th>
								<th scope="col">4번 설문</th>
								<th scope="col">5번 설문</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="surveyList" items="${requestScope.surveyList}" varStatus="stts">
							<tr>
								<td>${surveyList.memId}</td>
								<td>${surveyList.first}</td>
								<td>${surveyList.second}</td>
								<td>${surveyList.third}</td>
								<td>${surveyList.fourth}</td>
								<td>${surveyList.fifth}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div> 
		<jsp:include page="../../includes/footer.jsp" />		
	</div>
	
</div>

</body>
</html>