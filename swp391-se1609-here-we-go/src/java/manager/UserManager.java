/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
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
    
    private static final String LOGIN = "SELECT * FROM [User] WHERE phone = ? AND password = ?";
    private static final String INSERT = "INSERT INTO tblUsers(name, phone, roleId, password) VALUES(?,?,2,?)";
    
    public static User getUserById(long id) throws SQLException{
        Connection cn = null;
        User us = null;
        try{
            cn = DBUtils.getConnection();
            if (cn != null){
                String sql = "select * from [User] where userId = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    us = new User(id, rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getInt(5), rs.getString(6));
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
    public static User checkLogin(String phone, String password) throws SQLException {
        User user = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if(cn != null){
                pst = cn.prepareStatement(LOGIN);
                pst.setString(1, phone);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if(rs.next()){
                    user = new User(rs.getLong(1), rs.getString(2), phone, rs.getString(4), rs.getInt(5), "***");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
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
        return user;
    }
    
    public boolean insert(String name, String phone, String password) throws SQLException{
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
}
