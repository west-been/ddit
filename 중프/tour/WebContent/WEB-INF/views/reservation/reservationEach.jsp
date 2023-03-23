<%@page import="vo.MemberVO"%>
<%@page import="vo.TourVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TourVO tv = (TourVO)request.getAttribute("tv");
	MemberVO mv = (MemberVO)session.getAttribute("memberVO");
	
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>예약하기 | 대전오슈</title>



<script>
var v_spinnerCnt = 0;
var v_useMileage = null;
var v_use_mileage_check=false;
var v_paymentAmount;
var cntVal;
var cntValue;
$( function() {
    var spinner = $( "#spinner" ).spinner();
 
    $( "#disable" ).on( "click", function() {
      if ( spinner.spinner( "option", "disabled" ) ) {
        spinner.spinner( "enable" );
      } else {
        spinner.spinner( "disable" );
      }
    });
    $( "#destroy" ).on( "click", function() {
      if ( spinner.spinner( "instance" ) ) {
        spinner.spinner( "destroy" );
      } else {
        spinner.spinner();
      }
    });
    $( "#getvalue" ).on( "click", function() {
      alert( spinner.spinner( "value" ) );
    });
    $( "#setvalue" ).on( "click", function() {
      spinner.spinner( "value", 5 );
    });
 
    $( "button" ).button();
    
    $( "#spinner" ).spinner({
    	  min: 0
    	});
    
    $("#spinner").spinner({
        change: function (event, ui) {
        	var v_tourCnt = $("#spinner").val();
        	var v_totalPrice = <%=tv.getTourPrice()%> * v_tourCnt;
        	if(v_totalPrice !=0){
        		$("#totalPrice")[0].innerText=v_totalPrice+" 원";
        	} else{
        		$("#totalPrice")[0].innerText="무료";
        	}
        },
    });
	
    <%-- $( "#spinner" ).spinner({
    	  spin: function( event, ui ) {
    		var v_tourCnt = $("#spinner").val();
          	var v_totalPrice = <%=tv.getTourPrice()%> * v_tourCnt;
          	$("#totalPrice")[0].innerText=v_totalPrice;
    	  }
    	}); --%>
    	 
  } );
  
function fn_use_mileage(){
	v_spinnerCnt = $("#spinner").val(); // 예약할 수량
	var v_nowMileage = Number($("#nowMileage").text()); // 보유마일리지
	if(v_spinnerCnt != 0){ // 수량이 0일 경우 경고창 출력
		var v_price = ($("#totalPrice").text()).slice(0,-2);
		v_price=Number(v_price);
		v_useMileage = $("#useMileage").val();
		if(v_useMileage>v_price){
			swal('예약실패!', "결제금액을 초과해서 마일리지를 사용할 수 없습니다.",'warning');
			$("#useMileage").val(v_price);			
		}else{
			if(v_useMileage){
				if(v_nowMileage>=v_useMileage){
					v_paymentAmount = v_price-v_useMileage;
					if(v_paymentAmount>0){
						$("#paymentAmount")[0].innerText=v_paymentAmount+"원";						
					} else{
						$("#paymentAmount")[0].innerText="무료";
					}
					v_use_mileage_check= true;
				} else{
					swal('예약실패!', "현재 마일리지를 초과했습니다! 마일리지를 확인해주세요.",'warning');
				}
			}else{
				swal('예약실패!', "마일리지를 입력해주세요.",'warning');
			}
		}
	} else{
		/* alert("수량을 입력해주세요.") */
		swal('예약실패!', "수량을 입력해주세요.",'warning');
	}
	
} 


</script>
</head>
<body>
   <div id="sub">
      <jsp:include page="../../includes/header.jsp" />
      <jsp:include page="../../includes/subVisual.jsp" />
      
      <div  id="content" class="sub_wrap reservation-wrap">




               <div class="sub_cont " id="">
                  <div class="inner">
                    
                     <div class="join_wrap bor">

