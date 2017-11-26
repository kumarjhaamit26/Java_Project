<%@page import="com.forget.DBConnection"%>
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
		<li class="active">Category<span class="divider">/</span></li>
		<li><a href="subcategory.jsp">Sub Category</a></li>
    </ul>
	<h3> Enter Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="viewcat.jsp">View Category</a></h3>
		
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<%
			try{
				String cate=request.getParameter("cat");
				if(cate!=null)
				{
					Connection connection=DBConnection.getConnection();
					String sql="insert into category(Category) values(?)";
				PreparedStatement statement=connection.prepareStatement(sql);
				statement.setString(1,cate);
				int i=statement.executeUpdate();
				if(i>0)
				{
				out.print("inserted");
				}
				}
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
			%>
			<form action="">
			  <div class="control-group">
				<label class="control-label" for="inputEmail0">Category : </label>
				<div class="controls">
				  <input class="span3"  type="text" id="inputEmail0" placeholder="Category" name="cat">
				</div>
			  </div>
			  <div class="controls">
			  <button type="submit" class="btn block">Enter</button>
			  </div>
			</form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			
		</div>
		</div>
	</div>	
	
</div>
</div></div>
</div>
<!-- MainBody End ============================= -->
<%@ include file="footer.jsp" %>
</body>
</html>