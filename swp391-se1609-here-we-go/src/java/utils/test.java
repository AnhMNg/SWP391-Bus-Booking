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
//        System.out.println(UserManager.countCustomer());
//        System.out.println(TicketManager.countTicketSold());
//        System.out.println(CompanyManager.countCompany());
//        ArrayList<model.User> list  = UserManager.getListCustomer();
//        for (model.User user : list) {
//            System.out.println(user.getName());
//        }
//        System.out.println(TicketManager.countTicketbyId(1));
//        ArrayList<Company> listcom = CompanyManager.getAllCompany();
//        for (Company company : listcom) {
//            System.out.println(company.getName());
//            
//        }
//        ArrayList<Company> listc2 = CompanyManager.searchCompanyByName("ương");
//        for (Company company : listc2) {
//            System.out.println(company.getName());
        }
        ArrayList<RouteDetail> listroute = RouteDetailManager.getRouteByCompanyId(1);
        for (RouteDetail routeDetail : listroute) {
            System.out.println(RouteDetailManager.getNameDepartByRouteId(routeDetail.getRouteId())+ "  " + RouteDetailManager.getNameDestinationByRouteId(routeDetail.getRouteId()) + "   " + RouteDetailManager.getNameBusById(routeDetail.getBusTypeId())
            + "   " + routeDetail.getStartTime()
            );
        System.out.println("hi");
        RouteDetailManager.AddRouteDetail("Tiền Giang", "Hà Nội",1, "sleep", 2022, 0, timeArrival)
    }
}
