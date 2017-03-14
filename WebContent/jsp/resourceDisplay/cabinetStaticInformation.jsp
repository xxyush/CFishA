<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="CFA.resourceDisplay.databaseOperation" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源静态属性</title>

<link href="./default.css" rel="stylesheet" type="text/css" />

</head>
<body>
<%@ include file="../../common/jspCommon/header.jsp" %>

<%
Date d=new Date();
java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
String sd=formatter.format(d);

databaseOperation dbo=new databaseOperation();
dbo.connectDatabase();
String sql="select componentId from TB_Component_Info where cabinetId="+request.getParameter("cabinetID")+" order by componentId";
dbo.query(sql);
String[] cid;
cid=new String[10];
int i=0;
while(i<10)
{
	if(dbo.rs.next())
	{
		cid[i]=dbo.rs.getString("componentId");
	}
	else
	{
		cid[i]="";
	}
	++i;
}
%>

<div id="content">

	<!--
	<div id="sidebar">
		<div id="login" class="boxed">
			<div class="title">
				<h2>机柜总体参数</h2>
			</div>
			<div class="content">
				<h2>机柜编号：</h2>
				<h2>机柜名称（描述）：</h2>
				<h2>放置地点：</h2>
				<h2>处理组件数量：</h2>
				<br />
				<h2>CPU数量：</h2>
				<h2>FPGA数量</h2>
				<h2>GPU数量</h2>
				<h2>DDR3内存总容量：</h2>
				<h2>SATA磁盘总容量：</h2>
				<h2>RJ45接口数量：</h2>
			</div>
		</div>
	</div>
	-->
	
	<div id="main">
	
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
			<h2 class="title"><span>==机柜组件组成==&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前位置：CFA--><%="机柜"+request.getParameter("cabinetNo") %></span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				<div style="background-image:url('../../images/overviewBg.jpg');background-repeat:no-repeat;background-position:center top;width:900px;height:758px;float:left;margin-top:20px">
					<div style="margin-left:425px;margin-top:15px">
						<h3><%="机柜"+request.getParameter("cabinetNo") %></h3>
					</div>
					<div style="position:absolute;margin-left:290px;margin-top:110px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[0] %>&componentNo=1"><%=cid[0]==""?"":"组件1" %></a>
					</div>
					<div style="position:absolute;margin-left:535px;margin-top:70px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[1] %>&componentNo=2"><%=cid[1]==""?"":"组件2" %></a>
					</div>
					<div style="position:absolute;margin-left:290px;margin-top:230px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[2] %>&componentNo=3"><%=cid[2]==""?"":"组件3" %></a>
					</div>
					<div style="position:absolute;margin-left:535px;margin-top:180px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[3] %>&componentNo=4"><%=cid[3]==""?"":"组件4" %></a>
					</div>
					
					<div style="position:absolute;margin-left:290px;margin-top:340px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[4] %>&componentNo=5"><%=cid[4]==""?"":"组件5" %></a>
					</div>
					<div style="position:absolute;margin-left:535px;margin-top:290px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[5] %>&componentNo=6"><%=cid[5]==""?"":"组件6" %></a>
					</div>
					<div style="position:absolute;margin-left:290px;margin-top:460px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[6] %>&componentNo=7"><%=cid[6]==""?"":"组件7" %></a>
					</div>
					<div style="position:absolute;margin-left:535px;margin-top:400px">
						<a href="componentStaticInformation.jsp?cabinetID=<%=request.getParameter("cabinetID") %>&cabinetNo=<%=request.getParameter("cabinetNo") %>&componentID=<%=cid[7] %>&componentNo=8"><%=cid[7]==""?"":"组件8" %></a>
					</div>
				</div>
			</div>
		</div>
		
		<div id="example2" class="post" style="margin-top:800px">
			<h2 class="title"><span>机柜主要参数</span></h2>
			<div class="story">
				<table width=900px border=0 cellpadding=10 cellspacing=10>
					<tr>
						<td>机柜编号：<%=request.getParameter("cabinetID") %></td>
						<td>CPU数量：</td>
					</tr>
					<tr>
						<td>机柜名称（描述）：</td>
						<td>FPGA数量：</td>
					</tr>
					<tr>
						<td>机柜放置地点：</td>
						<td>GPU数量：</td>
					</tr>
					<tr>
						<td>处理组件数量：</td>
						<td>DDR3内存容量：</td>
					</tr>
					<tr>
						<td>SATA磁盘容量：</td>
						<td>RJ45接口数量：</td>
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

</body>
</html>
