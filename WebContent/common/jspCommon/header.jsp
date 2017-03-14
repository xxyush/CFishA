<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/common/jspCommon/header.css" />

<style type="text/css">
#backHome {

    height: 20px;
    margin-left: 78%;
    position: absolute;
    text-align: center;
    top: 141px;
    width: 50px;
}

#backHome a{
    color: #3E9722;
    text-decoration: underline;
}
</style>



<%@ include file="../../common/jspCommon/accessControl.jsp" %>  

<!--
<div id="backHome" >
<a href="../../jsp/login/main.jsp" >主画面</a>
</div>

-->

<div id="top"   style="background-image:url('<%=request.getContextPath()%>/images/top.jpg'); height: 120px; width:920px; margin:0 auto; padding:20px 20px 0; "  >
	<div id="logo"><h1>
	<strong>系统可重构特色展示与数据组织评估</strong>
	</h1>
	</div>
<%
/*
String role2="theRole";
String username="";

if(request.getSession(false) != null && request.getSession(false).getValueNames().length > 0){
	username=request.getSession(false).getAttribute("username").toString();
	role2 = request.getSession(false).getAttribute("role").toString(); 
}*/

%>
    
  <div id="menu">
	<ul id="CFA_MENU">
	<li id="nav_01"><a href="#" ><strong>系统资源展示</strong></a>
      <ul >
        <li ><a href="../../jsp/resourceDisplay/resourceStaticInformation.jsp"   >资源静态属性</a> </li>
	    <li><a href="../../jsp/resourceDisplay/resourceConnectStruct.jsp">资源互联结构</a></li>  
        <li><a href="#"    >资源初始状态</a> </li>  
        <li><a href="#" >资源利用率</a> 
            <ul>
        		<li><a href="../../jsp/resourceDisplay/cpuUsageInformation.jsp"  >单个单元资源利用率</a></li>
				<li><a href="../../jsp/resourceDisplay/fpgaComponentUsageInformation.jsp"  >FPGA组件资源利用率</a></li>
				<li><a href="../../jsp/resourceDisplay/cpuComponentUsageInformation.jsp"  >通用CPU组件资源利用率</a></li>
				<li><a href="#"  >GPU组件资源利用率</a></li>
				<li><a href="#">磁盘利用率</a></li>
				<li><a href="#">内存利用率</a></li>
			</ul>
        
        </li>  
        <li><a href="#"   >资源实时功率</a> 
            <ul>
        		<li><a href="../../jsp/resourceDisplay/powerInformation.jsp"  >单个单元实时功率</a></li>
				<li><a href="../../jsp/resourceDisplay/fpgaComponentPowerInformation.jsp"  >FPGA组件实时功率</a></li>
				<li><a href="../../jsp/resourceDisplay/cpuComponentPowerInformation.jsp"  >通用CPU组件实时功率</a></li>
				<li><a href="#"  >GPU组件实时功率</a></li>
				<li><a href="../../jsp/resourceDisplay/cabinetPowerInformation.jsp"  >机柜实时功率</a></li>
				
			</ul>
        
        </li>
	
	<li><a href="../../jsp/resourceDisplay/networkRealtimeMonitor.jsp">网络实时监控</a></li>  
           
     </ul>
    </li>



<li id="nav_02"><a ><span><strong>应用任务展示</strong></span></a>	
	  <ul >       
       <li><a href="#" >Web服务</a> 
            <ul >
				<li><a href="../../jsp/applicationDisplay/programComplexity.jsp?appType=Web&taskId=1"  >程序复杂度</a></li>
				<li><a href="../../jsp/applicationDisplay/programStructure.jsp?appType=Web&chartType=struct"  >程序软件结构图</a></li>
				<li><a href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=Web&chartType=flowchart"  >程序流程图</a></li>
				<li><a href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=Web&requestId=100"  >任务运行需求 </a></li>
				<li><a href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=Web&taskId=1"    >执行进度展示</a></li>
	
				<li><a href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=WebService">事件跟踪</a></li>
				
	   </ul>
       </li> 
       <li><a href="#" >大文件服务</a> 
           <ul>
				<li><a href="../../jsp/applicationDisplay/programComplexity.jsp?appType=Bigfile&taskId=2"  >程序复杂度</a></li>
				<li><a href="../../jsp/applicationDisplay/programStructure.jsp?appType=Bigfile&chartType=struct"  >程序软件结构图</a></li>
				<li><a href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=Bigfile&chartType=flowchart"  >程序流程图</a></li>
				<li><a href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=Bigfile&requestId=100"  >任务运行需求</a></li>
				<li><a href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=Bigfile&taskId=2"    >执行进度展示</a></li>
			
				<li><a href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=FileService">事件跟踪</a></li>
				
	  </ul>
       
       </li>     
       <li><a href="#"  >口令破解</a> 
            <ul >
				<li><a href="../../jsp/applicationDisplay/programComplexity.jsp?appType=Cypher&taskId=3"  >程序复杂度</a></li>
				<li><a href="../../jsp/applicationDisplay/programStructure.jsp?appType=Cypher&chartType=struct"  >程序软件结构图</a></li>
				<li><a href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=Cypher&chartType=flowchart"  >程序流程图</a></li>
				<li><a href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=Cypher&requestId=100"  >任务运行需求 </a></li>
				<li><a href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=Cypher&taskId=3"    >执行进度展示</a></li>

				
				<li><a href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=PasswordCrack">事件跟踪</a></li>
				
	   </ul>
       
       
       
       </li>      
       <li><a href="#" >图像识别</a> 
            <ul >
				<li><a href="../../jsp/applicationDisplay/programComplexity.jsp?appType=Image&taskId=4"  >程序复杂度</a></li>
				<li><a href="../../jsp/applicationDisplay/programStructure.jsp?appType=Image&chartType=struct"  >程序软件结构图</a></li>
				<li><a href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=Image&chartType=flowchart"  >程序流程图</a></li>
				<li><a href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=Image&requestId=100"  >任务运行需求 </a></li>
				<li><a href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=Image&taskId=4"    >执行进度展示</a></li>

				
				<li><a href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=ImageRecognization">事件跟踪</a></li>
				
	   </ul>
       
       </li>   
       
      
     
       
        
      </ul>
