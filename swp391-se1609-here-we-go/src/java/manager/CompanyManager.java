/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Company;
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
    public static Company getCompanyInfo(int id){
        Connection cn = null;
        Company  com = null;
        try{
            cn = DBUtils.getConnection();
            if (cn != null){
                String sql = "select * from Company where CompanyId = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs!= null && rs.next()){
                    com = new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5), rs.getString(6), "***");
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
    // get top n Company have a most number of Route
    public static ArrayList<Company> getTopCompany(int top) {
        ArrayList<Company> list = new ArrayList<>();
        Connection cn = null;
        Company com = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT TOP(?) * FROM Company,\n"
                        + "(SELECT  Company.name,COUNT(routeId) AS numberofRoute FROM Company,Route \n"
                        + "WHERE Company.companyId = Route.companyId \n"
                        + "GROUP BY name) AS long\n"
                        + "WHERE long.name = Company.name\n"
                        + "ORDER BY numberofRoute DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, top);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    com = new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5), rs.getString(6), "*****");
                    list.add(com);
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            }

        } catch (Exception e) {
                System.out.println(e.toString());
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }

        return list;
    }
}
