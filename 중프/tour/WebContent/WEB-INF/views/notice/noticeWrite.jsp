<%@page import="vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% AdminVO id = (AdminVO) session.getAttribute("AdminVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항입력</title>

<script>
	function notSubmit() {
		if ((con != null) && (tit !=null)) {
			alert('등록되었습니다.');
		} 
	}
</script>


</head>


<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form id="noticeForm" name="noticeVO" action="/tour/noticeInsert.do"
				method="post" onsubmit="notSubmit();">
				<div class="dataReqst">
					<span><strong class="point">*</strong>은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
								<span>제목<strong class="point">*</strong></span> <input type="text" name="noticeTitle" value=""
								required id="tit">
							</div>
						</li>

						<li class="pwd">
							<div class="">
								<span>관리자 아이디<strong class="point">*</strong></span> <input type="text" name="adminId" value="admin1">
							</div>
						</li>

						<li class="textarea-cont">
							<div class="">
								<span>내용<strong class="point">*</strong></span> 
								<textarea type="text" name="noticeContent" value="" required id="con"></textarea>
							</div>
						</li>
						</ul>
						
						<div class="btn-group">
							<a href="/tour/notice.do" class="btn btn-line">취소</a>
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