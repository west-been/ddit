<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/jquery/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/owl/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/owl/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/font.css">
<link rel="stylesheet" type="text/css" href="resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="resources/css/cmpt.css">
<link rel="stylesheet" type="text/css" href="resources/css/content.css">
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<script src="resources/plugins/jquery/jquery-3.6.1.min.js"></script>
<script src="resources/plugins/jquery/jquery-ui.min.js"></script>
<script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="resources/plugins/owl/owl.carousel.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/common.js"></script>
<title>Insert title here</title>
<style>
/* modal popup  */
.hid { overflow:hidden; }
.modal-backdrop {position: fixed; top:0; right:0; bottom:0; left:0; background:#000; z-index:7500; opacity:0.3; filter:alpha(opacity=70);}
.modal {display:none; position:fixed; top:0; right:0; bottom:0; left:0; z-index:8000; overflow:auto; -webkit-overflow-scrolling:touch; outline:0; }
.modal-dialog {position:relative; width:auto; margin:0 auto 15px; padding:0 15px; }
.modal-content {box-shadow: 0 0 0 transparent;  position:relative; background-color:#fff; outline:none; overflow:hidden; border-radius:10px; }
.modal-title { padding: 15px 15px; border-bottom: 1px solid #ddd; box-sizing: border-box; position: relative; }
.modal-title h4 { font-size:28px; line-height: 1; color: #080808; background: #fff; font-weight: 700; }
.modal-body { padding: 45px 40px 0;box-sizing: border-box;/* 20.10.07 khj수정 */ }
.modal-body .modal-txt { font-size:19px; line-height: 28px; color: #717171; margin-bottom: 45px;/*20.10.13 마진추가*/ }
.modal .btn_area { margin-top: 0; padding-bottom: 50px; /*20.10.07 khj수정 */}
.pop_close { display: block; background: url(../images/layout/pop_close.png) no-repeat center; width: 30px; height: 28px; position: absolute; right: 40px; top: 50%; transform: translateY(-50%); text-indent: -9999px; }

.ifm_box { background: #ddd; border-radius: 10px; margin-bottom: 10px; text-align: center; }

* {
    max-height: 1000000px;
    margin: 0;
    padding: 0;
}

body {
    min-width: 320px;
    background: #fff;
    color: #222;
    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕',Apple Gothic,arial,helvetica,sans-serif;
    font-size: 19px;
    font-weight: 400;
    line-height: 27px;
    -webkit-text-size-adjust: none;
    -webkit-overflow-scrolling: touch;
    word-wrap: break-word;
    word-break: keep-all;
    white-space: normal;
    letter-spacing: -1px;
}

element.style {
    padding-top: 100px;
}
@media (max-width: 1024px)
.modal-body {
    padding: 35px 30px 0;
}
@media (max-width: 1024px)
.modal-body .modal-txt {
    font-size: 17px;
    line-height: 1.4;
    margin-bottom: 25px;
}
@media (max-width: 1024px)
.table2 table tbody th.vtop {
    padding: 10px 5px 0;
}
.w_pop .modal-title {
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    z-index: 10;
    background: #fff;
}
@media (max-width: 1024px)
.modal-title {
    padding: 28px 30px;
}


</style>
</head>
<body>
<body class="text-sm w_pop" style="margin:10px">

<script>
$(document).ready(function(){
	$('body').addClass('w_pop')
 	var v_popResCode = opener.$('input[name=resCodeVal]').val();
 	$("#popResCode").text(v_popResCode)
 	var v_popTourNm = opener.$('input[name=tourNmVal]').val();
 	$("#popTourNm").text(v_popTourNm);
 	var v_StartDate = opener.$('input[name=startDateVal]').val();
 	$("#popStartDate").text(v_StartDate);
 	var v_popEndDate = opener.$('input[name=endDateVal]').val();
 	$("#popEndDate").text(v_popEndDate);
 	var v_popStartTime = opener.$('input[name=startTimeVal]').val();
 	$("#popStartTime").text(v_popStartTime);
 	var v_popEndTime = opener.$('input[name=endTimeVal]').val();
 	$("#popEndTime").text(v_popEndTime);
 	var v_popTourLocation = opener.$('input[name=tourLocationVal]').val();
 	$("#popTourLocation").text(v_popTourLocation);
 	var v_popResQty = opener.$('input[name=resQty]').val();
 	$("#popResQty").text(v_popResQty);
 	var v_popResPrice = opener.$('input[name=resPrice]').val();
 	$("#popResPrice").text(v_popResPrice);
 	

	var v_popMemNm = opener.$("#memNmVal").text();
	$("#popMemNm").text(v_popMemNm);
	var v_popMemTel = opener.$("#memTelVal").text();
	$("#popMemTel").text(v_popMemTel);
	var v_popMemMail = opener.$("#memMailVal").text();
	$("#popMemMail").text(v_popMemMail);
});

window.addEventListener("beforeprint", function(event) {
	$('#printBtn').css('display','none')
	$('.modal-title').css('display','none')
})

window.addEventListener("afterprint", function(event) {
	$('#printBtn').css('display','inline')
	$('.modal-title').css('display','inline')
})
	
</script>
<div class="w_wrap">
	<div class="modal-dialog" id="container" style="max-width:100%;padding: 0;">
		<div class="modal-title">
			<h4>상세 예약정보</h4>
			<a href="javascript:window.close();" class="pop_close">닫기</a>
		</div>
		<div class="modal-content">
			<div class="modal-body" style="padding-top:100px;">
				<div class="modal-txt">
				<p class="stit">관광지 정보</p>
				<div class="table2 responsive-type mb50">
						<table>
							<caption>출력용 예약증</caption>
							<colgroup>
									<col style="width:25%">
									<col style="width:30%">
									<col style="width:18%">
									<col style="width:27%">
								</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="vtop">예약번호</th>
									<td id="popResCode" class="b" colspan="3"></td>
								</tr>
								<tr>
									<th scope="row" class="vtop">관광지명</th>
									<td class="b" colspan="3">
										<div id="popTourNm" class="title_wrap">
										</div>
									</td>
								</tr>
								

								<tr>
									<th scope="row" class="vtop">운영 시작일</th>
									<td id="popStartDate">
									</td>
									<th scope="row" class="vtop">운영 종료일</th>
									<td id="popEndDate">
									</td>
								</tr>
								<tr>
									<th scope="row" class="vtop">운영 시작 시간</th>
									<td id="popStartTime">
									</td>
									<th scope="row" class="vtop">운영 종료 시간</th>
									<td id="popEndTime">
									</td>
								</tr>




								<tr>
									<th scope="row" class="vtop">주소</th>
									<td id="popTourLocation" colspan="3">
									
									</td>
								</tr>



							</tbody>
						</table>
						<!-- //mod_table -->

					</div>
					<!-- //table -->
					<p class="stit">예약자 정보</p>
					<div class="table2 responsive-type mb50">
						<table>
							<caption>출력용 예약증2</caption>
							<colgroup>
									<col style="width:25%">
									<col style="width:30%">
									<col style="width:18%">
									<col style="width:27%">
								</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="vtop">예약자 이름</th>
									<td id="popMemNm">
										
									</td>
									<th scope="row" class="vtop">휴대전화번호</th>
									<td id="popMemTel">
										
									</td>
								</tr>
								<tr>
									<th scope="row" class="vtop">이용인원</th>
									<td id="popResQty">
										
									</td>
									<th scope="row" class="vtop">결제금액</th>
									<td id="popResPrice">
										
									</td>
								</tr>
								<tr>
									<th scope="row" class="vtop">이메일</th>
									<td colspan="3" id="popMemMail">
									
									</td>
								</tr>





							</tbody>
						</table>
						<!-- //mod_table -->
					</div>


					<!-- //table -->
				</div>
				<!-- //modal-txt -->
			</div>
			<!-- //modal-body -->
		</div>
		<!-- //modal-content -->
		<div class="btn_area">
			<button class="btn btn-blue" id="printBtn" onclick="window.print()">예약증 출력</button>
		</div>
	</div>
	<!-- //modal-dialog -->
</div>
<!-- //팝업 -->

</body>
</body>
</html>