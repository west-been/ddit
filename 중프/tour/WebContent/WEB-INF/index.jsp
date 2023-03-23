<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pageFile = request.getParameter("page");
	//처음보여주는 페이지는 main
	if(pageFile == null) {
		pageFile = "./views/main/main";
	}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

</head>
<body>

	
		<jsp:include page="./includes/header.jsp" />
		<jsp:include page="<%=pageFile + \".jsp\" %>" />
		<jsp:include page="./includes/footer.jsp" />
	

</body>
</html>