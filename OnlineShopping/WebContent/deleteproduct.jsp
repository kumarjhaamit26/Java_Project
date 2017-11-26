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
<%
String id=request.getParameter("Product_Id");
out.print(id);
try{
	Connection connection=DBConnection.getConnection();
	  PreparedStatement statement= connection.prepareStatement("delete from product where Product_Id='"+id+"'");
    int i= statement.executeUpdate();
    if(i>0)
    {
    	out.print("Deleted");
    	response.sendRedirect("product.jsp");
    }
}
catch(Exception e)
{
	e.printStackTrace();
	}
%>
</body>
</html>