package constant;

public class Constant {

	private Constant() {
		throw new IllegalStateException("Utility class");
	}

	// 2024-06-01 QuocTP5 Add Common START
	// User SQL
	public static final String USER = "sa";
	// Password SQL
	public static final String PASSWORD = "123456";
	// SCHEMA
	public static final String SCHEMA = "PassengerDB";
	// Drive SQL
	public static final String DRIVE_SQL = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	// Local host
	public static final String LOCAL_HOST = "localhost:1433";
	// 2024-06-01 QuocTP5 Add Common END
}
