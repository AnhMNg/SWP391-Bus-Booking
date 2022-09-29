
import java.util.ArrayList;
import manager.CompanyManager;
import manager.TicketManager;
import model.Company;
import model.TicketDetail;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author baolo
 */
public class test {
    public static void main(String[] args) {
        //Hiển thị danh sách top 5 công ty có nhiều Route nhất
        ArrayList<Company> list = CompanyManager.getTopCompany(5);
        for (Company company : list) {
            System.out.println(company.getName());
        }
        
        //Hiển thị dnah sách chuyến đi sắp tới theo customer id
        ArrayList<TicketDetail> list2 = TicketManager.getUpcomingTickeDetailtByCustomerId(1);
        for (TicketDetail tk : list2) {
            System.out.println(tk.getCompanyName()+"---"+tk.getDepart()+"---"+tk.getDestination()+"---"+tk.getPosition());
        }
        
        //Hiển thị danh sách chuyến đi đã đi rồi
        ArrayList<TicketDetail> list3 = TicketManager.getCompletedTickeDetailtByCustomerId(1);
        for (TicketDetail tk : list3) {
            System.out.println(tk.getCompanyName()+"---"+tk.getDepart()+"---"+tk.getDestination()+"---"+tk.getPosition());
        }
                
    }
}
