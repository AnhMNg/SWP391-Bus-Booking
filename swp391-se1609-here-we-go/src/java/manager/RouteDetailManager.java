/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

/**
 *
 * @author baolo
 */
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RouteDetail;
import utils.DBUtils;

public class RouteDetailManager {

    private static final String DELETE_ROUTEDETAIL = "DELETE FROM RouteDetail WHERE RouteDetail.routeDetailId = ?";
    private static final String GET_ROUTEDETAIL = "SELECT rpp.[Department], rpp.[Destination], b.kind, rd.startTime\n"
            + "FROM [BusType] b INNER JOIN [RouteDetail] rd ON b.busTypeId = rd.busTypeId JOIN\n"
            + "(SELECT p.name AS 'Department', rp.[des] AS 'Destination', r.routeId\n"
            + "FROM Route r INNER JOIN Place p ON r.departId = p.placeId RIGHT OUTER JOIN \n"
            + "(SELECT p1.name AS 'des', r1.routeId\n"
            + "FROM Route r1 INNER JOIN Place p1 ON r1.destinationId = p1.placeId\n"
            + "WHERE r1.routeId = ? AND r1.destinationId = ?) rp ON r.routeId = rp.routeId\n"
            + "WHERE r.routeId = ? AND r.departId = ?) rpp ON rpp.routeId = rd.routeId \n"
            + "WHERE rd.routeId = ?";
    private static final String SEARCH_PLACE = "SELECT p.placeId FROM Place p WHERE p.name = ?";
    private static final String ADD_PLACE = "INSERT INTO Place(name) VALUES(?)";
    private static final String SEARCH_ROUTE = "SELECT r.routeId FROM Route r\n"
            + "WHERE r.departId = (SELECT p.placeId FROM Place p WHERE p.name = ?)\n"
            + "AND r.destinationId = (SELECT p.placeId FROM Place p WHERE p.name = ?)\n"
            + "AND r.companyId = ?";
    private static final String ADD_ROUTE = "INSERT INTO Route([companyId],[departId],[destinationId])\n"
            + "SELECT c.companyId, p.placeId as 'departId', p1.placeId as 'Destination'\n"
            + "FROM Place p, Place p1, Company c\n"
            + "WHERE p.name = ? AND p1.name = ? AND c.companyId = ?";
    private static final String GET_BUSTYPE = "SELECT b.busTypeId FROM BusType b WHERE b.kind = ?";
    private static final String ADD_ROUTEDETAIL = "INSERT INTO RouteDetail([routeId],[busTypeId],[startTime],[price],[timeArrival]) VALUES(?,?,?,?,?)";
    public static String FILTER_ROUTE = "SELECT tbl1.routeDetailId, bus.capacity, bus.kind, tbl1.startTime, tbl1.price, tbl1.timeArrival, tbl1.departDetail, tbl1.detinationDetail, tbl1.routeId, tbl1.name, tbl1.depart, tbl1.destination\n"
            + "	  FROM (SELECT rd.routeDetailId,rd.busTypeId, rd.startTime, rd.price, rd.timeArrival,rd.departDetail,rd.detinationDetail, rd.routeId, r.name,r.depart, r.destination  \n"
            + "		FROM [RouteDetail] rd\n"
            + "		inner join\n"
            + "		  (SELECT Route.companyId, Route.departId, Route.destinationId, Route.routeId, com.name, PlaceName.depart, PlaceName.destination FROM [Route], [Company] com,\n"
            + "	    (SELECT dep.routeId,dep.name depart,des.name destination \n"
            + "				FROM\n"
            + "					(SELECT * \n"
            + "						FROM Route,Place \n"
            + "						WHERE Route.departId = Place.placeId) dep,\n"
            + "					(SELECT * \n"
            + "						FROM Route,Place \n"
            + "						WHERE Route.destinationId = Place.placeId) des\n"
            + "				WHERE des.routeId = dep.routeId) PlaceName\n"
            + "	     WHERE PlaceName.depart like ? and PlaceName.destination like ? and com.companyId = Route.companyId and PlaceName.routeId = Route.routeId) r\n"
            + "		 ON rd.routeId = r.routeId) tbl1, BusType bus\n"
            + "WHERE tbl1.busTypeId = bus.busTypeId and tbl1.startTime > CURRENT_TIMESTAMP and ";

