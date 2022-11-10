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
import model.Feedback;
import model.RouteDetail;
import model.Ticket;




/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws SQLException, SQLException, Exception {
        ArrayList<Feedback> listfb = null;
                            listfb = FeedbackManager.getFeedbackbyComId(1);
    }
}
