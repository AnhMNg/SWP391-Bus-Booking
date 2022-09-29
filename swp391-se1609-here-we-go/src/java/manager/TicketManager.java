/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                String sql = "select tk.routeDeTailId, tk.position,od.date,rd.price,rd.startTime,rd.timeArrival, com.name, bt.capacity, bt.kind,PlaceName.depart,PlaceName.destination,tk.ticketId,tk.orderId\n"
                        + "from [Ticket] tk,[Order] od,[RouteDetail] rd,[Route] r,[BusType] bt,[Company] com,(select dep.companyId, dep.routeId,dep.name depart,des.name destination from\n"
                        + "(select * from Route,Place where Route.departId = Place.placeId) dep,\n"
                        + "(select * from Route,Place where Route.destinationId = Place.placeId) des\n"
                        + "where des.routeId = dep.routeId) PlaceName\n"
                        + "where tk.orderId = od.orderId and tk.routeDeTailId = rd.routeDetailId and rd.routeId = r.routeId \n"
                        + "		and rd.busTypeId = bt.busTypeId and od.customerId = ? and com.companyId = r.companyId and PlaceName.routeId = r.routeId\n"
                        + "		and rd.startTime > CURRENT_TIMESTAMP";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tik = new TicketDetail(rs.getLong(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9),
                            rs.getString(10), rs.getString(11), rs.getLong(12), rs.getLong(13));
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
                String sql = "select tk.routeDeTailId, tk.position,od.date,rd.price,rd.startTime,rd.timeArrival, com.name, bt.capacity, bt.kind,PlaceName.depart,PlaceName.destination,tk.ticketId,tk.orderId\n"
                        + "from [Ticket] tk,[Order] od,[RouteDetail] rd,[Route] r,[BusType] bt,[Company] com,(select dep.companyId, dep.routeId,dep.name depart,des.name destination from\n"
                        + "(select * from Route,Place where Route.departId = Place.placeId) dep,\n"
                        + "(select * from Route,Place where Route.destinationId = Place.placeId) des\n"
                        + "where des.routeId = dep.routeId) PlaceName\n"
                        + "where tk.orderId = od.orderId and tk.routeDeTailId = rd.routeDetailId and rd.routeId = r.routeId \n"
                        + "		and rd.busTypeId = bt.busTypeId and od.customerId = ? and com.companyId = r.companyId and PlaceName.routeId = r.routeId\n"
                        + "		and rd.startTime < CURRENT_TIMESTAMP";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setLong(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tik = new TicketDetail(rs.getLong(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9),
                            rs.getString(10), rs.getString(11), rs.getLong(12), rs.getLong(13));
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
}
