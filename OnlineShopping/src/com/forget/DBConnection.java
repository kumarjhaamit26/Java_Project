package com.forget;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
public static Connection getConnection()
{
Connection connection=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping",
			"root","amit1");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return connection;
}

}
