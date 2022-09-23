/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import java.sql.SQLException;
import model.Company;
import manager.CompanyManager;
import manager.UserManager;
import model.User;

/**
 *
 * @author baolo
 */
public class test {
    public static void main(String[] args) throws SQLException {
        Company com = CompanyManager.getCompanyInfo(1);
        System.out.println(com.getDesription());
        User us = UserManager.getUserById(1);
        System.out.println(us.getUserId()+"\n" + us.getPhone() +"\n" + us.getName());
    }
}
