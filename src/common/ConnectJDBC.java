/**
 * 
 */
package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author PhuQuoc
 * @since 30 thg 10, 2023
 */
public class ConnectJDBC {

    public static Connection getConnection() {
	final String USER = "sa";
	final String PASSWORD = "123456";
	final String URL = "jdbc:sqlserver://localhost:1433;databaseName=PassengerDB;user=" + USER + ";password="
		+ PASSWORD;
	Connection connection = null;
	try {
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    connection = DriverManager.getConnection(URL);
	} catch (ClassNotFoundException | SQLException e) {
	    e.printStackTrace();
	}
	return connection;
    }

    public static void close(ResultSet rs, PreparedStatement pre, Connection conn) throws SQLException {

	if (rs != null) {
	    rs.close();
	}

	if (pre != null) {
	    pre.close();
	}

	if (conn != null) {
	    conn.close();
	}
    }
}