<form id="reservationForm" name="tourVO" action="/tour/reserveach.do" method="post" >

                        <!-- signup2 -->
                        <div class="signup2">
                        	 <h3 class="tit">예약정보</h3>
                           <!-- table -->
                           <div class="table2 responsive-type mb50">
                              <table>
                                 <caption>관광지예약정보안내표입니다.</caption>
                                 <colgroup>
                                       <col style="width:20%">
                                       <col style="width:30%">
                                       <col style="width:20%">
                                       <col style="width:30%">
                                    </colgroup>
                                 <tbody>
                                    <tr>
                                       <th scope="row" class="vtop">관광지명</th>
                                       <td class="b" colspan="3">
                                          <div class="title_wrap">
                                          
                                          <%=tv.getTourNm() %>
                                          <input type="hidden" name="tourCode" value="<%=tv.getTourCode()%>">
                                          <input type="hidden" name=resCode value="">
                                          </div>
                                       </td>
                                    </tr>

   
                                    <tr>
                                       <th scope="row" class="vtop">운영 기간</th>
                                       <td class="b" colspan="3">
                                          
                                          
                                          <%=tv.getStartDate() %> ~ <%=tv.getEndDate() %>
                                          
                                       </td>
                                    </tr>
                                    <tr>
                                       <th scope="row" class="vtop">운영 시간</th>
                                       <td class="b" colspan="3">
                                          
                                          
                                          <%=tv.getStartTime() %> ~ <%=tv.getEndTime() %>
                                          
                                       </td>
                                    </tr>
   
   
   
   

									<tr>
                                       <th scope="row" class="vtop">주소</th>
                                       <td class="b" colspan="3">
                                          
                                          
                                          <%=tv.getTourLocation()%>
                                          
                                       </td>
                                    </tr>
                                    
                                    <tr>
                                       <th scope="row" class="vtop">비용</th>
                                       <td class="b" colspan="3">
                                          <%if(tv.getTourPrice().equals("0")){ %>
                                    	  무료
                                    	  <%}else{ %>                                    	  
                                             <%=tv.getTourPrice() %> 원
                                    	  <%} %>
                                       </td>
                                    </tr>


                                    <tr>

   
   
                                       <th scope="row" class="vtop">잔여 정원</th>
                                       <td class="b" colspan="3">
                                          	<%=tv.getTourCapacity() %>
                                       </td>

   

                                    </tr>

   
                                    <tr>
                                       <th scope="row" class="vtop">이메일</th>
                                       <td colspan="3">
                                          <div class="w_box" style="margin-top:0px">
                                             <div class="w100" style="vertical-align:middle">
                                                <label for="edcEmail" class="hidden">이메일</label>
                                                <input type="text" id="edcEmail" name="edcEmail" value="<%=mv.getMemEmail()%>" title="이메일 입력">
                                             </div>
                                             <%-- <div>
                                                <button type="button" onclick="fn_email_modify()" class="btn_ty_m2_c3">수정하기</button>
                                             </div> --%>
                                          </div>
                                          <p id="divEmailResult"></p>
                                          <p>※ 입력된 이메일주소로 예약정보가 발송됩니다.</p>
                                       </td>
                                    </tr>
   

                                 </tbody>
                              </table>
                           </div>
                           <!--// table -->

                           <!-- //board_ty -->
                           <!-- calc -->















