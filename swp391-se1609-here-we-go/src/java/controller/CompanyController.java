/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import config.Config;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.CompanyManager;
import manager.RouteDetailManager;
import model.Company;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CompanyController", urlPatterns = {"/company"})
public class CompanyController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        switch (action) {
            case "submit":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "infoFind":
                compInfo(request, response);
                break;
            case "toupload":
                Toupload(request, response);
                break;
            case "upload":
                upload(request, response);
                break;
            case "todelete":
                toDelete(request, response);
                break;
            case "delete":
                delete(request, response);
                break;

        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String ridString = request.getParameter("routeId");
        long rid = Long.parseLong(ridString);
        RouteDetailManager.delete(rid);
        request.setAttribute("controller", "company");
        request.setAttribute("action", "routesList");
    }
    private void toDelete(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("controller", "company");
        request.setAttribute("action", "routesList");
    }
private void Toupload(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("controller", "company");
        request.setAttribute("action", "upload");
    }
    private void upload(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, Exception{
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        Company com = (Company) request.getSession().getAttribute("LOGIN_COMPANY");
        String cityFrom = request.getParameter("cityfrom");
        String cityTo = request.getParameter("cityto");
        String districtFrom = request.getParameter("districtfrom");
        String districtTo = request.getParameter("districtto");
        String depart = districtFrom + ", " + cityFrom;
        String destination = districtTo + ", " + cityTo;
        String typeBus = request.getParameter("type-bus");
        String priceString = request.getParameter("currency-field");
        if (!priceString.equals("")){
        int price = Integer.parseInt(priceString);
        }
        
        String startTime = request.getParameter("startTime");
        startTime = startTime.replace('T', ' ');
        String pickpoint = request.getParameter("pickuppoint");
        String droppoint = request.getParameter("droppoint");
        
        if (depart.equals(", ") || destination.equals(", ") || depart.equals(destination) || typeBus == null || priceString.equals("") || startTime.equals("") || pickpoint.equals("") || droppoint.equals("") ){
            request.setAttribute("controller", "company");
        request.setAttribute("action", "upload");
        request.setAttribute("mes", "Information is invalid! Can't upload. Please upload again!");
        } else {
        RouteDetailManager.AddRouteDetail(depart, destination, com.getCompanyId(), typeBus, startTime, 0, "", pickpoint, droppoint);
        
        request.setAttribute("controller", "company");
        request.setAttribute("action", "upload");
        request.setAttribute("mes", "Upload successfully!  You can continue upload a new route!");
        }
        
        
    }
    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        request.setAttribute("controller", "home");
        request.setAttribute("action", "index");
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        try {
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            Company com = null;
            com = CompanyManager.getCompanyAccount(phone, password);
            if (com != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_COMPANY", com);
                session.setAttribute("LOGIN_COMPANY_NAME", com.getName());
                session.setAttribute("LOGIN_COMPANY_NAME_DES", com.getDesription());
                session.setAttribute("LOGIN_COMPANY_NAME_LOGO", com.getImgLink());
                request.setAttribute("controller", "company");
                request.setAttribute("action", "index");
            } else {
                request.setAttribute("controller", "company");
                request.setAttribute("action", "login");
                request.setAttribute("message", "username or password is incorrect!");
            }
        } catch (Exception ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());
        }
    }

    private void compInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CompanyManager comMag = new CompanyManager();
        int comId = Integer.parseInt(request.getParameter("comP"));
        Company com = comMag.getCompanyInfo(comId);
        if (com != null) {
            HttpSession session = request.getSession();
            session.setAttribute("COMPANY", com);
            session.setAttribute("COMPANY_NAME", com.getName());
            session.setAttribute("COMPANY_DES", com.getDesription());
            session.setAttribute("COMPANY_LOGO", com.getImgLink());
            request.setAttribute("controller", "company");
            request.setAttribute("action", "info");
        } else {
            request.setAttribute("message", "username or password is incorrect!");
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
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
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
