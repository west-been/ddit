<%@page import="vo.QnaVO"%>
<%@page import="vo.ReservationVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberVO mv = (MemberVO)request.getAttribute("mv");
List<ReservationVO> rvList = (List<ReservationVO>)request.getAttribute("rvList");
List<QnaVO> qvList = (List<QnaVO>) request.getAttribute("qvList");

String reservMsg = session.getAttribute("reservMsg") == null ?
		"" : (String) session.getAttribute("reservMsg");
session.removeAttribute("reservMsg");

String cancelMsg = session.getAttribute("cancelMsg") == null ?
		"" : (String) session.getAttribute("cancelMsg");
session.removeAttribute("cancelMsg");

String paymentMsg = session.getAttribute("paymentMsg") == null ?
		"" : (String) session.getAttribute("paymentMsg");
session.removeAttribute("paymentMsg");



String profile =  (String) session.getAttribute("profileUrl");
session.removeAttribute("profileUrl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script>

//회원탈퇴
function fn_memLeave(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		$('#memberConfirm').attr('method','post')
		$('#memberConfirm').attr("action" , '/tour/mypageDelete.do?memId=<%=mv.getMemId()%>');
		$("#memberConfirm").submit();
	}
}
</script>



<%
	if(reservMsg.equals("예약실패")){
%>

<script>
	alert('해당 관광지에 대한 예약이 진행중입니다. 예약내역을 확인해주세요.');
</script>
<%
	}
%>

<%
	if(cancelMsg.equals("성공")){
%>

<script>
	alert('예약이 취소되었습니다.');
</script>
<%
	}
%>

<%
	if(paymentMsg.equals("성공")){
%>

<script>
	alert('결제완료 되었습니다. 예약내역을 확인해주세요.');
</script>
<%
	}
%>
<script>
//티켓출력팝업
function fn_pop_rsvnCerti(val1, val2, va13, val4, val5, val6, val7, val8, val9, val10){
	//$('#edcRsvnReqid').val(idx);
	var totalPrice = Number(val9) + Number(val10); // 총금액: 결제금액+마일리지 사용금액
	$('input[name=resCodeVal]').attr('value',val1);
 	$('input[name=tourNmVal]').attr('value',val2);
 	$('input[name=startDateVal]').attr('value',va13);
 	$('input[name=endDateVal]').attr('value',val4);
 	$('input[name=startTimeVal]').attr('value',val5);
 	$('input[name=endTimeVal]').attr('value',val6);
 	$('input[name=tourLocationVal]').attr('value',val7);
 	$('input[name=resQty]').attr('value',val8);
 	$('input[name=resPrice]').attr('value',totalPrice);
	$('#reservPopVO').attr("action" , "/tour/reservationPop.do");
	window.open('','reservPop','width=818, height=900, resizable=yes, scrollbars=yes, status=no, titlebar=0, toolbar=0, left=300, top=100');
	$('#reservPopVO').submit();

}
</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />

		<div id="content" class="mypage-wrap">


<form id="reservPopVO" name="reservPopVO" action="/tour/reservationPop.do" method="post" target="reservPop"></form>

