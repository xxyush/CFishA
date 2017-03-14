<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%	
	String appType = request.getParameter("appType");
	String taskId = request.getParameter("taskId");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"  href="../login/main.css" />
<link rel="stylesheet" type="text/css"  href="applicationMain.css" />
<link id="themeStyles" rel="stylesheet" href="../../common/javaScriptCommon/dijit/themes/claro/claro.css"/>



 <script src="../../common/javaScriptCommon/dojo/dojo.js"
        djConfig="parseOnLoad: true">
        </script>
<script type="text/javascript">
		dojo.require("dijit.dijit"); 
		dojo.require("dijit.ProgressBar");
		dojo.require("dojo.parser");	
		
		var progressInfo;
		var startTime;  
		var endTime,isFinished,needTime;
		var nowTime;
		var p,updateInternal,over95Internal;
		var dataTrans,powerCost;
		
		
		dojo.addOnLoad(mystart);
		
		
		function mystart(){
			dojo.xhrGet({
				url : "/CFA/getApplicationProgressInfo?appType=<%=appType%>&taskId=<%=taskId%>",
				load : function(response,ioArgs){
					progressInfo=response;
					
					startTime=Date.parse((progressInfo.startingTime).replace(/\-/g,"/"));
//					endTime=Date.parse((progressInfo.estimateFinishTime).replace(/\-/g,"/"));
					needTime=progressInfo.estimateFinishTime;
					nowTime = Date.parse((progressInfo.nowTime).replace(/\-/g,"/"));
					isFinished=progressInfo.isFinished;
					powerCost=progressInfo.powerCost;
					dataTrans=progressInfo.dataTrans;
					console.log("success xhrGet for ApplicationProgressInfo!!!",response,ioArgs);
					
					underInternal=setInterval(updateUnderThreshold,1000);	//	setTimeout(updateUnderThreshold,1000);			    
				},
				error : function(response,ioArgs){
					console.log("error on the update of application progress information",response,ioArgs);		
				},
				handleAs : "json"				
			});
		}
		
		function updateUnderThreshold(){
			updateProgressUnderThreshold();
			updatePower();
			updateData();
		}
		
		function updateProgressUnderThreshold(){
		//	console.log("update Internal");
		//-	p=((nowTime-startTime)/(endTime-startTime))*100;
			p=((nowTime-startTime)/needTime)*100;
			nowTime = nowTime  + 1000;
			if( (p< 95) && ( isFinished!="Y"))
			dijit.byId("ApplicationProgressBar").set({maximum: 100, value: p });
			else{
				dijit.byId("ApplicationProgressBar").set({maximum: 100, value: 95 });
				//-clearInterval(underInternal);
				//-overInternal=setInterval(overThreshold,1000);
				updateProgressoverThreshold();
			}
			
		}
		
		function updateProgressoverThreshold(){
		//	console.log("over Internal");
			dojo.xhrGet({
				url : "/CFA/getApplicationProgressInfo?appType=<%=appType%>&taskId=<%=taskId%>",
				load : function(response,ioArgs){
					progressInfo=response;
					isFinished=progressInfo.isFinished;
			//		console.log("success xhrGet for ApplicationProgressInfo!!!",response,ioArgs);
									    
				},
				error : function(response,ioArgs){
					console.log("error on the update of application progress information",response,ioArgs);	
					
				},
				handleAs : "json"				
			});
			
			if(  isFinished=="Y")
				{
				
				dijit.byId("ApplicationProgressBar").set({maximum: 100, value: 100 });
				//-clearInterval(overInternal);
				}
		}
		
		function updatePower(){
		powerCost = powerCost *1 +0.001;
		var arrPower = powerCost.toString().split("",9);	
		showNumbers("progPowerInfo",arrPower);	
		}
		function updateData(){
		dataTrans = dataTrans *1 + 0.001;
		var arrData= dataTrans.toString().split("",9);
		showNumbers("progDataInfo",arrData);	
			
		}
		function showNumbers(elementId,dataArray){
			var numbers=document.getElementById(elementId).children; 
			for(var i = ( (dataArray.indexOf("."))>-1 ? (5-dataArray.indexOf(".")) : 0),j=0; i < numbers.length; i++,j++) 
				if(dataArray[j]!=".")
					numbers[i].className="number c"+dataArray[j];
		}
		
		
</script>







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
 		%>应用任务当前运行信息展示
</title>
</head>
	
<body>

<%@ include file="../../common/jspCommon/header.jsp" %>  
<div id="main" >
  
	
	<div id="center">

	<div class="title">
	<span>

			<%
 	if (appType.equals("Cypher"))
 		out.print("口令破解");
 	else if (appType.equals("Web"))
 		out.print("Web服务");
 	else if (appType.equals("Image"))
 		out.print("图像识别");
 	else if (appType.equals("Bigfile"))
 		out.print("大文件服务"); 	
	%>-->应用任务当前运行信息展示
	</span> 
	</div>
	
	<div class="content">

	    <div id="progressUP" class="progressDIV">
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;应用任务当前进度信息：</h1>
		
		
		<div id="progProgressInfo" class="progressInfo">
			<div id="ApplicationProgressBar" data-dojo-type="dijit.ProgressBar" data-dojo-props='places:2,style:"width:400px;height:35px;",
				maximum:200, value:"2"'   ></div>	
		</div>
	   </div>

	    <div id="progressMID" class="powerCostDIV">
		<h1 class="powerCostH1">&nbsp;&nbsp;&nbsp;&nbsp;应用任务当前能耗消耗量：</h1>
		
		<div id="progPowerInfo" class="numberInfo">
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div class="number dotDIV">  
              <div class="dot"></div>  
    		</div>  
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
 
		</div>
		<label id= "powerUnit">kWh</label>
	   </div>

	    <div id="progressDOWN" class="dataTransDIV">
		<h1>&nbsp;&nbsp;&nbsp;&nbsp; 应用任务当前数据传输量：</h1>
		
		<div id="progDataInfo" class="progressInfo">
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div  style=" display:none" class="number dotDIV">  
              <div class="dot0"></div>  
    		</div>  
			<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
    		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
       		<div class="number c0">  
        	  <div class="v n1"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n2"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n3"><div class="l"></div><div class="r"></div></div>  
        	  <div class="v n4"><div class="u"></div><div class="d"></div></div>  
        	  <div class="v n5"><div class="u"></div><div class="d"></div></div>  
        	  <div class="h n6"><div class="l"></div><div class="r"></div></div>  
        	  <div class="h n7"><div class="l"></div><div class="r"></div></div>  
    		</div>  
 			
		</div>
		<label id= "dataTransUnit">KB</label>
	   </div>

	</div>

	</div>
	<div id="footer" ></div>

	</div>
       


</body>
</html>
