/**
 * 
 */
package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import constant.Constant;

/**
 * @author PhuQuoc
 * @since 01 thg 06, 2024
 */
public class ConnectJDBC {

	/**
	 * connect jdbc
	 * 
	 * @return
	 */
	public static Connection getConnection() {

		final String URL = "jdbc:sqlserver://" + Constant.LOCAL_HOST + ";" + "databaseName=" + Constant.SCHEMA
				+ ";user=" + Constant.USER + ";password=" + Constant.PASSWORD;

		Connection connection = null;
		try {
			Class.forName(Constant.DRIVE_SQL);
			connection = DriverManager.getConnection(URL);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * close connect
	 * 
	 * @param rs
	 * @param pre
	 * @param conn
	 * @throws SQLException
	 */
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
