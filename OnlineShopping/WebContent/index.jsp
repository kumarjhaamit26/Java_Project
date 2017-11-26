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
    <meta charset="utf-8">
    <title>SHop&Joy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
</head>
<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome<strong> </strong></div>

</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp" style="color:hotpink"><h3>SHop&Joy</h3></a>
		<form class="form-inline navbar-search" method="post" action="login.jsp" >
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt">
		<%
try
{
	Connection connection=DBConnection.getConnection();
	String sql="select * from category";
	PreparedStatement statement=connection.prepareStatement(sql);
	ResultSet set=statement.executeQuery();
	
	//set.next();
	while(set.next())
	{
		 String cat= set.getString("Category");
		 out.print("<option value='"+cat+"'>"+cat+"</option>");
	}
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
		</select> 
		  <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
    </form>
    <ul id="topMenu" class="nav pull-right">

	 <li class=""><a href="adminlogin.jsp">Admin Login</a></li>
	 <li class=""><a href="register.jsp">Register</a></li>
	  <li class=""><a href="login.jsp">Login</a></li>
	 <li class="">
	   
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/1.png" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/2.png" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="register.html"><img src="themes/images/carousel/3.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/4.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/5.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			</div>
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/6.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<%@ include file="sidebar2.jsp" %>
<!-- Sidebar end=============================================== -->
		<div class="span9">		
			<div class="well well-small">
			<h4>Featured Products <small class="pull-right"></small></h4>
			<div class="row-fluid">
			<div id="featured" class="carousel slide">
			<div class="carousel-inner">
			  <div class="item active">
			  <ul class="thumbnails">
			  <% 
		String name2=null;
		String id1=null;
		int price=0;
	try{
	Connection connection2=	DBConnection.getConnection();
		PreparedStatement statement2= connection2.prepareStatement("select * from product order by Product_Id ASC limit 0,4 ");
		ResultSet set2=statement2.executeQuery();
		int img=1;
		
		while(set2.next())
		{
	    name2=set2.getString("Product_Name");	
	    id1=set2.getString("Product_Id");
	     price=set2.getInt("Price");
	    InputStream inputStream= set2.getBinaryStream("PHOTO");
	    File file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\image"+img+".jpg");
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
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<% out.print("<img src='"+file+"'>"); %>
					<div class="caption">
					  <h5><% out.print(name2); %></h5>
					  <h4><a class="btn" href="userviewproduct.jsp?Product_Id=<% out.print(id1); %>">VIEW</a> <span class="pull-right">&#8377; &nbsp;<%  out.print(price); %></span></h4>
					</div>
				  </div>
				</li>
				  <% 
		  fileOutputStream.close();
		  }
	}
		catch(Exception e)
		{
			
		}
		%>
			  </ul>
			  </div>
			  
			  
			  </div>
			  
			  </div>
			  </div>
		</div>
		<h4>Latest Products </h4>
			  <ul class="thumbnails">
			    <% 
		String name1=null;
		String id4=null;
		int price2=0;
	try{
	Connection connection2=	DBConnection.getConnection();
		PreparedStatement statement2= connection2.prepareStatement("select * from product order by Product_Id DESC limit 0,6 ");
		ResultSet set2=statement2.executeQuery();
		int img=1;
		
		while(set2.next())
		{
	    name1=set2.getString("Product_Name");	
	    id4=set2.getString("Product_Id");
	     price2=set2.getInt("Price");
	    InputStream inputStream= set2.getBinaryStream("PHOTO");
	    File file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\images\\latestproduct\\image"+img+".jpg");
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
				<li class="span3">
				  <div class="thumbnail">
					<% out.print("<img src='"+file+"'>"); %>
					<div class="caption">
					  <h5><% out.print(name1); %></h5>
					 
					  <h4 style="text-align:center"><a class="btn" href="userviewproduct.jsp?Product_Id=<% out.print(id4); %>">View</a> <a class="btn" href="addtocart.jsp?Product_Id=<%=id4 %> %>">Add to Cart</a> &#8377; &nbsp;<%out.print(price2); %></h4>
					</div>
				  </div>
				</li>
				
					  <% 
		  fileOutputStream.close();
		  }
	}
		catch(Exception e)
		{
			
		}
		%>	
				
			
				
			  </ul>	

		</div>
		</div>
	</div>
</div>
<!-- Footer ================================================================== -->
	<%@ include file="footer.jsp" %>
</body>
</html>