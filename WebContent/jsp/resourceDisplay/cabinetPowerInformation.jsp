<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机柜功率监视</title>

<script type="text/javascript" src="../../common/javaScriptCommon/dojo/dojo.js"></script>
<link href="./default.css" rel="stylesheet" type="text/css" />

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
var lines;

var cabinetID;
var componentID;
var CPUID;
var interval=1;
var maxPower=10000;

makeCharts = function(){
	/*var*/ lines = new dojox.charting.DataChart("lines", {
		//chartTheme:dojox.charting.themes.PlotKit.cyan,
		chartTheme:dojox.charting.themes.Electric,
		displayRange:31,
		//minWidth:700,
		//minHeight:500,
		//stretchToFit:false,
		xaxis:{labels:["time", "30","29","28","27","26","25","24","23","22","21","20","19","18","17","16","15","14","13","12","11","10","9","8","7","6","5","4","3","2","1","0"]},
		yaxis:{min:0,max:maxPower,majorTickStep:500,minorTickStep:250,title:"Power (W)",titleFontColor: "gray"},
		type: dojox.charting.plot2d.Lines
	});
	lines.setStore(store, {symbol:"ANDT"}, "historicPrice");
	
	/*
	var lines2 = new dojox.charting.DataChart("lines2", {
		//chartTheme:dojox.charting.themes.PlotKit.green,
		//chartTheme:dojox.charting.themes.PlotKit.cyan,
		chartTheme:dojox.charting.themes.Electric,
		displayRange:31,
		//minWidth:700,
		//minHeight:500,
		//stretchToFit:false,
		xaxis:{labels:["time", "30","29","28","27","26","25","24","23","22","21","20","19","18","17","16","15","14","13","12","11","10","9","8","7","6","5","4","3","2","1","0"]},
		yaxis:{min:0,max:100,title:"Cpu Used (%)",titleFontColor: "gray"},
		type: dojox.charting.plot2d.Lines
	});
	lines2.setStore(store, {symbol:"ATEU"}, "historicPrice");
	
	var lines3 = new dojox.charting.DataChart("lines3", {
		//chartTheme:dojox.charting.themes.PlotKit.red,
		displayRange:11,
		xaxis:{labels:["time", "20","18","16","14","12","10","8","6","4","2","0"]},
		yaxis:{min:0,max:100,title:"Cpu Used (%)",titleFontColor: "gray"},
		type: dojox.charting.plot2d.Lines
	});
	lines3.setStore(store, {symbol:"BGCN"}, "historicPrice");
	
	var lines4 = new dojox.charting.DataChart("lines4", {
		displayRange:11,
		xaxis:{labels:["time", "20","18","16","14","12","10","8","6","4","2","0"]},
		yaxis:{min:0,max:100,title:"Cpu Used (%)",titleFontColor: "gray"},
		type: dojox.charting.plot2d.Lines
	});
	lines4.setStore(store, {symbol:"BAYC"}, "historicPrice");
	*/
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
			document.getElementById("pt").innerHTML=xmlhttp.responseText;
			CpuUsed=document.getElementById("pt").innerHTML;
			//document.getElementById("sl").innerHTML=CpuUsed.length;
			//document.getElementById("errorMessage").innerHTML="Success!";
			
			store.fetch({query:{symbol:"ANDT"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed);
				});
			}, onError:function(err){console.error(err)}});
			
			/*
			store.fetch({query:{symbol:"ATEU"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed);
				});
			}, onError:function(err){console.error(err)}});
			
			store.fetch({query:{symbol:"BGCN"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed);
				});
			}, onError:function(err){console.error(err)}});
			
			store.fetch({query:{symbol:"BAYC"}, onComplete: function(items){
				dojo.forEach(items,function(m){
					store.setValue(m,"historicPrice",CpuUsed);
				});
			}, onError:function(err){console.error(err)}});
			*/
			
			if(isChanging==true)
			{
				setTimeout(change,interval*1000);
			}
		}
		else if(xmlhttp.readyState==4&&xmlhttp.status!=200)
		{
			document.getElementById("pt").innerHTML="No response!";
			//document.getElementById("sl").innerHTML="Code:"+xmlhttp.status;
			//document.getElementById("errorMessage").innerHTML=xmlhttp.statusText;
			setTimeout(change,6000);
		}
		else
		{
			document.getElementById("pt").innerHTML="Request not complete! Please waiting...";
			//document.getElementById("sl").innerHTML=xmlhttp.readyState;
			//document.getElementById("errorMessage").innerHTML="Request not complete! Please waiting...";
		}
	}
	
	xmlhttp.open("GET", "/CFA/getCabinetPower?cabinetID="+cabinetID, true);
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
			<h2 class="title"><span>机柜功率监视</span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				
				<div style="height:60px">
					机柜编号：&nbsp;
					<input id="cabinetID" type="text" style="height:20px;width:200px" />
					<!--
					<select id="cabinetID" style="height:30px;width:80px">
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
					&nbsp;&nbsp;
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
				
				<div id="charts" style="width:800px;height:300px;margin-top:30px;margin-left:5%">
					<span>当前机柜功率：&nbsp;<a id="pt">0</a>W</span>
					<div class="lines">
						<div id="lines"></div>
					</div>
				</div>
				
				<!--  
				<div style="margin-top:80px;margin-left:5%;height:60px">
					<button id="startChange" onclick="startChange()" style="width:150px;height:40px">开始</button>
					<button id="stopChange" onclick="stopChange()" style="width:150px;height:40px">停止</button>
				</div>
				-->
				
				<!--  
				<div id="charts" style="width:30%;margin-left:50%;margin-top:5%">
					<div class="lines">
						<div id="lines2"></div>
					</div>
				</div>
				
				<div id="charts" style="width:30%;margin-left:20%;float:left">
					<div class="lines">
						<div id="lines3"></div>
					</div>
				</div>
				
				<div id="charts" style="width:30%;margin-left:50%">
					<div class="lines">
						<div id="lines4"></div>
					</div>
				</div>
				-->
				
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
