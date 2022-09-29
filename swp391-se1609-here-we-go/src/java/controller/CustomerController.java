/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import config.Config;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.UserManager;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/user"})
public class CustomerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        switch (action) {
            case "submit":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "save" :
                save(request, response);
            default:
                break;
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);

    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        request.setAttribute("controller", "home");
        request.setAttribute("action", "index");
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try {
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            UserManager userManager = new UserManager();
            User user = null;
            user = userManager.checkLogin(phone, password);
            if (user != null) {
                int roleID = user.getRoleId();
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_CUSTOMER", user);
                session.setAttribute("LOGIN_CUSTOMER_NAME", user.getName());
                session.setAttribute("LOGIN_CUSTOMER_PHONE", user.getPhone());
                session.setAttribute("LOGIN_ROLE", roleID);
                if (roleID == 1) {
                    request.setAttribute("controller", "admin");
                    request.setAttribute("action", "index");               
                } else if (roleID == 2) {
                    request.setAttribute("controller", "home");
                    request.setAttribute("action", "index");
                } else {
                    request.setAttribute("message", "Your role is not support!");
                }
            } else {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "login");
                request.setAttribute("message", "username or password is incorrect!");
            }
        } catch (SQLException ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());

        }

    }
    
    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserManager userManager = new UserManager();
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            //validation
            if (userManager.checkDuplicate(phone)) {
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("password", password);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("controller", "user");
                request.setAttribute("action", "login");
                request.setAttribute("messageUN", "username has been used by another person!");
                return;
            }

            //check if password and confirm password matched or not
            if (password.equals(confirmPassword)) {
                //check if password meet the condition or not (8 digit,one lower,upper, special digit)
                String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
                if (password.matches(pattern)) {
                    User user = new User(0, name,null, phone, "", 2, password);
                    if (userManager.register(user)) {
                        request.setAttribute("controller", "user");
                        request.setAttribute("action", "login");
                    }
                } else {
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("password", password);
                    request.setAttribute("confirmPassword", confirmPassword);
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "login");
                    request.setAttribute("messagePW", "password must contain at least 8 letters with lower, upper letter and a special digit!");
                }
            } else {
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("pw", password);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("controller", "user");
                request.setAttribute("action", "login");
                request.setAttribute("messagePW", "Confirm password doesn't match!");
            }
        } catch (Exception ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
