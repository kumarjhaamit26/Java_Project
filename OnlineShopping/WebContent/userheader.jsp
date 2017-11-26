<%@page import="com.forget.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <title>SHop&Joy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
</head>
<body>
<% 
String id2=request.getParameter("Reg_Id");
String id="";
HttpSession httpSession= request.getSession(false);
if(httpSession!=null)
{
	if(httpSession.getMaxInactiveInterval()>(60*60))
	{
		out.print("session is expired");
	response.sendRedirect("index.jsp");	
	}
	else{
	id=(String)httpSession.getAttribute("user");
	}
	}
else if(httpSession==null)
{
response.sendRedirect("login.jsp");	
	
}
%>
<%
String name=null;
try{
Connection connection=	DBConnection.getConnection();
		String sql="select * from register where Reg_Id="+id;
	PreparedStatement statement=connection.prepareStatement(sql);
	ResultSet set=statement.executeQuery();
	if(set.first())
	{
	name=set.getString("First_Name");	

	}
	
}
catch(Exception e)
{
	}

%>
	<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome <strong> <%= name %></strong></div>
	<%
		if(name==null)
	{
	RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");	
	dispatcher.forward(request, response);
	}%>
	<div class="span6">
	<div class="pull-right">
		
	</div>
	</div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>

  <div class="navbar-inner">
    <a class="brand" href="userhome.jsp" style="color:hotpink"><h3>SHop&Joy</h3></a>
		<form class="form-inline navbar-search" method="post" action="products.jsp" >
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt" name="category">
		<%
		 String cat="";
try
{
	Connection connection=DBConnection.getConnection();
	String sql="select * from category";
	PreparedStatement statement=connection.prepareStatement(sql);
	ResultSet set=statement.executeQuery();
	
	//set.next();
	while(set.next())
	{
		  cat= set.getString("Category");
		 out.print("<option value='"+cat+"'>"+cat+"</option>");
	}
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
		</select> 
		  <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
    </form>
    <ul id="topMenu" class="nav pull-right">
     <li class=""><a href="latestproduct.jsp">Latest Products</a></li>
	 <li class=""><a href="viewprofile.jsp?Reg_Id=<%= id%>">Profile</a></li>
	 <li class=""><a href="shoppingcart.jsp?Reg_Id=<%= id%>">Shopping Cart</a></li>

	 <li class=""><a href="logout.jsp">LogOut</a></li>
	 <li class="">
	 
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal loginFrm">
			  <div class="control-group">								
				<input type="text" id="inputEmail" placeholder="Email">
			  </div>
			  <div class="control-group">
				<input type="password" id="inputPassword" placeholder="Password">
			  </div>
			  <div class="control-group">
				<label class="checkbox">
				<input type="checkbox"> Remember me
				</label>
			  </div>
			</form>		
			<button type="submit" class="btn btn-success">Sign in</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		  </div>
	</div>
	</li>
    </ul>
  </div>
</div>
</div>
</div>
</body>
</html>