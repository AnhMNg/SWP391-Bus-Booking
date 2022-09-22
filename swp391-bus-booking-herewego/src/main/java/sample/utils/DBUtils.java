/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author baolo
 */
public class DBUtils {
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        Connection cn= null;
        String IP="localhost";
        String instanceName="LAPTOP-A7H0KSVJ";
        String port="1433";
        String uid="sa";
        String pwd="12345";
        String db="HereWeGo";
 String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+"\\"+ instanceName+":"+port
                 +";databasename="+db+";user="+uid+";password="+pwd+";encrypt=true;trustServerCertificate=true;";
      

        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }
}
