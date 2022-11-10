/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import model.Feedback;
import utils.DBUtils;
import utils.DateUtil;

/**
 *
 * @author baolo
 */
public class FeedbackManager {
    public static void sendFeedback(int comId, long uId, String des, int star) throws SQLException{
        Connection cn = DBUtils.getConnection();
        if (cn!= null){
            PreparedStatement pst = cn.prepareStatement("INSERT INTO Feedback VALUES(?,?,?, ?, CURRENT_TIMESTAMP)");
            pst.setInt(1, comId);
            pst.setLong(2, uId);
            pst.setNString(3, des);
            pst.setInt(4, star);
            pst.executeUpdate();
            pst.close();
            cn.close();
        }
        }
    public static ArrayList<Feedback> getFeedbackbyComId(int comId) throws SQLException, ParseException{
        Connection cn = DBUtils.getConnection();
        ArrayList<Feedback> list =new ArrayList<>();
        Feedback fb = null;
        if (cn != null){
            PreparedStatement pst = cn.prepareStatement("SELECT * FROM Feedback WHERE companyId = ?");
            pst.setInt(1, comId);
            ResultSet rs = pst.executeQuery();
            while(rs != null && rs.next()){
                fb = new Feedback(rs.getLong(1), rs.getInt(2), rs.getLong(3), rs.getNString(4), rs.getInt(5), DateUtil.convertDateFormat(rs.getString(6)) );
                list.add(fb);
            }
        }
        return list;
    }
    public static int getAVGRatebyComId(int comId) throws SQLException, ParseException{
        Connection cn = DBUtils.getConnection();
        int result = 0;
        if (cn != null){
            PreparedStatement pst = cn.prepareStatement("SELECT AVG(star) FROM Feedback WHERE companyId = ?");
            pst.setInt(1, comId);
            ResultSet rs = pst.executeQuery();
            while(rs != null && rs.next()){
                result = rs.getInt(1);
            }
        }
        return result;
    }
    
}
