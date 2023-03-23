<%@page import="vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeVO nv = (NoticeVO) request.getAttribute("nv");
	

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지사항수정</title>

<script>

	function notSubmit() {
		if (tit !=null && con != null) {
			alert('수정되었습니다.');
		} else if (con == null) {
			alert('내용을 입력해주세요.')
		}
	}
</script>
</head>

<body>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">

			<form action="noticeUpdate.do" method="post"  onsubmit="notSubmit();">
				<input type="hidden" name="noticeCode" value="<%=nv.getNoticeCode()%>">
				<div class="dataReqst">
					<span><strong class="point">*</strong>은 필수입력사항입니다.</span>
					<ul>
						<li>
							<div class="">
							<td>
								<span>제목<strong class="point">*</strong></span> 
								<input type="text" name="noticeTitle" value="<%=nv.getNoticeTitle()%>" required id="tit">
							</td>
							</div>
						</li>

						<li class="">
							<div class="">
							<td>
								<span>관리자 아이디<strong class="point">*</strong></span> 
								<input type="text" name="adminId" value="<%=nv.getAdminId()%>">
							</td>
							</div>
						</li>

						<li class="textarea-cont">
							<div class="">
							<td>
								<span>내용<strong class="point">*</strong></span>
								 <textarea type="text" name="noticeContent"  required id="con"><%=nv.getNoticeContent()%></textarea>
								</td>
							</div>
						</li>
						
					</ul>
					<div class="btn-group">
						<a href="/tour/notice.do" class="btn btn-line">취소</a>
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