<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Drawing</title>

<%@page import="java.util.*"%>

<script src="./common/javaScriptCommon/dojo/dojo.js"
        djConfig="parseOnLoad: true">
        </script>


<style type="text/css">
		@import url("../../../dojox/drawing/resources/drawing.css");
.drawing{
			margin-left:52px;
			width:800px;
			height:500px;
			border:1px solid #ccc;
			
		}

</style>

<script>
		djConfig = {
			isDebug:false,
			parseOnLoad:true
		};
	</script>

<script type="text/javascript">

dojo.require("dojo.parser");
dojo.require("dojox.drawing");
dojo.require("dojox.drawing.tools.Ellipse");
dojo.require("dojox.drawing.tools.Line");
dojo.require("dojox.drawing.plugins.drawing.Grid");
dojo.require("dojox.drawing.plugins.drawing.GreekPalette");



dojo.require("dojox.gfx");
dojo.require("dojox.gfx.utils");

dojo.addOnLoad(function(){
dojo.connect(myDrawing, "onSurfaceReady", function(){

	
	var json = '[{"color":"#F00","fill": "#F00","style":"Solid","cap":"round","borderWidth":1,"cx":75,"cy":197,"rx":5,"ry":5,"type":"ellipse"},{"color":"#F00","fill": "#F00","style":"Solid","cap":"round","borderWidth":1,"cx":65,"cy":107,"rx":5,"ry":5,"type":"ellipse"}]';
	
	myDrawing.importer(dojo.fromJson(json));
	
	
	/*var names=[];
	var j='{"name": "eyes", "children": [	{	"name": "eyes1", "children": [	{"shape": {"type": "path", 	"path": "M123.163,176.668 c-5.066,1.17-9.01,7.888-13.666,10.335c-4.238,2.227-8.648,6.636-7.009,12.332c1.971,6.848,12.042,3.991,16.261,1.165 c5.282-3.539,9.59-8.517,12.006-14.524c1.523-3.787,2.568-7.272-1.509-9.391c-2.905-1.51-8.174-1.386-11.417-0.583"	},"fill": "#FFFFFF", "stroke": {"color": "#000000"}},{"shape": {"type": "path","path": "M182.545,179.865 c-3.533,0.169-4.854-1.166-8.408-0.001c-3,0.983-6.24,1.936-8.852,3.743c-3.938,2.725-7.46,5.555-4.73,13.592 c1.973,5.811,8.791,7.571,14.656,6.667c5.537-0.854,9.078-4.977,11.408-10.007c3.666-7.918,0.943-11.639-6.742-13.659"},"fill": "#FFFFFF","stroke": {"color": "#000000","cap": "round"}}]}';
	names.push(j);*/
	
	/*
	
	var container = dojo.byId("gfx");
surface = dojox.gfx.createSurface(container, 500, 500);
var g2 = surface.createGroup();
dojox.gfx.utils.fromJson(g2, '[{"name":"gg2","children":[{"name":"ss2","shape":{"cx":75,"cy":197,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"name":"ss3","shape":{"cx":65,"cy":187,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"}]}]'); 
*/

/*

var container = dojo.byId("gfx");
surface = dojox.gfx.createSurface(container, 500, 500);
var g2 = surface.createGroup();
dojox.gfx.utils.fromJson(g2, '[{"shape":{"cx":50,"cy":197,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"shape":{"cx":40,"cy":187,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"}]'); 
	
	*/
	
	var sjson='[{"fill":"#F00","shape":{"cy":10,"cx":245,"type":"ellipse","rx":5,"ry":5}},{"fill":"#F00","shape":{"cy":100,"cx":125,"type":"ellipse","rx":5,"ry":5}},{"fill":"#F00","shape":{"cy":100,"cx":285,"type":"ellipse","rx":5,"ry":5}},{"fill":"#F00","shape":{"cy":100,"cx":345,"type":"ellipse","rx":5,"ry":5}},{"fill":"#F00","shape":{"cy":200,"cx":235,"type":"ellipse","rx":5,"ry":5}},{"fill":"#F00","shape":{"cy":200,"cx":335,"type":"ellipse","rx":5,"ry":5}},{"stroke":{"color":"blue","width":"1"},"fill":"#00F","shape":{"points":[{"y":15,"x":245},{"y":95,"x":125}],"type":"polyline"}},{"stroke":{"color":"blue","width":"1"},"fill":"#00F","shape":{"points":[{"y":15,"x":245},{"y":95,"x":285}],"type":"polyline"}},{"stroke":{"color":"blue","width":"1"},"fill":"#00F","shape":{"points":[{"y":15,"x":245},{"y":95,"x":345}],"type":"polyline"}},{"stroke":{"color":"blue","width":"1"},"fill":"#00F","shape":{"points":[{"y":105,"x":285},{"y":195,"x":235}],"type":"polyline"}},{"stroke":{"color":"blue","width":"1"},"fill":"#00F","shape":{"points":[{"y":105,"x":285},{"y":195,"x":335}],"type":"polyline"}}]';
	/*  [{"fill":"#F00","shape":{"cy":"10","cx":"10","type":"ellipse","rx":"5","ry":"5"}}]  */
	var json2='[{"shape":{"cx":50,"cy":200,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"shape":{"cx":60,"cy":167,"rx":5,"ry":5,"type":"ellipse"},"fill":"#F00"},{"shape":{"points":[{"x":60,"y":172},{"x":60,"y":180},{"x":50,"y":180},{"x":50,"y":192}],"type":"polyline"},"stroke":{color: "blue", width: 1}},{"shape":{"points":[{"x":50,"y":197},{"x":47,"y":192},{"x":53,"y":192},{"x":50,"y":197}],"type":"polyline"},"stroke":{color: "blue", width: 1},"fill":"#00F"}]';
	var container = dojo.byId("gfx");
	surface = dojox.gfx.createSurface(container, 500, 500);
	var g1 = surface.createGroup();
	//var r1 = g1.createShape(dojo.fromJson(json));
	//dojox.gfx.utils.deserialize(g1, names[0]);
	dojox.gfx.utils.fromJson(g1, sjson);
	//new dojox.gfx.Moveable(group);
});

});







</script>


</head>
<body>

<%

Enumeration <String> pNames=request.getParameterNames();
while(pNames.hasMoreElements()){
    String name=(String)pNames.nextElement();
    String value=request.getParameter(name);
    out.print(name + "=" + value);
}



%>

<div dojoType="dojox.drawing.Drawing" id="drawingNode" jsId="myDrawing" drawingType="canvas" class="drawing"  >
		</div>


<br>
<span> this is the gfx examples:</span>

<div id="gfx" style="width: 500px; height: 500px; border: solid 1px black;">
				</div>


</body>
</html>