<form id="memberConfirm" name="memberConfirm" action="/tour/mypage.do?memId=<%=mv.getMemId()%>" method="post">								

	
	
	<div class="mypage-view">
		<div class="profile-group">			
			 <%if(mv.getAtchFile()==null || "".equals(mv.getAtchFile())){%> <!-- 첨부파일이 없을 경우 -->
				<img src=" resources/images/profile_bg.png" alt="프로필 사진">
			<%}else{%> <!-- 첨부파일이 있을 경우 -->
				<img src="<%= mv.getAtchFile() %>" alt="">
			<%}%>
		</div>



		<!--  table2-->
			<div class="table2">
				<table>
					<caption></caption>
					<colgroup>
						<col style="width: 15%">
						<col />
						<col style="width: 15%">
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td><%=mv.getMemId() %></td>
							<th scope="row">이름</th>
							<td id = "memNmVal"><%=mv.getMemNm() %></td>
						</tr>

						<tr>
							<th scope="row">주민번호</th>
							<td><%=mv.getMemRegno1()%> - <%=mv.getMemRegno2()%></td>
							<th scope="row">휴대전화번호</th>
							<td id = "memTelVal"><%=mv.getMemTel()%></td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td id = "memMailVal"><%=mv.getMemEmail()%></td>
							<th scope="row">주소</th>
							<td>
							
								<%if(mv.getMemAddr()==null || "".equals(mv.getMemAddr())){%> <!--  주소 없을 경우 -->	
								
								<%}else{%>
									<%=mv.getMemAddr()%> 
								<%}%>	
									
									
								<%if(mv.getMemAddr2()==null || "".equals(mv.getMemAddr2())){%> <!--  주소 없을 경우 -->	
								
								<%}else{%>
									<%=mv.getMemAddr2()%>
								<%}%>	
							
							</td>
						</tr>
						<tr>
							<th scope="row">보유 마일리지</th>
							<td colspan="3"><%=mv.getMemMileage()%></td>
						</tr> 

					</tbody>
				</table>
			</div>
</div>			

			<div class="btn-wrap">
				<a href="mypageModify.do?memId=<%=mv.getMemId()%>" class="btn btn-blue">회원정보수정</a> 
				<%-- <a href="/tour/mypageDelete.do?memId=<%=mv.getMemId()%>" class="btn btn-pink">회원탈퇴</a> --%>
				<a href="javascript:fn_memLeave()" class="btn btn-pink">회원탈퇴</a>
			</div>
</form>			
			
			<!-- //  table2-->
				

			<!-- 문의내역확인 -->
			<div class="box-group">
				<h3>문의내역확인</h3>
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
								<td><a href="qnaDetail.do?qnaCode=${qv.qnaCode}">${qv.qnaTitle}</a></td>
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
				<h3>예약내역확인 (예약번호 클릭시 결제화면으로 이동)</h3>

				<div class="table2">
					<table>
						<thead>
							<tr>
								<th scope="col">예약번호</th>
								<th scope="col">관광지명</th>
								<th scope="col">예약일지</th>
								<th scope="col">예약상태</th>
								<th scope="col">티켓확인</th>
								<input type="hidden" name=resCodeVal value="">
								<input type="hidden" name=tourNmVal value="">
								<input type="hidden" name=startDateVal value="">
								<input type="hidden" name=endDateVal value="">
								<input type="hidden" name=startTimeVal value="">
								<input type="hidden" name=endTimeVal value="">
								<input type="hidden" name=tourLocationVal value="">
								<input type="hidden" name=resQty value="">
								<input type="hidden" name=resPrice value="">
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rv" items="${requestScope.rvList}" varStatus="stts">
							<tr>
								<td><a href="reservcompletion.do?resCode=${rv.resCode}&tourCode=${rv.tourCode}">${rv.resCode}</a></td>
								<td>${rv.tourNm}</td>
								<td>${rv.resDate}</td>
								<td>${rv.resStatus}</td>
								<c:set var="status" value="${rv.resStatus}"/>
								<c:choose>
									<c:when test="${status eq '결제완료'}">
										<td><a href="javascript:;" onclick="fn_pop_rsvnCerti( `${rv.resCode}`,`${rv.tourNm}`,`${rv.startDate}`,`${rv.endDate}`,`${rv.startTime}`,`${rv.endTime}`,`${rv.tourLocation}`,`${rv.resQty}`,`${rv.resPrice}`,`${rv.useMileage}` );">클릭</a></td>	
									</c:when>
									<c:otherwise>
										<td></td>	
									</c:otherwise>
								</c:choose>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
			
				<jsp:include page="../../includes/footer.jsp" />
	</div>
	
<%if(profile != null)  { %>
	<script>
	
<%-- 	const urlStr = 'http://localhost/tour/' + decodeURIComponent('<%=profile %>'); --%>
// 	console.log(urlStr);
// 	document.getElementById('profile').src = urlStr;
	
	
	</script>
<%} %>
</body>
</html>