<%@page import="vo.PhotoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
String pageFile = request.getParameter("page");
PhotoVO pv = (PhotoVO)request.getAttribute("pv");
List<PhotoVO> ptList = (List<PhotoVO>) request.getAttribute("selectAllPhoto");

// 메세지 띄우기(insert할 때 session에서 꺼냄)
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 딱 1번 띄운 후(insert, update, delete) 더 이상 메세지 띄우지 않음
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>갤러리 | 대전오슈</title>

</head>
<!-- --------------------------------------------------------------------------------------------------------- -->
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">


<!-- 상단 -->
<div class="contents">
<div class="wrap">

					<!-- 검색  -->
					<div class="search_wrap">
						<div class="bo_sch_wrap">
							<fieldset class="bo_sch">

								<form name="fsearch" method="get" id="searchForm"
									action="/tour/photo.do">
									<div class="input-group">
										<div class="select-group">
											<input type="hidden" name="bo_table" value="notice"> <input
												type="hidden" name="sca" value=""> <input
												type="hidden" name="sop" value="and">
											<!--  <label for="sfl" class="sound_only"></label> -->



											<div class="select-inner">
												<select name="sfl" id="sfl">
													<option value="wr_subject">제목</option>
												</select> <i class="arr"></i>	
											</div>


											<div class="input-wrap">
												<input type="text" name="stx" value="" required="" id="stx"
													class="sch_input" size="25" maxlength="20"
													placeholder=" 검색어를 입력해주세요">
												<button type="submit" class="sch_btn btn">
													<i class="fa fa-search" aria-hidden="true">검색</i>
												</button>
											</div>

										</div>
										<a href="/tour/photo.do" class="btn btn-total"> 전체보기 </a>
									</div>
								</form>
							</fieldset>
						</div>
					</div>
					<!-- // 검색  -->
					<div class="BlistWrap">
		
	


		<ul class="GlistT2 Plist grid">
			
			
			
			<c:forEach var="list" items="${requestScope.selectAllPhoto}" varStatus="vs">
				<li class="grid-item grid-size">
				<!-- onclick="document.getElementById('exampleModal${vs.index}')" -->
					<a href="javascript:void(0)" id="view" data-toggle="modal" data-target="#exampleModal${vs.index}" onclick="upView('${list.photoCode}')">
						<div class="thumWrap">
							<div class="rounding">
								<img src="${list.atchFile}">
							</div>
						</div>
						<div class="ptxtWrap">
							<span>${list.photoTitle}</span>
							<ul>
								<li class="pdate">date. <span>${list.photoDate}</span></li>
								<li class="pview">views. <span id="spn${list.photoCode}">${list.photoHits}</span></li>
							</ul>
						</div>
					</a>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">${list.photoTitle}</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					       	<img src="${list.atchFile}">
					      </div>
					      <!-- <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					       
					      </div> -->
					    </div>
					  </div>
					</div>
				</li>
			</c:forEach>
			


		</ul>

</div> 
</div> 
</div> 

	<!--  페이징  -->
<%-- 	<div class="pagelist">
		<c:set var="currentPage" value="${requestScope.cPage}" />
		현재페이지:
		<c:out value="${currentPage}" />
 
   		페이지영역
		<div id="pagelist">
			<ul class="pager">
				<li><a class="prev" href="#">Prev</a></li>
			</ul>

			<ul class="pagination pae">
				<c:forEach var="i" begin="${requestScope.sPage}"
					end="${requestScope.ePage}">
					<c:if test="${currentPage == i}">
						<li class="active"><a class="paging" href="#">${i}</a></li>
					</c:if>

					<c:if test="${currentPage != i}">
						<li><a class="paging" href="#">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			
			<ul class="pager">
				<li><a class="next" href="#">Next</a></li>
			</ul>
		</div>
	</div> --%>

		<!--  페이징  -->
					<div id="pagelist" class="pagelist">
						<c:set var="currentPage" value="${requestScope.cPage}" />
						
						<span class="current">현재페이지:<c:out value="${currentPage}" /></span>
			  
			    		<%-- 페이지영역 --%>
						<div id="pagelist">
							<ul class="pager">
								<li><a class="prev" href="#">Prev</a></li>
							</ul>
		
							<ul class="pagination pager">
								<c:forEach var="i" begin="${requestScope.sPage}"
									end="${requestScope.ePage}">
									<c:if test="${currentPage == i}">
										<li class="active"><a class="paging" href="#">${i}</a></li>
									</c:if>
		
									<c:if test="${currentPage != i}">
										<li><a class="paging" href="#">${i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							
							<ul class="pager">
								<li><a class="next" href="#">Next</a></li>
							</ul>
						</div>
					</div>
			</div>
		</div>
		<!-- //paginate -->

<script type="text/javascript">
function upView(geta){
// 	alert("geta : " + geta);
	
// 	alert(document.getElementById("spn"+geta).innerText);
	document.getElementById("spn"+geta).innerHTML = Number(document.getElementById("spn"+geta).innerText) + 1;
	
	//<form></form>
	let formData = new FormData();
	//<form><input type="text" name="photoCode" value="P101" /></form>
	formData.append("photoCode", geta);
	
	//아작났어유..피씨다타써
	$.ajax({
		url:"/tour/photoHits.do?photoCode="+geta,
		processData: false,
        contentType: false,
		data:formData,
		type:'POST',
		success:function(result){
			console.log("result : "  + result);
		}
	});
	
}
</script>

<script>

	//페이지 번호 클릭이벤트
	$(".paging").on('click',function(){
		// alert($(this).text());
		location.href="/tour/photo.do?pageNo=" + $(this).text();
	});
	
	let currentPage;
	// 이전버튼 클릭이벤트
	$(".prev").on('click', function(){
		if(${currentPage} == 1){
			currentPage = ${currentPage};
		} else{
			currentPage = ${currentPage} - 1;
		} location.href="/tour/photo.do?pageNo=" + currentPage;
	}); 
	
	// 다음버튼 클릭이벤트
	$(".next").on('click', function(){
		if(${currentPage} == ${requestScope.ttPage}){
			currentPage = ${currentPage};
		} else{
			currentPage = ${currentPage} + 1;
		} location.href="/tour/photo.do?pageNo=" + currentPage;
	}); 
	
	
/* 	function photoCount() {
		var documentId = ${photoCode};
		
	} */
	
	
	
 	// 조회수 +1(새 창을 띄울 때 +1, 닫을 때 refresh)
	//1. ajax로 list.photoHits값을 update하러 가기 (기존의 서블릿이 존재하면 그거 사용, 없으면 새로 만들기..) 
		//1-1. >> DB에도 처리가 되어있는 상태
		
	//2. 업데이트 결과를 현재 success위치로 가져와서 해당 위치로 표시해주기
		//2-1 => 결과 가져올때 datType = text ./ servlet에서 값 넘겨줄 때 printWrite (수업중 예제 참고)
		//2-2 => 결과를 화면에 찍어줄때 선택자 잡아서 .. 
/* 	$('#view').on('click',function(){
		$.ajax({ dataType : "text",
				 error :function(error){
				 alert("error!" + error);
				}
				,success:function(result){
					
					
// 				alert("success!");
// 				alert(result);
// 				alert(result.length);
				

				}

				});
	}); */
	
	
</script>
<!-- --------------------------------------------------------------------------------------------------------- -->
		<jsp:include page="../../includes/footer.jsp" />
	</div> <!-- id="content" -->
	</div> <!-- id="sub" -->
<!-- --------------------------------------------------------------------------------------------------------- -->
</body>
</html>