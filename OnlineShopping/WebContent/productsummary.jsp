<%@page import="com.forget.DBConnection"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
	<div class="span9">
    <ul class="breadcrumb">
    <li><a href="adminhome.jsp">Home</a> <span class="divider">/</span></li>
    <li><a href="adminviewproduct.jsp">Products</a> <span class="divider">/</span></li>
    <li class="active">product Details</li>
    </ul>	
	<div class="row">
	<%
	String id=request.getParameter("Product_Id");
	//out.print(id);
	String category=null;
	File file=null;
	try
	{
		Connection connection=DBConnection.getConnection();
		PreparedStatement statement=connection.prepareStatement("select * from product where Product_Id='"+id+"'");
	ResultSet set= statement.executeQuery();
	int img=1;
	if(set.first())
	{
	String name=set.getString("Product_Name");
	String description=set.getString("Description");
	String quantity=set.getString("Quantity");
	String price=set.getString("Price");
	category=set.getString("Category");
	String brand=set.getString("Brand");
	String model=set.getString("Model");
	String date=set.getString("Released");
	String dimension=set.getString("Dimension");
	String display=set.getString("Display_Size");
	InputStream inputStream= set.getBinaryStream("PHOTO");
	file=new File("C:\\MyWork\\OnlineShopping\\WebContent\\imagebyid\\image"+img+".jpg");

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
	  
			<div id="gallery" class="span3">
           	<img src="<%=file %>" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera"/>
         
			
			  
			
			</div>
			<div class="span6">
				<h3><% out.print(name); %>  </h3>
				<small><% out.print(display); %> </small>
				<hr class="soft"/>
				<form class="form-horizontal qtyFrm">
				  <div class="control-group">
					<label class="control-label"><span>&#8377; &nbsp;<% out.print(price); %> </span></label>
					
				<select>
				<option>Quantity</option>
				<option value="<% out.print(quantity);%>"><% out.print(quantity);%></option>
				</select>
					 		
				  </div>
				</form>
				
				<hr class="soft"/>
				<h4><% out.print(quantity);%> items in stock</h4>
				<form class="form-horizontal qtyFrm pull-right">
				
				</form>
				<hr class="soft clr"/>
				<p>
				<% out.print(description);%>
				</p>
				<a class="btn btn-small pull-right" href="#detail">More Details</a>
				<br class="clr"/>
			<a href="#" name="detail"></a>
			<hr class="soft"/>
			</div>
	
			<div class="span9">
            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
              
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>
                <table class="table table-bordered">
				<tbody>
				<tr class="techSpecRow"><th colspan="2">Product Details</th></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand: </td><td class="techSpecTD2"><% out.print(brand);%></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Model:</td><td class="techSpecTD2"><% out.print(model); %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Released on:</td><td class="techSpecTD2"> <% out.print(date); %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Dimensions:</td><td class="techSpecTD2"> <% out.print(dimension); %></td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Display size:</td><td class="techSpecTD2"><% out.print(display); %></td></tr>
				</tbody>
				</table>
					<% 
			}
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}
	%>	
				
              </div>

		</div>
          </div>

	</div>
</div>
</div> </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>