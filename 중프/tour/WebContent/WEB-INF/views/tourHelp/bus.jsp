<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대전버스노선 | 대전오슈</title>
<link rel="stylesheet" type="text/css" href="resources/css/tourMap.css">
<style>
.wtheWrap {
	display: none !important;
}
</style>




</head>
<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />

		<div class="bus_wrap">

			<!-- bus_left -->
			<div class="bus_left">


				<div class="bus_info">
					<label for="busInfo" class="tit">버스운행정보 검색</label>
					<div class="bus_search bus_box">
						<div class="input_group">
							<input type="text" id="busInfo" /> <input type="button"
								onclick="" class="ico">
						</div>
						<span class="txt">노선번호, 정류소명을 한번에 검색하세요. <br> 예)104,
							대전광역시청
						</span>
					</div>
				</div>


				<div class="scroll">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">노선검색</li>
						<li class="tab-link" data-tab="tab-2">정류장검색</li>
					</ul>

					<div id="tab-1" class="tab-content current">
						<!-- 노선검색 테이블   -->
						<ul class="list_data01">

							<!-- 표 행 시작  -->
							<li>
								<ul class="list_detail">
									<li>
										<div class="bus_num">
											<span class="txt_02"> <a style="color: #121212;"
												href="javascript:routeView('up' , '30300100', '1','1  ','신안동','원내차고지')"
												title="지도에서 기점 보기">1</a>
											</span>
										</div>
									</li>
									<li>
										<div class="bus_kind">
											<div class="bus_st04">급행</div>
										</div>
									</li>
								</ul>
								<div class="bus_sta">
									<ul>
										<li><a
											href="javascript:routeView('up' , '30300100', '1','1  ','신안동','원내차고지')"
											title="신안동"> 신안동 방면 </a></li>
										<li><a
											href="javascript:routeView('down' , '30300100', '1','1  ','신안동','원내차고지')"
											title="원내차고지"> 원내차고지 방면 </a></li>

									</ul>
								</div>
							</li>
							<!-- // 표 행 끝  -->

							<!-- 표 행 시작  -->
							<li>
								<ul class="list_detail">
									<li>
										<div class="bus_num">
											<span class="txt_02"> <a style="color: #121212;"
												href="javascript:routeView('up' , '30300100', '1','1  ','신안동','원내차고지')"
												title="지도에서 기점 보기">1</a>
											</span>
										</div>
									</li>
									<li>
										<div class="bus_kind">
											<div class="bus_st04">급행</div>
										</div>
									</li>
								</ul>
								<div class="bus_sta">
									<ul>
										<li><a
											href="javascript:routeView('up' , '30300100', '1','1  ','신안동','원내차고지')"
											title="신안동"> 신안동 방면 </a></li>
										<li><a
											href="javascript:routeView('down' , '30300100', '1','1  ','신안동','원내차고지')"
											title="원내차고지"> 원내차고지 방면 </a></li>

									</ul>
								</div>
							</li>
							<!-- // 표 행 끝  -->


						</ul>
						<!-- // 노선검색 테이블   -->
					</div>

					<div id="tab-2" class="tab-content">
						정보가 없습니다. <br> 정류장명을 입력해주세요.
					</div>
				</div>

			</div>
			<!--  //bus_left -->



		<button type="button" class="btn btn-lg btn-primary"
			id="getMyPositionBtn">내 위치 가져오기</button>
			<div id="map" style="width: 1500px; height: 800px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f470a80055fc9d22f1fca974e1e797c7"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(33.450701,
						126.570667);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			</script>
		</div>
		<!-- 부트스트랩 primary 버튼 -->

		<!-- 부트스트랩 이용을 위한 jQuery와 CDN -->
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	</div>


	<script>
		$(document).ready(function() {
			// 탭 
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		});
	</script>

</body>
</html>