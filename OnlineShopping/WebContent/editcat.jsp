<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<%@ include file="adminheader.jsp" %>
<%
String id=request.getParameter("Cat_Id");
System.out.print("Iddd: "+id);
%>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<%@ include file="sidebar.jsp" %>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="adminhome.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Update Category<span class="divider">/</span></li>
		
    </ul>
	<h3> Enter Category </h3>
		
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<% 
			out.print("<form action='editcat2.jsp' method='get'>");
			 out.print(" <div class='control-group'>");
			 out.print("<label class='control-label' for='inputEmail0'>Category : </label>");
			 out.print("<div class='controls'>");
			 out.print("<input class='span3'  type='text' id='inputEmail0' placeholder='Category' name='updatecat'>");
			out.print("<input type='hidden' name='Cat_Id' value='"+id+"'>");
				out.print("</div>");
			 out.print(" </div>");
			 out.print("<div class='controls'>");
			 out.print("<button type='submit' class='btn block'>Enter</button>");
			 out.print(" </div>");
			 out.print("</form>");
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