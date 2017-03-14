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
<title>动态数据日志转存</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  @import "dojoroot/dijit/themes/tundra/tundra.css";
  @import "dojoroot/dojo/resources/dojo.css";
</style>

<script type="text/javascript" src="dojoroot/dojo/dojo.js" 
  djConfig="parseOnLoad: true, bindEncoding:'UTF-8'"></script>
<script type="text/javascript" src="js/dumpTb.js" charset="utf-8"></script>

<script type="text/javascript">
  dojo.require("dojo.parser");
  dojo.require("dijit.form.DateTextBox");
  dojo.require("dijit.form.TimeTextBox");
  
  function strFormat(src){
    if (arguments.length == 0) return null;
    var args = Array.prototype.slice.call(arguments, 1);    
    return src.replace(/\{(\d+)\}/g, function(m, i){    
      return args[i];    
    });    
  };    
</script>

</head>
<body class="tundra">
<%@ include file="../../common/jspCommon/header.jsp" %> 

<%
  String rootPath = request.getContextPath();
  Date d=new Date();
  java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
  String sd=formatter.format(d);
%>

<div id="content">  
  <div id="main">
    <div id="example" class="post">
      <h2 class="title"><span>==动态数据日志转存==</span></h2>
      <h3 class="date"><%=d %></h3>  
    </div>
    <div class="post">
      <label>选择要转存的动态信息表</label>&nbsp;&nbsp;&nbsp;
      <select id="tbName">
        <option value="TB_Component_Run_State">组件运行状态信息表</option>
        <option value="TB_Cpu_Used_State">CPU利用率动态信息表</option>
        <option value="TB_Gpu_Used_State">GPU利用率动态信息表</option>
        <option value="TB_Fpga_Used_State">FPGA利用率动态信息表</option>
        <option value="TB_Memory_Used_State">内存利用率动态信息表</option>
        <option value="TB_Disk_Used_State">磁盘利用率动态信息表</option>
        <option value="TB_Disk_Health_State">磁盘健康状况动态信息表（S.M.A.R.T信息）</option>
        <option value="TB_Rj45_Comm_State">以太网络通信动态信息表</option>
        <option value="TB_Rj45_Route_State">以太网路由表状态表</option>
        <option value="TB_IB_Comm_State">Infinband网络通信动态信息表</option>         
      </select><br/><br/>
      <label>起始日期</label>&nbsp;&nbsp;&nbsp;
      <input type="text" id="startDate" value="2012-9-1"
        data-dojo-type="dijit.form.DateTextBox"
        required="true" /><br/><br/>
      <label>起始时间</label>&nbsp;&nbsp;&nbsp;
      <input type="text" id="startTime" value="00:00:00"
        data-dojo-type="dijit.form.TimeTextBox"
        required="true" /><br/><br/>
      <label>结束日期</label>&nbsp;&nbsp;&nbsp;
      <input type="text" id="endDate" value="2012-9-1"
        data-dojo-type="dijit.form.DateTextBox"
        required="true" /><br/><br/>
      <label>结束时间</label>&nbsp;&nbsp;&nbsp;
      <input type="text" id="endTime" value="00:00:00"
        data-dojo-type="dijit.form.TimeTextBox"
        required="true" /><br/><br/>
      <input type="button" value="确认转存" onclick="dumpTB();" />
    </div>    
    <div id="example2" class="post" style="padding-top:100px">
      <div class="meta">
      </div>
    </div>
  </div>
</div>
</body>
</html>





