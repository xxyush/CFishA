<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 
<%@ page import="CFA.resourceDisplay.databaseOperation" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源静态属性</title>

<link href="./default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function expand(divID,tagID)
{
	var thisDiv=document.getElementById(divID);
	var tag=document.getElementById(tagID);
	
	if(thisDiv.style.display=="none")
	{
		thisDiv.style.display="block";
		tag.innerHTML="-";
	}
	else
	{
		thisDiv.style.display="none";
		tag.innerHTML="+";
	}
}
</script>

</head>
<body>
<%@ include file="../../common/jspCommon/header.jsp" %>

<%
Date d=new Date();
java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
String sd=formatter.format(d);

databaseOperation dbo=new databaseOperation();
if(!dbo.connectDatabase())
{
	out.print("Fail to connect.");
}
%>

<div id="content">

	<!--
	<div id="sidebar">
		<div id="login" class="boxed">
			<div class="title">
				<h2>详细描述</h2>
			</div>
			<div class="content">
				<p>
				通用CPU组件<br/><br/>
				通用CPU计算节点内所有计算模块及互连网络，其通过安装在操作系统中的监控和管理
				服务程序来实现对节点内所有计算模块的配置加载管理、运行控制、状态检测、电源管理等功能。
				<br/><br/>
				其主要性能指标如下：<br/>
				标准ATCA刀片设计规范<br/>
				双路4-6核高性能X86处理器<br/>
				8G DDR3内存<br/>
				2路1Gbps以太网接口（通过背板）<br/>
				2路1Gbps以太网接口（前面板）<br/>
				1路PCIE root（通过背板）<br/>
				显示、LPC 、USB 等调试资源接口<br/>
				支持电源控制<br/>
				最大功耗200W<br/>
				</p>
			</div>
		</div>
	</div>
	-->
	
	<div id="main" style="width:900px">
	
		 <!--   
		<div id="welcome" class="post" >
			<h2 class="title"><span>系统详细信息</span></h2>
			<h3 class="date"><span class="month">Mar.</span> <span class="day">8</span><span class="year">, 2007</span></h3>
			<div class="story">
				<div jsId="grid" id="grid" dojoType="dojox.grid.DataGrid" store="test_store" query="{ id: '*' }" structure="layout" rowSelector="20px"></div>
			</div>
			<div class="meta">
				<p>Posted by Jane Anderson under <a href="#">Uncategorized</a>, <a href="#">Daily Journal</a><br />
					<a href="#">Trackback URI</a> | <a href="#">No Comments</a> | <a href="#">Permalink</a></p>
			</div>
		</div>
		-->
		
		<div id="example" class="post">
		
			<div id="mainTitle">
				<h2 class="title"><span>==组件静态属性==&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前位置：CFA--><%="机柜"+request.getParameter("cabinetNo") %>--><%="组件"+request.getParameter("componentNo") %></span></h2>
				<h3 class="date"><%=sd %></h3>
			</div>
			<div id="mainContent" class="story">
				<h2>所属机柜编号：<%="机柜"+request.getParameter("cabinetNo") %></h2>
				<h2>组件编号：<%="组件"+request.getParameter("componentNo") %></h2>
				<h2>组件名称（描述）：</h2>
				<h2>组件类型：</h2>
				<h2>CPU数量：</h2>
				<h2>FPGA数量：</h2>
				<h2>GPU数量：</h2>
				<h2>SATA磁盘容量：</h2>
				<h2>DDR3内存容量：</h2>
			</div>
			
			<div id="cpuTitle" onclick="expand(&quot;cpuContent&quot;,&quot;cpuTag&quot;)">
				<h2 class="title"><span>CPU主要参数</span></h2>
				<h2 id="cpuTag" class="date" style="font-size:150%">+</h2>
			</div>
			<div id="cpuContent" style="display:none">
				<br />
				<%
				if(!dbo.query("select * from TB_Cpu_Info where componentId=72"))
				{
					out.print("Fail to query.");
				}
				%>
				<table width=800px>
					<tr>
						<td>编号</td><td>型号</td><td>主频（GHz）</td><td>L1 Cache(KB)</td><td>L2 Cache(KB)</td><td>L3 Cache(KB)</td><td>指令集</td>
					</tr>
					
					<%
					while(dbo.rs.next())
					{
						out.print("<tr height=60px>");
						out.print("<td>");
						out.print(dbo.rs.getString("cpuId"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("cpuType"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("cpuSpeed"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("l1Size"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("l2Size"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("l3Size"));
						out.print("</td>");
						out.print("<td>");
						out.print(dbo.rs.getString("instrucList"));
						out.print("</td>");
						out.print("</tr>");
					}
					%>
				</table>
			</div>
			
			<div id="fpgaTitle" onclick="expand(&quot;fpgaContent&quot;,&quot;fpgaTag&quot;)">
				<h2 class="title"><span>FPGA主要参数</span></h2>
				<h2 id="fpgaTag" class="date" style="font-size:150%">+</h2>
			</div>
			<div id="fpgaContent" style="display:none">
				<br />
				<table width=800px>
					<tr>
						<td>编号</td><td>型号</td><td>主频（GHz）</td><td>L1 Cache(KB)</td><td>L2 Cache(KB)</td><td>L3 Cache(KB)</td><td>指令集</td>
					</tr>
					<tr height=100px>
					</tr>
				</table>
			</div>
			
			<div id="gpuTitle" onclick="expand(&quot;gpuContent&quot;,&quot;gpuTag&quot;)">
				<h2 class="title"><span>GPU主要参数</span></h2>
				<h2 id="gpuTag" class="date" style="font-size:150%">+</h2>
			</div>
			<div id="gpuContent" style="display:none">
				<br />
				<table width=800px>
					<tr>
						<td>编号</td><td>型号</td><td>主频（GHz）</td><td>L1 Cache(KB)</td><td>L2 Cache(KB)</td><td>L3 Cache(KB)</td><td>指令集</td>
					</tr>
					<tr height=100px>
					</tr>
				</table>
			</div>
			
			<div id="memoryTitle" onclick="expand(&quot;memoryContent&quot;,&quot;memoryTag&quot;)">
				<h2 class="title"><span>DDR3内存主要参数</span></h2>
				<h2 id="memoryTag" class="date" style="font-size:150%">+</h2>
			</div>
			<div id="memoryContent" style="display:none">
				<br />
				<table width=800px>
					<tr>
						<td>编号</td><td>型号</td><td>主频（GHz）</td><td>L1 Cache(KB)</td><td>L2 Cache(KB)</td><td>L3 Cache(KB)</td><td>指令集</td>
					</tr>
					<tr height=100px>
					</tr>
				</table>
			</div>
			
			<div id="diskTitle" onclick="expand(&quot;diskContent&quot;,&quot;diskTag&quot;)">
				<h2 class="title"><span>SATA磁盘主要参数</span></h2>
				<h2 id="diskTag" class="date" style="font-size:150%">+</h2>
			</div>
			<div id="diskContent" style="display:none">
				<br />
				<table width=800px>
					<tr>
						<td>编号</td><td>型号</td><td>主频（GHz）</td><td>L1 Cache(KB)</td><td>L2 Cache(KB)</td><td>L3 Cache(KB)</td><td>指令集</td>
					</tr>
					<tr height=100px>
					</tr>
				</table>
			</div>
			<!--
			<div class="meta">
				<p>Posted by  <a href="http://see.tongji.edu.cn/default1024.asp">School of Electronics and Information</a><br />
					<a href="http://www.tongji.edu.cn">Tongji University</a> | <a href="#">No Comments</a> | <a href="#">Permalink</a></p>
			</div>
			-->
		</div>
			
	</div>
	
</div>

<%
dbo.disconnectDatabase();
%>
</body>
</html>
