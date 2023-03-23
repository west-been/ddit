<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
QnaVO qv = (QnaVO) request.getAttribute("qv");
%>
<!DOCTYPE html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>

</head>


<script>

function qnaSubmit(){
	if((tit != null) && (con !=null)){
	alert("수정되었습니다.");	
	}
}


</script>





<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form action="qnaUpdate.do" method="post" onsubmit="qnaSubmit();">
				<input type="hidden" name="qnaCode" value="<%=qv.getQnaCode()%>" onsubmit="qnaSubmit();">
				<div class="dataReqst mb0">
					<span>*은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
							<td>
								<span>제목*</span> <input type="text" name="qnaTitle"
									value="<%=qv.getQnaTitle()%>" required id="tit">
								</td>
							</div>
						</li>

						<li class="pwd">
							<div class="">
							<td>
								<span>회원 아이디*</span> <input type="text" name="memId"
									value="<%=qv.getMemId()%>">
								</td>
							</div>
						</li>

						<li class="pwd">
							<div class="">
							<td>
								<span>내용*</span>
								 <textarea type="text" name="qnaContent"
									value="" required id="con"><%=qv.getQnaContent()%></textarea>
								</td>
							</div>
						</li>
						
				</div>
					<div class="contac">
			
			<a href="/tour/qna.do" class="btn btn-line">취소</a>
			<button class="btn btn-blue">수정하기</button>
		</div>
		</form>
		</div>
	</div>
	
	
	<jsp:include page="../../includes/footer.jsp" />
	</div>

</body>
</html>