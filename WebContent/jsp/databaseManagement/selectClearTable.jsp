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
<title>==动态数据表清空==</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  @import "dojoroot/dijit/themes/tundra/tundra.css";
  @import "dojoroot/dojo/resources/dojo.css";
  @import "dojoroot/dojox/grid/resources/tundraGrid.css";
  @import "dojoroot/dojox/grid/enhanced/resources/tundra/EnhancedGrid.css";
  @import "dojoroot/dojox/grid/enhanced/resources/EnhancedGrid_rtl.css";
</style>

<script type="text/javascript" src="dojoroot/dojo/dojo.js" 
  djConfig="parseOnLoad: true"></script>


<script type="text/javascript">
  dojo.require("dojo.parser");  
  function strFormat(src){
    if (arguments.length == 0) return null;
    var args = Array.prototype.slice.call(arguments, 1);    
    return src.replace(/\{(\d+)\}/g, function(m, i){    
      return args[i];    
    });    
   };
</script>

<style type="text/css">
  .formContainer{
    width: 600px;
    height: 600px;
    float: left;
  }
  label{
    width: 150px;
    float: left;
  }
  .editBox{ 
    width: 700px;
  }
  .editBox ul{
    list-style : none;
    float: left;
    width: 700px;
  }
  .editBox li{
    float: left;
    padding-bottom: 10px;
    display: block;
    text-align: center;
    list-style: none;
    width: 700px;
  }
  .editBox label{
    text-align: center;
    font-size: 17px;
    font: bold;
  }
  .editBox .text{
    margin-left: 20px;
    width: 400px;
  }
  #shortCuts{
    width: 920px;
    float: left;
    padding-bottom: 10px;
  }
  .subDiv{
    width: 920px;
    float: left;
    padding-bottom: 10px;
  }
  .shortCut{
    width: 80px;
    height: 110px;
    float: left;
    padding-right: 20px;
    cursor: pointer;
  }
  .shortCut img{
    width: 80px;
    height: 80px;
    float: left;
  } 
  .shortCut label{
    width: 80px;
    height: 30px;
    text-align: center;
    float: left;
  }
  #msg{
    display: inline;
    float: none;
  }
  #gridDiv label{
    width: auto;
    display: inline;
    float: none;
  }
  #grid{
    width: 920px; 
    height: 480px;
    float: left;
  }  
</style>

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
      <h2 class="title"><span>==动态数据表清空==</span></h2>
      <h3 class="date"><%=d %></h3>  
    </div>
    
    <div id="shortCuts" class="post">
      <div class="subDiv">
        <div class="shortCut" onclick="window.location.href='usedStateTablesClear.jsp?_tbName=TB_Cpu_Used_State';">
          <img alt="cabinet" src="<%=rootPath%>/images/cpu.jpg">
          <label>CPU利用率动态信息表</label>
        </div>
        <div class="shortCut" onclick="window.location.href='usedStateTablesClear.jsp?_tbName=TB_Gpu_Used_State';">
          <img alt="component" src="<%=rootPath%>/images/gpu.jpg">
          <label>GPU利用率动态信息表</label>
        </div>
        <div class="shortCut" onclick="window.location.href='usedStateTablesClear.jsp?_tbName=TB_Fpga_Used_State';">
          <img alt="cpu" src="<%=rootPath%>/images/fpga.gif">
          <label>FPGA利用率动态信息表</label>
        </div>
        <div class="shortCut" onclick="window.location.href='usedStateTablesClear.jsp?_tbName=TB_Memory_Used_State';">
          <img alt="gpu" src="<%=rootPath%>/images/memory.jpg">
          <label>内存利用率动态信息表</label>
        </div>
        <div class="shortCut" onclick="window.location.href='usedStateTablesClear.jsp?_tbName=TB_Disk_Used_State';">
          <img alt="fpga" src="<%=rootPath%>/images/disk.jpg">
          <label>磁盘利用率动态信息表</label>
        </div>
       

    </div>
    <div id="example2" class="post" style="padding-top:100px">
      <div class="meta">
        <p>Posted by  <a href="http://see.tongji.edu.cn/default1024.asp">School of Electronics and Information</a><br />
          <a href="http://www.tongji.edu.cn">Tongji University</a> | <a href="#">No Comments</a> | <a href="#">Permalink</a></p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
