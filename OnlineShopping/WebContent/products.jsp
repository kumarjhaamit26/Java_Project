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
<jsp:include page="userheader.jsp"></jsp:include>
<div id="mainBody">
	<div class="container">
	<div class="row">
<jsp:include page="sidebar2.jsp"></jsp:include>
<div class="span9">
    <ul class="breadcrumb">
		<li><a href="userhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Products</li>
    </ul>
	<hr class="soft"/>
	<hr class="soft"/>
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">Sort By </label>
			<select>
              <option>Priduct name A - Z</option>
              <option>Priduct name Z - A</option>
              
            </select>
		</div>
	  </form>
	  

<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
		
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> $140.00</h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br/>
			
			  <a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
			  <a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
			
				</form>
			</div>
		</div>
		
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				<a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
				</form>
			</div>
		</div>
<%
String category=request.getParameter("category");
try{
	Connection connection= DBConnection.getConnection();
	PreparedStatement statement=	connection.prepareStatement("select * from product where Category='"+category+"'");
	ResultSet set= statement.executeQuery();
	int img=1;
	while(set.next())
	{
String name=set.getString("Product_Name");
String model=set.getString("Model");
String description=set.getString("description");
int price=set.getInt("Price");
int id=set.getInt("Product_Id");
InputStream inputStream= set.getBinaryStream("PHOTO");
File file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\image"+img+".jpg");
//out.println("img = " + img);
img=img+1;
FileOutputStream fileOutputStream=new FileOutputStream(file);

byte[] bs=new byte[10240];
int j;
//response.setContentType("image/jpg");
while((j=inputStream.read(bs)) !=-1)
{
	fileOutputStream.write(bs, 0,j);
	
}

%>


	
		<div class="row">	  
			<div class="span2">
			<% 	out.print("<img src='"+file+"' alt=''/> ");%>
			</div>
			<div class="span4">
				<h3><% out.print(name); %></h3>				
				<hr class="soft"/>
				<h5><% out.print(model); %> </h5>
				<p>
				<% out.print(description); %>
				</p>
				<a class="btn btn-small pull-right" href="userviewproduct.jsp?Product_Id=<% out.print(id); %>">View</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3>&#8377; &nbsp; <% out.print(price); %></h3>
				<br/>
				
					<a href="addtocart.jsp?Product_Id=<%=id %>" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
			<a href="buyproduct.jsp?Product_Id=<%= id %>" class="btn btn-large btn-primary"> Buy</a>
			
				
				</form>
			</div>
		</div>
		<hr class="soft"/>
	
<% 
fileOutputStream.close();
}
 	
	
}

catch(Exception e)
{
	e.printStackTrace();
	}
%>
</div>

</div>


			<br class="clr"/>
</div>
</div></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>