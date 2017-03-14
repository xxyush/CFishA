<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %> 
<%@ page import="java.io.IOException" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>初始配置</title>
<link href="./default.css" rel="stylesheet" type="text/css" />
<link href="./divShape.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function expand(obj,index)
{
	var divArray=document.body.getElementsByTagName("div");
	var i;
	
	for(i=0;i<divArray.length;++i)
	{
		if(divArray[i].getAttribute("name")==index)
		{
			divArray[i].style.display="block";
		}
		else if(divArray[i].getAttribute("name")!=null)
		{
			divArray[i].style.display="none";
		}
		
		if(divArray[i].getAttribute("name")==null)
		{
			divArray[i].style.border="none";
		}
	}
	
	obj.style.borderStyle="solid";
	obj.style.borderWidth="2px";
	obj.style.borderColor="blue";
}

function flash(n,m,k){//闪动效果的制作'''''''''''''''''''''''''''''''''''''''
	
	
	var msecs = 1000; //改变时间得到不同的闪烁间隔，这里代表1秒
     document.getElementById(""+((n)*10000+(m)*10+k)+"").style.visibility =
	(document.getElementById(""+((n)*10000+(m)*10+k)+"").style.visibility =="hidden")?"visible" : "hidden";
	setTimeout("flash()",msecs);
	}
function handleStarType(color)//这个函数根据颜色使五角形用不同颜 色显示
{
	var s;
	 
	if(color==""){
	  s="star-five";
	}
	 else if(color=="red"){
	  s="star-five-red";
	}
	 else if(color=="green"){
	 s="star-five-green";
	}
	else if(color=="gray"){
	  s="star-five";
	}
	 else if(color=="yellow"){
		 s="star-five-yellow";
	 }
	  
	
	return s;



}


function handleDiamondClassType(color){//这个函数根据颜色使菱形用不同颜色显示
	var s;
	if(color==""||color=="gray"){
	  s="diamond";
	}else if(color=="red"){
	  s="diamond-red";
	}else if(color=="green"){
	 s="diamond-green";
	}else{
	  s="diamond-yellow";
	}
	return s;
}


function initialDiv()//初始化各个图形为灰色
{

	  var i;
	  var j;
	  for(i=0;i<13;++i)//i是器件号
		{
			for(j=0;j<10;++j)//j是机柜号
			{
				if(i<7 || (i==7 && j!=5 && j!=8) || (i>7 && j<5))
				{
					 
					
					 document.getElementById(""+((j+1)*10000+(i+1)*10+1)+"").style.background="gray";
					 document.getElementById(""+((j+1)*10000+(i+1)*10+2)+"").style.background="gray";
					 document.getElementById(""+((j+1)*10000+(i+1)*10+3)+"").style.borderBottomColor="gray";
					 document.getElementById(""+((j+1)*10000+(i+1)*10+4)+"").className="star-five";
					 document.getElementById(""+((j+1)*10000+(i+1)*10+5)+"").className="diamond";
					 
				}
			}
		}
	 
}


function handleMessage(message)//处理传递来的信息，改变控件的颜色
  {
	  
     var elementForeId=parseInt(message[0]*10000+message[1]*10);
    if(document.getElementById(""+(elementForeId+1)+"")!=null){
        document.getElementById(""+(elementForeId+1)+"").style.background=message[2];
        if(message[2]=="red"){
        	flash(message[0],message[1],1);
        }
    }
    if(document.getElementById(""+(elementForeId+2)+"")!=null){
        document.getElementById(""+(elementForeId+2)+"").style.background=message[3];
    }
    if(document.getElementById(""+(elementForeId+3)+"")!=null){
       
      document.getElementById(""+(elementForeId+3)+"").style.borderBottomColor=message[4];

    }
   // if(document.getElementById(""+(elementForeId+4)+"")!=null){//网络信息单独处理，来自不同的表。
   //  document.getElementById(""+(elementForeId+4)+"").className=handleStarType(message[5]);
    // }
   if(document.getElementById(""+(elementForeId+5)+"")!=null){
    document.getElementById(""+(elementForeId+5)+"").className=handleDiamondClassType(message[5]);

    } 

}
function handleMessage_internet(message){//得到网络信息，然后进行处理，然后进行相应的变色
	var elementForeId=parseInt(message[0]*10000+message[1]*10);
	alert(handleStarType(message[2]))
	if(document.getElementById(""+(elementForeId+4)+"")!=null){
	     document.getElementById(""+(elementForeId+4)+"").className=handleStarType(message[2]);
	     }
	
}


