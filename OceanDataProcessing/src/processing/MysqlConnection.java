package processing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnection {
	 public Connection getConnection() throws ClassNotFoundException, SQLException {
		   Class.forName("com.mysql.jdbc.Driver");
		   String url = "jdbc:mysql://localhost:3306";
		   String name = "root";
		   String password = "**********";
		   Connection con = DriverManager.getConnection(url, name, password);
		   return con;
		 }
}
