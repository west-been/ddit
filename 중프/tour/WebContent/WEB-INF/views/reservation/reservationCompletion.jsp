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
<form id="paymentInformation" name="paymentInformation" action="/tour/reservationPayfinish.do" method="post">
<input type="hidden" name="paymentResult" id="paymentResult" value="">
<input type="hidden" name="reservCode" id="reservCode" value="<%=rv.getResCode()%>">

</form>		

<script src="/resources/js/common_nsm_edu.js"></script>
<script>
function fn_direct_pay(){
	if(<%=rv.getResPrice()%> > 0){ // 결제금액이 0원일경우 바로 결제완료 처리
	// 카카오 결제 API
	  var IMP = window.IMP; // 생략가능
	  IMP.init('imp23062788');  // 가맹점 식별코드
	  // IMP.request_pay(param, callback) 결제창 호출
	  IMP.request_pay({
	      pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
	      pay_method: 'card',// 기능 없음
	      merchant_uid : '<%=rv.getResCode()%>',
	      name : '<%=tv.getTourNm()%>',
	      amount : <%=rv.getResPrice()%>, // 빌링키 발급과 함께 1,004원 결제승인을 시도합니다.
	      //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
	      customer_uid : 'imp23062788',
	      buyer_email : 'iamport@siot.do',
	      buyer_name : '대전오슈',
	      buyer_tel : '042-222-8202',
	      buyer_addr : '대전광역시 중구 계룡로 846 3층',
	  }, function(rsp) { //callback
	      if ( rsp.success ) {
	        console.log('빌링키 발급 성공', rsp)
	        //빌링키 발급이 완료되었으므로, 서버에 결제 요청
	        alert('예약 결제가 완료되었습니다');
	        $('input[name=paymentResult]').attr('value','결제완료')
	      } else {
	        var msg = '결제에 실패하였습니다.\n';
	        msg += rsp.error_msg;
	        alert(msg);
	        return false;
	      }
	      //$("#final-support-submit").submit();
	      $("#paymentInformation").submit();
	  });
	}else{
		 $('input[name=paymentResult]').attr('value','결제완료')
		 $("#paymentInformation").submit();
	}
	
}

//예약취소
function fn_reserv_cancel(){
	if(`<%=rv.getResStatus()%>`==='결제대기'){
		if(confirm("정말 예약을 취소하시겠습니까?")){
			$('#reservCancel').attr('method','post')
			$('#reservCancel').attr("action" , "/tour/reservcompletion.do");
			$("#reservCancel").submit();
		}
	}else{
		if(confirm("결제취소시 전액 마일리지 환불 됩니다. 예약을 취소하시겠습니까?")){
			$('#reservCancel').attr('method','post')
			$('#reservCancel').attr("action" , "/tour/reservcompletion.do");
			$("#reservCancel").submit();
		}
	}
}
</script>
				<div class="sub_cont reservation-wrap" id="container">
					<div class="inner">
						<h3 class="tit">예약정보</h3>
						<div class="join_wrap bor complete">
							<!-- step -->
								 <!--  개인 -->
									
								<!-- //step -->
							<!-- //step -->
							<!-- signup2 -->
							<div class="signup2">
								
								<%if(rv.getResStatus()=="결제대기") {%>
									<!-- <h4 class="h4 mb40"><span class="red">결제</span>를 완료하시면 <br><span class="red">예약이 완료</span>됩니다.</h4> -->
									<h4 class="h4 mb40">결제를 계속하시려면 <span class="red">바로결제버튼</span>을 클릭해주세요</h4>
								<%} else{ %>
									<h4 class="h4 mb40">이용해주셔서 감사합니다.<br>티켓은&nbsp;<span class="red">예약내역</span>에서 출력 가능합니다.</h4>
								<%} %>
								
								

								<%if(rv.getResStatus()=="결제대기") {%>
									<div class="calc">

										<div class="cal2">
											<!-- <span><img src="/resources/images/sub/ico_total.png" alt="전체금액아이콘"></span> -->
											<dl>
												<dt>결제 예정 금액</dt>
												<dd class="pink">
													<%=rv.getResPrice() %> 원
													<input type="hidden" name="LGD_AMOUNT" id="LGD_AMOUNT" value="20000">
												</dd>
											</dl>
										</div>
									</div>
									<!-- //calc -->
								<%}%>

								
									<!-- btn_area -->
<form id="myRsvnVO" name="myRsvnVO" action="/nsm/mypage/myRsvn/myRsvnPay" method="post">
<input type="hidden" name="rsvnIdx" value="14168">
<input type="hidden" name="gubun" value="EDC">
				<!-- btn_area -->
				<ul class="btn_area mb70">
				<%if(rv.getResStatus().equals("결제대기")){ %>
					<li><a href="javascript:fn_direct_pay()" class="btn btn-line">바로 결제</a></li>
				<%}%>
					<li><a href="javascript:fn_reserv_cancel()" class="btn btn-blue">예약취소</a></li>
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
							<ul class="btn_area long">
							<li><a href="/tour/reserv.do" class="btn btn-line">관광지 목록</a></li>
							
							<li><a href="/tour/mypage.do?memId=<%=memberVO.getMemId()%>" class="btn btn-blue">나의 예약내역</a></li>
								
								
							

						</ul>
						<!-- //btn_area -->
							
						</div>
						<!-- //join_wrap -->
					</div>
					<!-- //inner -->
				</div>
				<!-- //sub_cont -->


</div>



	</div>
	<!-- //wrap -->


	<script>
		
		$('#relaGovern').click(function(){
			
			var varThisObjClass = $('#relaGovern').attr('class');
			
			if(varThisObjClass == "on"){
				$('#relaGovern').attr('title', '열기');
			} else {
				$('#relaGovern').attr('title', '닫기');
			}

			return false;
			
		});
		
	</script>
	


   
      <jsp:include page="../../includes/footer.jsp" />
</div>
</body>
</html>