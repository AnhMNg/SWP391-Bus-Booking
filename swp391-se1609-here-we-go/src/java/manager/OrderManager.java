/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author baolo
 */
public class OrderManager {

    public static void addOrder(long userId, int totalPrice) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "INSERT INTO [Order] VALUES (CURRENT_TIMESTAMP,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setLong(1, userId);
            pst.setInt(2, totalPrice);
            pst.executeUpdate();
            pst.close();
            cn.close();
            
        }
    }

    public static long getOrderIdLatest(long id) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = ("SELECT * FROM [Order]\n"
                    + "WHERE orderId = (SELECT MAX(orderId) FROM [Order] WHERE customerId = ? )");
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs!= null && rs.next()){
                return rs.getLong(1);
            }
        }
        return 0;
    }
}
