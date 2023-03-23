<%@page import="vo.EventVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.PhotoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

List<PhotoVO> PhotoAll = (List<PhotoVO>) request.getAttribute("PhotoAll");
List<EventVO> EventAll = (List<EventVO>) request.getAttribute("EventAll");

%>	

<link rel="stylesheet" type="text/css" href="resources/css/main.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- mainVisualWrap -->
<section class="mainVisualWrap">
	<div class="mvTxt">
		<strong>DAEJEON</strong> <strong>TRIP ROAD</strong> <span> 우리
			지금, 대전가요!<br> 가장 쉽게! 가장 빠르게! 가장 즐겁게!<br> 대한민국의 중심으로 통하는 길
		</span>
	</div>
	<div class="mainVisual owl-carousel">
		<div class="item item01"><img src="resources/images/main/mVisual01.jpg"></div>
		<div class="item item02"><img src="resources/images/main/mVisual02.jpg"></div>
		<div class="item item03"><img src="resources/images/main/mVisual03.jpg"></div>
		<div class="item item04"><img src="resources/images/main/mVisual04.jpg"></div>
		<div class="item item05"><img src="resources/images/main/mVisual05.jpg"></div>
	</div>
	<div class="mVnavWrap">
		<div class="mVdots"></div>
		<div class="mVnav">
			<button class="pasuebtn pause"></button>
		</div>
	</div>
</section>
<!--  // mainVisualWrap -->

<!-- mc01 -->
<section class="mc01">
	<div class="wrap">
		<div class="sectnTt">
			<strong> 지금 대전에서<br> <b>'HOT'</b>한 여행지는?
			</strong> <span>대전은 노잼? 노! 꿀잼! 대전의 핫한 여행지를 T.P.O에 맞게 즐겨보세요.</span>
		</div>
		<div class="hot3Wrap">
			<ul class="hot3Tpo">

					
					<c:forEach var="PhotoAll" items="${requestScope.PhotoAll}" varStatus="stts">	
				
							<li>
								<a href="javascript:void(0);" target="_self"> 
		
									<div class="hotThum">
										<img src="${PhotoAll.atchFile}">
									</div>
									<div class="hot3Txt">
										<span>${PhotoAll.photoTitle}</span>
										<p>
											  ${PhotoAll.photoDate}
										</p>
									</div>
									
								</a>
							</li>
						
						
					</c:forEach>

			</ul>
		</div>


	</div>
</section>
<!--  // mc01 -->

<!--mc03  -->
<section class="mc03">
    <div class="wrap">
        <div class="sectnTt">
            <strong>
                보고 즐기고 맛보는 <br>
                <b>축제</b>의 향연
            </strong>
            <span>피로를 날리는, 특별한 휴식과<br> 먹거리, 볼거리, 즐길거리가 있는 대전의 축제</span>
            <div class="fest-nav"></div>
        </div>
 
        
        <div class="festSlide">
        
        	<c:forEach var="EventAll" items="${requestScope.EventAll}" varStatus="stts">
	       		<a href="javascript:void(0);">
	       			<div class="festThum">
	         			<img src="${EventAll.atchFile}">
	        		</div>
	        		<span>${EventAll.eventNm}</span>
	         		<p>${selectAllEvent.evertPeriod}</p>
	       		</a>
       		</c:forEach>
       		
       		
       		
       		
        </div>
    </div>
</section>
<!--  //mc03  -->


<section class="mc04">
    <div class="wrap">
        <div class="askTop">
            <span>대전여행 무엇이든 물어보세요!</span>
            <div class="numThing">
                <ul>
                    <li class="clock">09:00 - 21:00</li>
                    <li class="tel">042. 221. 1905</li>
                    <li><span>대전역과 중앙로역 사이에 위치해 있습니다.</span></li>
                </ul>
            </div>
        </div>
        <div class="askBttm">
            <ul>
                <li class="guiding lock on">
                    <div>
                        <a href="javascript:void(0);">
                            <span>공지사항</span>
                        </a>
                    </div>
                </li>
                <li class="trvbook">
                    <div>
                        <a href="<%=request.getContextPath()%>/reserv.do">
                            <span>관광지예약</span>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="showGuide">
                <span>공지사항</span>
                <div class="moreView">
                    <a href="<%=request.getContextPath()%>/notice.do">더보기</a>
                </div>
                <div class="showList">
                    <ul>




						<c:forEach var="NoticeAll" items="${requestScope.NoticeAll}" varStatus="stts">
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <span>${NoticeAll.noticeTitle}</span>
                                <p>${NoticeAll.noticeDate.substring(0,10)}</p>
                            </a>
                        </li>
                        </c:forEach>

                        

                    </ul>

                </div>
            </div>
        </div>
    </div>
</section>



<div>
<!-- 챗봇아이콘 -->
<div style="width:100%;">
	<!-- 누리봇을 생성하기 위한 DIV 태그를 유일한 아이디 값으로 추가합니다. -->
	<div id="dj_nuribot_div"></div>  
</div>
<!-- 대전 시청의 Jquery 버전과 맞추기 위해 추가한 파일이기 때문에 제외합니다. --> 
<script src="resources/api/dj-nuribot-plugin-1.0.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
	// 필요한 구간에서 위에서 추가한 DIV 태그에 누리봇을 생성하는 스크립트를 추가합니다
  $('#dj_nuribot_div').dj_nuribot();
});
</script> 
<!-- 챗봇아이콘 -->
<!-- 챗봇팝업 start -->
<div id="dj_nuribot_div_2" style="z-index: 9000; position: fixed; right: 30px; bottom: 30px;"></div>
<script type="text/javascript">
	$(document).ready(function(e) {
		$("#dj_nuribot_div").on('click', function(e){
			var openGubun = $("#dj_nuribot_div iframe").css("display");
			if( openGubun == "inline"){
				$.ajax({
					url: "/tou/chatbotClick.do",
					type: "post",
					data: {},
					dataType : "json"
				});
			}
		});
	});
</script>
<!-- 챗봇팝업 end -->
</div>
