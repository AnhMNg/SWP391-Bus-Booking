/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.SQLException;
import manager.OrderManager;
import manager.TicketManager;
import model.Ticket;
import sun.security.krb5.internal.TicketFlags;



/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws SQLException, SQLException, Exception {
        OrderManager.addOrder(2, 999999);
        long id = OrderManager.getOrderIdLatest(2);
        int[] listPos = {1,2};
        String[] listName = {"Long thu nhat","Long thu 2"};
        String[] listPhone = {"092982887","0929828938"};
        TicketManager.addTicket(id, 1, listPos, listName, listPhone);
    }
}
