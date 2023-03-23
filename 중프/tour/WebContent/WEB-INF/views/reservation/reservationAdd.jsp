
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성하기</title>

</head>

<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<form id="bbsForm" name="tourVO" action="reservationAdd.do" method="post" enctype="multipart/form-data">
				<div class="wrap">
					<div class="dataReqst half">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li class="">
								<div class="">
									<span>작성자*</span> <input type="text" name="adminId" value="admin1" />
								</div>
							</li>
							<li>
								<div class="">
									<span>여행지*</span> <input type="text" name="tourNm" value="" />
								</div>
							</li>
							<li>
								<div class="">
									<span>주소*</span> <input type="text" name="tourLocation" value="" />
								</div>
							</li>
							
							<li   class="">
								<div class="">
									<span>지역*</span> <input type="text" name="tourRegion" value="" />
								</div>
							</li>
							
							<li class="">
								<div class="">
									<span>전화번호*</span> <input type="text" name="tourTel" value="" />
								</div>
							</li>
							
							<li class="">
								<div class="">
									<span>여행계절*</span> <input type="text" name="tourSeason" value="" />
								</div>
							</li>
							
							<li class="">
								<div class="">
									<span>카테고리*</span> <input type="text" name="tourCategory" value="" />
								</div>
							</li>

							<li  class="">
								<div>
									
										<span>가격*</span> <input type="text" name=tourPrice value="" />
									
								</div>
							</li>
							<li   class="">
								<div class="">
									<span>최대수용인원*</span> <input type="text" name="tourCapacity" value="" />
								</div>
							</li>

							<li> <div class=""><span>개장시간*</span><input type="time" name="startTime" value="" /></div></li>
							<li><div class=""><span>폐장시간*</span> <input type="time" name="endTime" value="" /></div></li>
							<li><div class=""><span>개장일*</span> <input type="date" name="startDate" value="" /></div></li>
							<li><div class=""><span>폐장일*</span> <input type="date" name="endDate" value="" /></div></li>
							<li><div><span>첨부파일</span><input type="file" name="atchFile">	</div></li>


							<!-- <li class="pwd"> -->
							<!-- <div class=""> -->
							<!-- <span>비밀번호*</span> <input type="password" name="password" -->
							<!-- id="password" maxlength="4" class="pwInput" value=""> -->
							<!-- </div> -->
							<!-- </li> -->
							<!-- <li class="pwd"> -->
							<!-- <div class=""> -->
							<!-- <span>비밀번호 확인*</span> <input type="password" name="password2" -->
							<!-- id="password2" maxlength="4" class="pwInput" value=""> -->
							<!-- </div> -->
							<!--</li> -->
						</ul>
					</div>	

						<div class="dataReqst mb0">
							<ul>
								<li>
									<div>
										<span>여행지소개*</span> 
										<textarea type="text" name="tourInfo" value="" ></textarea>
									</div>
								</li>
							</ul>
						</div>


							
						
							
						

		
				

				<div class="btn-wrap btnAdd">
					<a href="/tour/reserv.do" class="btn btn-line">목록</a>
			 		<input type="submit" value="작성하기" class="btn btn-blue">

				</div>
				

			</form>
		</div>



	</div>

	</div>



	<jsp:include page="../../includes/footer.jsp" />

	</div>
</body>
</html>