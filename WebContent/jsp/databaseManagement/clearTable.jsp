<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="CFA.databaseManagement.*" %>
  <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
  try{ Connection con=null;
  con=Database.getConnection();
  String tbName = request.getParameter("_tbName");
  Statement stm=con.createStatement();
  stm.executeUpdate(String.format("delete from %s ", tbName));
  response.sendRedirect("../login/main.jsp");
 }catch(Exception e){
     e.printStackTrace();
 }
 %>

</body>
</html>
