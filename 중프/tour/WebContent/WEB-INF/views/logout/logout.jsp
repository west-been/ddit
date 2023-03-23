<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/yejicopy.css"/> --%>
<style>
li { list-style: none; }
* { max-height: 1000000px; margin: 0; padding: 0; }
.login_wrap>ul>li { display: inline-block; width: 100%; text-align: center; vertical-align: top; box-sizing: border-box; }
.sub_cont { padding: 83px 0 85px; }
.sub_cont .desc { color: #717171; text-align: center; }
.inner { position: relative; max-width: 1300px; margin: 0 auto; }
.inner:after { display: block; clear: both; height: 0; content: ""; overflow: hidden; }
.login_wrap { border: 1px solid #ddd; border-radius: 10px; padding: 70px 0; margin: 0 auto; }
.login_wrap .stit { text-align: center; margin-bottom: 27px; }
.login_wrap ul { font-size: 0; }
.login_wrap>ul>li { display: inline-block; width: 100%; text-align: center; vertical-align: top; box-sizing: border-box; }
.login_wrap>ul>li:last-child { padding: 0 60px; border-left: 1px solid #ddd; }
.login_wrap>ul>li:last-child dl dd { font-size: 17px; color: #717171; text-align: center; margin: 20px 0 30px; }
body { min-width: 320px; background: #fff; color: #222; font-family: 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', Apple Gothic, arial, helvetica, sans-serif;
	   font-size: 19px; font-weight: 400; line-height: 27px; -webkit-text-size-adjust: none; -webkit-overflow-scrolling: touch; word-wrap: break-word;
	   word-break: keep-all; white-space: normal; letter-spacing: -1px; }
.alert_p { color: #e61b3c; font-size: 15px; text-align: left; line-height: 1.3; margin-bottom: 10px; }
#sub .tit { margin-bottom: 35px; font-size: 30px; }
#updateForm { position: relative; max-width: 1300px; margin: 0 auto; }
</style>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<!-----------------------  내용 들어갑니다 ---------------------->

			<div class="sub_cont" id="container">
				<div class="inner">
					<h3 class="tit mb20">로그인</h3>
					<p class="desc mb70" style="font-size: 20px; font-weight: normal;">
						💛💛볼수록 빠져드는 대전여행💛💛
					<div class="login_wrap">

						<ul>
							<li>
								<form name="updateForm" id="updateForm" method="post" action="./join/joinUpdate">
									<input type="hidden" name="_csrf" value="d94cf539-ccc5-4840-9b28-0b446d025dbc"> 
									<input type="hidden" name="updateId" value="">
									<input type="hidden" name="snsId" value="">
								
								</form>
								<form name="loginForm" id="loginForm" method="post">
									<input type="hidden" id="returnURL" name="returnURL" value="/nsm/main"> <input type="hidden" name="_csrf" value="d94cf539-ccc5-4840-9b28-0b446d025dbc">
									<p class="stit">회원 로그인</p>
									<span class="sub_cont desc" style="font-size: 20px; font-weight: normal;">예약 결제시 인터넷 익스플로러는 지원되지 않으니 참고바랍니다.</span>
									<div class="login_cont">
										<label for="id" class="hidden">아이디</label> <input name="id" id="id" title="아이디를 입력하세요" type="text" class="input_log" placeholder="아이디" value="">
										<p> <p>
											<label for="password" class="hidden">비밀번호</label>
											<input name="password" id="password" title="비밀번호을 입력하세요" type="password" class="input_log" placeholder="비밀번호" autocomplete="”off”">
										<p class="alert_p" id="loginResultMsg"></p>

										<!-- log_link -->
										<ul class="log_link">
											<li><input type="checkbox" id="saveCheck" name="saveCheck" value="Y" onchange="fn_webid_save(this.checked)"> 
												<label for="saveCheck"><pre>  아이디 저장  </pre></label></li>
											<li><a href= "<%=request.getContextPath()%>/join.do"><pre>  회원가입   </pre></a></li>
											<li><a href="/nsm/member/findId"><pre>  아이디찾기  </pre></a></li>
											<li><a href="/nsm/member/findPasswd"><pre>  비밀번호찾기  </pre></a></li>
										</ul>
										<!-- //log_link -->
										<!-- btn_area-->
										<ul class="btn_area w100">
											<li class="list_btn"><a
												href="javascript:fn_login_action()" class="btn_ty_m_c1">로그인</a></li>
										</ul>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>
</body>
</html>