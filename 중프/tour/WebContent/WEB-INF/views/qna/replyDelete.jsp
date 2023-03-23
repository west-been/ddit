<%@page import="vo.AdminVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    List<QnaVO> qnaList = (List<QnaVO>) request.getAttribute("qnaList");
    QnaVO qv = (QnaVO) request.getAttribute("qv");
	AdminVO id =(AdminVO) session.getAttribute("adminVO");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>답변 삭제 확인</title>


<style>

/* section {display: block;margin: 0; padding: 0; border: 0; vertical-align: baseline; background: transparent;}
* { padding: 0; margin: 0; word-break: keep-all !important; }
body { color: #555; font-size: 1.4rem;
line-height: 1; word-break: break-all;
word-wrap: break-word; -webkit-text-size-adjust: none; height: 100%; width: 100%; margin: 0; padding: 0; left: 0; top: 0; color: #666666; font-family: "Noto Sans KR", sans-serif; line-height: 1.2; font-weight: 400; }
*, *::before, *::after {box-sizing: border-box;}
.reply_con {margin: 0 20px 20px; padding: 20px; font-size: 1rem; line-height: 2.4rem; background-color: #e5e5e5;}

/*취소 버튼  */
/* .btn_wrap { position: relative; margin-bottom: 50px;}
.btn_s {width: 100px;}
.btn.btn_01 { min-width: 130px; font-weight: 400; background-color: red; font-size: 1rem; font-weight: 400; font-size: 15px; padding: 7px 33px; border-radius: 600px;}
.postBttm > div a { line-height: 3rem; text-align: center; color: white; font-size: 1.125rem; padding: 0 1.5rem; border: 1px solid #0000; border-radius: 25px; transition: .3s all; background-color: #9fb5ee;}
 */
.dataReqst h2 {    text-align: center;
    margin-bottom: 55px;
    color: #000;}
</style>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script>
function delSubmit(){
	if(tit == "" && con == ""){
	 alert("삭제할 답변이 없습니다.")
	} else{
	alert("삭제되었습니다.");	
	}
}

</script>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
		
		
		


	<form action="replyDelete.do" method="post" onsubmit="delSubmit();">
				<input type="hidden" name="qnaCode" value="<%=qv.getQnaCode()%>">
				<div class="dataReqst">
				
				
				
						<h2> 삭제하시겠습니까? </h2>
						
				
				
					<ul>
						<li>
							<div class="">
							<td>
								<span>제목*</span> <input type="text" name="replyTitle"
									placeholder="${requestScope.qv.replyTitle}" id="tit">
								</td>
							</div>
						</li>
						
<%-- 
						<li class="pwd">
							<div class="">
							<td>
								<span>관리자 아이디*</span> <input type="hidden" name="memId"
									placeholder="<%=qv.getMemId()%>">
								</td>
							</div>
						</li>
 --%>
 
						<li class="pwd">
							<div class="">
							<td>
								<span>내용*</span> <input type="text" name="replyContent"
									placeholder="${requestScope.qv.replyContent}" id="con">
								</td>
							</div>
						</li>
						</ul>
						
						
						<div class="contac">
							<button id="btn_wrap txt_r" class="btn btn-blue"> 예</button>
							<a href="/tour/qna.do" class="btn btn-line">아니오</a>
						</div>
					
						
					
						<div>
				
 	
   
		</form>
			
<%-- <script>
	  //글 삭제
                $("#delete").click(function(){
                	 location.  href="/tour/replyDelete.do?qnaCode=<%= qv.getQnaCode() %>
          
                    }      		
        </script> 
 		 --%>
 		
 		

		
		
		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>


</body>
</html>