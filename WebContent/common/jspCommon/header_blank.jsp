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
        <li ><a target="_blank"  href="../../jsp/resourceDisplay/resourceStaticInformation.jsp"   >资源静态属性</a> </li>  
        <li><a target="_blank"  href="#"    >资源初始化配置</a> </li>  
        <li><a href="#" >资源利用率监视</a> 
            <ul>
        		<li><a target="_blank"  href="../../jsp/resourceDisplay/cpuUsageInformation.jsp"  >单个器件资源利用率</a></li>
				<li><a target="_blank"  href="../../jsp/resourceDisplay/fpgaComponentUsageInformation.jsp"  >FPGA组件资源利用率</a></li>
				<li><a target="_blank"  href="../../jsp/resourceDisplay/cpuComponentUsageInformation.jsp"  >通用CPU组件资源利用率</a></li>
				<li><a target="_blank"  href="#"  >GPU组件资源利用率</a></li>
			</ul>
        
        </li>  
        <li><a href="#"   >资源实时功率监视</a> 
            <ul>
        		<li><a target="_blank"  href="../../jsp/resourceDisplay/powerInformation.jsp"  >单个器件实时功率</a></li>
				<li><a target="_blank"  href="../../jsp/resourceDisplay/fpgaComponentPowerInformation.jsp"  >FPGA组件实时功率</a></li>
				<li><a target="_blank"  href="../../jsp/resourceDisplay/cpuComponentPowerInformation.jsp"  >通用CPU组件实时功率</a></li>
				<li><a target="_blank"  href="#"  >GPU组件实时功率</a></li>
				<li><a target="_blank"  href="#"  >机柜实时功率</a></li>
				
			</ul>
        
        </li>  
           
     </ul>
    </li>



<li id="nav_02"><a ><span><strong>应用任务展示</strong></span></a>	
	  <ul >       
       <li><a href="#" >Web服务</a> 
            <ul >
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programComplexity.jsp?appType=webService&taskId=10"  >程序复杂度</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programStructure.jsp?appType=webService&chartType=struct"  >程序软件结构图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=webService&chartType=flowchart"  >程序流程图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=webService&requestId=100"  >任务运行需求 </a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=webService&taskId=36866"    >执行进度展示</a></li>
				
				<li><a target="_blank"  href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=WebService">事件跟踪</a></li>
				
	   </ul>
       </li> 
       <li><a href="#" >大文件服务</a> 
           <ul>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programComplexity.jsp?appType=bigFile&taskId=10"  >程序复杂度</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programStructure.jsp?appType=bigFile&chartType=struct"  >程序软件结构图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=bigFile&chartType=flowchart"  >程序流程图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=webService&requestId=100"  >任务运行需求</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=bigFile&taskId=36866"    >执行进度展示</a></li>
				
				<li><a target="_blank"  href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=FileService">事件跟踪</a></li>
				
	  </ul>
       
       </li>     
       <li><a href="#"  >口令破解</a> 
            <ul >
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programComplexity.jsp?appType=passwordAnalysis&taskId=10"  >程序复杂度</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programStructure.jsp?appType=passwordAnalysis&chartType=struct"  >程序软件结构图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=passwordAnalysis&chartType=flowchart"  >程序流程图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=webService&requestId=100"  >任务运行需求 </a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=passwordAnalysis&taskId=36866"    >执行进度展示</a></li>
				
				<li><a target="_blank"  href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=PasswordCrack">事件跟踪</a></li>
				
	   </ul>
       
       
       
       </li>      
       <li><a href="#" >图像识别</a> 
            <ul >
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programComplexity.jsp?appType=imageRecognize&taskId=10"  >程序复杂度</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programStructure.jsp?appType=imageRecognize&chartType=struct"  >程序软件结构图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programFlowchart.jsp?appType=imageRecognize&chartType=flowchart"  >程序流程图</a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programRequestInformation.jsp?appType=webService&requestId=100"  >任务运行需求 </a></li>
				<li><a target="_blank"  href="../../jsp/applicationDisplay/programProgressInformation.jsp?appType=imageRecognize&taskId=36866"    >执行进度展示</a></li>
				
				<li><a target="_blank"  href="../../jsp/applicationDisplay/EventsTrace.jsp?AppType=ImageRecognization">事件跟踪</a></li>
				
	   </ul>
       
       </li>   
       
      
     
       
        
      </ul>
