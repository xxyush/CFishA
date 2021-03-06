<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 
<%@ page import="CFA.resourceDisplay.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用CPU组件利用率监视</title>

<script type="text/javascript" src="../../common/javaScriptCommon/dojo/dojo.js"></script>
<link href="./default.css" rel="stylesheet" type="text/css" />

<%
int cpuCount=0;
/*
databaseOperation dbo=new databaseOperation();
if(dbo.connectDatabase("192.168.0.206","CFA_DATABASE","tongji","tongji"))
{
	dbo.query("select cpuCount from TB_Component_Info where componentId=397");	
	dbo.rs.first();
	cpuCount=dbo.rs.getInt("cpuCount");
}
*/
%>

<script type="text/javascript">
dojo.require("dojox.charting.DataChart");
dojo.require("dojo.data.ItemFileWriteStore");
dojo.require("dijit.form.NumberSpinner");

dojo.require("dojox.charting.themes.PlotKit.blue");
dojo.require("dojox.charting.themes.PlotKit.cyan");
dojo.require("dojox.charting.themes.PlotKit.green");
dojo.require("dojox.charting.themes.PlotKit.red");
dojo.require("dojox.charting.themes.PlotKit.base");
dojo.require("dojox.charting.themes.Electric");
dojo.require("dojox.charting.themes.Tom");
dojo.require("dojox.charting.themes.Chris");
dojo.require("dojox.charting.themes.Renkoo");

var store = new dojo.data.ItemFileWriteStore({ url:"stock.json" });
var isChanging=false;
<%
cpuCount=12;
for(int i=0;i<cpuCount;++i)
{
	out.print("var line"+i+";");
	out.print("\r\n");
}
%>

var cabinetID;
var componentID;
var CPUID;
var interval=1;

makeCharts = function(){
	<%
	for(int i=0;i<cpuCount;++i)
	{
		out.print("line"+i+"= new dojox.charting.DataChart(\"line"+i+"\", {chartTheme:dojox.charting.themes.Electric,displayRange:11,xaxis:{labels:[\"time\", \"10\",\"9\",\"8\",\"7\",\"6\",\"5\",\"4\",\"3\",\"2\",\"1\",\"0\"]},yaxis:{min:0,max:100,majorTickStep:20,minorTickStep:10,title:\"Cpu Used (%)\",titleFontColor: \"gray\"},type: dojox.charting.plot2d.Lines});");
		out.print("\r\n");
		out.print("line"+i+".setStore(store, {symbol:\"CPU"+(i+1)+"\"}, \"historicPrice\");");
		out.print("\r\n");
	}
	%>
}

