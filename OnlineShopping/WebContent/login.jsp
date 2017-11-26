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
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome <strong> </strong></div>

</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp" style="color:orange;"><h3>SHop&Joy</h3></a>
		<form class="form-inline navbar-search" method="post" action="products.jsp" >
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt">
		<%
try
{
	Connection connection=DBConnection.getConnection();
		String sql="select * from category";
	PreparedStatement statement=connection.prepareStatement(sql);
	ResultSet set=statement.executeQuery();
	
	//set.next();
	while(set.next())
	{
		 String cat= set.getString("Category");
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
	
	 <li class=""><a href="adminlogin.jsp">Admin Login</a></li>
	 <li class=""><a href="register.jsp">Register</a></li>
	 	  <li class=""><a href="login.jsp">Login</a></li>
	 <li class="">
	 
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
<%@ include file="sidebar2.jsp" %>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Login</li>
    </ul>
	<h3> Login</h3>	
	<hr class="soft"/>
	
	<div class="row">
	
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			<h5>ALREADY REGISTERED ?</h5>
		<%
		String regid="";
			try{
				String email=request.getParameter("mail");
				String pswd=request.getParameter("pswd");
				Connection connection=DBConnection.getConnection();
				String sql="select * from register where Email='"+email+"' && Password='"+pswd+"'";
				PreparedStatement statement=connection.prepareStatement(sql);
				ResultSet set=statement.executeQuery();
				if(set.first())
				{
					regid=set.getString("Reg_Id");
					//out.print(regid);
					HttpSession session2= request.getSession();
					if(session2!=null)
					{
					//String id=session.getId();
					session2.setAttribute("user",regid);
					session2.setMaxInactiveInterval(60*60);
			    
					}
					response.sendRedirect("userhome.jsp?Reg_Id="+regid);
				}
				else
				{
				
				}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>
			<form method="get" action="">
			  <div class="control-group">
				<label class="control-label" for="inputEmail1">Email</label>
				<div class="controls">
				  <input class="span3"  type="email" id="inputEmail1" placeholder="Email" name="mail">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword1">Password</label>
				<div class="controls">
				  <input type="password" class="span3"  id="inputPassword1" placeholder="Password" name="pswd">
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="btn">Sign in</button> <a href="forgetpass.jsp">Forget password?</a>
				</div>
			  </div>
			  <p><h4>If you are not registered Click  &nbsp;&nbsp;<a href="register.jsp"><strong><span style="color:red">here</span></strong></a>  &nbsp;&nbsp;for Registration</h4> </p>	

			</form>
		</div>
		</div>
	</div>	
	
</div>
</div></div>
</div>

	
<%@ include file="footer.jsp" %>
</body>
</html>