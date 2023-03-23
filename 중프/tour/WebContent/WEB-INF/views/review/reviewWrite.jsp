<%@page import="java.util.List"%>
<%@page import="vo.TourVO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO mv = (MemberVO) session.getAttribute("memberVO");
List<TourVO> tourList = (List<TourVO>) request.getAttribute("tourList");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style>


</style>



</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content">
			<!-- <h3>리뷰쓰기</h3> -->

			<!-- 작성하기 목록 -->
			<form id="bbsForm" name="ReviewVO" action="reviewWrite.do"
				method="post" enctype="multipart/form-data" autocomplete="off">
				<div class="wrap">
					<div class="dataReqst mb0">
						<span>*은 필수입력사항입니다.</span>
						<ul>
							<li>
								<div class="">
									<span>관광지명*</span> <input type="text" name="tourNm" value=""
										list="depList" />
									<datalist id="depList">
										<c:forEach var="list" items="${requestScope.list}"
											varStatus="stts">
											<option value="${list.tourNm}"></option>
										</c:forEach>
									</datalist>
								</div> <!-- 								<div class=""> --> <!-- 									<span>별점*</span> <input type="text" name="score" value="" list="scoreList" /> -->
								<!-- 									<datalist id="scoreList"> --> <!-- 											<option value="5">5</option> -->
								<!-- 											<option value="4">4</option> --> <!-- 											<option value="3">3</option> -->
								<!-- 											<option value="2">2</option> --> <!-- 											<option value="1">1</option> -->
								<!-- 									</datalist> --> <!-- 									</div> --> <!-- 								<div class="star-ratings"> -->
								<!-- 									<div class="star-ratings-fill space-x-2 text-lg" -->
								<!-- 										:style="{ width: ratingToPercent + '%' }"> --> <!-- 										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span> -->
								<!-- 									</div> --> <!-- 									<div class="star-ratings-base space-x-2 text-lg"> -->
								<!-- 										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span> -->
								<!-- 									</div> --> <!-- 								</div> --> <!-- 							</li> -->
							<li class="pwd">
								<div class="">
									<span>제목*</span> <input type="text" name="revTitle" value="" />
								</div>
							</li>
							<li class="pwd">
								<div class="">
									<span>작성자*</span> <input type="text" name="memId"
										value="<%=mv.getMemId()%>" />
								</div>
							</li>


							<!-- 							<li class="pwd"> -->
							<!-- 								<div class=""> -->
							<!-- 									<span>내용*</span> <input type="text" name="revContent" value="" /> -->
							<!-- 								</div> -->
							<!-- 							</li> -->

						

							<li class="">
								<div>
									<span>평점*</span>
									<div id="star" class="stars">
										<!-- 부모 -->
										<a href="javascript:void(0);" value="1" class="on">★</a>
										<!-- 자식들-->
										<a href="javascript:void(0);" value="2" class="on">★</a> 
										<a href="javascript:void(0);" value="3" class="on">★</a> 
										<a href="javascript:void(0);" value="4">★</a>
										<a href="javascript:void(0);" value="5">★</a>
									
									</div>
								</div>
							</li>
							
							<li class="">
								<div>
									<span>내용*</span>
									<textarea class="" type="text"
										id="reviewContents" name="revContent" rows="9"></textarea>
								</div>
							</li>
							
									
							<li class="">
								<div>
									<span>첨부파일*</span>
									<input type="file" name="atchFile" />
								</div>
							</li>
						</ul>
					</div>
				</div>
				<input type = "hidden" name ="score" value = ""> 
				
				
				<div class="btn-wrap">
					<a href="/tour/review.do" class="btn btn-line">목록</a>
					<button type="submit" class="btn btn-blue" id = "insert_btn">작성하기</button>
				</div>
			
			</form>
			
		
			



		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>

	<script>
	
	$("#insert_btn").click(function(){
	    if(confirm("정말 등록하시겠습니까 ?") == true){
	        alert("등록되었습니다");
	    }
	    else{
	        return location.href="/tour/reviewWrite.do";
	    }
	});
	
	$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
	 var Rscore = $(this).attr("value");
	 $('input[name=score]').attr('value',Rscore); 	 

	 
// 	 $('input[name=score]').attr('value'.Rscore);
// 	 alert(Rscore);
 });

		// 	if(${'a .class'}.val() == 1){
		// 		$('#star').val(asmlkdmaskl)
		// 	}
	</script>
</body>
</html>