<div class="signup2">
            
            </div>
            <p class="stit mb5">예약 인원 선택 <span class="tb_txt"></span></p>

            <!-- board_ty -->

            <div class="board_ty">
               <ul>

                  <li>
                     <div class="info">
                        <!-- info_tit -->
                        <div class="info_tit">
                           <span><%=tv.getTourNm() %><em> (<%if(tv.getTourPrice().equals("0")){%>
                           									무료 )
                           									<%}else{%>
                           									<%=tv.getTourPrice() %>원&nbsp)
                           									<%} %></em></span>
                        </div>
                        <!-- //info_tit -->
                        <!-- numcontrol -->
                         <!-- <div class="numcontrol num01">
                           <input type="button" title="어른 및 노인 예약인원수제거" class="btn_minus" onclick="fn_cnt_change('2' , 0 ,  -1 , this)">
                           <input id="chargeList0.itemCnt" name="chargeList[0].itemCnt" title="어른 및 노인 예약인원수 입력" data-item="2" data-idx="0" class="count" value="0" type="text" autocomplete="false">
                           <input type="button" title="어른 및 노인 예약인원수추가" class="btn_plus" onclick="fn_cnt_change('2' , 0 ,  1 , this)">
                        </div> --> 
                        <div class="numcontrol num01">
                           <input id="spinner" name="cntValue" value="0">
                           <input type="hidden" name="cntVal" value="">
                        </div>
						
                        <!-- //numcontrol -->
                     </div>
                     
                     <!-- //info -->
                  
                  
                     
                     <!-- info_price -->
                     <ul class="info_price" id="DIV_PRICE_2">
                        <li class="ex_totalp">
                           <dl>
                              <dt>총 금액</dt>
                              <dd ><div id="totalPrice"></div></dd>
                              
                           </dl>
                        </li>
                        
                     </ul>
                     <!-- //info_price -->
                     
                  </li>

               </ul>
            </div>
            
            <div class="signup2">
                           <!-- table -->
                           <p class="stit mb5">마일리지 사용 <span class="tb_txt"></span></p>
                           <div class="table2 responsive-type mb50">
                              
                              <table>
                                 
                                 <tbody>
            						<tr>
                                       <th scope="row" class="vtop">보유 마일리지</th>
                                       <td class="b" colspan="3">
                                          
                                             <div id ="nowMileage"><%=mv.getMemMileage() %></div>
                                    
                                       </td>
                                    </tr>
                                    
                                    <tr>
                                       <th scope="row" class="vtop">마일리지 사용</th>
                                       <td colspan="3">
                                          <div class="w_box">
                                             <div class="w100">
                                                <label for="edcEmail" class="hidden">마일리지</label>
                                                <input type="text" id="useMileage" name="useMileage" value="" title="마일리지 사용">
                                             </div>
                                        	<button type="button" onclick="fn_use_mileage()" class="btn btn-blue">적용하기</button>
                                          </div>
                                  			<p class="extra-txt">※마일리지를 사용하지 않을 경우 0을 입력해주세요.</p>
                                       </td>
                                    </tr>
                                    
                                    
            					</tbody>
                              </table>
                           </div>

                           <div class="calc mb70">
                              <div class="cal1">
                                 <dl>
                                    <dt>결제 금액</dt>
                                    <dd class="pink"><div id="paymentAmount"></div></dd>
                                    <input type="hidden" name="paymentAmountVal" value="">
                                 </dl>
                              </div>
                           </div>
      