</li>


	


<li id="nav_03"><a href="#"><span><strong>重构特色展示</strong></span></a>	
	  <ul>       
       <li><a href="../../jsp/reconfigurationDisplay/reconfigurationPlans.jsp"   >系统重构预案</a> </li>      
       <li><a href="#"  >系统实时配置</a> </li>   
       <li><a href="#"  >图像处理两种实现效果</a>
        	<ul >
                                <li><a href="../../jsp/reconfigurationDisplay/imageReconfiguration.jsp?appType=Image&taskId=4&component=GPU" target="_blank" >GPU实现</a></li>

                                <li><a href="../../jsp/reconfigurationDisplay/imageReconfiguration.jsp?appType=Image&taskId=4&component=FPGA" target="_blank"  >FPGA实现</a></li>
                </ul>

	 </li>
       <li><a href="#"  >口令破解三种实现效果</a>
        	<ul >
                                <li><a href="../../jsp/reconfigurationDisplay/cypherReconfiguration.jsp?appType=Cypher&taskId=3&component=CPU" target="_blank" >CPU实现</a></li>
                                <li><a href="../../jsp/reconfigurationDisplay/cypherReconfiguration.jsp?appType=Cypher&taskId=3&component=GPU" target="_blank" >GPU实现</a></li>
                                <li><a href="../../jsp/reconfigurationDisplay/cypherReconfiguration.jsp?appType=Cypher&taskId=3&component=FPGA" target="_blank"  >FPGA实现</a></li>
                </ul>

       </li>
       <li><a href="#"  >同功能不同算法实现效果</a> </li>
       <li><a href="../../jsp/reconfigurationDisplay/devicesTrace.jsp"  >器件重构跟踪显示</a> </li>
       <li><a href="#"  >组件重构跟踪显示</a> </li>
       
     </ul>
