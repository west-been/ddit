<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String uId = request.getParameter("userId");
   String uPw = request.getParameter("userPw");
   // JDBC를 사용해서 DB정보 가져오기
   Class.forName("oracle.jdbc.driver.OracleDriver");
   String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
   Connection conn = DriverManager.getConnection(url, "team1_202208M", "java");
   Statement stmt = conn.createStatement();
   String sql = "SELECT MEM_ID FROM MEMBER WHERE MEM_ID = '" + uId + "' AND MEM_PW = '" + uPw + "'";
   
   stmt.executeQuery(sql);
   ResultSet rs = stmt.executeQuery(sql);
   
   //System.out.print(rs.next()); // boolean 값으로 값의 유무를 확인
   
   if(rs.next()){
%>
      {"rst" : "ok"}
<%
   }else{
%>
      {"rst" : "fail"}      
<%
   }
%>