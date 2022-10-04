/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import utils.DBUtils;

/**
 *
 * @author baolo
 */
public class UserManager {
    private static final String GET_USER = "select * from [User] where userId = ?";
    private static final String INSERT = "INSERT INTO [User](name, phone, roleId, password) VALUES(?,?,2,?)";
    private static final String GET_INFO = "SELECT userId, name, dateCreated FROM [User] WHERE [User].userId = ?";
    private static final String COUNT = "SELECT COUNT(orderId) as 'Number of Tickets' FROM [Order] WHERE [Order].customerId = ?";
    
    public static User getUserById(long id) throws SQLException{
        Connection cn = null;
        User us = null;
        try{
            cn = DBUtils.getConnection();
            if (cn != null){
                String sql = GET_USER;
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    us = new User(id, rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getInt(5), rs.getString(6), rs.getString(7));
                }
                if (rs!= null) rs.close();
                if (pst!= null) pst.close();
            }
        } catch(Exception e){
            
        } finally{
            if (cn!= null) cn.close();
        }
        return us;
    }
    
    public boolean addUser(String name, String phone, String password) throws SQLException{
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try{
            cn = DBUtils.getConnection();
            if (cn!=null){
                pst = cn.prepareStatement(INSERT);
                pst.setString(1, name);
                pst.setString(2, phone);
                pst.setString(3, password);
                check = pst.executeUpdate()>0?true:false;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }
 
    public static User getUserInfo(long id)throws Exception{
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        User us = null;
        try{
            cn = DBUtils.getConnection();
            if (cn!=null){
                pst = cn.prepareStatement("GET_INFO");
                pst.setLong(1, id);
                rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    long ID = rs.getLong(1);
                    String Name = rs.getString(2);
                    Date Date = rs.getDate(3);
                    us = new User(ID, Name, "", "", 0, "", "22/01/2020");
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return us;
}
    public int getNumOfTicket(long id) throws Exception{
        int num = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            cn = DBUtils.getConnection();
            if (cn!=null){
                pst = cn.prepareStatement(COUNT);
                pst.setLong(1, id);
                rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    num = rs.getInt(1);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return num;
    }
}
