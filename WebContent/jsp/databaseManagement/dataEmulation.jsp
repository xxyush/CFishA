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
<title>系统数据仿真模拟</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="dojoroot/dojo/dojo.js" 
  djConfig="parseOnLoad: true, isDebug:true"></script>
<script type="text/javascript" src="js/dataEmulation.js"></script>
<script type="text/javascript">
  dojo.require("dojo.parser");
  dojo.require("dijit.ProgressBar");  
</script>
<style type="text/css">
  @import "dojoroot/dijit/themes/tundra/tundra.css";
  @import "dojoroot/dojo/resources/dojo.css";
</style>
<style type="text/css">
  #emuFields{
    width: 920px;
    padding-top: 20px;
  }
  .emuField{
    width: 300px;
    float: left;
  }
  .emuField ul{
    list-style: none;
    float: left;
    margin: 0 0 0 0;
  }
  .emuField li{
    float: left;
    display: block;
    padding-top: 5px;
    margin: 0 0 0 0;
  }
  .emuField label{
    padding-right: 5px;
    width: 120px;
    text-align: center;
    float: left;
    display: block;
  }
  .emuField input{
    float: left;
    display: block;
  }
  .emuField select{
    float: left;
    display: block;
  }
  
  .inputField{
    width:900px;
    float: left;
    padding-left: 40px;
    padding-bottom: 10px;
  }
  .inputField label{
    width: 120px;
    float: left;
  }
  .inputField .text{
    width: 300px;
    float: left;
  }
  .inputField ul{
    margin: 0 0 0 0;
  }
  .inputField ul li{
    list-style-type: none;
    float: left;
    padding-top: 10px;
    width: 500px;
  }
  
  .inputField ul li .text{
    width: 150px;
    margin-right: 10px;
  }
  
  .inputField ul li input{
    float: left;
  }
  
  #buttoms input{
    text-align: center;
    float: left;
    margin-right: 10px;
  }
  #buttoms #startEmulate{
    display: block;
  }
  #buttoms #stopEmulate{
    display: block;
  }
  #buttoms #addParam{
    display: block;
  }
  #buttoms #startEmulateWithClear{
    display: block;
  }
  #msg label{
    color : red;
    width : auto;
  }
</style>


</head>
<body class="tundra">
<%@ include file="../../common/jspCommon/header.jsp" %> 

<%  
  Date d=new Date();
  java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
  String sd=formatter.format(d);
%>

<div id="content">  
  <div id="main">
    <div id="example" class="post">
      <h2 class="title"><span>==系统数据仿真模拟==</span></h2>
      <h3 class="date"><%=d %></h3>
      <div class="inputField" style="padding-top: 20px"><label>表名:</label>
<%
  Connection conn = null;
  try{
      StringBuilder sb = new StringBuilder();
      conn=CFA.databaseManagement.Database.getConnection();
      DatabaseMetaData meta = conn.getMetaData();
      String[] types = {"TABLE"};
      ResultSet rs = meta.getTables(null, null, "%", types);
      sb.append("<select id='tbName' onchange='updateAllSelect(this.value);'>");
      while(rs.next()){
          sb.append(String.format("<option value='%s'>%s</option>",
                  rs.getString(3), rs.getString(3)));
      }
      sb.append("</select>");
      out.print(sb.toString());
  }
  catch (Exception e){
      e.printStackTrace();
      out.print("<label style='color:red'>连接数据库异常<label>");
  }
  finally{
      try{
          if (conn != null){
          conn.close();
          }
      }
      catch(Exception e){
          e.printStackTrace();
      }
  }
%>      
      </div>
      <div class="inputField"><label>数据生成周期(ms):</label><input type="text" id="interval" class="text"/></div>
      <div class="inputField"><label>生成数据数量</label><input type="text" id="count" class="text"/></div>
      <div id="emuFields">
        <div class="emuField">
          <ul>
            <li><label style="color:#000; width: 290px;">仿真字段1</label></li>
            <li><label>字段名</label><select id="fieldName1" class="fieldName"></select></li>
            <li><label>取值下界</label><input id="lowerBound1" type="text" /></li>
            <li><label>取值上界</label><input id="upperBound1" type="text" /></li>
            <li>
              <label>数据分布</label>
              <select id="waveType1">
                <option value="1">完全随机</option>
                <option value="2">正弦</option>
                <option value="3">三角</option>
                <option value="4">矩形</option>
                <option value="5">阶梯形</option>
                <option value="6">均匀</option>
              </select>
            </li>
            <li><label>数据分布周期(ms):</label><input id="period1" type="text"/></li>
          </ul>
        </div>
        <div class="emuField">
          <ul>
            <li><label style="color:#000; width: 290px;">仿真字段2</label></li>
            <li><label>字段名</label><select id="fieldName2" class="fieldName"></select></li>
            <li><label>取值下界</label><input id="lowerBound2" type="text" /></li>
            <li><label>取值上界</label><input id="upperBound2" type="text" /></li>
            <li>
              <label>数据分布</label>
              <select id="waveType2">
                <option value="1">完全随机</option>
                <option value="2">正弦</option>
                <option value="3">三角</option>
                <option value="4">矩形</option>
                <option value="5">阶梯形</option>
                <option value="6">均匀</option>
              </select>
            </li>
            <li><label>数据分布周期(s):</label><input id="period2" type="text"/></li>
          </ul>
        </div>
        <div class="emuField">
          <ul>
            <li><label style="color:#000; width: 290px;">仿真字段3</label></li>
            <li><label>字段名</label><select id="fieldName3" class="fieldName"></select></li>
            <li><label>取值下界</label><input id="lowerBound3" type="text" /></li>
            <li><label>取值上界</label><input id="upperBound3" type="text" /></li>
            <li>
              <label>数据分布</label>
              <select id="waveType3">
                <option value="1">完全随机</option>
                <option value="2">正弦</option>
                <option value="3">三角</option>
                <option value="4">矩形</option>
                <option value="5">阶梯形</option>
                <option value="6">均匀</option>
              </select>
            </li>
            <li><label>数据分布周期(s):</label><input id="period3" type="text"/></li>
          </ul>
        </div>
      </div>
      <div class="inputField" style="padding-top: 20px;"><ul id="params"></ul></div>
      <div class="inputField" id="buttoms" style="padding-top: 10px;">
        <input type="button" value="添加参数" id="addParam" onclick="addParam();"/>
        <input type="button" value="首次仿真" id="startEmulateWithClear" onclick="startEmulateWithClear();"/>
        <input type="button" value="后续仿真" id="startEmulate" onclick="startEmulate();"/>
        <input type="button" value="停止仿真" id="stopEmulate" onclick="stopEmulate()" />
      </div>
      <div class="inputField" id="msg"></div>
      <div class="inputField"><div id="progressBar" dojoType="dijit.ProgressBar" style="width: 600px"
        progress="0%" annotate="true"></div></div>
    </div>
    
    <div id="example2" class="post" style="padding-top: 40px">
    </div>
  </div>
</div>
</body>
</html>
