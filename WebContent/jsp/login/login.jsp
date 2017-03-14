<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎进入国家863重点项目:CFA系统可重构特色展示与数据组织评估系统！</title>


<link rel="stylesheet" type="text/css"  href="/CFA/jsp/login/login.css" />


<script type="text/javascript">
function showNumbers(){
	var oImg = document.getElementById("ValidationNumbersImg");
	oImg.src="/CFA/getRandomNumbersImage?" +Math.random();
}


</script>

</head>
<body  >
<center >
<div id="container">
<div id="header" align="center">


			<form>
				<h2 >国家高技术研究发展计划（863计划）重点项目</h2>
				<h2>新概念高效能计算机体系结构及系统研究开发（2009AA012201）</h2>
				<h1 style="color:red">系统可重构特色展示与数据组织评估</h1>
				
			</form>
</div>


<div  id="left">  <img id="leftimg" alt="可重构绿色计算" src="<%=request.getContextPath()%>/images/loginLeft.jpg" >    </div>
<div   id="right" align="left" >
<form  id="loginForm"
            method="POST"
            action="login">
    <div class="grouping">
  <h2 id="loginTitle">用户登录</h2>     
<label>用户名:</label>
<input type="text" name="loginName" size="20" title="用户名" >

<label>密&nbsp;&nbsp;码:</label>
<input type="password" name="password" size="20" title="密码">
<label>验证码:</label>
<input id="validateInput" name="validate" size="20" title="验证码"  >
<img  id="ValidationNumbersImg" src="/CFA/getRandomNumbersImage" alt="点击图片验证码！" title="点击图片，刷新验证码！" onclick="showNumbers()" >
<input id="submitInpt"  type="submit" value="登录" > 
		

    
    
    
    
	</div>
</form>

</div>
</div>
</center>


</body>
</html>
