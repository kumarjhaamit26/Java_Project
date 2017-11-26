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

</head>
<body>
<jsp:include page="userheader.jsp"></jsp:include>
<div id="mainBody">
	<div class="container">
	<div class="row">
<jsp:include page="sidebar2.jsp"></jsp:include>
<div class="span9">
    <ul class="breadcrumb">
		<li><a href="userhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Update Profile</li>
    </ul>
	<h3> Update Profile</h3>	
	<div class="well">
	<%
	String id=request.getParameter("Reg_Id");
	//out.print(id);
String name="";
String pswd="";
String email="";
String address="";
String zc="";
String mobile="";
	try{
	Connection connection=	DBConnection.getConnection();
		String sql="select * from register where Reg_Id="+id;
			PreparedStatement statement= connection.prepareStatement(sql);
			ResultSet set= statement.executeQuery();
		if(set.first())
		{
			name=set.getString("First_Name");
			pswd=set.getString("Password");
			email=set.getString("Email");
			address=set.getString("Address");
			zc=set.getString("ZipCode");
			mobile=set.getString("Mobile_Phone");
		}
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}
%>

	
	<%
	String fname=request.getParameter("name");
	String naddress=request.getParameter("address");
	String nmail=request.getParameter("email");
	String nzc=request.getParameter("zc");
	String nmobile=request.getParameter("mobile");
	String pass=request.getParameter("pswd");
	String npass=request.getParameter("newpass");
	String conpass=request.getParameter("confirmpass");
	if(pswd.equals(pass))
	{
		if(npass.equals(conpass))
		{
	try
	{
		Connection connection= DBConnection.getConnection();
		String sql="update register set First_Name=?,Address=?,Email=?,ZipCode=?,Mobile_Phone=?,Password=? where Reg_Id="+id;
      PreparedStatement statement=  connection.prepareStatement(sql);
      statement.setString(1, fname);
      statement.setString(2, naddress);
      statement.setString(3, nmail);
      statement.setString(4, nzc);
      statement.setString(5, nmobile);
      statement.setString(6, conpass);
     int j= statement.executeUpdate();
     if(j>0)
     {
    	 out.print("Updated");
   // response.sendRedirect("viewprofile.jsp");	 
     }
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}
		}
	}
	%>
	<form class="form-horizontal" method="post" action="">
		<h4 style=color:red>Your Information</h4>
	
		 <div class="control-group">
			<label class="control-label" for="inputLnam">Name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLnam" value="<%= name %>" name="name">
			</div>
		 </div>	
<div class="control-group">
		<label class="control-label" for="input_email">Email <sup>*</sup></label>
		<div class="controls">
		   <input type="email" id="input_email" value="<%= email %>" name="email">
		 
		</div>
	  </div>	  
	<div class="control-group">
		<label class="control-label" for="inputPassword1">Address <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="inputPassword1" value="<%= address %>" name="address">
		</div>
	  </div>
	  <div class="control-group">
		<label class="control-label" for="inputPassword1">Zip Code <sup>*</sup></label>
		<div class="controls">
		  <input type="number" id="inputPassword1" value="<%= zc %>" name="zc">
		</div>
	  </div>
	  <div class="control-group">
		<label class="control-label" for="inputPassword1">Mobile Number <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="inputPassword1" value="<%= mobile %>" name="mobile">
		</div>
	  </div>
	  	  <div class="control-group">
		<label class="control-label" for="inputPassword1"> Old Password <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="inputPassword1" placeholder="Old Password" name="pswd">
		</div>
	  </div>
	    <div class="control-group">
		<label class="control-label" for="inputPassword1"> New Password <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="inputPassword1" placeholder="New Password" name="newpass">
		</div>
	  </div>
	    <div class="control-group">
		<label class="control-label" for="inputPassword1"> Confirm Password <sup>*</sup></label>
		<div class="controls">
		  <input type="text" id="inputPassword1" placeholder="Confirm Password" name="confirmpass">
		</div>
	  </div>	  
	<div class="control-group">
			<div class="controls">
				<input type="hidden" name="email_create" value="1">
				<input type="hidden" name="is_new_customer" value="1">
				<input class="btn btn-large btn-success" type="submit" value="Submit" name="Submit"/>
			</div>
		</div>		
	</form>

</div>

</div>
</div></div></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>