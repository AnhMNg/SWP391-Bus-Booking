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
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import manager.CompanyManager;
import manager.RouteDetailManager;
import model.Company;
import model.RouteDetail;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/user"})

public class CustomerController extends HttpServlet {

    private static final String ACCOUNT_SID = "AC7531d18ea7e24011554d500770a01c58";
    private static final String AUTH_TOKEN = "0f9f4431546a3dd7ee404768256b8671";

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
            case "signup":
                signup(request, response);
                break;
            case "save":
                save(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "booking":
                booking(request, response);
                break;
            case "filter":
                filter(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
                case "change":
                change(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);

    }

    private void booking(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("LOGIN_CUSTOMER");
        request.getSession().setAttribute("backToBook", "false");
        if (us != null && us.getRoleId() == 2) {
            String[] listPosString;
            listPosString = request.getParameterValues("seat");
            

            if (listPosString == null || listPosString.length == 0) {
                request.setAttribute("notification", "Please select seats to book tickets");
                ArrayList<RouteDetail> listReturn = (ArrayList<RouteDetail>) session.getAttribute("listReturn");
                request.setAttribute("listSearch", listReturn);
                request.setAttribute("controller", "user");
                request.setAttribute("action", "booking");
            } else {
                long rid = Long.parseLong(request.getParameter("routeDe"));
                RouteDetail rd = RouteDetailManager.getRouteDetailById(rid);
                int[] listPos = new int[listPosString.length];
                for (int i = 0; i < listPosString.length; i++) {
                    listPos[i] = Integer.parseInt(listPosString[i]);
                }
                request.setAttribute("listPos", listPos);
                request.setAttribute("routeDe", rd);
                request.setAttribute("controller", "order");
                request.setAttribute("action", "checkout");
            }

        } else {
            request.getSession().setAttribute("backToBook", "true");
            request.setAttribute("message", "Please login to booking!!!");
            request.setAttribute("controller", "user");
            request.setAttribute("action", "login");
        }

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
            String back = request.getParameter("back");
            UserManager userManager = new UserManager();
            User user = null;
            user = userManager.checkLogin(phone, password);
            if (user != null) {
                int roleID = user.getRoleId();
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_CUSTOMER", user);
                session.setAttribute("LOGIN_CUSTOMER_NAME", user.getName());
                session.setAttribute("LOGIN_CUSTOMER_PHONE", user.getPhone());
                session.setAttribute("LOGIN_CUSTOMER_IMG", user.getAvtLink());
                session.setAttribute("LOGIN_ROLE", roleID);
                
                if (roleID == 1) {
                    request.setAttribute("controller", "admin");
                    request.setAttribute("action", "index");
                    request.getRequestDispatcher(Config.ADMIN_LAYOUT).forward(request, response);
                } else if (roleID == 2) {
                    if (back != null && back.equals("true")) {
                        request.setAttribute("listSearch", request.getSession().getAttribute("listReturn"));
                        request.setAttribute("controller", "user");
                        request.setAttribute("action", "booking");
                    } else {
                        request.setAttribute("controller", "home");
                        request.setAttribute("action", "index");
                    }

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

    private void signup(HttpServletRequest request, HttpServletResponse response)
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
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "otpSMS");
                    //Generate OTP
                    int ramdonNum = (int) (Math.random() * 9000) + 100000;
                    String otp = String.valueOf(ramdonNum);
                    HttpSession session = request.getSession();
                    session.setAttribute("SUBMIT_OTP", otp);
                    if (session != null) {
                        //Send OTP
                        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
                        //process phone to +84
                        String newPhone = "+84" + phone.substring(1);
                        Message message = Message.creator(
                                new PhoneNumber(newPhone),
                                new PhoneNumber("+19785033345"),
                                otp
                        ).create();
                    }
                    session.setAttribute("name", name);
                    session.setAttribute("phone", phone);
                    session.setAttribute("password", password);
                    session.setAttribute("confirmPassword", confirmPassword);
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

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        UserManager userManager = new UserManager();
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        String phone = (String) session.getAttribute("phone");
        String password = (String) session.getAttribute("password");
        String SUBMIT_OTP = (String) session.getAttribute("SUBMIT_OTP");
        String otp1 = request.getParameter("otp1");
        String otp2 = request.getParameter("otp2");
        String otp3 = request.getParameter("otp3");
        String otp4 = request.getParameter("otp4");
        String otp5 = request.getParameter("otp5");
        String otp6 = request.getParameter("otp6");
        String otpCheck = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
        if (otpCheck.equals(SUBMIT_OTP)) {
            User user = new User(0, name, null, phone, null, 2, password, "");
            if (userManager.register(user)) {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "login");
            }
        } else {
            request.setAttribute("message", "Wrong OTP, please check again!");
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String cityFrom = request.getParameter("cityfrom");
        String cityTo = request.getParameter("cityto");
        String districtFrom = request.getParameter("districtfrom");
        String districtTo = request.getParameter("districtto");
        String startDate = request.getParameter("startDate");
        String depart = districtFrom + ", " + cityFrom;
        String destination = districtTo + ", " + cityTo;
        ArrayList<RouteDetail> list = RouteDetailManager.searchRouteDetail(depart, destination, startDate);
        request.setAttribute("depart", depart);
        request.setAttribute("destination", destination);
        request.setAttribute("listSearch", list);
        request.setAttribute("controller", "user");
        request.setAttribute("action", "booking");
    }

    private void filter(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, UnsupportedEncodingException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            String[] time_raw = request.getParameterValues("option1");
            String depart = request.getParameter("depart");
            String destination = request.getParameter("destination");
            String min_raw = request.getParameter("minPrice");
            String max_raw = request.getParameter("maxPrice");
            int min = Integer.parseInt(min_raw);
            int max = Integer.parseInt(max_raw);
            String[] company = request.getParameterValues("option2");
            String[] from = null;
            String[] to = null;
            int deNum = Integer.parseInt(request.getParameter("deNum"));

            if (time_raw != null) {

                from = new String[time_raw.length];
                to = new String[time_raw.length];
                String[] listtmp = new String[2];
                for (int i = 0; i < time_raw.length; i++) {
                    listtmp = time_raw[i].split(",");
                    from[i] = listtmp[0];
                    to[i] = listtmp[1];

                }
            }
            
            ArrayList<RouteDetail> listRoute = RouteDetailManager.getListRouteV1(depart, destination, from, to, min, max, company, deNum);
            if (listRoute.size() > 0) {
                request.setAttribute("listSearch", listRoute);
            }
            request.setAttribute("depart", depart);
            request.setAttribute("destination", destination);
       
            request.setAttribute("controller", "user");
            request.setAttribute("action", "booking");
            HttpSession session = request.getSession();
            session.setAttribute("deNum", deNum);
        } catch (SQLException e) {
            log("Error at SortController:" + e.toString());
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String filename = null;
            HttpSession session = request.getSession();
            String phone = (String) session.getAttribute("LOGIN_CUSTOMER_PHONE");
            String img=(String) session.getAttribute("LOGIN_CUSTOMER_IMG");
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

// Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

// Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
// Parse the request
            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
            Iterator<FileItem> iter = items.iterator();
            HashMap<String, String> fields = new HashMap<>();
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString());
                    String name = item.getFieldName();
                    String value = item.getString();
                    System.out.println("name: " + name);
                    System.out.println("value: " + value);
                } else {
                    filename = item.getName();
                    System.out.println("filename: " + filename);
                    if (filename == null || filename.equals("")) {
                       filename="";
                    } else {
                        Path path = Paths.get(filename);
                        Path file = path.toAbsolutePath();
                         String storePath = servletContext.getRealPath("/uploads");
                          String action = storePath.substring(0, storePath.lastIndexOf("build"));
                        String s = servletContext.getContextPath();
                        File uploadFile = new File(action + "web\\uploads/" + path.getFileName());
                        item.write(uploadFile);
                        System.out.println(action + "web\\uploads/" + path.getFileName());
                        
                    }
                }
            }
            String newName = fields.get("newName");
            User user = UserManager.getUserByPhone(phone);
            if (newName != null && filename.equals("")) {
                if (UserManager.updateUser(newName, user.getUserId(), img)) {
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "profile");
                    session.setAttribute("LOGIN_CUSTOMER_NAME", newName);
                     session.setAttribute("LOGIN_CUSTOMER_IMG", img);
                    System.out.println("-------save-------");
                }
            }
            if (newName != null && filename!="") {
                if (UserManager.updateUser(newName, user.getUserId(), filename)) {
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "profile");
                    session.setAttribute("LOGIN_CUSTOMER_NAME", newName);
                     session.setAttribute("LOGIN_CUSTOMER_IMG", filename);
                    System.out.println("-------save-------");
                }
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

    private void change(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
