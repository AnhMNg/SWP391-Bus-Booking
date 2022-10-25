/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DBUtils {
    public static Connection getConnection() {
        String url = "jdbc:sqlserver://localhost;databaseName=HereWeGo2;user=sa;password=12345";
        Connection con = null;
        try {
            //Loading a driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //Creating a connection
            con = DriverManager.getConnection(url);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
    public static boolean contains(List list, Object o) {
      return list.contains(o);
   }
}
