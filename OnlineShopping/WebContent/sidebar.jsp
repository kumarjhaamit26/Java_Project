
<%@page import="com.forget.DBConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
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


<div id="sidebar" class="span3">
	
		<%
String category=null;
try
{
Connection connection=	DBConnection.getConnection();
PreparedStatement statement= connection.prepareStatement("select * from category");
ResultSet set=statement.executeQuery();
while(set.next())
{
	category=set.getString("Category");
	%>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a href="v.jsp?Category=<% out.print(category);%>"><% out.print(category); %></a>
			
			</li>
			
		</ul>
			<% 
}
}

catch(Exception e)
{
	}
%>
		<br/>
		<% 
		String name=null;
		String id3=null;
	try{
	Connection connection2=	DBConnection.getConnection();
		PreparedStatement statement2= connection2.prepareStatement("select * from product order by Product_Id DESC limit 0,2 ");
		ResultSet set2=statement2.executeQuery();
		int img=1;
		
		while(set2.next())
		{
	    name=set2.getString("Product_Name");	
	    id3=set2.getString("Product_Id");
	    int price=set2.getInt("Price");
	    InputStream inputStream= set2.getBinaryStream("PHOTO");
	    File file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\sidebarpic\\image"+img+".jpg");
	    //out.println("img = " + img);
	    img=img+1;
	    FileOutputStream fileOutputStream=new FileOutputStream(file);

	    byte[] bs=new byte[10240];
	    int j;
	    while((j=inputStream.read(bs)) !=-1)
	    {
	    	fileOutputStream.write(bs, 0,j);
	    	
	    }
		
	%>
		  <div class="thumbnail">
			<% 	out.print("<img src='"+file+"' alt=''/> ");%>
			<div class="caption">
			  <h5><%= name %></h5>
				<h4 style="text-align:center"><a class="btn" href="editproduct.jsp?Product_Id=<% out.print(id3);%>">Edit</a> <a class="btn" href="deleteproduct.jsp?Product_Id=<% out.print(id3); %>">Delete</a> <a class="btn btn-primary" href="#"> &#8377; &nbsp;<% out.print(price); %></a></h4>
			</div>
		  </div><br/>
		  <% 
		  fileOutputStream.close();
		  }
	}
		catch(Exception e)
		{
			
		}
		%>
		<br/>
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>
</body>
</html>