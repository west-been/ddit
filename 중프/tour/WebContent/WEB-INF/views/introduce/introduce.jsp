<%@page import="vo.TourVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<TourVO> list = (List<TourVO>) request.getAttribute("list");
%>


<style>
#map {height: 100% !important;width: 100% !important;}
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;  color: #000 !important;}
.distanceInfo:after {content:none;}
.label {
    display: inline;
    padding: 0.2em 0.6em 0.3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25em;
}



.main{
    margin-top:-285px;
}
.map_wrap {position:relative;width:100%;height:350px;}
.wrap.wtheWrap {display: none;margin-top:2px;font-weight: normal;}
.topBtn.on {display: none;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.desc-img {width: 100%;height: 130px;overflow: hidden;}
.desc-img img {float: none;}
.overlay_info {    width: 210px;
    border-radius: 6px;
    margin-bottom: 12px;
    float: left;
    position: relative;
    border: 1px solid #ccc;
    border-bottom: 2px solid #ddd;
    background-color: #fff;
}

.overlay_info:nth-of-type(n) {
    border: 0;
    box-shadow: 0px 1px 2px #888;
}
.overlay_info a {
    display: block;
    background: #6187ed;
    background: #6187ed url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
    text-decoration: none;
    color: #fff;
    padding: 12px 36px 12px 14px;
    font-size: 14px;
    border-radius: 6px 6px 0 0;
}
.overlay_info a strong {
/*     background: url(https://cdn0.iconfinder.com/data/icons/iconico-3/128/33.png) no-repeat; */
    padding-left: 27px;
}
.overlay_info .desc {
    padding: 14px;
    position: relative;
    min-width: 190px;
}

#daumContent img {
    max-width: 100%;
}
.overlay_info .address {
    font-size: 12px;
    color: #333;

    left: 80px;
    right: 14px;
    top: 16px;
    white-space: normal;
        margin-top: 13px;
    line-height: 16px;
}






</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f470a80055fc9d22f1fca974e1e797c7"></script>


	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />


		<div class="maintourWrap">

			<div class="mtrResultWrap">
				<div class="mtropbtn"></div>
				<div class="mtrResult open">
					
					<!-- <div class="resulTt">
						<h5>주요관광지</h5>
						<div class="mtrsrch">
							<form action="">
								<input type="text" name="map_nm" id="map_nm"
									placeholder="결과내 검색" value=""> <input type="button"
									onclick="search()">
								<script>
									$('input[type="text"]').keydown(function() {
										if (event.keyCode === 13) {
											event.preventDefault();
										}
										;
									});
								</script>
							</form>
						</div>
					</div> -->

					<div class="rsListWrap">
						<div class="rsscrWrap">
							

							<!-- 						페이지 왼쪽 여행지리스트  			-->
							<ul class="resultList">

								<c:forEach var="list" items="${list}"
									varStatus="stts">

									<li nm="여행지명" idx="34" midx="17990921">
										<div class="mtrthum">
											<a onclick="panTo(`${list.latlng1}`, `${list.latlng2}`, `${list.tourNm}`, `${list.tourLocation}`, `${list.atchFile}`, `${list.href}`) ">
											<img src="${list.atchFile}" alt=""></a>
										</div>
										<div class="mtrtxt">
											<a href="/tour/reservdetail.do?tourCode=${list.tourCode}">
												<strong class="rsname">${list.tourNm}</strong>
											</a> <span class="rsaddr">${list.tourLocation}</span>
										</div>
									</li>

								</c:forEach>
							</ul>
						</div>
					</div>

				</div>
			</div>

			<%-- --%>

			<!--mtrMap  -->
			<div class="mtrMap">
				<ul class="mapTab" ondragstart="return false"
					onselectstart="return false">
					<li class="on" idx="TYPEDIV_11"><a>관광지</a></li>
					<li class="" idx="TYPEDIV_13"><a onclick="getCurrentPosBtn()">내위치</a></li>
				</ul>
				<div id="map" style=" height: 900px;"></div>
			</div>


			<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(36.32528977989337, 127.40871040958804), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
					// 지도를 생성한다
					var map = new kakao.maps.Map(mapContainer, mapOption);

