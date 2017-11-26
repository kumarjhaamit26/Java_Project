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

</head>
<body>
<jsp:include page="userheader.jsp"></jsp:include>
<div id="mainBody">
	<div class="container">
	<div class="row">
<jsp:include page="sidebar2.jsp"></jsp:include>
<%
String proid=request.getParameter("Product_Id");
int pid=Integer.parseInt(proid);
Object object=session.getAttribute("user");
String str=object.toString();
int sid=Integer.parseInt(str);
String name="";
int price=0;
String model="";
try
{
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","manoj");
	Connection connection=DBConnection.getConnection();
	PreparedStatement statement=connection.prepareStatement("select * from product where Product_Id='"+pid+"'");
	ResultSet set= statement.executeQuery();
	if(set.first())
	{
		name= set.getString("Product_Name");
		model=set.getString("Model");
		price=set.getInt("Price");
		
		}	
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
<%
try
{
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","manoj");
	Connection connection=DBConnection.getConnection();
	String sql="insert into shoppingcart(Reg_Id,Product_Id,Product_Name,Price,Model) values (?,?,?,?,?)";
	PreparedStatement statement=connection.prepareStatement(sql);
	statement.setInt(1, sid);
	statement.setInt(2, pid);
	statement.setString(3, name);
	statement.setInt(4, price);
	statement.setString(5, model);
	int i=statement.executeUpdate();
	if(i>0)
	{
	//RequestDispatcher dispatcher=request.getRequestDispatcher("shoppingcart.jsp");
	//dispatcher.forward(request, response);
	out.print("added");
	response.sendRedirect("shoppingcart.jsp?Reg_Id="+sid);
	
}
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
</div></div></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>