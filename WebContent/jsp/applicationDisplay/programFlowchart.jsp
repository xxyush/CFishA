<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String appType = request.getParameter("appType");
	String chartType = request.getParameter("chartType");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../login/main.css" />
<link id="themeStyles" rel="stylesheet"
	href="../../common/javaScriptCommon/dijit/themes/claro/claro.css" />
<link rel="stylesheet" type="text/css" href="applicationMain.css" />
<style type="text/css">
#progProgressInfo {
	float: left;
	margin-left: 150pt;
	margin-top: 30pt;
	position: relative;
	width: 400px;
}

#proInfo {
	float: left;
	margin-left: 15pt;
	margin-top: 20pt;
	position: relative;
	width: 100%;
}
</style>

<script src="../../common/javaScriptCommon/dojo/dojo.js"
	djConfig="parseOnLoad: true">
        </script>

<script>
		djConfig = {
			isDebug:false,
			parseOnLoad:true
		};
	</script>

<script type="text/javascript">
		dojo.require("dijit.dijit"); // optimize: load dijit layer
		dojo.require("dojo.parser");	// scan page for widgets  
		
		
		dojo.require("dojox.gfx");
		dojo.require("dojox.gfx.utils");
		
		
		dojo.addOnLoad(function(){
			
				dojo.xhrGet({  //"http://localhost:8080/CFA/getGraphicGfxInfo",
					url : "/CFA/getProgramArchitecture?appType=<%=appType%>&chartType=<%=chartType%>",
					load : function(response,ioArgs){
						console.log("success xhrGet for Application Program structrue chart!!!",response,ioArgs);
						var structrueJSON=response;
						
						//var va=dojo.byId("proInfo");
						//va.innerHTML=structrueJSON.toLocaleString();
						var container = dojo.byId("gfx");
						surface = dojox.gfx.createSurface(container, 900, 600);
						var g1 = surface.createGroup();
						
						dojox.gfx.utils.fromJson(g1, structrueJSON);

					   
					},
					error : function(response,ioArgs){
						console.log("error on the update of application program structrue chart",response,ioArgs);	
						
					},
					handleAs : "text"	
				
				});
								
				
				/*  [{"fill":"#F00","shape":{"cy":"10","cx":"10","type":"ellipse","rx":"5","ry":"5"}}]  */
				//var json2='[{"shape":{"cx":50,"cy":200,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"shape":{"cx":60,"cy":167,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"shape":{"points":[{"x":60,"y":172},{"x":60,"y":180},{"x":50,"y":180},{"x":50,"y":192}],"type":"polyline"},"stroke":{color: "blue", width: 1}},{"shape":{"points":[{"x":50,"y":197},{"x":47,"y":192},{"x":53,"y":192},{"x":50,"y":197}],"type":"polyline"},"stroke":{color: "blue", width: 1},"fill":"#00F"}]';

				
			

			});
		
		
		
		
</script>







<title>
	<%
		if (appType.equals("passwordAnalysis"))
			out.print("口令破解");
		else if (appType.equals("webService"))
			out.print("Web服务");
		else if (appType.equals("imageRecognize"))
			out.print("图像识别");
		else if (appType.equals("bigFile"))
			out.print("大文件服务");
	%>应用任务程序软件流程图
</title>
</head>

<body>

	<%@ include file="../../common/jspCommon/header.jsp"%>
	<div id="main">


		<div id="center">

			<div class="title">
				<span> <strong> 
				<%
 				if (appType.equals("passwordAnalysis"))
 					out.print("口令破解");
 				else if (appType.equals("webService"))
			 		out.print("Web服务");
			 	else if (appType.equals("imageRecognize"))
			 		out.print("图像识别");
			 	else if (appType.equals("bigFile"))
			 		out.print("大文件服务");
 				%>
 				应用任务程序软件流程图 
 				</strong> </span>
			</div>

			<div class="content">



				<span id="proInfo"> <%--out.println(request.getParameter("programType"));  --%>
					应用任务软件结构图如下： </span>



				<div id="gfx"
					style="width: 900px; height: 600px; position: relative; float: left;">
				</div>




			</div>

		</div>
		<div id="footer"></div>

	</div>



</body>
</html>
