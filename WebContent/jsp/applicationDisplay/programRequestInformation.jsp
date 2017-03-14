<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"  href="../login/main.css" />
<link rel="stylesheet" type="text/css"  href="applicationMain.css" />

<style type="text/css">
#divComplexity{
    margin-left: 15%;
    margin-top: 5%;

}
#complexityInfo td{
	border:0pt none;
	font : bold;
	text-align: right;

}
#complexityInfo input{
width:120px;
height:25px;

}

#complexityInfo {
	  border-collapse: separate;
	  border-color:white;
	  font-size: 18px;
	  margin :0;
	
}

</style>


<%@page import="CFA.applicationDisplay.databaseConnect" %>



<%
	String appType = request.getParameter("appType");
	String taskId = request.getParameter("requestId").trim()
			.replace(" ", "");
	databaseConnect oDatabaseConnect;
	//ProgramComplexity oProgramComplexity=new ProgramComplexity();
	oDatabaseConnect = new databaseConnect();
	oDatabaseConnect.openDatabaseConnection("CFA_DATABASE", "tongji", "tongji");
	oDatabaseConnect.executeQuery("SELECT  *  FROM TB_Task_Request_Info where  requestId='"
					+ taskId + "' ");
	
	try {

		if (oDatabaseConnect.resultSet.first()) {

			
			session.putValue("requestId",oDatabaseConnect.resultSet.getInt("requestId"));
			session.putValue("userId",oDatabaseConnect.resultSet.getInt("userId"));
			session.putValue("taskId",oDatabaseConnect.resultSet.getInt("taskId"));
			session.putValue("requestType",oDatabaseConnect.resultSet.getString("requestType"));
			session.putValue("submitDate",oDatabaseConnect.resultSet.getDate("submitDate"));
			session.putValue("submitTime",oDatabaseConnect.resultSet.getTime("submitTime"));
			session.putValue("deadlineDate",oDatabaseConnect.resultSet.getDate("deadlineDate"));
			session.putValue("deadlineTime",oDatabaseConnect.resultSet.getTime("deadlineTime"));
			session.putValue("cost",oDatabaseConnect.resultSet.getDouble("cost"));
			session.putValue("powerLimit",oDatabaseConnect.resultSet.getDouble("powerLimit"));
			session.putValue("SecrityLevel",oDatabaseConnect.resultSet.getInt("SecrityLevel"));
			session.putValue("useSpecialNeed",oDatabaseConnect.resultSet.getInt("useSpecialNeed"));
			session.putValue("serviceSpecialNeed",oDatabaseConnect.resultSet.getInt("serviceSpecialNeed"));
			session.putValue("cpuNumReq",oDatabaseConnect.resultSet.getInt("cpuNumReq"));
			session.putValue("gpuNumReq",oDatabaseConnect.resultSet.getInt("gpuNumReq"));
			session.putValue("fPgaNumReq",oDatabaseConnect.resultSet.getInt("fPgaNumReq"));
			session.putValue("memoryReq",oDatabaseConnect.resultSet.getInt("memoryReq"));
			session.putValue("commPortReq",oDatabaseConnect.resultSet.getInt("commPortReq"));
			session.putValue("commBandReq",oDatabaseConnect.resultSet.getInt("commBandReq"));
				

			

		}
		oDatabaseConnect.closeDatabaseConnection();
		//out.write(oDatabaseConnect.rs.getString("userId"));
	} catch (Exception e) {
		e.printStackTrace();
		oDatabaseConnect.closeDatabaseConnection();
	}
%>






<title>
<%
 	if (appType.equals("Cypher"))
 		out.print("口令破解");
 	else if (appType.equals("Web"))
 		out.print("Web服务");
 	else if (appType.equals("Image"))
 		out.print("图像识别");
 	else if (appType.equals("Bigfile"))
 		out.print("大文件服务");
%>应用任务用户请求信息

</title>
</head>
	
<body>

<%@ include file="../../common/jspCommon/header.jsp" %>  
<div id="main" >
  
	
	<div id="center">

	<div class="title">
		<span id ="CTitle"> 
		<%
 		 
        if (appType.equals("Cypher"))
 		out.print("口令破解");
 	else if (appType.equals("Web"))
 		out.print("Web服务");
 	else if (appType.equals("Image"))
 		out.print("图像识别");
 	else if (appType.equals("Bigfile"))
 		out.print("大文件服务");
                %>-->应用任务用户请求信息
 		</span> 
	</div>
	
		
	<div class="content" >
         
		<div id ="divComplexityUP"  class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;请求的基本信息</h1>
			<table id="complexityInfoUP">
				       <tr>
					<td style="border:0pt none">请求排队编号：</td>
					<td ><input type="text" readOnly="true"  value=<%=session.getValue("requestId")%> ></input></td>

					<td>用户编号：</td>
					<td><input type="text" readOnly="true"  value=<%=session.getValue("userId")%>></input></td>
					</tr>

					<tr>
					<td>任务编号：</td><td><input type="text" readOnly="true"  value=<%=session.getValue("taskId")%> ></input></td>

					<td>请求业务类型：</td><td><input type="text" readOnly="true"   value=<%=session.getValue("requestType")%> ></input></td>
					
					</tr>

					<tr>
					<td>请求提交的日期：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("submitDate")%> ></input></td>
					<td>请求提交的时间：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("submitTime")%> ></input></td>
					</tr>

			</table>
		
		
		</div>

		<div id ="divComplexityMID"  class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;请求的QoS信息</h1>
			<table id="complexityInfoMID">
					<tr>
					<td>任务必须完成日期：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("deadlineDate")%> ></input></td>
					<td>任务必须完成时间：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("deadlineTime")%> ></input></td>
					</tr>

					<tr>
					<td>费用要求：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("cost")%> ></input></td>
					<td>能耗要求：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("powerLimit")%> ></input></td>
					</tr>

					<tr>
					<td>安全要求等级：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("SecrityLevel")%> ></input></td>
					<td>用户特殊要求：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("useSpecialNeed")%> ></input></td>
					</tr>
					
					<tr>
					<td>服务特殊要求：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("serviceSpecialNeed")%> ></input></td>
					</tr>
			</table>
		
		
		</div>







		<div id ="divComplexityDOWN"  class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;请求的硬件资源信息</h1>
			<table id="complexityInfoDOWN">
					<tr>
					<td>CPU的个数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("cpuNumReq")%> ></input></td>
					<td>GPU的个数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("gpuNumReq")%> ></input></td>
					</tr>

					<tr>
					<td>FPGA的块数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("fPgaNumReq")%> ></input></td>
					<td>内存大小：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("memoryReq")%> ></input><label>M Bytes</label></td>
					</tr>

					<tr>
					<td>通信带宽：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("commBandReq")%> ></input><label>M Bytes</label></td>
					<td>通信端口：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("commPortReq")%> ></input></td>
					</tr>

					<tr>

					</tr>

			</table>
		
		
		</div>


		<span>
		
		</span>
	</div>

	</div>
	<div id="footer" ></div>

	</div>
       


</body>
</html>
