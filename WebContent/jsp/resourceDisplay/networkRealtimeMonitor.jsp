<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络实时监控</title>
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
	  <h2 class="title"><span>网络实时监控</span></h2>
      <h3 class="date"><%=sd %></h3>
      <div style="right">
					刷新周期：&nbsp;
					<select id="interval" style="height:30px;width:80px">
					<option>0.5</option>
					<option>1.0</option>
					<option>1.5</option>
					<option>2.0</option>
					<option>2.5</option>
					<option>3.0</option>
					</select>秒&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button id="startChange" onclick="startChange()" style="width:80px;height:30px">开始</button>
					<button id="stopChange" onclick="stopChange()" style="width:80px;height:30px">停止</button>	
		</div>
		
        <center>
          <img  src="/CFA/networkRealtimeMonitorImage">
        </center>
     
    </div>
   </div>
</div>
</body>
</html>
