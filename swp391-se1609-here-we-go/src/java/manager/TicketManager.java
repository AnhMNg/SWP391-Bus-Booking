/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.TicketDetail;
import utils.DBUtils;

/**
 *
 * @author baolo
 */
public class TicketManager {
    public static ArrayList<TicketDetail> getUpcomingTickeDetailtByCustomerId(long id) {
        ArrayList<TicketDetail> list = new ArrayList<>();
        Connection cn = null;
        TicketDetail tik = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select rd.price,rd.startTime,rd.timeArrival, com.name, bt.capacity, bt.kind,PlaceName.depart,PlaceName.destination,rd.departDetail, rd.detinationDetail,tk.ticketId,tk.orderId,tk.routeDeTailId, tk.position, tk.passengerName, tk.purchaseDate\n" +
"                        from [Ticket] tk,[Order] od,[RouteDetail] rd,[Route] r,[BusType] bt,[Company] com,(select dep.companyId, dep.routeId,dep.name depart,des.name destination from\n" +
"                        (select * from Route,Place where Route.departId = Place.placeId) dep,\n" +
"                        (select * from Route,Place where Route.destinationId = Place.placeId) des\n" +
"                        where des.routeId = dep.routeId) PlaceName\n" +
"                        where tk.orderId = od.orderId and tk.routeDeTailId = rd.routeDetailId and rd.routeId = r.routeId\n" +
"                        		and rd.busTypeId = bt.busTypeId and od.customerId = ? and com.companyId = r.companyId and PlaceName.routeId = r.routeId\n" +
"                        		and rd.startTime > CURRENT_TIMESTAMP";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tik = new TicketDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)
                            , rs.getString(8), rs.getString(9), rs.getString(10), rs.getLong(11), rs.getLong(12), rs.getLong(13), rs.getInt(14), rs.getString(15), rs.getString(16));
                    list.add(tik);
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
    public static ArrayList<TicketDetail> getCompletedTickeDetailtByCustomerId(long id) {
        ArrayList<TicketDetail> list = new ArrayList<>();
        Connection cn = null;
        TicketDetail tik = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select rd.price,rd.startTime,rd.timeArrival, com.name, bt.capacity, bt.kind,PlaceName.depart,PlaceName.destination,rd.departDetail, rd.detinationDetail,tk.ticketId,tk.orderId,tk.routeDeTailId, tk.position, tk.passengerName, tk.purchaseDate\n" +
"                        from [Ticket] tk,[Order] od,[RouteDetail] rd,[Route] r,[BusType] bt,[Company] com,(select dep.companyId, dep.routeId,dep.name depart,des.name destination from\n" +
"                        (select * from Route,Place where Route.departId = Place.placeId) dep,\n" +
"                        (select * from Route,Place where Route.destinationId = Place.placeId) des\n" +
"                        where des.routeId = dep.routeId) PlaceName\n" +
"                        where tk.orderId = od.orderId and tk.routeDeTailId = rd.routeDetailId and rd.routeId = r.routeId\n" +
"                        		and rd.busTypeId = bt.busTypeId and od.customerId = ? and com.companyId = r.companyId and PlaceName.routeId = r.routeId\n" +
"                        		and rd.startTime < CURRENT_TIMESTAMP";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tik = new TicketDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)
                            , rs.getString(8), rs.getString(9), rs.getString(10), rs.getLong(11), rs.getLong(12), rs.getLong(13), rs.getInt(14), rs.getString(15), rs.getString(16));
                    list.add(tik);
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
    public static long countTicketSold() throws SQLException{
        long count = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null ){
            PreparedStatement pst = cn.prepareStatement("SELECT COUNT(t.ticketId) FROM Ticket t");
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                count  = rs.getLong(1);
            }
            cn.close();
        }
        return count;
    }
     public static int countTicketbyId(long id) throws SQLException {
        int count = 0;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT COUNT(tk.routeDeTailId)\n"
                    + "FROM [Ticket] tk,[Order] od,[RouteDetail] rd,[Route] r,[BusType] bt,[Company] com,(SELECT dep.companyId, dep.routeId,dep.name depart,DES.name destination FROM\n"
                    + "(SELECT * FROM Route,Place WHERE Route.departId = Place.placeId) dep,\n"
                    + "(SELECT * FROM Route,Place WHERE Route.destinationId = Place.placeId) DES\n"
                    + "WHERE DES.routeId = dep.routeId) PlaceName\n"
                    + "WHERE tk.orderId = od.orderId and tk.routeDeTailId = rd.routeDetailId and rd.routeId = r.routeId \n"
                    + "and rd.busTypeId = bt.busTypeId and od.customerId = ? and com.companyId = r.companyId and PlaceName.routeId = r.routeId");
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                count = rs.getInt(1);
            }
            cn.close();
        }
        return count;
    }
}
