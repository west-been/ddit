<%@page import="vo.TourVO"%>
<%@page import="vo.ReservationVO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	ReservationVO rv = (ReservationVO)request.getAttribute("rv");
	TourVO tv = (TourVO)request.getAttribute("tv");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.join_wrap { max-width: 950px; margin: auto; position: relative; background: #fff; border: 1px solid #ddd; border-radius: 10px; padding: 140px 0 70px; box-sizing: border-box; }
.join_wrap .step { font-size: 0; text-align: center; position: absolute; top: -30px; width: 100%; }
.join_wrap .step li { display: inline-block; color: #717171; margin: 0 23px; }
.join_wrap .step li dl dt { font-size: 28px; display: block; width: 60px; height: 60px; line-height: 60px; background: #ddd; border-radius: 100%; font-weight: 900; margin: 0 auto; margin-bottom: 15px; }
.join_wrap .step li dl dd { font-size: 21px; }
.join_wrap .step li.on dl dt { background: #013668; color: #fff; }
.join_wrap .step li.on dl dd { color: #222; font-weight: 700; }
.join_wrap .step.step2 li { margin: 0 12px; }
.join_wrap .step.step3 li { margin: 0 17px; }
.signup2 {max-width: 738px;margin: 0 auto;}
.tit {font-size:49px;font-weight:700;text-align:center;overflow:hidden;font-family: 'NanumSquareRound';font-weight: 800;line-height: 1;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="sub">
      <jsp:include page="../../includes/header.jsp" />
      <jsp:include page="../../includes/subVisual.jsp" />
     
	<!-- wrap -->
	<div id="wrap">
		
<script>

			<!-- sub_wrap -->
			<div class="sub_wrap">
				
		<!-- //lnb -->

</script>

<script src="/resources/js/common_nsm_edu.js"></script>

				<div class="sub_cont" id="container">
					<div class="inner">
						<h3 class="tit">예약정보</h3>
						<div class="join_wrap bor">
							<!-- step -->
								 <!--  개인 -->
									
								<!-- //step -->
							<!-- //step -->
							<!-- signup2 -->
							<div class="signup2">
								
								
									<!-- <h4 class="h4 mb40"><span class="red">결제</span>를 완료하시면 <br><span class="red">예약이 완료</span>됩니다.</h4> -->
									<h1>결제가 완료되었습니다!</h1>
								
						
									<!-- btn_area -->
<form id="myRsvnVO" name="myRsvnVO" action="/nsm/mypage/myRsvn/myRsvnPay" method="post">
<input type="hidden" name="rsvnIdx" value="14168">
<input type="hidden" name="gubun" value="EDC">
				<!-- btn_area -->
				<ul class="btn_area mb70">
					<li><a href="javascript:fn_direct_pay()" class="btn_ty_m_c1">바로 결제</a></li>
					<li><a href="javascript:fn_reserv_cancel()" class="btn_ty_m_c1">예약취소</a></li>
				</ul>
<div>
<input type="hidden" name="_csrf" value="c0f037b9-c156-4425-83dc-1ddfeb200e7f">
</div><input type="hidden" name="_csrf" value="c0f037b9-c156-4425-83dc-1ddfeb200e7f"></form>
									<!-- //btn_area -->
<form id="reservCancel" name="reservCancel" action="/tour/mypage.do?memId=<%=memberVO.getMemId()%>" method="post">								
								<p class="stit">예약 정보</p>
								<!-- table -->
								<div class="table2 responsive-type mb50">
									<table>
										<caption>예약 정보 확인표입니다.</caption>
										<colgroup>
											<col style="width:30%">
											<col style="width:70%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="vtop">예약 관광지</th>
												<td class="b">
														<div class="title_wrap">
														
														<%=tv.getTourNm()%>
														</div>
												</td>
											</tr>
											<tr>
												<th scope="row" class="vtop">예약번호</th>
												<td class="b">
													<%=rv.getResCode() %>
													<input type="hidden" name=resCode value="<%=rv.getResCode() %>">
												</td>
											</tr>
											<tr>
												<th scope="row" class="vtop">예약자 이름</th>
												<td class="b">
													<%=memberVO.getMemNm()%>
												</td>
											</tr>
											<tr>
												<th scope="row" class="vtop">휴대전화번호</th>
												<td class="b"><%=memberVO.getMemTel()%></td>
											</tr>
											<tr>
												<th scope="row" class="vtop">이메일</th>
												<td class="b">
												<%=memberVO.getMemEmail() %>
												</td>
											</tr>
</form>




										</tbody>
									</table>
								</div>
								<!-- //table -->
								<!-- //예약자 정보 입력 -->


							</div>
							<!-- //signup2 -->
						</div>
						<!-- //join_wrap -->
						<ul class="btn_area long">
							<li><a href="/tour/reserv.do" class="btn_ty_m_c1">관광지 목록</a></li>
							
							<li><a href="/tour/mypage.do?memId=<%=memberVO.getMemId()%>" class="btn_ty_m_c1">나의 예약내역</a></li>
								
								
							

						</ul>
						<!-- //btn_area -->
					</div>
					<!-- //inner -->
				</div>
				<!-- //sub_cont -->


</div>



	</div>
	<!-- //wrap -->



      <jsp:include page="../../includes/footer.jsp" />
</div>
</body>
</html>