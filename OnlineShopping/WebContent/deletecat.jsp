<%@page import="com.forget.DBConnection"%>
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
		<li class="active">Delete Category<span class="divider">/</span></li>
		
    </ul>

		
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<%
			String id=request.getParameter("Cat_Id");
			try{
				
				Connection connection=DBConnection.getConnection();
				String sql="delete from category where Cat_Id='"+id+"'";
				 PreparedStatement statement=connection.prepareStatement(sql);
		
				 int i=statement.executeUpdate();
				 out.print(i);
				 if(i>0)
				 {
			response.sendRedirect("viewcat.jsp");
					
				 }
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
			
			
		
			%>
			
		
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
</body>
</html>