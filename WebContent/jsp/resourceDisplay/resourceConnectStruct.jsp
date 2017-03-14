<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源互联结构</title>
<link href="./default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@ include file="../../common/jspCommon/header.jsp" %>

<%
Date d=new Date();
java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
String sd=formatter.format(d);
%>
<div id="content">
  <div id="main">
    <div id="example" class="post">
	  <h2 class="title"><span>资源互联结构</span></h2>
      <h3 class="date"><%=sd %></h3>
      
        <center>
          <img  src="/CFA/resourceConnectStuctImage">
        </center>
     
    </div>
   </div>
</div>
</body>
</html>
