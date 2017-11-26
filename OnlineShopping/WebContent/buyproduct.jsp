<%@page import="com.forget.DBConnection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="userheader.jsp"></jsp:include>
<div id="mainBody">
	<div class="container">
	<div class="row">
<jsp:include page="sidebar2.jsp"></jsp:include>
<%
String id=request.getParameter("Product_Id");
int pid=Integer.parseInt(id);
//out.print(pid);
Object object=session.getAttribute("user");
String str=object.toString();
int sid=Integer.parseInt(str);
//out.print(sid);
String name="";
String description="";
int price=0;
int quantity=0;
String model="";
try{
	Connection connection=DBConnection.getConnection();
PreparedStatement statement=connection.prepareStatement("select * from product where Product_Id='"+pid+"'");
ResultSet set= statement.executeQuery();
if(set.first())
{
	name= set.getString("Product_Name");
	description=set.getString("Description");
	model=set.getString("Model");
	quantity=set.getInt("Quantity");
	price=set.getInt("Price");
	
	}
}
catch(Exception e)
{
	}
%>
<%
String quan=request.getParameter("quan");
int quan2=0;
if(quan!=null)
{
quan2=Integer.parseInt(quan);
//out.print(quan2);
if(quan2<=quantity)
{
	int totalamount=(quan2*price);
try
{
	Connection connection=DBConnection.getConnection();
		String sql="insert into buytable(Reg_Id,Product_Id,Product_Name,Description,Quantity,Price,Total_Price,Date) values(?,?,?,?,?,?,?,?)";
	PreparedStatement statement=connection.prepareStatement(sql);
	statement.setInt(1, sid);
	statement.setInt(2, pid);
	statement.setString(3, name);
	statement.setString(4, description);
	statement.setInt(5, quan2);
	statement.setInt(6, price);
	statement.setInt(7, totalamount);
	long dt=System.currentTimeMillis();
	Timestamp timestamp=new Timestamp(dt);
	String datetime=timestamp.toString();
	statement.setString(8, datetime);
   int i= statement.executeUpdate();
   if(i>0)
   {
	out.print("<h3 style='color:green'>Thank you for booking "+name+"</h3>"); 
	//response.sendRedirect("userhome.jsp");
			int leftquantity=(quantity-quan2);
			PreparedStatement statement2= connection.prepareStatement("update product set Quantity=? where Product_Id='"+pid+"'");
          statement2.setInt(1, leftquantity);
        int k=  statement2.executeUpdate();
        if(k>0)
        {
       // out.print(name+" product left in stock is "+leftquantity);
        if(leftquantity==0)
        {
       // out.print("Sorry "+name+" is not available right now"+"\n");
        out.print(name+" will be updated Shortly"+"\n<br>");
        
        out.print("Keep Visiting our website<br>");
        }
        }
   }
   else{

	   
   }
	
}
catch(Exception e)
{
	}
}
else
{
out.print("<h4 style='color:red'>Sorry Product "+name+" is out of stock</h4><br>");	
out.print("<h4 style='color:green'>"+name+" will be updated shortly</h4>"+"\n<br>");

out.print("<h4 style='color:green'>Keep visiting our website</h4><br>");
}
}
else
{
	//out.print("null value");
	
	}

%>


	<div class="span9">
  
  <h2 style="color:green">Check Out</h2>
  <form action="" method="post">
			   <table  style ="width:100%" cellpadding  ="20">
	<tr><td style="color:#3a3f44">Name : </td><td style="color:#3a3f44"><%= name %></td></tr>
	<tr><td style="color:#3a3f44">Description : </td><td style="color:#3a3f44"><%= description %></td></tr>
	<tr><td style="color:#3a3f44">Model : </td><td style="color:#3a3f44"><%= model %></td></tr>
	<tr><td style="color:#3a3f44">Quantity : </td><td><select name="quan" style="color:#3a3f44"><option value="1">1</option>
	<option value="2">2</option><option value="3">3</option><option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option><option value="7">7</option><option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option></select></td></tr>
	<tr><td style="color:#3a3f44">Price : </td><td style="color:#3a3f44"><%= price %> &nbsp; &nbsp; &#8377;</td></tr>
	 <tr><td></td><td> <button type="submit" class="btn">Submit</button></td></tr>
	  </table>
	</form>		
</div>
</div></div></div>
<jsp:include page="footer.jsp"></jsp:include>