function change(){
	var CpuUsed;
	var xmlhttp;
	
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			CpuUsed=xmlhttp.responseText.split(",");
			//document.getElementById("sl").innerHTML=CpuUsed.length;
			//document.getElementById("errorMessage").innerHTML="Success!";
			
			document.getElementById("pt1").innerHTML=CpuUsed[0];
			store.fetch({query:{symbol:"CPU1"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[0]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt2").innerHTML=CpuUsed[1];
			store.fetch({query:{symbol:"CPU2"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[1]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt3").innerHTML=CpuUsed[2];
			store.fetch({query:{symbol:"CPU3"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[2]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt4").innerHTML=CpuUsed[3];
			store.fetch({query:{symbol:"CPU4"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[3]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt5").innerHTML=CpuUsed[4];
			store.fetch({query:{symbol:"CPU5"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[4]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt6").innerHTML=CpuUsed[5];
			store.fetch({query:{symbol:"CPU6"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[5]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt7").innerHTML=CpuUsed[6];
			store.fetch({query:{symbol:"CPU7"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[6]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt8").innerHTML=CpuUsed[7];
			store.fetch({query:{symbol:"CPU8"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[7]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt9").innerHTML=CpuUsed[8];
			store.fetch({query:{symbol:"CPU9"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[8]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt10").innerHTML=CpuUsed[9];
			store.fetch({query:{symbol:"CPU10"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[9]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt11").innerHTML=CpuUsed[10];
			store.fetch({query:{symbol:"CPU11"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[10]);
				});
			}, onError:function(err){console.error(err)}});
			
			document.getElementById("pt12").innerHTML=CpuUsed[11];
			store.fetch({query:{symbol:"CPU12"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed[11]);
				});
			}, onError:function(err){console.error(err)}});
			
			if(isChanging==true)
			{
				setTimeout(change,interval*1000);
			}
		}
		else if(xmlhttp.readyState==4&&xmlhttp.status!=200)
		{
			//document.getElementById("pt").innerHTML="No response!";
			//document.getElementById("sl").innerHTML="Code:"+xmlhttp.status;
			//document.getElementById("errorMessage").innerHTML=xmlhttp.statusText;
			setTimeout(change,6000);
		}
		else
		{
			//document.getElementById("pt").innerHTML="Request not complete! Please waiting...";
			//document.getElementById("sl").innerHTML=xmlhttp.readyState;
			//document.getElementById("errorMessage").innerHTML="Request not complete! Please waiting...";
		}
	}
	
	xmlhttp.open("GET", "/CFA/getCpuComponentUsed?cabinetID="+cabinetID+"&componentID="+componentID, true);
	xmlhttp.setRequestHeader("If-Modified-Since", "0");
	xmlhttp.send();

	/*
	store.fetch({query:{symbol:"*"}, onComplete: function(items){
		dojo.forEach(items,function(m){
			store.setValue(m,"historicPrice",CpuUsed);
		});
	}, onError:function(err){console.error(err)}});
	*/
	//setTimeout(change,3000);
}

function startChange()
{
	var obj=document.getElementById("cabinetID");
	//var index=obj.selectedIndex;
	//cabinetID=obj.options[index].text;
	cabinetID=obj.value;
	
	obj=document.getElementById("componentID");
	//index=obj.selectedIndex;
	//componentID=obj.options[index].text;
	componentID=obj.value;
	
	obj=document.getElementById("interval");
	index=obj.selectedIndex;
	interval=obj.options[index].text;
	
	isChanging=true;
	change();
}

function stopChange()
{
	isChanging=false;
}

dojo.addOnLoad(function(){
	makeCharts();
	console.log(store.getFeatures());
});
</script>

</head>
<body>
<%@ include file="../../common/jspCommon/header.jsp" %>

<%
Date d=new Date();
java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
String sd=formatter.format(d);
%>

<div id="content">

	<div id="main">

		<div id="example" class="post">
			<h2 class="title"><span>通用CPU组件利用率监视</span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				
				<div style="height:60px">
					机柜编号：&nbsp;
					<input id="cabinetID" type="text" style="height:20px;width:100px" />
					<!--
					<select id="cabinetID" style="height:30px;width:100px">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					</select>
					-->
					&nbsp;&nbsp;&nbsp;&nbsp;
					组件编号：&nbsp;
					<input id="componentID" type="text" style="height:20px;width:100px" />
					<!--
					<select id="componentID" style="height:30px;width:100px">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					</select>
					-->
					&nbsp;&nbsp;&nbsp;&nbsp;
					刷新周期：&nbsp;
					<select id="interval" style="height:30px;width:100px">
					<option>0.5</option>
					<option>1.0</option>
					<option>1.5</option>
					<option>2.0</option>
					<option>2.5</option>
					<option>3.0</option>
					</select>秒&nbsp;&nbsp;&nbsp;&nbsp;
					
					<!--  
					<p id="sl">0</p>
					<p id="errorMessage">no error</p>
					-->
					
					<button id="startChange" onclick="startChange()" style="width:120px;height:30px">开始</button>
					<button id="stopChange" onclick="stopChange()" style="width:120px;height:30px">停止</button>
					
				</div>
				
				<!--
				<div style="margin-left:5%;height:60px">
					<button id="startChange" onclick="startChange()" style="width:150px;height:30px">开始</button>
					<button id="stopChange" onclick="stopChange()" style="width:150px;height:30px">停止</button>
				</div>
				-->
				
				<div id="charts" style="width:900px">
					<%
					for(int i=0;i<cpuCount;++i)
					{
						out.print("<div style=\"float:left\">");
						out.print("<span>CPU"+(i+1)+"当前利用率：&nbsp;<a id=\"pt"+(i+1)+"\">0</a>%</span>");
						out.print("<div class=\"lines\" style=\"width:300px\"><div id=\"line"+i+"\" style=\"width:290px;height:150px\"></div></div>");
						out.print("</div>");
					}
					%>
				</div>
				
			</div>
		</div>
		
	</div>

</div>

</body>
</html>
