/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBUtils;

/**
 *
 * @author baolo
 */
public class CompanyManager {
    public static Company getCompanyAccount(String phone, String password){
        Connection cn = null;
        Company  com = null;
        try{
            cn = DBUtils.getConnection();
            if (cn != null){
                String sql = "select * from Company where phone = ? and Password = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, phone);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    com = new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5), rs.getString(6), rs.getString(7));
                }
                if (pst!= null) pst.close();
                if (rs != null) rs.close();
            }
            
        } catch(Exception e) {
        
        } finally{
            if (cn != null){
                try {                   
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return com;
    }
}
