<%@page import="com.forget.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.forget.SendingEmailForPassword"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome<strong> </strong></div>

</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp" style="color:hotpink"><h3>Dahiya Boy</h3></a>
		<form class="form-inline navbar-search" method="post" action="login.jsp" >
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
<jsp:include page="sidebar2.jsp"></jsp:include>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="userhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Forget password?</li>
    </ul>
	<h3> FORGET YOUR PASSWORD?</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span9" style="min-height:900px">
			<div class="well">
			<h5>Reset your password</h5><br/>
			Please enter the email address for your account. A verification code will be sent to you. Once you have received the verification code, you will be able to choose a new password for your account.<br/><br/><br/>
			<%
			String email=request.getParameter("email");
					int num=(int)(Math.random()*10000);
					String number=""+num;
			
					if(email!=null)
					{
					
			int sent=SendingEmailForPassword.send("manojdahiya001@gmail.com", "manoj000", email, "Recover Password","your verification code is "+number);
			if(sent==0)
			{
				out.print("sent");
				try{
				Thread.sleep(4000);
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				}
				
				
			}
			else
			{
				out.print("failed");
			}
				
					}
			%>
			<form method="get" action="recoverpassword.jsp">
			  <div class="control-group">
				<label class="control-label" for="inputEmail1">Email</label>
				<div class="controls">
				  <input class="span3"  type="email" id="inputEmail1" placeholder="Email" name="email">
				</div>
			  </div>
			  <div class="control-group">
				
				<div class="controls">
				  <input type="hidden" class="span3"  id="inputPassword1"  name="number" value="<%= number%>">
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="btn">Recover</button>
				</div>
			  </div>
			  <p><h4>If you are not registered Click  &nbsp;&nbsp;<a href="register.jsp"><strong><span style="color:red">here</span></strong></a>  &nbsp;&nbsp;for Registration</h4> </p>	

			</form>
		</div>
		</div>
	</div>	
	
</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>