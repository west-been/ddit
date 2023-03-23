<%@page import="vo.AdminVO"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QnaVO qv = (QnaVO) request.getAttribute("qv");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>답변글 수정</title>

</head>
<body>


<script>
function repSubmit(){
	if((tit != null) && (con !=null)){
	alert("수정되었습니다.");	
	}
}
</script>


<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form action="replyUpdate.do" method="post" onsubmit="repSubmit();">
				<input type="hidden" name="qnaCode" value="<%=qv.getQnaCode()%>">
				<div class="dataReqst">
					<span><strong class="point">*</strong>은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
							<td>
								<span>제목<strong class="point">*</strong></span>
								 <input type="text" name="replyTitle"
									 value="${requestScope.qv.replyTitle}" required id="tit"> 
								</td>
							</div>
						</li>

						<li class="pwd">
							<div class="">
							<td>
								<span>관리자 이름<strong class="point">*</strong></span> 
								<input type="text" name="adminNm"
									value="<%=qv.getAdminNm()%>">
								</td>
							</div>
						
						</li>

						<li class="textarea-cont">
							<div class="">
							<td>
								<span>내용<strong class="point">*</strong></span>
								 <textarea type="text" name="replyContent"
									 value="" required id="con">${requestScope.qv.replyContent}</textarea>
								</td>
							</div>
						</li>
						</ul>
						
						<div class="btn-group">
							<a href="/tour/qna.do" class="btn btn-line">취소</a>
							<button class="btn btn-blue">수정하기</button>
						</div>
				</div>
		</form>
		</div>
	</div>
	
	<jsp:include page="../../includes/footer.jsp" />
	</div>




</body>
</html>