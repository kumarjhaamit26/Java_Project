<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
td{
text-align: center;
}
</style>
</head>
<body>
<%@ include file="adminheader.jsp" %>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<%@ include file="sidebar.jsp" %>
<!-- Sidebar end=============================================== -->
	<div class="span9">
  
  <h2>Users</h2>
			   <table bgcolor="hotpink" bordercolor="black" style ="width:100%" cellpadding  ="20" border='5'>
			   <tr><th>Id</th><th>Name</th><th>Email</th><th>Password</th><th>Date of Birth</th><th>Address</th><th>Country</th><th>Mobile</th><th>Home Phone</th></tr>
			   <%
			   try{
				 
		Connection connection=	DBConnection.getConnection();
				   PreparedStatement statement=connection.prepareStatement("select * from register");
			  ResultSet set=statement.executeQuery();
			  while(set.next())
			  {
				String id=set.getString("Reg_Id"); 
				String fname=set.getString("First_Name");
				String lname=set.getString("Last_Name");
				String name4=fname+" "+lname;
				String email=set.getString("Email");
				String pass=set.getString("Password");
				String dob=set.getString("DOB");
				String address=set.getString("Address");
				String country=set.getString("Country");
				String phone=set.getString("Home_Phone");
				String mobile=set.getString("Mobile_Phone");
			
			 %>
			 <tr><td><% out.print(id);%></td><td><% out.print(name4); %></td><td><% out.print(email); %></td>
			 <td><% out.print(pass); %></td><td><% out.print(dob); %></td><td><% out.print(address); %></td>
			 <td><% out.print(country); %></td><td><% out.print(phone); %></td><td><% out.print(mobile); %></td>
			</tr>
			 <%
			  }
			   }
			   catch(Exception e)
			   {
				   
			   }
			   %>
			   
			   </table>
		
	
	
</div>
</div></div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>