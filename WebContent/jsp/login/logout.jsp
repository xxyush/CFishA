<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>注销登录</title>
</head>
<% session.invalidate(); 
response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
%>
<body >
<h3>您已经成功注销登录。</h3>
</body>
</body>
</html>