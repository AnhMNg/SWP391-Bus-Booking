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
        System.out.println(DBUtils.convertMoney(10000));
        
    }
}
