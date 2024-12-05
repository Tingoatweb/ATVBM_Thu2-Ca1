package database;


import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    public static Connection getConnection() {
        Connection c = null;
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            String url = "jdbc:mysql://localhost:3306/book";
            String username = "root";
            String password = "123456";

            c = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return c;
    }
    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void printInfo(Connection c) {
        try {
            if(c!=null) {
                DatabaseMetaData mtdt = c.getMetaData();
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Connection connection = null;
        try {
            // Lấy kết nối
            connection = JDBCUtil.getConnection();

            // In thông tin kết nối
            JDBCUtil.printInfo(connection);

            // Đóng kết nối
            JDBCUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
