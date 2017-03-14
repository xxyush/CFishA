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
<title>系统数据库移植</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  @import "dojoroot/dijit/themes/tundra/tundra.css";
  @import "dojoroot/dojo/resources/dojo.css";
  @import "dojoroot/dojox/grid/resources/tundraGrid.css";
</style>

<script type="text/javascript" src="dojoroot/dojo/dojo.js" 
  djConfig="parseOnLoad: true, bindEncoding:'UTF-8'"></script>
<script type="text/javascript" src="js/dbTransplant.js" charset="utf-8"></script>

<script type="text/javascript">
  dojo.require("dojo.parser");
  
  function strFormat(src){
    if (arguments.length == 0) return null;
    var args = Array.prototype.slice.call(arguments, 1);    
    return src.replace(/\{(\d+)\}/g, function(m, i){    
      return args[i];    
    });    
  };  
  dojo.ready(function(){
	  getBackups();
	  var today = new Date();
	  dojo.byId("exportFileName").value = "CFA_" + today.getFullYear() + "_" + today.getMonth() + "_" + today.getDate() + "_" + today.getHours() + "_" + today.getMinutes() + "_" + today.getSeconds();
  });
  
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
      <h2 class="title"><span>==导出数据库==</span></h2>
      <h3 class="date"><%=d %></h3>  
    </div>
    <div id="export" class="post">
      <label>请输入当前数据库导出后的文件名</label>&nbsp;&nbsp;
      <input type="text" id="exportFileName" style="width: 400px" />&nbsp;&nbsp;
      <input type="button" id="exportBegin" value="确认导出"  onclick="dbExport();"  />
      <label id = "msg"></label>
    </div>
    <div id="example1" class="post">
      <h2 class="title"><span>==导入数据库==</span></h2>  
    </div>
    <div id="import" class="post">
      <label>请选择要导入的数据库文件</label>&nbsp;&nbsp;
      <select id="backups"></select>&nbsp;&nbsp;
      <input type="button" id="importBegin" value="确认导入" onclick="dbImport();" />
    </div>
    <div id="example2" class="post" style="padding-top:100px">
      <div class="meta">
      </div>
    </div>
  </div>
</div>
</body>
</html>