// 					map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); //노선 표현
					<%--
					// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
--%>



					function locationLoadSuccess(pos) {
						// 현재 위치 받아오기
						var currentPos = new kakao.maps.LatLng(
								36.32528977989337, 127.40871040958804);

						// 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
						map.panTo(currentPos);

						// 마커 생성
						var marker1 = new kakao.maps.Marker({
							position : currentPos
						});

// 						기존에 마커가 있다면 제거
						
						marker1.setMap(map);
					};

					function locationLoadError(pos) {
						alert('위치 정보를 가져오는데 실패했습니다.');
					};

					// 위치 가져오기 버튼 클릭시
					function getCurrentPosBtn() {
						navigator.geolocation.getCurrentPosition(
								locationLoadSuccess, locationLoadError);
					};
					
				    
					
					
					//현재 위치로 이동
					function panTo(asd1, asd2, nm, location, atchFile, href) {
var content = '';
content += '<div class = "main">'
content += '<div class="overlay_info">'
content += '    <a href="'+href+'" target="_blank"><strong>'+nm+'</strong></a>';
content += '    <div class="desc">';
content += '        <div class="desc-img"><img src="'+atchFile+'" alt=""></div>';
content += '        <span class="address"><strong>'+location+'</strong></span>';
content += '    </div>';
content += '</div>';
content += '</div>';
//  					    이동할 위도 경도 위치를 생성합니다 
 					    var moveLatLon = new kakao.maps.LatLng(asd1, asd2);
// 						alert(asd1+","+ asd2);
// 					    지도 중심을 부드럽게 이동시킵니다
//  					    만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
 					    map.panTo(moveLatLon);  
 					   	var marker = new kakao.maps.Marker({
 						    position: new kakao.maps.LatLng(asd1, asd2),
 						 map: map,
 						});
 					   	
 					   var overlay = new daum.maps.CustomOverlay({
 						  content: content,
 						 map: map,
 						 position: marker.getPosition()   
 					  });  
 						   
 						   
 						   
 					   
					overlay.setMap(map);
					console.log(href);
					};
					
					var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
					var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
					var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

					// 지도에 클릭 이벤트를 등록합니다
					// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

					    // 마우스로 클릭한 위치입니다 
					    var clickPosition = mouseEvent.latLng;

					    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
					    if (!drawingFlag) {

					        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
					        drawingFlag = true;
					        
					        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
					        deleteClickLine();
					        
					        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					        deleteDistnce();

					        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
					        deleteCircleDot();
					    
					        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
					        clickLine = new kakao.maps.Polyline({
					            map: map, // 선을 표시할 지도입니다 
					            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
					            strokeWeight: 3, // 선의 두께입니다 
					            strokeColor: '#db4040', // 선의 색깔입니다
					            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					            strokeStyle: 'solid' // 선의 스타일입니다
					        });
					        
					        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
					        moveLine = new kakao.maps.Polyline({
					            strokeWeight: 3, // 선의 두께입니다 
					            strokeColor: '#db4040', // 선의 색깔입니다
					            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					            strokeStyle: 'solid' // 선의 스타일입니다    
					        });
					    
					        // 클릭한 지점에 대한 정보를 지도에 표시합니다
					        displayCircleDot(clickPosition, 0);

					            
					    } else { // 선이 그려지고 있는 상태이면

					        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();

					        // 좌표 배열에 클릭한 위치를 추가합니다
					        path.push(clickPosition);
					        
					        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
					        clickLine.setPath(path);

					        var distance = Math.round(clickLine.getLength());
					        displayCircleDot(clickPosition, distance);
					    }
					});
					    
					// 지도에 마우스무브 이벤트를 등록합니다
					// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
					kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

					    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
					    if (drawingFlag){
					        
					        // 마우스 커서의 현재 위치를 얻어옵니다 
					        var mousePosition = mouseEvent.latLng; 

					        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();
					        
					        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
					        var movepath = [path[path.length-1], mousePosition];
					        moveLine.setPath(movepath);    
					        moveLine.setMap(map);
					        
					        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
					            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
					        
					        // 거리정보를 지도에 표시합니다
					        showDistance(content, mousePosition);   
					    }             
					});                 

					// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
					// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
					kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

					    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
					    if (drawingFlag) {
					        
					        // 마우스무브로 그려진 선은 지도에서 제거합니다
					        moveLine.setMap(null);
					        moveLine = null;  
					        
					        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();
					    
					        // 선을 구성하는 좌표의 개수가 2개 이상이면
					        if (path.length > 1) {

					            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
					            if (dots[dots.length-1].distance) {
					                dots[dots.length-1].distance.setMap(null);
					                dots[dots.length-1].distance = null;    
					            }

					            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
					                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
					                
					            // 그려진 선의 거리정보를 지도에 표시합니다
					            showDistance(content, path[path.length-1]);  
					             
					        } else {

					            // 선을 구성하는 좌표의 개수가 1개 이하이면 
					            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
					            deleteClickLine();
					            deleteCircleDot(); 
					            deleteDistnce();

					        }
					        
					        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
					        drawingFlag = false;          
					    }  
					});    

					// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
					function deleteClickLine() {
					    if (clickLine) {
					        clickLine.setMap(null);    
					        clickLine = null;        
					    }
					}

					// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
					// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
					function showDistance(content, position) {
					    
					    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
					        
					        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					        distanceOverlay.setPosition(position);
					        distanceOverlay.setContent(content);
					        
					    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
					        
					        // 커스텀 오버레이를 생성하고 지도에 표시합니다
					        distanceOverlay = new kakao.maps.CustomOverlay({
					            map: map, // 커스텀오버레이를 표시할 지도입니다
					            content: content,  // 커스텀오버레이에 표시할 내용입니다
					            position: position, // 커스텀오버레이를 표시할 위치입니다.
					            xAnchor: 0,
					            yAnchor: 0,
					            zIndex: 3  
					        });      
					    }
					}

					// 그려지고 있는 선의 총거리 정보와 
					// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
					function deleteDistnce () {
					    if (distanceOverlay) {
					        distanceOverlay.setMap(null);
					        distanceOverlay = null;
					    }
					}

					// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
					function displayCircleDot(position, distance) {

					    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
					    var circleOverlay = new kakao.maps.CustomOverlay({
					        content: '<span class="dot"></span>',
					        position: position,
					        zIndex: 1
					    });

					    // 지도에 표시합니다
					    circleOverlay.setMap(map);

					    if (distance > 0) {
					        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					        var distanceOverlay = new kakao.maps.CustomOverlay({
					            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
					            position: position,
					            yAnchor: 1,
					            zIndex: 2
					        });

					        // 지도에 표시합니다
					        distanceOverlay.setMap(map);
					    }

					    // 배열에 추가합니다
					    dots.push({circle:circleOverlay, distance: distanceOverlay});
					}

					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
					function deleteCircleDot() {
					    var i;

					    for ( i = 0; i < dots.length; i++ ){
					        if (dots[i].circle) { 
					            dots[i].circle.setMap(null);
					        }

					        if (dots[i].distance) {
					            dots[i].distance.setMap(null);
					        }
					    }

					    dots = [];
					}

					// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
					// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
					// HTML Content를 만들어 리턴하는 함수입니다
					function getTimeHTML(distance) {

					    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
					    var walkkTime = distance / 67 | 0;
					    var walkHour = '', walkMin = '';

					    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
					    if (walkkTime > 60) {
					        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
					    }
					    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

					    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
					    var bycicleTime = distance / 227 | 0;
					    var bycicleHour = '', bycicleMin = '';

					    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
					    if (bycicleTime > 60) {
					        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
					    }
					    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

					    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
					    var content = '<ul class="dotOverlay distanceInfo">';
					    content += '    <li>';
					    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
					    content += '    </li>';
					    content += '    <li>';
					    content += '        <span class="label">도보</span>' + walkHour + walkMin;
					    content += '    </li>';
					    content += '    <li>';
					    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
					    content += '    </li>';
					    content += '</ul>'

					    return content;
					}
					    
				</script>
		</div>
		<!-- // mtrMap  -->








	</div>
