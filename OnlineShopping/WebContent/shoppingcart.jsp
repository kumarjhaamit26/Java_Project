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
  
  <h2 style="color:#3a3f44">Your Shopping Cart</h2>

			 <table bgcolor="hotpink" bordercolor="black" style ="width:100%" cellpadding  ="20" border='5'>
			   <tr><th>Product Name</th><th>Model</th><th>Price</th><th>Action</th></tr>
<%
String sid=request.getParameter("Reg_Id");
int proid;
String proname;
String promodel;
int price;
try
{
	Connection connection=DBConnection.getConnection();
		PreparedStatement statement=connection.prepareStatement("select * from shoppingcart where Reg_Id='"+sid+"'");
	ResultSet set= statement.executeQuery();
	while(set.next())
	{
	proid=set.getInt("Product_Id");
	proname=set.getString("Product_Name");
	promodel=set.getString("Model");
	price=set.getInt("Price");
	%>
<tr><td style="text-align:center"><%= proname %></td><td style="text-align:center"><%= promodel %></td>
<td style="text-align:center"><%= price %> &nbsp; &nbsp; &#8377;</td>
<td style="text-align:center" ><a href="buyproduct.jsp?Product_Id=<%= proid%>">Buy</a>/<a href="removefromcart.jsp?Product_Id=<%= proid%>">Remove</a></td></tr>

	<% 
	}
	
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