</form>

                           <!-- //calc -->
                           <ul class="agree_choice ty">
                              <li>
                                 <input type="checkbox" id="total_chk">
                                 <label for="total_chk">예약 유의사항, 환불 유의사항, 개인정보 이용 동의에 모두 동의합니다.</label>
                              </li>
                           </ul>
                           <!-- agree_list -->
                           <ul class="agree_list ty">

   
   <li>
      <div class="agree_tit">
         <input type="hidden" id="stplatId13002" name="stplatId13002" value="3002">
         <input type="checkbox" id="c1">
            <label for="c1" class="on">관광지 환불유의사항</label>
            
          <!-- <i class="on">내용보기</i> 원본 JYS --> 
         <a href="javascript:void(0);"  class="toggle-a" onclick="fnAgreeOnClick(this); return false;"><i class="on">내용보기</i></a>
         
      </div>
      <div class="agree_cont" style="display: none;">
         [ 관광지예약 환불 유의사항]<br><br>환불시 100% 마일리지 환불<br> 예약에 신중을 가하시기 바랍니다.>_o
      </div>
   </li>
   

   
   <li>
      <div class="agree_tit">
         <input type="hidden" id="stplatId13001" name="stplatId13001" value="3001">
         <input type="checkbox" id="c2">
            <label for="c2" class="on">관광지 예약유의사항</label>
            
          <!-- <i class="on">내용보기</i> 원본 JYS --> 
         <a href="javascript:void(0);"  class="toggle-a" onclick="fnAgreeOnClick(this); return false;"><i class="on">내용보기</i></a>
         
      </div>
      <div class="agree_cont" style="display: none;">
         [ 관광지 예약 유의사항 ]<br><br> 1. 결제완료까지 진행되어야 예약이 완료됩니다. <br> 2. 예상치 못한 상황(기상악화, 사고발생)등으로 관광지 운영이 어려울 경우 예약이 취소 될 수 있습니다. 
      </div>
   </li>
   

   
   <li>
      <div class="agree_tit">
         <input type="hidden" id="stplatId11001" name="stplatId11001" value="1001">
         <input type="checkbox" id="c3">
            <label for="c3" class="on">개인정보 수집 및 이용동의</label>
            
          <!-- <i class="on">내용보기</i> 원본 JYS --> 
         <a href="javascript:void(0);"  class="toggle-a" onclick="fnAgreeOnClick(this); return false;"><i class="on">내용보기</i></a>
         
      </div>
      <div class="agree_cont" style="display: none;">
         개인정보 수집 및 이용 안내<br><br>대전오슈 회원가입 및 홈페이지 서비스 이용과 관련하여 본인으로부터 취득하게 될 아래의 개인정보는 “개인정보보호법” 및 "정보통신망이용촉진 등에 관한 법률"에 따라 개인정보의 이용과 타인에게 제공 및 활용 시 본인의 동의를 얻어야 하는 정보입니다. 이에 본인은 아래 내용과 같이 개인정보의 제공 및 활용에 동의합니다.<br><br>제1조 (개인정보의 처리 목적)<br><br>대전오슈은 다음의 목적을 위해 개인정보를 수집 및 이용합니다. 수집된 개인정보는 정해진 목적 이외의 용도로는 사용되지 않으며, 수집 목적 등이 변경될 경우에는 정보주체에게 알리고 동의를 받을 예정입니다.<br><br>회원가입 및 홈페이지 서비스 이용<br><br>회원가입, 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 부정이용방지, 비인가 사용방지, 가입의사 확인, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 개인정보를 처리<br>온라인 교육운영시 수업재료 발송을 위한 주소를 수집처리<br><br>제2조 (처리하는 개인정보의 항목)<br><br>대전오슈는 회원가입 및 각종 서비스를 위한 필수정보 및 선택정보를 아래와 같이 수집하고 있습니다.<br>(1)수집항목<br> 필수항목 : 이름, 아이디, 비밀번호, 비밀번호 확인, 성별, 생년월일, 휴대전화번호, 이메일<br> 선택항목 : 거주지역, 기관(학교)명, 차량정보, 관심정보<br>※ 서비스 이용과정에서 접속 일시, 서비스 이용기록 정보들이 자동으로 생성되어 수집 될 수 있습니다. <br><br><br>(2) 수집방법 <br> 가. 홈페이지, 온라인설문, 게시판<br> 나. 생성정보 수집툴을 통한 수집<br><br><br>제3조 (개인정보의 처리 및 보유 기간)<br><br>정보주체의 개인정보는 원칙적으로 개인정보의 처리목적이 달성되면 지체없이 파기합니다. <br> 가. 회원정보 : 회원 가입기간(탈퇴시 즉시 파기)<br> 나. 기타 개별적으로 “정보주체”의 동의를 받은 정보 : 수집목적이 소멸되거나 “이용기관 서비스” 해지가 완료된 시점까지 보유<br><br>제4조 (본인확인 기관간 정보 공유) <br>대전오슈는 “인터넷상의 주민번호대체수단 가이드라인" 에 의거하여 "정보주체"의 편의를 위해 타 "본인확인기관"과 아래의 정보를 공유할 수가 있습니다.<br>"정보주체" 의 "성명, 성별, 휴대전화번호, 중복가입확인정보, 암호화 된 동일인 식별정보, 생년월일정보, 연령대정보, 본인인증방법정보<br>"개인정보보호법 제 15조에 따라서 개인정보 수집 및 이용에 따른 동의를 거부할 수 있으나 대전오슈 서비스를 제공 받을 수 없습니다." 
      </div>
   </li>
   


                           </ul>
                           <!-- //agree_list -->
                        </div>