function freshMessage()//刷新信息,由刷新按钮控制
  {
	var xmlhttp;
	var messageString;  //用来接收服务器传递来的字符串信息
    var messageStringSplit;  //信息字符串的第一次分割，分离出不同器件的信息
    var componentMessage;  //信息字符串的第二次分割，分离器件的不同指标的信息
    var messageEveryComponent;
    var messageInterNet;
    var i;
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
	         
                
           //alert("xmlhttp.readyState:"+xmlhttp.readyState+"xmlhttp.status:"+xmlhttp.status);
              
		 if(xmlhttp.readyState==4&&xmlhttp.status==200)
		  {
			   

			 messageString=xmlhttp.responseText;//读取servlet传递来的字符串信息
		         alert(messageString);
			
			 messageStringSplit=messageString.split("|");//按；分割出不同器件的信息

			 messagePart1=messageStringSplit[0];//第一部分信息是圆形，正方形，三角形代表的信息，即开关状态，温度，功率信息。```````
			 messagePart2=messageStringSplit[1];//第二部分所代表的是五角星所代表的信息即网络转台信息
			   alert(messagePart1);
		       alert(messagePart2);
              messageEveryComponent=messagePart1.split(";");
                for(i=0;i<messageEveryComponent.length-1;i++)
			   {
                      
            	    //alert(messageEveryComponent[i]);
					componentMessage=messageEveryComponent[i].split(",");//分割得到每个器件的各项不同信息
					alert(componentMessage);
					handleMessage(componentMessage);//调用处理信息的函数，控制个标志的颜色
    		   }
                messageInterNet=messagePart2.split(";");
			  for(i=0;i<messageInterNet.length-1;i++){
				  componentMessage= messageInterNet[i].split(",");//分割得到每个器件的网络信息 
				  alert(componentMessage);
				  handleMessage_internet(componentMessage);
			  }

			}
		 
		}
		var validTime = document.getElementById("validTimeText").value;
		xmlhttp.open("GET", "/CFA/getInitialData?validTime=" + validTime, true);
		xmlhttp.setRequestHeader("If-Modified-Since", "0");
		xmlhttp.send();
		
  }
 
 
</script>

</head>

<body onload="">

<%
Date d=new Date();
java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
String sd=formatter.format(d);
%>

