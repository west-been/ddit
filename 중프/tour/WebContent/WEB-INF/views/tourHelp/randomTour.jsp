<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜덤여행추천 | 대전오슈  </title>

<link rel="stylesheet" type="text/css" href="resources/css/weather_webfont.css">
<script>

//팝업 열기 
function openPopup() {
	$('#contents').after($('#travel100Pupup02')); $('#travel100Pupup02').toggle();
}
//팝업 닫기 
function closePopup() {
	$('#contents').after($('#travel100Pupup02')); $('#travel100Pupup02').css('display','none');
}

//일정 팝업-모든 일정 선택 버튼 이벤트
function allDate() {
	if($('#dateOption em').attr('id') == "allChoiceDate") {
		$('#dateOption em').attr('id', '');
		$('#dateList li').removeClass();
   		$('#dateList li button').attr('title','');
   		$('#dateList li button').attr('class','');
   		
   		$('#dateOption em').css('background', '#1111');
   		$('#dateOption em').css('color', '#000');
	} else {
		$('#dateOption em').attr('id', 'allChoiceDate');
		$('#dateList li').attr('class','on');
   		$('#dateList li button').attr('title','선택됨');
   		$('#dateList li button').attr('class','choiceDate');
   		
   		$('#dateOption em').css('background', '#666');
   		$('#dateOption em').css('color', '#fff');
	}

}

</script>


</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div id="sub">
			<jsp:include page="../../includes/header.jsp" />
			<jsp:include page="../../includes/subVisual.jsp" />
					
					
			<!-- search_box -->		
			<div class="search_box">
				<div id="content">
				
					<!-- search -->
					<div class="search">
						<strong class="smtxt">구석구석 새로운 대전을 만나보세요!</strong>
						<h3 class="bigtxt">랜덤여행추천</h3>
						
			
<!-- 						날씨   -->
<!-- 						<div class="is_today"> -->
<!-- 							<div class="card_today_weather"> -->
							
<!-- 								<div class="location_info_area"> -->
<!-- 						            <div class="location_area"> -->
<!-- 						                <span class="blind">현위치</span> -->
<!-- 						                <span class="provider_badge on">기상청</span> -->
<!-- 						                <span class="provider_badge accuweather ">아큐웨더</span> -->
<!-- 						                <span class="provider_badge weatherchannel ">웨더채널</span> -->
<!-- 						                <span class="provider_badge weathernews ">웨더뉴스</span> -->
<!-- 						                <strong class="location_name">유성구 노은3동</strong> -->
<!-- 						                <button type="button" class="btn_location" data-loading-class="loading" onclick="nclk_v2(this, 'gnb.curloc', '', '')"><span class="blind">내위치 찾기</span></button> -->
<!-- 						            </div> -->
<!-- 						        </div> -->
								
<!-- 								<div class="weather_area"> -->
<!-- 									<div class="weather_now"> -->
<!-- 					                    <div class="summary_img "> -->
<!-- 					                        <i class="ico_animation _cnLazy ico_animation_wt7" data-ico="ico_animation_wt7" data-ymdt="2022111320"></i> -->
<!-- 					                        <strong class="current "> -->
<!-- 					                            <span class="blind">현재 온도</span>9.6<span class="degree">°</span> -->
<!-- 					                        </strong> -->
<!-- 					                    </div> -->
<!-- 					                    <p class="summary"> -->
<!-- 					                        <span class="weather">흐림</span> -->
<!-- 					                        <em>어제보다</em> <span class="temperature down">10.8° <span class="blind">낮아요</span></span></p> -->
<!-- 					                </div> -->
<!-- 				                </div> -->
<!-- 			                </div> -->
<!-- 		                </div> -->

						
						<!-- 검색 -->
						<form name="fsearch" method="get" id="searchForm" action="/tour/randomTour.do">
	                	<div class="pdt_search">
	                        <input type="text" name="stx" placeholder="원하는 여행 상품을 찾아보세요." title="여행상품 검색" id="stx" class="sch_input" value="">
	                        <button id="search_btn" type="submit">검색</button>
	                    </div>
	                    </form>
<!-- 	                    <strong class="form_tit"># 어디로 떠나시나요?</strong> -->
	                    
<!-- 	                    지역을 선택 -->
<!-- 	                    <div class="form" id="areaForm"> -->
<!-- 	                    	<input type="text" id="areaTextbox"  -->
<!-- 	                    	placeholder="지역을 선택해주세요" title="지역 선택" value="" readonly="" onclick="openPopup();"> -->
<!-- 	                    </div> -->
<!-- 	                     // 지역을 선택 -->
	                    
<!-- 	                      지역선택팝업  -->
<!-- 	                    <div id="travel100Pupup02" class="wrap_layerpop" style="display: none"> -->
<!-- 					        <div class="layerpop""> -->
<!-- 					            <div class="option_form" id="dateOption"> -->
<!-- 					               <strong>어디로 여행을 떠나시나요?</strong> -->
<!-- 								   <p>다중 선택 가능합니다.</p> -->
<!-- 								   <em onclick="allDate();">전체 기간</em> -->
<!-- 								   <ul id="dateList"> -->
<!-- 									   <li><button type="button" id="rg01" value="전체" title="" class="">전체</button></li> -->
<!-- 									   <li><button type="button" id="rg02" value="동구" title="" class="">동구</button></li> -->
<!-- 									   <li><button type="button" id="rg03" value="중구" title="" class="">중구</button></li> -->
<!-- 									   <li><button type="button" id="rg04" value="서구" title="" class="">서구</button></li> -->
<!-- 									   <li><button type="button" id="rg05" value="유성구" title="" class="">유성구</button></li> -->
<!-- 									   <li><button type="button" id="rg06" value="대덕구" title="" class="">대덕구</button></li> -->
									  
