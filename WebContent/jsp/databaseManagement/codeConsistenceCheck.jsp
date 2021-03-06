<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@ page import="CFA.databaseManagement.DBcode" %>
<%@ page import="CFA.databaseManagement.Database" %>
<%@ page import="CFA.databaseManagement.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统数据基本操作</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  @import "dojoroot/dijit/themes/tundra/tundra.css";
  @import "dojoroot/dojo/resources/dojo.css";
  @import "dojoroot/dojox/grid/resources/tundraGrid.css";
  @import "dojoroot/dojox/grid/enhanced/resources/tundra/EnhancedGrid.css";
  @import "dojoroot/dojox/grid/enhanced/resources/EnhancedGrid_rtl.css";
</style>

<script type="text/javascript" src="dojoroot/dojo/dojo.js" 
  djConfig="isDebug: true, parseOnLoad: true, bindEncoding:'UTF-8'"></script>


<script type="text/javascript">
  dojo.require("dojo.parser");
  dojo.require("dojo.data.ItemFileReadStore");
  dojo.require("dojox.grid.DataGrid");
  dojo.require("dojo.data.ItemFileWriteStore");
  dojo.require("dojox.grid.cells.dijit");
  dojo.require("dojox.grid.EnhancedGrid");
  dojo.require("dojox.grid.enhanced.plugins.Pagination");
  dojo.require("dijit.form.Button");
  dojo.require("dijit.form.TextBox");
  dojo.require("dijit.form.NumberTextBox");
  dojo.require("dijit.form.DateTextBox");
  dojo.require("dijit.form.TimeTextBox");
  
  function strFormat(src){
    if (arguments.length == 0) return null;
    var args = Array.prototype.slice.call(arguments, 1);    
    return src.replace(/\{(\d+)\}/g, function(m, i){    
      return args[i];    
    });    
  };
<%---
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  String tbName = request.getParameter("_tbName");
  if (tbName == null || tbName.equals("")){
      response.sendRedirect("dataBasicOperation.jsp");
      return;
  }
---%>
  dojo.ready(function(){
    initGrid("TB_System_ID_IP_Def");
  });
</script>

<script type="text/javascript" src="js/codeDisplay.js" charset="utf-8"></script>

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
<%@include file="../../common/jspCommon/header.jsp" %> 

<%
 	String rootPath = request.getContextPath();
   Date d=new Date();
   java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
   String sd=formatter.format(d);
   
   //Connection conn = null;
   //Class.forName("com.mysql.jdbc.Driver").newInstance();
  //conn = java.sql.DriverManager.getConnection("jdbc:MySQL:/192.168.1.109/CFA_DATABASE?useUnicode=true&characterEncoding=GBK", "tongji", "tongji");  
   //Connection conn = null;
 //conn=CFA.databaseManagement.Database.getConnection();
 //Statement stmt  = conn.createStatement();
   
// String sql_cpu="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,cpu.cpuId,cpu.cpuNo FROM TB_Component_Info AS comp INNER JOIN TB_Cpu_Info AS cpu ON comp.componentId = cpu.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";

 //String sql_fpga="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,fpga.fpgaId,fpga.fpgaNo FROM TB_Component_Info AS comp INNER JOIN TB_Fpga_Info AS fpga ON comp.componentId = fpga.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";
 //String sql_gpu="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,gpu.gpuId,gpu.gpuNo FROM TB_Component_Info AS comp INNER JOIN TB_Gpu_Info AS gpu ON comp.componentId = gpu.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";

 //String sql_disk="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,disk.diskId,disk.diskNo FROM TB_Component_Info AS comp INNER JOIN TB_Disk_Info AS disk ON comp.componentId = disk.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";

 //String sql_mem="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,mem.memId,mem.memNo FROM TB_Component_Info AS comp INNER JOIN TB_Memory_Info AS mem ON comp.componentId = mem.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";

 //String sql_rj="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo,ipAddress) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,rj.rj45Id,rj.rj45No,rj.ipAddr FROM TB_Component_Info AS comp INNER JOIN TB_Rj45_Info AS rj ON comp.componentId = rj.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId";

 //String sql_ethernet="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,unitId,unitNo,subunitId,ipAddress) SELECT cab.cabinetId,cab.cabinetNo,comp.componentId,comp.componentNo,rj.rj45Id,rj.rj45No,eth.networkId,eth.ipAddr FROM TB_Component_Info AS comp INNER JOIN TB_Rj45_Info AS rj ON comp.componentId = rj.componentId INNER JOIN TB_Cabinet_Info AS cab ON comp.cabinetId = cab.cabinetId TB_Rj45_Info AS rj INNER JOIN TB_Ethernet_Struc_Info AS eth ON rj.rj45Id=eth.rj45Id";
     //  String sql="INSERT INTO TB_System_ID_IP_Def(cabinetId,cabinetNo,componetId,componetNo,subunitId,subunitNo) SELECT cabinet.cabinetId,cabinet.cabinetNo,comp.componentId,comp.componentNo,cpu.cpuId,cpu.cpuNo FROM TB_Component_Info AS comp , TB_Cpu_Info AS cpu , TB_Cabinet_Info AS cabinet ";
       // String sql="DELETE  FROM TB_System_ID_IP_Def";
 //stmt.executeUpdate(sql_cpu);
  //stmt.executeUpdate(sql_fpga);
  // stmt.executeUpdate(sql_gpu);
  //stmt.executeUpdate(sql_disk);
  // stmt.executeUpdate(sql_mem);
 // stmt.executeUpdate(sql_rj);
 
 
DBcode db=new DBcode();
db.select();
 %>

<div id="content">  
  <div id="main">
    <div id="example" class="post">
      <h2 class="title"><span>系统数据基本操作-->资源编码一致性检查</span></h2>
      <h3 class="date"><%=d %></h3>  
    </div>    
    <div class="post">
      <div id="gridDiv">
        <div class="gridDivBottom">
            <div id="grid" dojoType="dojox.grid.EnhancedGrid" plugins="{pagination: false}" noDataMessage="数据库中没有数据"></div>
        <div class="gridDivBottom">
          第<input type="text" id="pageIndex" style="width: 15px" onkeydown="gotoPage(this.value)" />页，共<label id="totalPageCount"></label>页
          &nbsp;&nbsp;<label style="cursor: pointer; color: green;" onclick="firstPage();">首页</label>
          &nbsp;&nbsp;<label style="cursor: pointer; color: green;" onclick="lastPage();">上一页</label>
          &nbsp;&nbsp;<label style="cursor: pointer; color: green;" onclick="nextPage();">下一页</label>
          &nbsp;&nbsp;<label style="cursor: pointer; color: green;" onclick="endPage();">末页</label>
        </div>
      </div>
    </div>
-    <div id="msg"></div><br/>
    <div id="example2" class="post" style="padding-top:100px">
      <div class="meta">
      </div>
    </div>
  </div>
</div>
</body>
</html>





