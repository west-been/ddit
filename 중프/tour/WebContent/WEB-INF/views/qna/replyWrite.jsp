<%@page import="vo.QnaVO"%>
<%@page import="vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% AdminVO id = (AdminVO) session.getAttribute("AdminVO"); 
	QnaVO qv = (QnaVO) request.getAttribute("qv");

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 등록</title>

</head>
<% String a = request.getParameter("qnaCode"); %>
<body>

<script>
	function repSubmit() {
		if ((con != null) && (tit !=null)) {
			alert('등록되었습니다.');
		} 
	}
</script>




	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form id="replyForm" name="qnaVO" action="/tour/replyWrite.do"
				method="post" onsubmit="repSubmit();">
				<div class="dataReqst">
					<input type="hidden" name="qnaCode" value="<%=a %>">
					<span><strong class="point">*</strong>은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
								<span>제목<strong class="point">*</strong></span> 
								<input type="text" name="replyTitle" value=""
								placeholder="제목을 입력해주세요" required id="tit">
							</div>
						</li>

						<li class="pwd">
							<div class="">
								<span>관리자 <strong class="point">*</strong></span> <input type="text" name="adminNm" value="<%=qv.getAdminNm()%>">
							</div>
						</li>

						<li  class="textarea-cont">
							<div class="">
								<span>내용<strong class="point">*</strong></span> 
								<textarea type="text" name="replyContent"
									value="" placeholder="내용을 입력해주세요" required id="con"></textarea>
							</div>
						</li>
						</ul>
						
						
						<div class="btn-group">
							<a href="/tour/qna.do" class="btn btn-line">취소</a>
							<button class="btn btn-blue">작성하기</button>
						</div>
						
				</div>
		</form>
		</div>


	</div>


	</div>
	<jsp:include page="../../includes/footer.jsp" />
	</div>
</body>
</html>