<!-- 								   </ul> -->
<!-- 								   <div class="btn_area"><a href="javascript:;" onclick="">확인</a></div> -->
<!-- 					            </div> -->
<!-- 					            <button type="button" class="popup_close" onclick="closePopup();">닫기</button> -->
<!-- 					        </div> -->
<!-- 					    </div> -->
<!-- 					    //  지역선택팝업  -->
	                    

<!-- 						 계절선택  -->
<!-- 						<strong class="form_tit"># 어떤 계절에 떠나시나요?</strong> -->
<!-- 	                    <div class="radio_design_detail"> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="spring" name="season" value=""> -->
<!-- 								<label for="spring">봄</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="summer" name="season" value=""> -->
<!-- 								<label for="summer">여름</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="fall" name="season" value=""> -->
<!-- 								<label for="fall">가을</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="winter" name="season" value=""> -->
<!-- 								<label for="winter">겨울</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						 // 계절선택  -->

<!-- 						 카테고리선택  -->
<!-- 						<br> -->
<!-- 						<strong class="form_tit"># 어떤 테마를 원하시나요?</strong> -->
<!-- 	                    <div class="radio_design_detail"> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="category1" name="category" value=""> -->
<!-- 								<label for="category1">카테고리1</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="category2" name="category" value=""> -->
<!-- 								<label for="category2">카테고리2</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="category3" name="category" value=""> -->
<!-- 								<label for="category3">카테고리3</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio_box"> -->
<!-- 								<input type="checkbox" id="category4" name="category" value=""> -->
<!-- 								<label for="category4">카테고리4</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						 // 카테고리선택  -->
						<form name="frandom" method="get" id="randomCountForm" action="/tour/randomPickTour.do">
						<!--  랜덤카운트선택  -->
						<br>
						<strong class="form_tit"># 랜덤검색: 몇 곳을 추천해드릴까요?</strong>
	                    <div class="radio_design_detail">
							<div class="radio_box">
								<input type="radio" id="randomCount1" name="randomCount" value="1">
								<label for="randomCount1">1개</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="randomCount2" name="randomCount" value="2">
								<label for="randomCount2">2개</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="randomCount4" name="randomCount" value="4">
								<label for="randomCount4">4개</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="randomCount8" name="randomCount" value="8">
								<label for="randomCount8">8개</label>
							</div>
						</div>
						<!--  // 랜덤카운트선택  -->
	                    <div class="theme">
	                        <div class="btn">
<!-- 	                            <a href="javascript:void(0);"class="random">검색하기</a> -->
	                            <a href="javascript:void(0);" id="random_count_btn" onclick="return ran_cnt_submit()" class="random">랜덤추천</a>
	                        </div>
	               		 </div>
						</form>
					</div>
					<!-- // search -->
					
					<!-- right_imgBox  -->				
					<div class="right_imgBox">
						<div class="cont_wrap">
							<div class="tit">
								<p>더 추워지기 전에 즐겨보세요!<br> 대전오슈 </p>
								<span>대전오슈와 함께 아름다운 대전을 돌아봐요</span>
							</div>
						</div>
						<img src="resources/images/randomTour/banner.jpg">
					</div>
					<!--  // right_imgBox  -->		

				</div>
			</div>
			<!-- // search_box -->		
					
					
			<!--  result_100scene -->
			<div class="layout result_100scene">
				
				<!-- 검색결과가 있을 경우  -->
				<h3 id="randomTitle">어디로 갈지 고민이라면, 이런 여행 어때요?</h3>
				
				<c:forEach var="list" items="${requestScope.list}" varStatus="stts">
				<ul id="searchList">
					<li>
						<input type="hidden" id="listCount" value="<c:out value="${stts.count}"/>">
						<a href="javascript:void(0);">
							<span class="img">
								<em>${list.tourRegion}</em>
								<img onclick="javascript:location.href='/tour/reservdetail.do?tourCode=${list.tourCode}';" src="${list.atchFile}">		
							</span>
							<div class="cont_box" onclick="location.href='/tour/reservdetail.do?tourCode=${list.tourCode}';">
								<strong class="tit">
									<em>[${list.tourCategory}]</em>${list.tourNm}
										<span class="date">${list.startDate} ~ ${list.endDate}</span>
									
								</strong>
								<div class="info">
									<span class="price">
										<c:set var="price" value="${list.tourPrice}"/>
										<c:choose>
										<c:when test="${price == 0}">무료</c:when>
										<c:otherwise>${list.tourPrice}원</c:otherwise>
										</c:choose>
									</span>
								
<%-- 									<span class="date"><a href="/tour/reservdetail.do?tourCode=${list.tourCode}">자세히보기</a></span> --%>
								</div>
							</div>
						</a>
					</li>
				</ul>
				</c:forEach>
				<c:if test="${fn:length(list) == 0}">
					<!-- 검색결과가 없을 경우  -->
				<div class="result_100scene">
		            <div id="none_result" class="none_result">
		                <strong>검색 결과가 없어요.</strong>
		                <p>다른 곳도 검색해보는게 어떨까요?</p>
		            </div>
		        </div>
		        <!--  //검색결과가ㅏ 없을 경우  -->
				</c:if>
				<!-- // 검색결과가 있을 경우  -->	
				
				
				
			</div>
			<!--  //  result_100scene -->

			<jsp:include page="../../includes/footer.jsp" />
		</div>
<script>
function ran_cnt_submit(){
	document.getElementById('randomCountForm').submit();
}
</script>				
	</body>
</html>
