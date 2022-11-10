/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import manager.FeedbackManager;
import manager.OrderManager;
import manager.RouteDetailManager;
import manager.TicketManager;
import manager.UserManager;
import model.Feedback;
import model.RouteDetail;
import model.Ticket;




/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws SQLException, SQLException, Exception {
        
    boolean add = RouteDetailManager.AddRouteDetail("Tay Ninh", "TPHCM", 5, "Sleeper Bus", "2022-11-13 07:00:00.000", 100000, "2022-11-13 09:00:00.000","Phuoc Dong","An Suong");
        System.out.println(add);
    }
}
