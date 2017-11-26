<%@page import="com.forget.DBConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<jsp:include page="adminheader.jsp"></jsp:include>
<div id="mainBody">
	<div class="container">
	<div class="row">
<jsp:include page="sidebar.jsp"></jsp:include>
<%
Connection connection=null;
PreparedStatement statement=null;
ResultSet set=null;
int count=0;

try{
	connection=DBConnection.getConnection();
		statement=connection.prepareStatement("select * from product");
set=statement.executeQuery();
while(set.next())
{
count=count+1;

%>
<% 
}
 	
	
}

catch(Exception e)
{
	e.printStackTrace();
	}
%>
<div class="span9">
    <ul class="breadcrumb">
		<li><a href="adminhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Products</li>
    </ul>
	<h3> Products Name <small class="pull-right"><h3><% out.print(count+" "); %></h3><span>products are available</span></small></h3>	
	<hr class="soft"/>
	<p>
		Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - that is why our goods are so popular and we have a great number of faithful customers all over the country.
	</p>
	<hr class="soft"/>
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">Sort By </label>
			<select>
              <option>Product name A - Z</option>
              <option>Product name Z - A</option>
           
            </select>
		</div>
	  </form>
	  
<div id="myTab" class="pull-right">
 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
<%

int id=0;
String name=null;
String description=null;
int price=0;
File file=null;
try{
	connection=DBConnection.getConnection();
	statement=connection.prepareStatement("select * from product");
set=statement.executeQuery();
int img=1;
while(set.next())
{

id=set.getInt("Product_Id");
name=set.getString("Product_Name");
description=set.getString("Description");
price=set.getInt("Price");
String model =set.getString("Model");
InputStream inputStream= set.getBinaryStream("PHOTO");
file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\image"+img+".jpg");
img=img+1;
FileOutputStream fileOutputStream=new FileOutputStream(file);

byte[] bs=new byte[10240];
int j;
//response.setContentType("image/jpg");
while((j=inputStream.read(bs)) !=-1)
{
	fileOutputStream.write(bs, 0,j);
	
}
fileOutputStream.close();
%>


	
		<div class="row">	  
			<div class="span2">
				<% 	
				System.out.print(file);
				out.print("<img src='"+file+"' alt=''/> ");%>
			</div>
			<div class="span4">
				<h3><% out.print(name); %></h3>				
				<hr class="soft"/>
				<h5><% out.print(model); %> </h5>
				<p>
				<% out.print(description); %>
				</p>
				<a class="btn btn-small pull-right" href="editproduct.jsp?Product_Id=<% out.print(id); %>">Edit</a>
				<a class="btn btn-small pull-right" href="deleteproduct.jspProduct_Id=<% out.print(id); %>">Delete</a>
				<a class="btn btn-small pull-right" href="productsummary.jsp?Product_Id=<%out.print(id);%>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3>&#8377; &nbsp; <% out.print(price); %></h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				
				
				</form>
			</div>
		</div>
		<hr class="soft"/>
	
<% 
}
 	
	
}

catch(Exception e)
{
	e.printStackTrace();
	}
%>
</div>
	<div class="tab-pane  active" id="blockView">
			<ul class="thumbnails">
	<%

int id2=0;
String name2=null;
String description2=null;
int price2=0;
try{
	connection=DBConnection.getConnection();
	 statement=connection.prepareStatement("select * from product");
set=statement.executeQuery();
int img=1;
while(set.next())
{

id2=set.getInt("Product_Id");
name2=set.getString("Product_Name");
description2=set.getString("Description");
price2=set.getInt("Price");
String model2=set.getString("Model");
InputStream inputStream= set.getBinaryStream("PHOTO");
file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\image"+img+".jpg");
img=img+1;
FileOutputStream fileOutputStream=new FileOutputStream(file);

byte[] bs=new byte[10240];
int j;
//response.setContentType("image/jpg");
while((j=inputStream.read(bs)) !=-1)
{
	fileOutputStream.write(bs, 0,j);
	
}
fileOutputStream.close();
%>

			<li class="span3">
			  <div class="thumbnail">
				<% 	out.print("<img src='"+file+"' alt=''/> ");%>
				<div class="caption">
				  <h5><% out.print(name2); %></h5>
				  <p> 
			<% out.print(description2); %>
				  </p>
				   <h4 style="text-align:center"><a class="btn" href="editproduct.jsp?Product_Id=<%out.print(id2);%>">Edit</a> <a class="btn" href="deleteproduct.jsp?Product_Id=<%out.print(id2);%>">Delete</a> <a class="btn" href="productsummary.jsp?Product_Id=<%out.print(id2);%>">View Details</a> <a class="btn btn-primary" href="#">&#8377; &nbsp;<%out.print(price2); %></a></h4>
				</div>
			  </div>
			</li>
				
<% 
}
 	
	
}

catch(Exception e)
{
	e.printStackTrace();
	}
%>
		  </ul>
	<hr class="soft"/>
	</div>
</div>


			<br class="clr"/>
</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>