<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*" %> 
<%@ page import="CFA.databaseManagement.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
conn=CFA.databaseManagement.Database.getConnection();
Statement stmt  = conn.createStatement();;
String sql = "select * from TB_Cabinet_Info";
ResultSet rs=stmt.executeQuery(sql);
while(rs!=null&&rs.next()) {
	  System.out.println(rs.getString(1));
}
%>
</body>
</html>