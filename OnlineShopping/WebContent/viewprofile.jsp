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
<style >
.button{
background-color:#3a3f44;
color:white;
text-align: center;
padding: 12px 26px;
font-size: 16px;

}
</style>
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
		<li class="active">Profile</li>
    </ul>

<table style ="width:100%" cellpadding  ="20">
<%
String id=request.getParameter("Reg_Id");
try
{
	Connection connection=DBConnection.getConnection();
	String sql="select * from register where Reg_Id="+id;
	PreparedStatement statement=connection.prepareStatement(sql);
	ResultSet set= statement.executeQuery();
	set.first();
	
	String fname=set.getString("First_Name");
	String lname=set.getString("Last_Name");
	String name=fname+" "+lname;
	String email=set.getString("Email");
	String dob=set.getString("DOB");
	String address=set.getString("Address");
	String mobile=set.getString("Mobile_Phone");
	%>

<tr><td>Name</td><td><%= name %></td></tr>
<tr><td>Email</td><td><%= email %></td></tr>
<tr><td>Date-Of-Birth</td><td><%= dob %></td></tr>
<tr><td>Address</td><td><%= address %></td></tr>
<tr><td>Mobile</td><td><%= mobile %></td></tr>
<tr><td><a href="deleteprofile.jsp?Reg_Id=<%= id %>"><button type="submit" class="button" name="delete">Delete</button></a></td>
<td><a href="updateprofile.jsp?Reg_Id=<%= id %>"><button type="submit" class="button" name="update">Update</button></a></td></tr>

	<% 
	
}
catch(Exception e)
{
	e.printStackTrace();
	}
%>		
</table>		

	
</div>
</div></div></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>