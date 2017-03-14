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
    margin-top: 3%;

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
	String taskId = request.getParameter("taskId");
			
	databaseConnect oDatabaseConnect;

	oDatabaseConnect = new databaseConnect();
	oDatabaseConnect.openDatabaseConnection("CFA_DATABASE", "tongji", "tongji");
	oDatabaseConnect.executeQuery("SELECT  * FROM TB_Application_Task_Info where  taskId='"
					+ taskId + "' ");
	//oDatabaseConnect.ExecQuery("SELECT taskId,taskName,taskType,algorithmName,workload,compVolume,netStruc FROM TB_Application_Task_Info where taskType='" +request.getParameter("programType") +"'");

	try {

		if (oDatabaseConnect.resultSet.first()) {

			session.putValue("taskId",oDatabaseConnect.resultSet.getInt("taskId"));
			session.putValue("taskName",oDatabaseConnect.resultSet.getString("taskName"));
			session.putValue("executiveDir",oDatabaseConnect.resultSet.getString("executiveDir"));
			session.putValue("executiveName",oDatabaseConnect.resultSet.getString("executiveName"));
			session.putValue("taskType",oDatabaseConnect.resultSet.getString("taskType"));
			session.putValue("taskAttribute",oDatabaseConnect.resultSet.getString("taskAttribute"));
			session.putValue("alogrithmName",oDatabaseConnect.resultSet.getString("alogrithmName"));
			session.putValue("timeComplexity",oDatabaseConnect.resultSet.getString("timeComplexity"));
			session.putValue("spaceComplexity",oDatabaseConnect.resultSet.getString("spaceComplexity"));
			session.putValue("codeLines",oDatabaseConnect.resultSet.getInt("codeLines"));
			session.putValue("statementNumber",oDatabaseConnect.resultSet.getInt("statementNumber"));
			session.putValue("branchNumber",oDatabaseConnect.resultSet.getInt("branchNumber"));
			session.putValue("loopNumber",oDatabaseConnect.resultSet.getInt("loopNumber"));
			session.putValue("functionNumber",oDatabaseConnect.resultSet.getInt("functionNumber"));
			session.putValue("opcodeNumber",oDatabaseConnect.resultSet.getInt("opcodeNumber"));
			session.putValue("operandNumber",oDatabaseConnect.resultSet.getInt("operandNumber"));
			session.putValue("programArch",oDatabaseConnect.resultSet.getString("programArch"));
			session.putValue("programFlowGraph",oDatabaseConnect.resultSet.getString("programFlowGraph"));
			session.putValue("subtaskDAG",oDatabaseConnect.resultSet.getString("subtaskDAG"));
			session.putValue("inputParaNum",oDatabaseConnect.resultSet.getInt("inputParaNum"));
			session.putValue("inputDataSize",oDatabaseConnect.resultSet.getInt("inputDataSize"));
			session.putValue("outputParaNum",oDatabaseConnect.resultSet.getInt("outputParaNum"));
			session.putValue("outputDataSize",oDatabaseConnect.resultSet.getInt("outputDataSize"));
			session.putValue("workload",oDatabaseConnect.resultSet.getInt("workload"));
			session.putValue("compVolume",oDatabaseConnect.resultSet.getInt("compVolume"));
			session.putValue("commVolume",oDatabaseConnect.resultSet.getInt("commVolume"));
			session.putValue("dataTrans",oDatabaseConnect.resultSet.getInt("dataTrans"));
			session.putValue("estimateFinishTime",oDatabaseConnect.resultSet.getInt("estimateFinishTime"));
			session.putValue("estimateEnergy",oDatabaseConnect.resultSet.getDouble("estimateEnergy"));

		}
		oDatabaseConnect.closeDatabaseConnection();

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
%>应用任务程序复杂度展示

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
                %>-->应用任务程序复杂度展示
 		</span> 
	</div>
	
		
	<div class="content" >
         
		<div id ="divComplexityLeftUp" class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;应用任务基本信息   </h1>
			<table id="complexityInfoLeftUp">
				<tr>
					<td style="border:0pt none">任务编号：</td>
					<td ><input type="text"  readOnly="true"   value= <%=session.getValue("taskId")%> ></input></td>

					<td style="border:0pt none">任务名称：</td>
					<td ><input type="text"  readOnly="true"   value= <%=session.getValue("taskName")%> ></input></td>

				</tr>

					<tr>
					<td>程序所在目录：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("executiveDir")%>></input></td>
					<td>执行程序名：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("executiveName")%>></input></td>
					</tr>

					<tr>
					<td>业务类型：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("taskType")%> ></input></td>
					<td>业务计算特性：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("taskAttribute")%>></input></td>
					</tr>


					
			</table>
		</div>

		<div id ="divComplexityRightUp" class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;程序算法复杂性 </h1>
			<table id="complexityInfoRightUp">
					<tr>
					<td>算法名称：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("alogrithmName")%>></input></td>
                                        <td> 代码行数： </td><td><input type="text"  readOnly="true"   value=<%=session.getValue("codeLines")%>></ input> </td>
                 			</tr>

					<tr>
					<td>空间复杂度：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("spaceComplexity")%> ></input></td>
                                        <td>时间复杂度：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("timeComplexity")%> ></input></td>
					</tr>

					<tr>
					<td>语句数目：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("statementNumber")%> ></input></td>
					<td>分支总数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("branchNumber")%>></input></td>
					</tr>

					<tr>
					<td>循环总数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("loopNumber")%> ></input></td>
					<td>函数数目：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("functionNumber")%>></input></td>
					</tr>

					<tr>
					<td>操作码总数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("opcodeNumber")%> ></input></td>
					<td>操作数总数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("operandNumber")%>></input></td>
					</tr>

					<tr>
					<td>程序结构图：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("programArch")%> ></input></td>
					<td>程序流程图：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("programFlowGraph")%>></input></td>
					</tr>
					<tr>
					<td>子任务DAG图：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("subtaskDAG")%> ></input></td>
					</tr>
			</table>
		</div>

		<div id ="divComplexityLeftDown"  class="complexityDIV">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp; 程序I/O量</h1>
			<table id="complexityInfoLeftDown">
				<tr>	
					<td>输入参数个数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("inputParaNum")%>></input></td>
					<td>输入数据总量：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("inputDataSize")%> ></input><label>KB</label></td>
					</tr>
					
					<tr>
					<td>输出参数个数：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("outputParaNum")%>></input></td>
					<td>输出数据总量：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("outputDataSize")%> ></input></input><label>KB</label></td>
					</tr>

					<tr>
					<td>总负载量：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("workload")%>></input></td>
					<td>计算量：</td><td><input type="text"  readOnly="true"   value=<%=session.getValue("compVolume")%> ></input></td>
					</tr>

					<tr>
					<td>存储数据传输量：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("dataTrans")%> ></input><label>KB</label></td>
					<td>网络通信量：</td><td><input type="text" class="hasUnit" readOnly="true"   value=<%=session.getValue("commVolume")%>></input><label>KB</label></td>
					</tr>

			</table>
			</table>
		</div>


		<div id ="divComplexityRightDown"  class="complexityDIV" >
			<h1>&nbsp;&nbsp;&nbsp;&nbsp; 程序预估性能  </h1>
			<table id="complexityInfoRightDOWN">
					<tr>
					<td>预估的完成时间：</td><td><input type="text" class="hasUnit"  readOnly="true"   value=<%=session.getValue("estimateFinishTime")%>></input><label>ms</label></td>
					<td>预估的运行能耗：</td><td><input type="text" class="hasUnit"  readOnly="true"   value=<%=session.getValue("estimateEnergy")%> ></input><label>瓦</label></td>
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