</li>

      
    <li id="nav_04"><a href="#" style="font-size: 11pt;"><span><strong>应用性能分析</strong></span></a>	
      <ul>       
       <li><a href="#">Web服务</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
               <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=WebService">年视图</a></li>
               <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=WebService">月视图</a></li> 
               <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=WebService">日视图</a></li>  
            </ul>
         </li>      
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=WebService">时间视图</a></li>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=WebService">能耗视图</a></li> 
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=WebService">效能视图</a></li>
               <li><a href="">通信量视图</a></li>  
            </ul>
         </li>    
       	 <li><a href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=WebService">通信操作展示</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=WebService">完成时间统计</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=WebService">运行能耗统计</a> </li>      
       	 <li><a href=""  >任务资源映射图</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=WebService">任务完成时间预测</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=WebService">任务运行能耗预测</a> </li>  
       	 <li><a href=""  >档位变化预测</a> </li>      
       	 <li><a href=""  >重构策略预测</a> </li>  
       	 <li><a href=""  >调度策略预测</a> </li>        
        </ul> 
       </li>      
       <li><a href="#">大文件服务</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=FileService">年视图</a></li>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=FileService">月视图</a></li>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=FileService">日视图</a></li>
            </ul>
         </li>      
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=FileService">时间视图</a></li>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=FileService">能耗视图</a></li> 
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=FileService">效能视图</a></li>  
               <li><a href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=FileService">通信操作展示</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=FileService">完成时间统计</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=FileService">运行能耗统计</a> </li>      
       	 <li><a href=""  >任务资源映射图</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=FileService">任务完成时间预测</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=FileService">任务运行能耗预测</a> </li>  
       	 <li><a href=""  >档位变化预测</a> </li>      
       	 <li><a href=""  >重构策略预测</a> </li>  
       	 <li><a href=""  >调度策略预测</a> </li>     
        </ul>        
       </li>   
       <li><a href="#">口令破解</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=PasswordCrack">年视图</a></li>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=PasswordCrack">月视图</a></li> 
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=PasswordCrack">日视图</a></li> 
            </ul>
        </li>
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=PasswordCrack">时间视图</a></li>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=PasswordCrack">能耗视图</a></li> 
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=PasswordCrack">效能视图</a></li>  
               <li><a href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=PasswordCrack">通信操作展示</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=PasswordCrack">完成时间统计</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=PasswordCrack">运行能耗统计</a> </li>      
       	 <li><a href=""  >任务资源映射图</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=PasswordCrack">任务完成时间预测</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=PasswordCrack">任务运行能耗预测</a> </li>  
       	 <li><a href=""  >档位变化预测</a> </li>      
       	 <li><a href=""  >重构策略预测</a> </li>  
       	 <li><a href=""  >调度策略预测</a> </li>         
        </ul>        
       </li> 
       <li><a href="#">图像识别</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=ImageRecognization">年视图</a> </li>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=ImageRecognization">月视图</a> </li>
                <li><a href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=ImageRecognization">日视图</a> </li>
            </ul>
         </li>       
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=ImageRecognization">时间视图</a></li>
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=ImageRecognization">能耗视图</a></li> 
               <li><a href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=ImageRecognization">效能视图</a></li>  
               <li><a href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=ImageRecognization">通信操作展示</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=ImageRecognization">完成时间统计</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=ImageRecognization">运行能耗统计</a> </li>      
       	 <li><a href=""  >任务资源映射图</a> </li>  
       	 <li><a href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=ImageRecognization">任务完成时间预测</a> </li>      
       	 <li><a href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=ImageRecognization">任务运行能耗预测</a> </li>  
       	 <li><a href=""  >档位变化预测</a> </li>      
       	 <li><a href=""  >重构策略预测</a> </li>  
       	 <li><a href=""  >调度策略预测</a> </li>            
        </ul>        
       </li> 
      </ul>
	</li>
	
   <%
   	if( role.equals("1") || role.equals("3")  || role.equals("2") )	  //数据库管理员角色
		out.write("	<li id=\"nav_05\"><a href=\"#\" class=\"\" ><span><strong>系统数据管理</strong></span></a>	" +
	  		"<ul>  " +     
        		"<li><a href=\"../../jsp/databaseManagement/dataBasicOperation.jsp\" >表数据基本操作</a> </li> " +
		   	"<li><a href=\"#\">系统数据初始化</a>     "  + 
         		"<ul>  " +     
        		"<li><a href=\"#\" >动态数据表清空</a> </li> " +
        		"<li><a href=\"../../jsp/databaseManagement/codeConsistenceCheck.jsp\" >资源编码一致性检查</a> </li> " +
			"</ul>  " + 
			"</li>" + 		  
        		"<li><a href=\"../../jsp/databaseManagement/dataEmulation.jsp\"  target=\"_blank\" >运行数据仿真模拟</a> </li>   " +  
			"<li><a href=\"#\">系统数据库移植</a></li>" + 
       		   	"<li><a href=\"#\">动态数据日志转存</a></li>" +
    		"</ul>"+
   		"</li> "
   		);
   %>	   
   <%
   if( role.equals("2") || role.equals("3") || role.equals("1") )	  //Web管理员角色
	   out.write(" <li id=\"nav_06\"><a href=\"#\" class=\"\" ><span><strong>&nbsp;&nbsp;&nbsp;&nbsp;其&nbsp;&nbsp;&nbsp;&nbsp;他&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></a>" +
   "<ul>  " +     
        		"<li><a href=\"#\" >&nbsp;&nbsp;&nbsp;&nbsp;帮&nbsp;&nbsp;&nbsp;&nbsp;助&nbsp;&nbsp;&nbsp;&nbsp;</a> </li> " +
   "</ul>"+
	
   "</li>"
   );
   %>
	</ul>
	</div>
	<div id="logoRight">
	
	</div>
	<div id="userInfo">
		<p style="vertical-align:baseline;">
			<span> 欢迎您: </span>  <% 
			    out.write( username +"&nbsp!&nbsp" );
				/*if( role.equals("1"))	
				out.write("数据库管理员"+")");
				else if(role.equals("2"))
				out.write("Web管理员"+")");
				else if(role.equals("3"))
				out.write("普通用户"+")");
				*/
		%>  
			<span> <a href="<%=request.getContextPath()%>/jsp/login/main.jsp"  >返回主画面</a></span>
			<span> <a href="<%=request.getContextPath()%>/jsp/login/logout.jsp"  > 注销</a></span> <br/>
			</p> 
	</div>

</div>

