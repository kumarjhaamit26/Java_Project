<%@page import="com.forget.DBConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
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
		<li class="active">Latest Products</li>
    </ul>
		<h4>Latest Products </h4>
			  <ul class="thumbnails">
			  <%
			  int proid;
			  String proname="";
			  String model="";
			  int price;
			  
			  try{
				Connection connection=	DBConnection.getConnection();
				  PreparedStatement statement=connection.prepareStatement("select * from product order by Product_Id DESC Limit 0,5");
				ResultSet set=statement.executeQuery();
				int img=1;
				while(set.next())
				{
				proid=set.getInt("Product_Id");	
				proname=set.getString("Product_Name");
				model=set.getString("Model");
				price=set.getInt("Price");
				InputStream inputStream=set.getBinaryStream("PHOTO");
			File file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\latestproduct\\image"+img+".jpg");
			img=img+1;
			FileOutputStream fileOutputStream=new FileOutputStream(file);
			byte[] bs=new byte[10240];
			int j;
			while((j=inputStream.read(bs)) !=-1)
			{
				fileOutputStream.write(bs, 0, j);
			}
				%>
			
				<li class="span3">
				  <div class="thumbnail">
					<% out.print("<img src='"+file+"' alt=''/>"); %>
					<div class="caption">
					  <h5><%= proname %></h5>
					  <p> 
						<%= model %> 
					  </p>
					 
					  <h4 style="text-align:center"><a class="btn" href="userviewproduct.jsp?Product_Id=<%= proid%>">View</a> <a class="btn" href="buyproduct.jsp?Product_Id=<%= proid%>">Buy</a> <a class="btn btn-primary">&#8377; &nbsp;<%= price%></a></h4>
					</div>
				  </div>
				</li>
					<% 
					fileOutputStream.close();
				}
				
			  }
			  catch(Exception e)
			  {
				e.printStackTrace();  
			  }
			  %>
			  </ul>	

		</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>