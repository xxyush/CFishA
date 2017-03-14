<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>磁盘利用率</title>

<script type="text/javascript" src="../../common/javaScriptCommon/dojo/dojo.js"></script>
<link href="./default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
dojo.require("dojox.charting.Chart");
dojo.require("dojox.charting.plot2d.Pie");
dojo.require("dojox.charting.action2d.Highlight");
dojo.require("dojox.charting.action2d.MoveSlice");
dojo.require("dojox.charting.action2d.Tooltip");
dojo.require("dojox.charting.themes.Tom");
dojo.require("dojox.charting.widget.Legend");


var isChanging=false;
var lines;

var cabinetID;
var componentID;
var diskID;
var interval=1;

makeCharts = function(){
	var dc = dojox.charting;
    pieChart = new dc.Chart("pieChart");
    pieChart.setTheme(dc.themes.Tom).addPlot("default", {
        type: "Pie",
        font: "normal normal 10pt Tahoma",
		fontColor: "#ccc",
		labelWiring: "#ccc",
        radius: 100,
		labelStyle: "columns",
		htmlLabels: true,
		startAngle: -10
    }).addSeries("Series A", [{
        y: 50,
        text: "已用",
        tooltip: "50"
    },{
        y: 50,
        text: "未用",
        tooltip: "50"
    }]);
    var anim_b = new dc.action2d.Highlight(pieChart, "default");
    var anim_c = new dc.action2d.Tooltip(pieChart, "default");
    pieChart.render();
    legend = new dojox.charting.widget.Legend({
        chart: pieChart,
		horizontal:true
    }, "legend");
	
	
}

function change(){
	var diskUsed;
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
			diskUsed=document.getElementById("pt").innerHTML;
			//document.getElementById("sl").innerHTML=CpuUsed.length;
			//document.getElementById("errorMessage").innerHTML="Success!";
			
			var newData = [];
			//for(var i = 0; i < 2; i++){
				newData.push(parseFloat(diskUsed));
				newData.push(eval(100-diskUsed));
			//}
			//newData.sort(function(v1,v2){return v2 - v1});
			pieChart.updateSeries("Series A", newData);
		    pieChart.render();
			//legend.refresh();
			
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
	
	xmlhttp.open("GET", "/CFA/getDiskUsed?cabinetID="+cabinetID+"&componentID="+componentID+"&diskID="+diskID, true);
	xmlhttp.setRequestHeader("If-Modified-Since", "0");
	xmlhttp.send();

	
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
	
	obj=document.getElementById("diskID");
	//index=obj.selectedIndex;
	//diskedID=obj.options[index].text;
	diskID=obj.value;
	
	
	change();
}



dojo.addOnLoad(makeCharts);
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
			<h2 class="title"><span>磁盘利用率监视</span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				
				<div style="height:60px">
					机柜编号：&nbsp;
					<input id="cabinetID" type="text" style="height:20px;width:80px" />
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
					组件编号：&nbsp;
					<input id="componentID" type="text" style="height:20px;width:80px" />
					<!--
					<select id="componentID" style="height:30px;width:80px">
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
					SATA磁盘编号：&nbsp;
					<input id="diskID" type="text" style="height:20px;width:80px" />
					<!--
					<select id="diskedID" style="height:30px;width:80px">
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
					<option>11</option>
					<option>12</option>
					</select>
					-->
					&nbsp;&nbsp;
					
					
					<!--  
					<p id="sl">0</p>
					<p id="errorMessage">no error</p>
					-->
					 
                   
                   
					<button id="startChange" onclick="startChange()" style="width:80px;height:30px">刷新</button>
					
					
				</div>
				
				<div id="charts" style="width:800px;height:300px;margin-top:30px;margin-left:5%">
					<span>当前磁盘利用率：&nbsp;<a id="pt">0</a>%</span>
					<div id="pieChart" style="width: 470px; height: 350px; float:left;">
                  </div>
                      <div id="legend">
                      </div>
				</div>
				
				
		</div>
		
	</div>

</div>

</body>
</html>