    public static boolean delete(long rid) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean delete = false;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(DELETE_ROUTEDETAIL);
                pst.setLong(1, rid);
                pst.executeUpdate();
                delete = true;
            }
        } catch (Exception e) {
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
        return delete;
    }

    public static ArrayList getRouteDetail(long rId, long departId, long destinationId) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<String> route = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(GET_ROUTEDETAIL);
                pst.setLong(1, rId);
                pst.setLong(2, destinationId);
                pst.setLong(3, rId);
                pst.setLong(4, departId);
                pst.setLong(5, rId);
                rs = pst.executeQuery();
                if (rs.next()) {
                    route.add(rs.getString(1));
                    route.add(rs.getString(2));
                    route.add(rs.getString(3));
                    route.add(rs.getString(4));
                }
            }
        } catch (Exception e) {
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
        return route;
    }

    public static boolean AddRouteDetail(String departure, String destination, long companyId, String bustype, String startTime, int price, String timeArrival) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null, pst1 = null;
        ResultSet rs = null;
        boolean rd = false, place = false;
        long routeId = 0, busID = 0;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(SEARCH_PLACE);
                pst.setString(1, departure);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    place = true;
                } else {
                    pst = cn.prepareStatement(ADD_PLACE);
                    pst.setString(1, departure);
                    pst.executeUpdate();
                    place = true;
                }
                pst = cn.prepareStatement(SEARCH_PLACE);
                pst.setString(1, destination);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    place = true;
                } else {
                    pst = cn.prepareStatement(ADD_PLACE);
                    pst.setString(1, destination);
                    pst.executeUpdate();
                    place = true;
                }
                if (place) {
                    pst = cn.prepareStatement(SEARCH_ROUTE);
                    pst.setString(1, departure);
                    pst.setString(2, destination);
                    pst.setLong(3, companyId);
                    rs = pst.executeQuery();
                    if (rs != null && rs.next()) {
                        routeId = rs.getLong(1);
                    } else {
                        pst1 = cn.prepareStatement(ADD_ROUTE);
                        pst1.setString(1, departure);
                        pst1.setString(2, destination);
                        pst1.setLong(3, companyId);
                        pst1.executeUpdate();
                        pst = cn.prepareStatement(SEARCH_ROUTE);
                        pst.setString(1, departure);
                        pst.setString(2, destination);
                        pst.setLong(3, companyId);
                        rs = pst.executeQuery();
                        if (rs.next()) {
                            routeId = rs.getLong(1);
                        }
                    }
                    //lấy busTypeId
                    pst = cn.prepareStatement(GET_BUSTYPE);
                    pst.setString(1, bustype);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                        busID = rs.getLong(1);
                    }
                    //add RouteDetail
                    pst = cn.prepareStatement(ADD_ROUTEDETAIL);
                    pst.setLong(1, routeId);
                    pst.setLong(2, busID);
                    pst.setString(3, startTime);
                    pst.setInt(4, price);
                    pst.setString(5, timeArrival);
                    pst.executeUpdate();
                    rd = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst1 != null) {
                pst1.close();
            }
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
        return rd;
    }

    public static long getPlaceId(String departure) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        long pId = 0;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(SEARCH_PLACE);
                pst.setString(1, departure);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    pId = rs.getLong(1);
                } else {
                    pst = cn.prepareStatement(ADD_PLACE);
                    pst.setString(1, departure);
                    pst.executeUpdate();
                    pst = cn.prepareStatement(SEARCH_PLACE);
                    pst.setString(1, departure);
                    rs = pst.executeQuery();
                    if (rs != null && rs.next()) {
                        pId = rs.getLong(1);
                    }
                }
            }
        } catch (Exception e) {
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
        return pId;
    }

    public static ArrayList<RouteDetail> getRouteByCompanyId(long id) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int[] listPosition = null;
        RouteDetail rd = null;
        ArrayList<RouteDetail> list = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement("SELECT tbl1.routeDetailId, bus.capacity, bus.kind, tbl1.startTime, tbl1.price, tbl1.timeArrival, tbl1.departDetail, tbl1.detinationDetail, tbl1.routeId, tbl1.name, tbl1.depart, tbl1.destination\n"
                        + "	  FROM (SELECT rd.routeDetailId,rd.busTypeId, rd.startTime, rd.price, rd.timeArrival,rd.departDetail,rd.detinationDetail, rd.routeId, r.name,r.depart, r.destination  \n"
                        + "		FROM [RouteDetail] rd\n"
                        + "		inner join\n"
                        + "		  (SELECT Route.companyId, Route.departId, Route.destinationId, Route.routeId, com.name, PlaceName.depart, PlaceName.destination FROM [Route], [Company] com,\n"
                        + "	    (SELECT dep.routeId,dep.name depart,des.name destination \n"
                        + "				FROM\n"
                        + "					(SELECT * \n"
                        + "						FROM Route,Place \n"
                        + "						WHERE Route.departId = Place.placeId) dep,\n"
                        + "					(SELECT * \n"
                        + "						FROM Route,Place \n"
                        + "						WHERE Route.destinationId = Place.placeId) des\n"
                        + "				WHERE des.routeId = dep.routeId) PlaceName\n"
                        + "	     WHERE Route.companyId = ? and com.companyId = Route.companyId and PlaceName.routeId = Route.routeId) r\n"
                        + "		 ON rd.routeId = r.routeId) tbl1, BusType bus\n"
                        + "WHERE tbl1.busTypeId = bus.busTypeId");
                pst.setLong(1, id);
                rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    listPosition = getListPosition(rs.getLong(1));
                    rd = new RouteDetail(rs.getLong(1), rs.getInt(2), rs.getInt(2) - listPosition.length, rs.getString(3), rs.getString(4),
                            rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), listPosition, rs.getLong(9), rs.getString(10), rs.getString(11), rs.getString(12));
                    list.add(rd);
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public static String getNameBusById(int id) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT BusType.kind FROM BusType WHERE busTypeId = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getString(1);
            }
        }
        return null;
    }

    public static int getCapacityBusById(int id) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT BusType.capacity FROM BusType WHERE busTypeId = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public static int getCapacityBusByRouteDetailId(long id) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT BusType.capacity\n"
                    + "FROM BusType, RouteDetail\n"
                    + "WHERE BusType.busTypeId = RouteDetail.busTypeId and RouteDetail.routeDetailId = ?");
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public static int[] getListPosition(long RouteDetailId) throws SQLException {
        Connection cn = DBUtils.getConnection();
        int lenght = getCapacityBusByRouteDetailId(RouteDetailId);
        int[] list = new int[lenght];
        int count = 0;
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT tk.position FROM Ticket tk\n"
                    + "WHERE tk.routeDeTailId = ?");
            pst.setLong(1, RouteDetailId);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                list[count] = rs.getInt(1);
                count++;

            }
        }
        return list;
    }

    public static String getNameDepartByRouteId(long id) throws SQLException {
        Connection cn = DBUtils.getConnection();

        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT p.name FROM Place p, Route r WHERE r.departId = p.placeId and r.routeId = ?");
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getString(1);
            }
        }
        return null;
    }

    public static String getNameDestinationByRouteId(long id) throws SQLException {
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT p.name FROM Place p, Route r WHERE r.destinationId = p.placeId and r.routeId = ?");
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return rs.getString(1);
            }
        }
        return null;
    }

    public static ArrayList<RouteDetail> searchRouteDetail(String depart, String destination, String startDate) throws SQLException {
        ArrayList<RouteDetail> list = new ArrayList<>();
        Connection cn = DBUtils.getConnection();
        RouteDetail rd = null;
        int[] listPosition = null;
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT tbl1.routeDetailId, bus.capacity, bus.kind, tbl1.startTime, tbl1.price, tbl1.timeArrival, tbl1.departDetail, tbl1.detinationDetail, tbl1.routeId, tbl1.name, tbl1.depart, tbl1.destination\n"
                    + "	  FROM (SELECT rd.routeDetailId,rd.busTypeId, rd.startTime, rd.price, rd.timeArrival,rd.departDetail,rd.detinationDetail, rd.routeId, r.name,r.depart, r.destination  \n"
                    + "		FROM [RouteDetail] rd\n"
                    + "		inner join\n"
                    + "		  (SELECT Route.companyId, Route.departId, Route.destinationId, Route.routeId, com.name, PlaceName.depart, PlaceName.destination FROM [Route], [Company] com,\n"
                    + "	    (SELECT dep.routeId,dep.name depart,des.name destination \n"
                    + "				FROM\n"
                    + "					(SELECT * \n"
                    + "						FROM Route,Place \n"
                    + "						WHERE Route.departId = Place.placeId) dep,\n"
                    + "					(SELECT * \n"
                    + "						FROM Route,Place \n"
                    + "						WHERE Route.destinationId = Place.placeId) des\n"
                    + "				WHERE des.routeId = dep.routeId) PlaceName\n"
                    + "	     WHERE PlaceName.depart like ? and PlaceName.destination like ? and com.companyId = Route.companyId and PlaceName.routeId = Route.routeId) r\n"
                    + "		 ON rd.routeId = r.routeId) tbl1, BusType bus\n"
                    + "WHERE tbl1.busTypeId = bus.busTypeId and tbl1.startTime > ? and tbl1.startTime > CURRENT_TIMESTAMP");
            pst.setString(1, "%" + depart + "%");
            pst.setString(2, "%" + destination + "%");
            pst.setString(3, startDate + " 00:00:00");
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                listPosition = getListPosition(rs.getLong(1));
                rd = new RouteDetail(rs.getLong(1), rs.getInt(2), getNumberOfRemaningPosition(listPosition), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), listPosition, rs.getLong(9), rs.getString(10), rs.getString(11), rs.getString(12));
                list.add(rd);
            }
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

        return list;
    }

    public static RouteDetail getRouteDetailById(long id) throws SQLException {
        RouteDetail rd = null;
        Connection cn = DBUtils.getConnection();
        int[] listPosition = null;
        if (cn != null) {
            PreparedStatement pst = cn.prepareStatement("SELECT tbl1.routeDetailId, bus.capacity, bus.kind, tbl1.startTime, tbl1.price, tbl1.timeArrival, tbl1.departDetail, tbl1.detinationDetail, tbl1.routeId, tbl1.name, tbl1.depart, tbl1.destination\n"
                    + "                    	  FROM (SELECT rd.routeDetailId,rd.busTypeId, rd.startTime, rd.price, rd.timeArrival,rd.departDetail,rd.detinationDetail, rd.routeId, r.name,r.depart, r.destination  \n"
                    + "                    		FROM [RouteDetail] rd\n"
                    + "                    		inner join\n"
                    + "                    		  (SELECT Route.companyId, Route.departId, Route.destinationId, Route.routeId, com.name, PlaceName.depart, PlaceName.destination FROM [Route], [Company] com,\n"
                    + "                    	    (SELECT dep.routeId,dep.name depart,des.name destination \n"
                    + "                    				FROM\n"
                    + "                    				(SELECT * \n"
                    + "                    						FROM Route,Place \n"
                    + "                    						WHERE Route.departId = Place.placeId) dep,\n"
                    + "                    					(SELECT *\n"
                    + "                    						FROM Route,Place \n"
                    + "                    						WHERE Route.destinationId = Place.placeId) des\n"
                    + "                    				WHERE des.routeId = dep.routeId) PlaceName\n"
                    + "                    	     WHERE com.companyId = Route.companyId and PlaceName.routeId = Route.routeId) r\n"
                    + "                    		 ON rd.routeId = r.routeId) tbl1, BusType bus\n"
                    + "                    WHERE tbl1.busTypeId = bus.busTypeId and tbl1.routeDetailId = ?");
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                listPosition = getListPosition(rs.getLong(1));
                rd = new RouteDetail(rs.getLong(1), rs.getInt(2), getNumberOfRemaningPosition(listPosition), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), listPosition, rs.getLong(9), rs.getString(10), rs.getString(11), rs.getString(12));

            }
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

        return rd;
    }

    public static int getNumberOfRemaningPosition(int[] list) {
        int count = 0;
        for (int i : list) {
            if (i == 0) {
                count++;
            }
        }
        return count;
    }

    public static ArrayList<RouteDetail> getListRouteV1(String depart, String destination, String[] from, String[] to, int min, int max, String[] company, int deNumSeat) throws SQLException {
        ArrayList<RouteDetail> listRoute = new ArrayList<RouteDetail>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        RouteDetail rd = null;
        int[] listPosition = null;
        String SQL = FILTER_ROUTE;
        if (from != null && from.length > 0) {
            for (int i = 0; i < from.length; i++) {
                if (i == 0) {
                    SQL += " CAST(startTime AS TIME) BETWEEN '" + from[i] + "' and '" + to[i] + "'";
                } else {
                    SQL += " OR CAST(startTime AS TIME) BETWEEN '" + from[i] + "' and '" + to[i] + "'";
                }
            }
            SQL += " and ";
        }

        if (company != null && company.length > 0) {
            for (int i = 0; i < company.length; i++) {
                if (i == 0) {
                    SQL += " name like N'%" + company[i] + "%'";
                } else {
                    SQL += " OR name like N'%" + company[i] + "%'";
                }
            }
            SQL += " and ";
        }

        SQL += "price BETWEEN ? AND ?";

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(SQL);
                psm.setString(1, "%" + depart + "%");
                psm.setString(2, "%" + destination + "%");
                psm.setInt(3, min);
                psm.setInt(4, max);
                rs = psm.executeQuery();
            }
            while (rs != null && rs.next()) {
                listPosition = getListPosition(rs.getLong(1));
                int deNum = getNumberOfRemaningPosition(listPosition);
                if (deNumSeat != 0 && deNumSeat <= deNum) {
                    rd = new RouteDetail(rs.getLong(1), rs.getInt(2), deNum, rs.getString(3), rs.getString(4),
                       rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), listPosition, rs.getLong(9), rs.getString(10), rs.getString(11), rs.getString(12));
                    listRoute.add(rd);
                }
                if (deNumSeat == 0) {
                    rd = new RouteDetail(rs.getLong(1), rs.getInt(2), deNum, rs.getString(3), rs.getString(4),
                       rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), listPosition, rs.getLong(9), rs.getString(10), rs.getString(11), rs.getString(12));
                    listRoute.add(rd);
                }
                
            }

        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listRoute;
    }

}