<div id="content">

	<div id="main">

		<div id="example" class="post">
			<h2 class="title"><span>==初始配置==</span></h2>
			<h3 class="date"><%=sd %></h3>
			<div class="story">
				<!--
				<img alt="" src="../../images/cabinets.png" style="position:absolute;margin-top:100px;margin-left:80px">
				<div id="cabinet0" style="position:absolute;margin-top:100px;margin-left:80px;background-color:green;height:10px;width:72px"></div>
				<div id="cabinet1" style="position:absolute;margin-top:100px;margin-left:152px;background-color:yellow;height:10px;width:72px"></div>
				<div id="cabinet2" style="position:absolute;margin-top:100px;margin-left:224px;background-color:green;height:10px;width:72px"></div>
				<div id="cabinet3" style="position:absolute;margin-top:100px;margin-left:296px;background-color:green;height:10px;width:72px"></div>
				-->

				<!--
				<div style="position:absolute;margin-top:50px;margin-left:0px;height:20px;width:40px;background-color:lightgreen"></div><div style="position:absolute;margin-top:50px;margin-left:50px;height:20px;">开启</div>
				<div style="position:absolute;margin-top:50px;margin-left:150px;height:20px;width:40px;background-color:yellow"></div><div style="position:absolute;margin-top:50px;margin-left:200px;height:20px;">休眠</div>
				<div style="position:absolute;margin-top:50px;margin-left:300px;height:20px;width:40px;background-color:red"></div><div style="position:absolute;margin-top:50px;margin-left:350px;height:20px;">关闭</div>
				
				<div style="position:absolute;margin-top:210px;margin-left:-50px;">CFA</div>
				<div style="position:absolute;margin-top:330px;margin-left:-50px;">机柜</div>
				<div style="position:absolute;margin-top:450px;margin-left:-50px;">组件</div>
				-->
				<%
				/*
				int i,j,k;
				for(i=0;i<1;++i)
				{
					out.write("<div style=\"position:absolute;margin-top:160px;margin-left:0px;background-color:lightgreen;height:100px;width:897px\"></div>");
					for(j=0;j<10;++j)
					{
						out.write("<div style=\"position:absolute;margin-top:280px;margin-left:"+(j*90)+"px;background-color:lightgreen;height:100px;width:87px\" onclick=\"expand(this,"+j+")\">"+(j+1)+"</div>");
						//out.write("<div style=\"position:absolute;margin-top:170px;margin-left:"+(j*90)+"px;background-color:lightgreen;height:100px;width:87px\"></div>");
						for(k=0;k<10;++k)
						{
							out.write("<div name=\""+j+"\" style=\"position:absolute;margin-top:400px;margin-left:"+(k*50+j*45)+"px;background-color:lightgreen;height:100px;width:47px;display:none\">"+(k+1)+"</div>");
						}
					}
				}
				*/
				%>

				<img src="../../images/cabinetsAbstract.jpg" style="position:absolute;margin-top:100px;margin-left:-70px">
				<%
				int basePositionX=-30;
				int basePositionY=195;
				int i,j;
				
				for(i=0;i<13;++i)//i是器件号
				{
					for(j=0;j<10;++j)//j是机柜号
					{
						if(i<7 || (i==7 && j!=5 && j!=8) || (i>7 && j<5))
						{
							out.write("<div id=\""+((j+1)*10000+(i+1)*10+1)+"\" class=\"circle\" style=\"position:absolute;margin-left:"+(basePositionX+98*j-5)+"px;margin-top:"+(basePositionY+31*i)+"px;\"></div>");
							out.write("<div id=\""+((j+1)*10000+(i+1)*10+2)+"\" class=\"square\" style=\"position:absolute;margin-left:"+(basePositionX+98*j+10)+"px;margin-top:"+(basePositionY+31*i)+"px;\"></div>");
							out.write("<div id=\""+((j+1)*10000+(i+1)*10+3)+"\" class=\"triangle-up\" style=\"position:absolute;margin-left:"+(basePositionX+98*j+25)+"px;margin-top:"+(basePositionY+31*i)+"px;\"></div>");
							out.write("<div id=\""+((j+1)*10000+(i+1)*10+4)+"\" class=\"star-five\" style=\"position:absolute;margin-left:"+(basePositionX+98*j+35)+"px;margin-top:"+(basePositionY+31*i+2)+"px;\"></div>");
							out.write("<div id=\""+((j+1)*10000+(i+1)*10+5)+"\" class=\"diamond\" style=\"position:absolute;margin-left:"+(basePositionX+98*j+55)+"px;margin-top:"+(basePositionY+31*i+79)+"px;\"></div>");
						}
					}
				}
				%>
                                 
                                <div style="position:absolute;margin-top:60px;margin-left:300px;">
                               <font font-size=1.3em color="black"><B>
                                <label for="tex1">输入信息的有效时间:</label>
                                <input type="text" id="validTimeText" name="validTime" style="height:25px">
                                  <label for="tex1">（单位为秒，默认为120秒）</label>
				<input type="button" value="刷新" onclick="javascript:freshMessage()" style="width:60px;height:30px" /> 
                               </B>
                               </font>
                            </div>

			</div>
		
		</div>

	</div>

</div>

<div style="position:absolute;margin-top:715px;margin-left:120px;font-size:1.3em;color:black"><B><font  color="green" >绿色</font>---正常</B></div>
<div style="position:absolute;margin-top:715px;margin-left:215px;font-size:1.3em;color:black"><B><font  color="yellow">黄色</font>---中间状态</B></div>
<div style="position:absolute;margin-top:715px;margin-left:310px;font-size:1.3em;color:black"><B><font color="red">红色</font>---故障</B></div>

<div  class="circle" style="position:absolute;margin-top:720px;margin-left:530px;color:black"></div>
<div style="position:absolute;margin-top:715px;margin-left:545px;font-size:1.3em;color:black"><B>表示电源状况</B></div>

<div  class="square" style="position:absolute;margin-top:720px;margin-left:660px;color:black"></div>
<div style="position:absolute;margin-top:715px;margin-left:675px;font-size:1.3em;color:black"><B>表示功率状况</B></div>

<div  class="triangle-up" style="position:absolute;margin-top:717px;margin-left:790px;color:black"></div>
<div style="position:absolute;margin-top:715px;margin-left:805px;font-size:1.3em;color:black"><B>表示温度状况</B></div>

<div  class="star-five" style="position:absolute;margin-top:720px;margin-left:915px;color:black"></div>
<div style="position:absolute;margin-top:715px;margin-left:930px;font-size:1.3em;color:black"><B>表示网络状况</B></div>

<div  class="diamond" style="position:absolute;margin-top:755px;margin-left:1040px;color:black"></div>
<div style="position:absolute;margin-top:715px;margin-left:1055px;font-size:1.3em;color:black"><B>其他(备用)</B></div>


</body>
</html>
