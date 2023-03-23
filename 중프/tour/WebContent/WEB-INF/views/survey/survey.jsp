<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO) session.getAttribute("memberVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 | 대전오슈</title>
</head>
<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />

		<div id="content" class="survay-wrap">

			<!-- survey-tit -->
			<div class="survay-tit">
				<h2>
					<strong>대전<span>오</span><span>슈</span></strong> 홈페이지 설문조사
				</h2>
				<div class="deco-box">
					<p>대전오슈 홈페이지를 방문해주셔서 감사합니다.</p>
					<p>본 설문을 통해 여러분의 만족도와 요구를 조사하여 보다 나은 정보를 제공하는데 활용하겠습니다.</p>
					<p>통계법 제 332조에 따라 설문 응답자에 대한 비밀이 보장되면 설문조사 결과 자료는 통계 목적 이외에
						사용되지 않음을 알려드립니다. 감사합니다.</p>
				</div>
			</div>
			<!--  //survey-tit -->



			<!-- survey-items -->

			<form id="surveyForm" name="SurveyVO" method="post"
				action="/tour/surveyInsert.do">
				<input id="surBtn" type="hidden" name="textt">
				<!-- 	<input type="button" value="보내기"> -->
				<input type="hidden" name="memId" value="<%=mv.getMemId()%>">
				<div class="survay-items">
					<ol>
						<li><strong class="question"><span>1.</span> 대전오슈
								홈페이지 전반에 대해 어떻게 생각하십니까?</strong>
							<div class="radio_box">
								<label for="radio1"><input type="radio" id="radio1"
									class="radio" name="first" value="매우만족"><em></em><span>매우만족</span></label>
								<label for="radio2"> <input type="radio" id="radio2"
									class="radio" name="first" value="만족"><em></em><span>만족</span></label>
								<label for="radio3"> <input type="radio" id="radio3"
									class="radio" name="first" value="불만족"><em></em><span>불만족</span></label>
								<label for="radio4"> <input type="radio" id="radio4"
									class="radio" name="first" value="매우불만족"><em></em><span>매우불만족</span></label>
							</div></li>
						<li><strong class="question"><span>2.</span> 관광지예약
								시스템 이용에 만족하십니까?</strong>
							<div class="radio_box">
								<label for="radio5"><input type="radio" id="radio5"
									class="radio" name="second" value="매우만족"><em></em><span>매우만족</span></label>
								<label for="radio6"> <input type="radio" id="radio6"
									class="radio" name="second" value="만족"><em></em><span>만족</span></label>
								<label for="radio7"> <input type="radio" id="radio7"
									class="radio" name="second" value="불만족"><em></em><span>불만족</span></label>
								<label for="radio8"> <input type="radio" id="radio8"
									class="radio" name="second" value="매우불만족"><em></em><span>매우불만족</span></label>
							</div></li>
						<li><strong class="question"><span>3.</span> 랜덤여행추천
								이용에 만족하십니까?</strong>
							<div class="radio_box">
								<label for="radio9"><input type="radio" id="radio9"
									class="radio" name="third" value="매우만족"><em></em><span>매우만족</span></label>
								<label for="radio10"> <input type="radio" id="radio10"
									class="radio" name="third" value="만족"><em></em><span>만족</span></label>
								<label for="radio11"> <input type="radio" id="radio11"
									class="radio" name="third" value="불만족"><em></em><span>불만족</span></label>
								<label for="radio12"> <input type="radio" id="radio12"
									class="radio" name="third" value="매우불만족"><em></em><span>매우불만족</span></label>
							</div></li>
						<li><strong class="question"><span>4.</span> 문의게시판
								문의글에 대한 답변에 대한 만족도는 어느정도입니까? </strong>
							<div class="radio_box">
								<label for="radio13"><input type="radio" id="radio13"
									class="radio" name="fourth" value="매우만족"><em></em><span>매우만족</span></label>
								<label for="radio14"> <input type="radio" id="radio14"
									class="radio" name="fourth" value="만족"><em></em><span>만족</span></label>
								<label for="radio15"> <input type="radio" id="radio15"
									class="radio" name="fourth" value="불만족"><em></em><span>불만족</span></label>
								<label for="radio16"> <input type="radio" id="radio16"
									class="radio" name="fourth" value="매우불만족"><em></em><span>매우불만족</span></label>
							</div></li>
						<li><strong class="question"><span>5.</span> 대전오슈
								홈페이지 메뉴 중 가장 유용한 메뉴는 무엇입니까? </strong>
							<div class="radio_box">
								<label for="radio17"><input type="radio" id="radio17"
									class="radio" name="fifth" value="관광지예약"><em></em><span>관광지예약</span></label>
								<label for="radio18"> <input type="radio" id="radio18"
									class="radio" name="fifth" value="랜덤여행추천"><em></em><span>랜덤여행추천</span></label>
								<label for="radio19"> <input type="radio" id="radio19"
									class="radio" name="fifth" value="대전버스노선"><em></em><span>대전버스노선</span></label>
								<label for="radio20"> <input type="radio" id="radio20"
									class="radio" name="fifth" value="관광지소개"><em></em><span>관광지소개</span></label>
								<label for="radio21"> <input type="radio" id="radio21"
									class="radio" name="fifth" value="문의게시판"><em></em><span>문의게시판</span></label>
							</div></li>
					</ol>
					<div class="btn-wrap center">
						<button type="button" class="btn btn-blue" id="insertSurvey">제출하기</button>
					</div>

				</div>
			</form>


			<!-- // survey-items -->


			<script type="text/javascript">
				$("#insertSurvey").click(function(){
					alert("설문에 응해주셔서 감사합니다.");
					$("#surveyForm").submit();
				});
			</script>





		</div>

		<jsp:include page="../../includes/footer.jsp" />
	</div>


</body>
</html>