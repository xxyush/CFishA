<%
HttpSession mysession = request.getSession(false);
String username="";
String role="";
if (mysession!=null && mysession.getValueNames().length > 0)
{	 
	  username=(String) mysession.getAttribute("username"); 
	  role=(String) mysession.getAttribute("role"); 

	if(username.equals("")|| role.equals(""))
	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");
}
else
	response.sendRedirect(request.getContextPath()+"/jsp/login/login.jsp");

%>