<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%MemberVO id = (MemberVO) session.getAttribute("memberVO");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 등록</title>

</head>

<body>

<script>

function qnaSubmit(){
	if((tit != null) && (con !=null)){
	alert("등록되었습니다.");	
	}
}

</script>



<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form id="qnaForm" name="qnaVO" action="/tour/qnaWrite.do"
				method="post" onsubmit="qnaSubmit();">
				<div class="dataReqst mb0">
					<span>*은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
								<span>제목*</span> <input type="text" name="qnaTitle" value=""  required id="tit">
							</div>
						</li>

						<li class="pwd">
							<div class="">
								<span>회원 아이디*</span> <input type="text" name="memId" value="<%=id.getMemId()%>">
							</div>

						</li>


						<li class="pwd">
							<div class="">
								<span>내용*</span> <textarea type="text" name="qnaContent"
									required id="con"></textarea>
							</div>
						</li>
						
						</ul>
				</div>
				
				<div class="contac">
					<a href="/tour/qna.do" class="btn btn-line">취소</a>
					<button class="btn btn-blue">작성하기</button>
				</div>
		</form>
		</div>



	</div>




	<jsp:include page="../../includes/footer.jsp" />


</body>
</html>