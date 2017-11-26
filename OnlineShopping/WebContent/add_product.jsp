<%@page import="com.forget.DBConnection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>

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
		<li class="active">Product</li>
    </ul>
	<h3> Add Product</h3>	
	<div class="well">
	 <%
	 try{
	 String name1=request.getParameter("proname");
	 String description=request.getParameter("description");
	 String image=request.getParameter("image");
	 out.print(image);
	String quantity= request.getParameter("quantity");
	String price=request.getParameter("price");
	String cat=request.getParameter("cat");
	String brand=request.getParameter("brand");

	String model=request.getParameter("model");

	//String date=request.getParameter("date");
	String dimension=request.getParameter("dimension");
	String display=request.getParameter("displaysize");
	//if(fname !=null && lname !=null && mail !=null && pswd !=null && dob !=null && faddress !=null && zip !=null && country !=null && phone !=null && mobile !=null )
	//{
    // Class.forName("com.mysql.jdbc.Driver");
	// Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","manoj");
 Connection connection= DBConnection.getConnection();
	String sql="insert into product(Product_Name,Description,PHOTO,Quantity,Price,Category,Brand,Model,Released,Dimension,Display_Size) values (?,?,?,?,?,?,?,?,?,?,?)";

   PreparedStatement statement=connection.prepareStatement(sql);
	
	statement.setString(1, name1);
	 statement.setString(2, description);
InputStream inputStream=new FileInputStream(image);
statement.setBinaryStream(3, inputStream,inputStream.available());
  
	 statement.setString(4,quantity );

	 statement.setString(5,price);
	 statement.setString(6, cat);

	 statement.setString(7, brand);
	 statement.setString(8, model);
	long dt= System.currentTimeMillis();
	Timestamp timestamp=new Timestamp(dt);
  String date2= timestamp.toString();
  statement.setString(9, date2);
	statement.setString(10, dimension);
	statement.setString(11, display);
	 int i=statement.executeUpdate();
	 if(i>0)
	 {
		out.print("<h4 style='color:green'>Product is added</h4>"); 
	 }
	 else
	 {
		 out.print("Product is not added");
	 }
	/* }
	else {
		out.print("fields can not be null");
	}*/
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	 
	 %>
	<form class="form-horizontal" method="post" action="">
		<h4>Product Information</h4>
		<div class="control-group">
			<label class="control-label" for="inputFname1">Product Name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputFname1" placeholder="Product Name" name="proname">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLnam">Description <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLnam" placeholder="Description" name="description">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="input_email">Image </label>
		<div class="controls">
		<input type='file' onchange="readURL(this);" name="image" />
		</div>
	  </div>	
<div class="control-group">
		<label class="control-label" for="input_email">Quantity <sup>*</sup></label>
		<div class="controls">
		  <select name="quantity">
		  <option value="1">1</option>
		  <option value="2">2</option>
		  <option value="3">3</option>
		  <option value="4" selected="selected">4</option>
		  <option value="5">5</option>
		  <option value="6">6</option>
		  <option value="7">7</option>
		  <option value="8">8</option>
		  <option value="9">9</option>
		  <option value="10">10</option>
		  </select>
		</div>
	  </div>	  
	<div class="control-group">
		<label class="control-label" for="inputPassword1">Price <sup>*</sup></label>
		<div class="controls">
		  <input type="number" id="inputPassword1" placeholder="Price" name="price">
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label">Category <sup>*</sup></label>
		<div class="controls">
	
							<select name="cat">
					<%
			try{
			
			    Class.forName("com.mysql.jdbc.Driver");
				Connection connection2=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","amit1");
				PreparedStatement statement2=connection2.prepareStatement("select * from category");
				ResultSet set=statement2.executeQuery();
			while(set.next())
			{
				String cat=set.getString("Category");
				out.print("<option value='"+cat+"'>"+cat+"</option>");
			}
				
			
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
			%></select>	
	
		</div>
	  </div>	

		<h4>Product Details </h4>
		<div class="control-group">
			<label class="control-label" for="inputFname">Brand <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputFname" placeholder="Brand" name="brand">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputLname">Model <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLname" placeholder="Model" name="model"/>
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label" for="address">Dimension <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address" placeholder="Dimension" name="dimension"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="address2">Display Size <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address2" placeholder="Display Size" name="displaysize"/>
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
</div>

</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<%@ include file="footer.jsp" %>
</body>
</html>