<%@page import="com.forget.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
			try{
				String id=request.getParameter("Cat_Id");
				out.print(id);
				String cate=request.getParameter("updatecat");
				out.print(cate);
			//if(cate!=null && id!=null)
				{
					//if(cate!="" && id!="")
					{
						Connection connection=DBConnection.getConnection();
					 System.out.print("IDDD: "+id);
				 String sql="update category set Category='"+cate+"' where Cat_Id="+id+"";
				 PreparedStatement statement=connection.prepareStatement(sql);
			
				 int i=statement.executeUpdate();
				 out.print(i);
				 if(i>0)
				 {
					out.print("Updated"); 
					//response.sendRedirect("viewcat.jsp");
				 }
					}
				//	else{
					//	System.out.print("err2 ");
						
					//}
				}
				//else{
				//	 System.out.print("err ");
						
				//}
			}
			catch(Exception e)
			{
			e.printStackTrace();	
			}
			
			
		
			%>			
</body>
</html>