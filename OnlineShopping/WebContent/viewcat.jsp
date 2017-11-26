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
  
  <h2>Categories</h2>
			   <table bgcolor="hotpink" bordercolor="black" style ="width:100%" cellpadding  ="20" border='5'>
			   <tr><th>Category_Id</th><th>Category</th><th>Action</th></tr>
			   <%
			   try{
				 
			Connection connection=DBConnection.getConnection();
				   PreparedStatement statement=connection.prepareStatement("select * from category");
			  ResultSet set=statement.executeQuery();
			  while(set.next())
			  {
				String id=set.getString("Cat_Id"); 
				String cat=set.getString("Category");
			
			 %>
			 <tr><td><% out.print(id);%></td><td><% out.print(cat); %></td><td><a href="editcat.jsp?Cat_Id=<% out.print(id); %>">Edit</a>/<a href="deletecat.jsp?Cat_Id=<% out.print(id); %>">Delete</a></td></tr>
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