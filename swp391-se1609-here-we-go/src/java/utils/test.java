/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import manager.CompanyManager;
import manager.RouteDetailManager;
import manager.TicketManager;
import manager.UserManager;
import model.Company;
import model.RouteDetail;
import model.Ticket;
import model.TicketDetail;
import model.User;

/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws SQLException, SQLException {
        ArrayList<RouteDetail> list = RouteDetailManager.searchRouteDetail("Tiền Giang", "Hà Nội", "2022-10-15");
        for (RouteDetail rd : list) {
            System.out.println("Cpmpany:" + rd.getCompanyName()); 
           System.out.println(rd.getDepart() + " - " +rd.getDepartDetail());
            System.out.println(rd.getDestinationDetail()+" - " +rd.getDestination());
            System.out.println("Price: " + rd.getPrice());
            System.out.println("StartTime: " + rd.getStartTime());
            System.out.println("=========================================================");
            for (int i : rd.getListPosition()) {
                System.out.println(i);
            }
            
        }
        int[] list2 = RouteDetailManager.getListPosition(2);
        for (int i : list2) {
            System.out.println(i);
        }
        
    }
}
