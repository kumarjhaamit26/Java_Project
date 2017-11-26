<%@page import="com.forget.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    <ul class="breadcrumb">
		<li><a href="adminhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Update Product</li>
    </ul>
	<h3> Update Product</h3>	
	<div class="well">
	<%
	String id=request.getParameter("Product_Id");
	out.print(id);

	try{
		String description2=request.getParameter("description");
		String quantit=request.getParameter("quan");
		int quantity2=Integer.parseInt(quantit);
		String pric=request.getParameter("price");
		int price2=Integer.parseInt(pric);
		Connection connection3=DBConnection.getConnection();	
		PreparedStatement statement3=connection3.prepareStatement("update product set Description=?,Quantity=?,Price=? where Product_Id='"+id+"'");
	       statement3.setString(1, description2);
	       statement3.setInt(2, quantity2);
	       statement3.setInt(3, price2);
	    int j=   statement3.executeUpdate();
	    if(j>0)
	    {
	   	response.sendRedirect("adminhome.jsp");
	    }
	}
	catch(Exception e)
	{
		
	}
	%>
	
<%

try{
	Connection connection2=DBConnection.getConnection();
		PreparedStatement statement2=connection2.prepareStatement("select * from product where Product_Id='"+id+"'");
		ResultSet set= statement2.executeQuery();
		while(set.next())
		{
		String description=set.getString("Description");
		int quantity=set.getInt("Quantity");
		int price=set.getInt("Price");

	%>
		
	<form class="form-horizontal" method="post" action="">
		<h4 style=color:red>Product Information</h4>
	
		 <div class="control-group">
			<label class="control-label" for="inputLnam">Description <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLnam" value="<% out.print(description); %>" name="description">
			</div>
		 </div>	
<div class="control-group">
		<label class="control-label" for="input_email">Quantity <sup>*</sup></label>
		<div class="controls">
		   <input type="number" id="input_email" value="<% out.print(quantity); %>" name="quan">
		 
		</div>
	  </div>	  
	<div class="control-group">
		<label class="control-label" for="inputPassword1">Price <sup>*</sup></label>
		<div class="controls">
		  <input type="number" id="inputPassword1" value="<% out.print(price); %>" name="price">
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
	<% 	
		}
	
}
catch(Exception e){
	
}
%>
</div>

</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<%@ include file="footer.jsp" %>
</body>
</html>
</body>
</html>