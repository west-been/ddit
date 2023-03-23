<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String msg1 = session.getAttribute("msg1") == null ? "" : (String)session.getAttribute("msg1");
session.removeAttribute("msg1"); 
String findId = session.getAttribute("findId") == null ? "" : (String)session.getAttribute("findId");
session.removeAttribute("findId"); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 대전오슈 </title>

<%
String msg = (String)session.getAttribute("msg");
if(msg!=null && !msg.equals("비밀번호 실패")){
%>
<script>alert('<%=msg%>');</script>

<%// msg 세션제거
}
	session.removeAttribute("msg");
%>

<%
String memId = session.getAttribute("memId") == null ? "" : (String)session.getAttribute("memId");
// 꺼낸 값 지우기
session.removeAttribute("memId");
%>

<%	
 if(msg!=null && !msg.equals("가입성공! ") && msg1.equals("2") && findId == null) {
%>
<script> alert("등록하신 회원정보가 일치하지 않습니다.") </script>
<% } %>



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

			<div class="sub_cont">
				<div class="inner login-container">
					
					<div class="login_wrap">
						<h3 class="tit">로그인</h3>
						<p class="desc">볼수록 빠져드는 대전여행 이야기 </p>
						<ul>
							<li>
								<form name="loginForm" id="loginForm" method="post" action="/tour/login.do">
									<!-- <p class="stit">회원 로그인</p> -->
									<!-- <span class="sub_cont desc" style="font-size: 18px; font-weight: normal;">예약 결제시 인터넷 익스플로러는 지원되지 않으니 참고바랍니다.</span> -->
									<div class="login_cont">
										<div class="input-wrap">
											<label for="id" class="hidden">아이디</label> 
											<input name="id" id="id" title="아이디를 입력하세요" type="text" class="input_log" placeholder="아이디" value="">
											<!-- <p> <p> -->
										</div>
										<div class="input-wrap">
											<label for="password" class="hidden">비밀번호</label> 
											<input name="password" id="password" title="비밀번호을 입력하세요" type="password" class="input_log" placeholder="비밀번호" autocomplete="”off”">
										</div>
										<!-- log_link -->
										<ul class="log_link">
											<li><a href="<%=request.getContextPath()%>/join.do">  회원가입   </a></li>
											<li><a href="<%=request.getContextPath()%>/findId.do">  아이디찾기  </a></li>
											<li><a href="<%=request.getContextPath()%>/findPw.do">  비밀번호찾기  </a></li>
										</ul>
										<!-- //log_link -->
										
										<!-- btn_area-->
										<div class="list_btn">
										<button type="submit" class="btn btn-blue">로그인</button></div>
								
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
	
	
	<% if(!findId.equals("")) {
			if(findId.equals("NOID")) {	
	%>
	<script> alert("❌❌고객님의 아이디는 존재하지 않습니다.❌❌")</script>
	<% 	session.removeAttribute("findId");		} else {  %> 
	
	<script> alert("🎁🎁고객의 아이디는  : " + '<%=findId%>' + "입니다🎁🎁.") </script>
	
	<% 		session.removeAttribute("findId");
			} 
		}
	%>
</body>
</html>