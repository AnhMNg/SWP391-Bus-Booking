/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import manager.TicketManager;
import manager.UserManager;
import model.Ticket;
import model.TicketDetail;
import model.User;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args) {
        ArrayList<TicketDetail> list1 = TicketManager.getCompletedTickeDetailtByCustomerId(1);
        
    }
}
