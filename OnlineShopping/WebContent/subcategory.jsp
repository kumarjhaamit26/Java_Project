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
		<li><a href="category.jsp">Category  <span class="divider">/</span></a></li>
		<li class="active">Sub Category</li>
    </ul>
	<h3> Enter Sub Category</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
		<%
		try{
			String catid=request.getParameter("sub");
			String subname=request.getParameter("subcat");
			if(catid!=null && subname!=null)
			{
				if(catid!="" && subname!="")
				{
		Connection connection=	DBConnection.getConnection();
					PreparedStatement statement=connection.prepareStatement("insert into Subcategory(Cat_Id,Sub_Category) values(?,?)");
			statement.setString(1, catid);
			statement.setString(2, subname);
			int i=statement.executeUpdate();
			if(i>0)
			{
				//out.print("added");
				}
				}
			}
		}
		catch(Exception e)
		{
			
		}
		%>
		
			<form action="">
			  <div class="control-group">
				<label class="control-label" for="inputEmail0">Sub Category : </label>
					<select name="sub">
					<%
			try{
			
			 Connection connection2=DBConnection.getConnection();
				PreparedStatement statement2=connection2.prepareStatement("select * from category");
				ResultSet set=statement2.executeQuery();
			while(set.next())
			{
				String id=set.getString("Cat_Id");
				String cat=set.getString("Category");
				out.print("<option value='"+id+"'>"+cat+"</option>");
			}
				
			
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
			%></select>
				<div class="controls">
				  <input class="span3"  type="text" id="inputEmail0" placeholder=" Sub Category" name="subcat">
				</div>
			  </div>
			  <div class="controls">
			  <button type="submit" class="btn block">Submit</button>
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