<div>
<input type="hidden" name="_csrf" value="735210ec-c061-47ff-a09a-91056bbb2b6e">
</div><input type="hidden" name="_csrf" value="735210ec-c061-47ff-a09a-91056bbb2b6e"></form>
                        <!-- //signup2 -->
                     </div>
                     <!-- //join_wrap -->
                     <ul class="btn_area">
                        <li>
                           <a href="javascript:history.back()" class="btn btn-line">이전</a>
                        </li>
                        <li>

   
      	 <a href="javascript:fn_reserve_save()" class="btn btn-blue">예약</a>
      	 <%-- <button type="submit" class="btn_ty_m_c1" onclick="fn_reserve_save()">예약</button> --%>
   

                        </li>
                     </ul>
                     <!-- //btn_area -->
                  </div>
                  <!-- //inner -->
               </div>
               <!-- //sub_cont -->
<script type="text/javascript">
   $(function(){
      setTimeout("fn_login_check()", 100); //로그인여부 체크

      $('#total_chk').click(function() {
         var chkBox = $(this);
         if (chkBox.is(':checked')) {
            $(".agree_list input[type='checkbox']").prop("checked", true);
         } else {
            $(".agree_list input[type='checkbox']").prop("checked", false);
         }
      }); //전체 약관 동의
      $('.agree_list.ty input[type="checkbox"] + label').click(function() {
         $(this).toggleClass('on');
      }); //제목클릭이벤트

      $('.agree_list.ty li i').click(function() {
         $(this).toggleClass('on');
         $(this).parent().siblings('.agree_cont').stop().slideToggle();
      });//화살표

      $('.count').keyup(function(){
         if($(this).val() == ""){
            $(this).val("0");
         }
         if($(this).val().length > 1 && $(this).val().indexOf("0") == 0){
            $(this).val(parseInt($(this).val()));
         }
         if( isNaN($(this).val())){
            alert("숫자만 입력해주세요.");
            $(this).val("0");
         }

         if(fn_cnt_change('cus',  0, 0, this)){
            //
         }
      });

      $('#edcEmail').on('keyup',function(){
         $('#divEmailResult').html("");
      });

      //setTimeout("fn_total_price_set()", 100); //historyback 시 금액 계산
   });

    function fn_reserve_save(){
    	v_spinnerCnt = $("#spinner").val();
    	v_useMileage = $("#useMileage").val().trim();
    	let temp = $("#paymentAmount").text();
    	//숫자가 아니면 0으로 처리
    	if(isNaN(temp)){//무료
    		paymentAmount = 0;
    	}else{
	    	paymentAmount = Number($("#paymentAmount").text().slice(0,-1));
    	}
    	v_cntValue = $('#spinner').val();
    	
    	
    	if(v_spinnerCnt>0){
    		if(v_useMileage!=''){
    			if(v_use_mileage_check){
      				if(fn_personcnt_check()){
        		 		if(confirm("예약하시겠습니까?")){
           				<%-- location.href="/tour/reservcompletion.do?tourCode=<%=tv.getTourCode()%>"; --%>
           				$('input[name=paymentAmountVal]').attr('value',v_paymentAmount)
           				$('input[name=cntVal]').attr('value',v_cntValue)
           				$('#reservationForm').attr('method','post')
           				$('#reservationForm').attr("action" , "/tour/reserveach.do");
           	         	$("#reservationForm").submit();
        	 			}
      				}
    			} else{
    				swal('예약실패!',"마일리지 적용 버튼을 눌러주세요.",'warning');
    			}
    		} else{
    			swal('예약실패!',"사용할 마일리지를 입력해주세요.",'warning');
    		}
    	} else{
    		swal('예약실패!',"수량을 확인해 주세요.",'warning');
    	}

   	}
   function fn_next(){
      if(fn_personcnt_check()){
         $('#eduSaveForm').attr("action" , "./edcarsvnRegInput");
         $("#eduSaveForm").submit();
      }
   }


         function fn_numWithCommas(x) {
             return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         }

         function fn_rsvnsave_callback(data){

            console.log("call fn_rsvnsave_callback");
            console.log(data);

            $('body').hideLoading();

            if(data.RESULT.EXE_YN == 'Y'){

               // 완료 페이지 이동
               $("#edcRsvnReqid").val(data.RESULT.RSVN_REQ_ID);
               $('#eduSaveForm').attr("action" , "./edcarsvnRegEnd");
               $("#eduSaveForm").submit();

               return false;

            }else{
               alert("오류! 교육 예약에 실패했습니다.");
               return false;
            }

         }

         function fn_cnt_change(itemCd, index, cnt, obj){
            var varMaxCnt     = Number("38");
            var varAllRscvRow = Number("15");
            var varPernCnt = $("#personCnt").val();

            if(itemCd == 'plus'){
               varPernCnt ++;

               if((varMaxCnt - varAllRscvRow) < varPernCnt){
                  alert("현재 잔여정원은 " + (varMaxCnt - varAllRscvRow) + "명입니다.\n잔여정원 이하로 인원을 선택해 주세요.");
                  return false;
               }

               $("#personCnt").val(varPernCnt);

            }else if(itemCd == 'minus'){

               varPernCnt --;

               if(varPernCnt <= 0){
                  alert("더는 줄일 수 없습니다");
                  return false;
               }

               $("#personCnt").val(varPernCnt);

            }else if((varMaxCnt - varAllRscvRow) < varPernCnt){
               alert("현재 잔여정원은 " + (varMaxCnt - varAllRscvRow) + "명입니다.\n잔여정원 이하로 인원을 선택해 주세요.");
               //fn_total_price_set();
               return false;
            }


            //fn_total_price_set();
            return false;

         }

         function fn_total_price_set(){
            var varPernCnt = 0;
            var varPrice   = Number("20000");

            if($("#personCnt").length){
               varPernCnt =  Number($("#personCnt").val());
            }else{
               varPernCnt = 1;
            }



            var varTotalAmt      = varPrice;
            var varFinalTotalAmt = 0;

            varFinalTotalAmt = varPrice * varPernCnt;

            $("#totalAmt").text(fn_numWithCommas(varFinalTotalAmt) + "원");
            $("#dcChargeAmt").text("0");
            $("#totalChargeAmt").text(fn_numWithCommas(varFinalTotalAmt) + "원");

            $("#finalTotalAmt").text($("#totalAmt").text());
            $("#finalDcChargeAmt").text("0");
            $("#finalTotalChargeAmt").text($("#totalChargeAmt").text());

         }

         function fn_personcnt_check(){
            var varMaxCnt     = Number("38");
            var varAllRscvRow = Number("");

            var varPernCnt = $("#personCnt").val();

             if((varMaxCnt - varAllRscvRow) < varPernCnt){
                  alert("현재 잔여정원은 " + (varMaxCnt - varAllRscvRow) + "명입니다.\n잔여정원 이하로 인원을 선택해 주세요.");
                  return false;
               }


             var notCheckCnt = 0;
               $.each($('.agree_list.ty input[type="checkbox"]') , function(idx , item){
                  if(!$(item).prop("checked")){
                     notCheckCnt++;
                  }
               });

            if(notCheckCnt > 0){
               swal('예약실패!',"약관을 확인하시고 모두 동의해주세요.",'warning');
               $('#total_chk').focus();
               return false;
            }else{
               return true;
            }

         }
      
   function fnAgreeOnClick(parmThis){
      $(parmThis).parent().siblings('.agree_cont').stop().slideToggle();      
      return false;   
   }

</script>





</div>
      
      <jsp:include page="../../includes/footer.jsp" />
   </div>
</body>
</html>