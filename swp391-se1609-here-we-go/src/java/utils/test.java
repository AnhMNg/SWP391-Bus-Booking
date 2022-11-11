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
import model.User;




/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws SQLException, SQLException, Exception {
        
                            
          ArrayList<model.User> list = UserManager.getListCustomer();
          for (User user : list) {
              System.out.println(user.getUserId());
        }
    }
}