</li>


	


<li id="nav_03"><a href="#"><span><strong>重构特色展示</strong></span></a>	
	  <ul>       
       <li><a target="_blank"  href="../../jsp/reconfigurationDisplay/reconfigurationPlans.jsp"   >系统重构预案</a> </li>      
       <li><a target="_blank"  href="#"  >系统实时配置</a> </li>   
       <li><a   href="#"  >图像处理两种实现效果</a>
        	<ul >
                                <li><a target="_blank"  href="../../jsp/reconfigurationDisplay/imageRecognization.jsp" target="_blank" >GPU实现</a></li>

                                <li><a target="_blank"  href="../../jsp/reconfigurationDisplay/imageRecognization.jsp" target="_blank"  >FPGA实现</a></li>
                </ul>

	 </li>
       <li><a href="#"  >口令破解三种实现效果</a> </li>
       <li><a target="_blank"  href="#"  >同功能不同算法实现效果</a> </li>
       <li><a target="_blank"  href="../../jsp/reconfigurationDisplay/devicesTrace.jsp"  >器件重构跟踪显示</a> </li>
       <li><a target="_blank"  href="#"  >组件重构跟踪显示</a> </li>
       
     </ul>
</li>

      
    <li id="nav_04"><a href="#" style="font-size: 11pt;"><span><strong>应用性能分析</strong></span></a>	
      <ul>       
       <li><a href="#">Web服务</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=WebService">年视图</a></li>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=WebService">月视图</a></li> 
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=WebService">日视图</a></li>  
            </ul>
         </li>      
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=WebService">时间视图</a></li>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=WebService">能耗视图</a></li> 
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=WebService">效能视图</a></li>
               <li><a target="_blank"  href="">通信量视图</a></li>  
            </ul>
         </li>    
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=WebService">通信操作展示</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=WebService">完成时间统计</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=WebService">运行能耗统计</a> </li>      
       	 <li><a target="_blank"  href=""  >任务资源映射图</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=WebService">任务完成时间预测</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=WebService">任务运行能耗预测</a> </li>  
       	 <li><a target="_blank"  href=""  >档位变化预测</a> </li>      
       	 <li><a target="_blank"  href=""  >重构策略预测</a> </li>  
       	 <li><a target="_blank"  href=""  >调度策略预测</a> </li>        
        </ul> 
       </li>      
       <li><a href="#">大文件服务</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=FileService">年视图</a></li>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=FileService">月视图</a></li>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=FileService">24小时视图</a></li>
            </ul>
         </li>      
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=FileService">时间视图</a></li>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=FileService">能耗视图</a></li> 
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=FileService">效能视图</a></li>  
               <li><a target="_blank"  href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=FileService">通信操作展示</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=FileService">完成时间统计</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=FileService">运行能耗统计</a> </li>      
       	 <li><a target="_blank"  href=""  >任务资源映射图</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=FileService">任务完成时间预测</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=FileService">任务运行能耗预测</a> </li>  
       	 <li><a target="_blank"  href=""  >档位变化预测</a> </li>      
       	 <li><a target="_blank"  href=""  >重构策略预测</a> </li>  
       	 <li><a target="_blank"  href=""  >调度策略预测</a> </li>     
        </ul>        
       </li>   
       <li><a href="#">口令破解</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=PasswordCrack">年视图</a></li>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=PasswordCrack">月视图</a></li> 
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=PasswordCrack">24小时视图</a></li> 
            </ul>
        </li>
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=PasswordCrack">时间视图</a></li>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=PasswordCrack">能耗视图</a></li> 
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=PasswordCrack">效能视图</a></li>  
               <li><a target="_blank"  href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=PasswordCrack">通信操作展示</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=PasswordCrack">完成时间统计</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=PasswordCrack">运行能耗统计</a> </li>      
       	 <li><a target="_blank"  href=""  >任务资源映射图</a> </li>  
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=PasswordCrack">任务完成时间预测</a> </li>      
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=PasswordCrack">任务运行能耗预测</a> </li>  
       	 <li><a target="_blank"  href=""  >档位变化预测</a> </li>      
       	 <li><a target="_blank"  href=""  >重构策略预测</a> </li>  
       	 <li><a target="_blank"  href=""  >调度策略预测</a> </li>         
        </ul>        
       </li> 
       <li><a href="#">图像识别</a> 
        <ul>       
       	 <li><a href="#">任务到达规律</a> 
            <ul>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionYearView.jsp?AppType=ImageRecognization">年视图</a> </li>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionMonthView.jsp?AppType=ImageRecognization">月视图</a> </li>
                <li><a target="_blank"  href="../../jsp/performanceAnalyze/TaskArriveDistributionDayView.jsp?AppType=ImageRecognization">24小时视图</a> </li>
            </ul>
         </li>       
       	 <li><a href="#">计算热点分布</a> 
            <ul>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionTimeView.jsp?AppType=ImageRecognization">时间视图</a></li>
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerView.jsp?AppType=ImageRecognization">能耗视图</a></li> 
               <li><a target="_blank"  href="../../jsp/performanceAnalyze/ComputingHotspotDistributionPowerTimeView.jsp?AppType=ImageRecognization" >效能视图</a></li>  
               <li><a target="_blank" href="">通信量视图</a></li>  
            </ul>
         </li>   
       	 <li><a target="_blank"  href="../../jsp/performanceAnalyze/CommunicationDisplay.jsp?AppType=ImageRecognization" >通信操作展示</a> </li>      
       	 <li><a target="_blank" href="../../jsp/performanceAnalyze/TimeConsumptionStatistic.jsp?AppType=ImageRecognization" >完成时间统计</a> </li>  
       	 <li><a target="_blank" href="../../jsp/performanceAnalyze/PowerConsumptionStatistic.jsp?AppType=ImageRecognization">运行能耗统计</a> </li>      
       	 <li><a href=""  >任务资源映射图</a> </li>  
       	 <li><a target="_blank" href="../../jsp/performanceAnalyze/TimeConsumptionPrediction.jsp?AppType=ImageRecognization" >任务完成时间预测</a> </li>      
       	 <li><a target="_blank" href="../../jsp/performanceAnalyze/PowerConsumptionPrediction.jsp?AppType=ImageRecognization" >任务运行能耗预测</a> </li>  
       	 <li><a href="" target="_blank" >档位变化预测</a> </li>      
       	 <li><a href=""  target="_blank" >重构策略预测</a> </li>  
       	 <li><a href=""  target="_blank" >调度策略预测</a> </li>            
        </ul>        
       </li> 
      </ul>
	</li>
	
   <%
   	if( role.equals("1") || role.equals("3")  || role.equals("2") )	  //数据库管理员角色
		out.write("	<li id=\"nav_05\"><a href=\"#\" class=\"\" ><span><strong>系统数据管理</strong></span></a>	" +
	  		"<ul>  " +     
        		"<li><a href=\"../../jsp/databaseManagement/dataBasicOperation.jsp\" target=\"_blank\">表数据基本操作</a> </li> " +
		   	"<li><a href=\"#\" target=\"_blank\">系统数据初始化</a></li>" + 		  
        		"<li><a href=\"../../jsp/databaseManagement/dataEmulation.jsp\"  target=\"_blank\" >运行数据仿真模拟</a> </li>   " +  
			"<li><a href=\"#\" target=\"_blank\">系统数据库移植</a></li>" + 
       		   	"<li><a href=\"#\" target=\"_blank\">动态数据日志转存</a></li>" +
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
			<span> <a target="_blank"  href="<%=request.getContextPath()%>/jsp/login/main.jsp"  >返回主画面</a></span>
			<span> <a target="_blank"  href="<%=request.getContextPath()%>/jsp/login/logout.jsp"  > 注销</a></span> <br/>
			</p> 
	</div>

</div>

