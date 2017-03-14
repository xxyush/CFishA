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
String sql="select cabinetId from TB_Cabinet_Info order by cabinetId";
dbo.query(sql);
String[] cid;
cid=new String[10];
int i=0;
while(i<10)
{
	if(dbo.rs.next())
	{
		cid[i]=dbo.rs.getString("cabinetId");
	}
	else
	{
		cid[i]="";
	}
	++i;
}
%>	
		<div id="example" class="post">
			<h2 class="title"><span>==系统机柜组成==&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前位置：CFA</span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				<div style="background-image:url('../../images/overviewBg.jpg');background-repeat:no-repeat;background-position:center top;width:900px;height:758px;float:left;margin-top:20px">
					<div style="margin-left:425px;margin-top:10px">
						<h1>CFA</h1>
					</div>
					<div style="position:absolute;margin-left:300px;margin-top:100px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[0]%>&cabinetNo=1"><%=cid[0]==""?"":"机柜1" %></a>
					</div>
					<div style="position:absolute;margin-left:550px;margin-top:60px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[1]%>&cabinetNo=2"><%=cid[1]==""?"":"机柜2" %></a>
					</div>
					<div style="position:absolute;margin-left:300px;margin-top:220px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[2]%>&cabinetNo=3"><%=cid[2]==""?"":"机柜3" %></a>
					</div>
					<div style="position:absolute;margin-left:550px;margin-top:170px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[3]%>&cabinetNo=4"><%=cid[3]==""?"":"机柜4" %></a>
					</div>
					
					<div style="position:absolute;margin-left:300px;margin-top:330px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[4]%>&cabinetNo=5"><%=cid[4]==""?"":"机柜5" %></a>
					</div>
					<div style="position:absolute;margin-left:550px;margin-top:280px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[5]%>&cabinetNo=6"><%=cid[5]==""?"":"机柜6" %></a>
					</div>
					<div style="position:absolute;margin-left:300px;margin-top:450px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[6]%>&cabinetNo=7"><%=cid[6]==""?"":"机柜7" %></a>
					</div>
					<div style="position:absolute;margin-left:550px;margin-top:390px">
						<a href="cabinetStaticInformation.jsp?cabinetID=<%=cid[7]%>&cabinetNo=8"><%=cid[7]==""?"":"机柜8" %></a>
					</div>
				</div>
			</div>
		</div>
		
		<div id="example2" class="post" style="margin-top:800px">
			<h2 class="title"><span>系统主要参数</span></h2>
			<div class="story">
				<table width=900px border=0 cellpadding=10 cellspacing=10>
					<tr>
						<td>机柜总数：</td>
						<td>DDR3内存总容量：</td>
					</tr>
					<tr>
						<td>处理组件总数：</td>
						<td>SATA磁盘总容量：</td>
					</tr>
					<tr>
						<td>CPU总数：</td>
						<td>RJ45接口总数：</td>
					</tr>
					<tr>
						<td>FPGA总数：</td>
						<td>GPU总数：</td>
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
