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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;

import manager.CompanyManager;
import manager.FeedbackManager;
import manager.NotificationManager;
import manager.OrderManager;
import manager.RouteDetailManager;
import manager.TicketManager;
import model.RouteDetail;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.swing.text.AbstractDocument.Content;
import model.Company;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/user"})

public class CustomerController extends HttpServlet {

    private static final String ACCOUNT_SID = "AC7b6a82f57ffbe30b90e8bf77c5feac8f";
    private static final String AUTH_TOKEN = "019bdb909954885740f32d987b2087b3";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
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
            case "checkPass":
                checkPass(request, response);
                break;
            case "forgot":
                forgot(request, response);
                break;
            case "reset":
                reset(request, response);
                break;
            case "payment":
                payment(request, response);
                break;
            case "cancle":
                cancleTicket(request, response);
                break;
            case "deleteTicket":
                deleteTicket(request, response);
                break;
            case "about":
                about(request, response);
                break;
            case "changeTicket":
                changeTicket(request, response);
                break;
            case "selectChangeTicket":
                selectChangeTicket(request, response);
                break;
            case "feedback":
                sendFeedback(request, response);
                break;
            case "send":
                send(request, response);
                break;
            case "resetPassProfile":
                resetPassProfile(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);

    }

    private void sendFeedback(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int star = 0;
        String feedback;
        String starString = request.getParameter("rating");
        if (starString != null) {
            star = Integer.parseInt(starString);
        }
        String des = request.getParameter("feedback");
        if (des != null && !des.equals("")) {
            String busType = request.getParameter("category");
            feedback = busType + ": \n" + des;
        } else {
            feedback = "";
        }

        Company com = (Company) request.getSession().getAttribute("COMPANY");
        int comID = com.getCompanyId();
        User us = (User) request.getSession().getAttribute("LOGIN_CUSTOMER");
        long uID = us.getUserId();
        FeedbackManager.sendFeedback(comID, uID, feedback, star);
        request.setAttribute("controller", "company");
        request.setAttribute("action", "info");
    }

    private void selectChangeTicket(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int pos = Integer.parseInt(request.getParameter("seat"));
        long tkIdChange = (long) request.getSession().getAttribute("ticketIdChange");
        long routeDetailId = Long.parseLong(request.getParameter("routeDe"));
        RouteDetail rd = RouteDetailManager.getRouteDetailById(routeDetailId);
        request.setAttribute("pos", pos);
        request.setAttribute("routeDe", rd);
        request.setAttribute("controller", "order");
        request.setAttribute("action", "checkout_changeTicket");
    }

    private void changeTicket(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String changeTicketIdString = request.getParameter("changeTicketId");

        if (changeTicketIdString != null) {
            String depart = request.getParameter("depart");
            String destination = request.getParameter("destination");
            ArrayList<RouteDetail> list = RouteDetailManager.searchRouteDetail(depart, destination, "");
            request.setAttribute("listSearch", list);
            long ticketIdChange = Long.parseLong(changeTicketIdString);
            request.getSession().setAttribute("ticketIdChange", ticketIdChange);
            request.setAttribute("controller", "user");
            request.setAttribute("action", "changeTicket");
        } else {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
        }
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws ParseException, SQLException {
        long ticketId = Long.parseLong(request.getParameter("ticketIdCDelete"));
        if (TicketManager.deleteTicket(ticketId)) {
            request.setAttribute("controller", "user");
            request.setAttribute("action", "myBooking");
        } else {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
        }
    }

    private void cancleTicket(HttpServletRequest request, HttpServletResponse response) throws ParseException, SQLException {
        long ticketId = Long.parseLong(request.getParameter("ticketIdCancle"));
        String timeStart = request.getParameter("ticketTimeStartCancle");
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("LOGIN_CUSTOMER");
        if (TicketManager.checkValidCancle(timeStart)) {
            TicketManager.deleteTicket(ticketId);
            NotificationManager.add(us.getUserId(), us.getName() + " Cancle ticket");
            //Generate OTP
            //int ramdonNum = (int) (Math.random() * 9000) + 100000;
            String code = "Here We Go's Cancel code: " + getAlphaNumericString(15);
            //session = request.getSession();
            //session.setAttribute("SUBMIT_OTP", otp);
            if (session != null) {
                //Send OTP
                Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
                //process phone to +84
                String newPhone = "+84" + us.getPhone().substring(1);
                Message message = Message.creator(
                        new PhoneNumber(newPhone),
                        new PhoneNumber("+18158578891"),
                        code
                ).create();

            }
            request.setAttribute("controller", "user");
            request.setAttribute("action", "myBooking");
        } else {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
        }
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("LOGIN_CUSTOMER");

        String[] listName = (String[]) session.getAttribute("listPasNameForTicket");
        String[] listPhone = (String[]) session.getAttribute("listPasPhoneForTicket");
        RouteDetail rd = (RouteDetail) session.getAttribute("RouteDetailForTicket");

        if (request.getSession().getAttribute("ticketIdChange") != null) {
            int pos = (int) session.getAttribute("posForTicket");
            OrderManager.addOrder(us.getUserId(), rd.getPrice());
            long id = OrderManager.getOrderIdLatest(us.getUserId());
            long idChange = (long) request.getSession().getAttribute("ticketIdChange");
            TicketManager.changeTicket(idChange, id, rd.getRouteDetailId(), pos, listName[0], listPhone[0]);
            session.removeAttribute("ticketIdChange");
        } else {
            int[] listPos = (int[]) session.getAttribute("listPosForTicket");
            OrderManager.addOrder(us.getUserId(), rd.getPrice() * listPos.length);
            long id = OrderManager.getOrderIdLatest(us.getUserId());
            TicketManager.addTicket(id, rd.getRouteDetailId(), listPos, listName, listPhone);

        }
        session.removeAttribute("listPosForTicket");
        session.removeAttribute("listPasNameForTicket");
        session.removeAttribute("listPasPhoneForTicket");
        session.removeAttribute("RouteDetailForTicket");

        //Generate OTP
        //int ramdonNum = (int) (Math.random() * 9000) + 100000;
        String code = "Here We Go's ticket code: " + getAlphaNumericString(15);
        //session = request.getSession();
        //session.setAttribute("SUBMIT_OTP", otp);
        if (session != null) {
            //Send OTP
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
            //process phone to +84
            String newPhone = "+84" + us.getPhone().substring(1);
            Message message = Message.creator(
                    new PhoneNumber(newPhone),
                    new PhoneNumber("+18158578891"),
                    code
            ).create();

        }
        request.setAttribute("controller", "user");
        request.setAttribute("action", "myBooking");

    }

    private static String getAlphaNumericString(int n) {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }

    private void booking(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException, UnsupportedEncodingException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
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
                if (user.getAvtLink() == null) {
                    if (user.getGender() == null) {
                        session.setAttribute("LOGIN_CUSTOMER_IMG", "people.png");
                    } else if (user.getGender() != null) {
                        if (user.getGender().equals("man")) {
                            session.setAttribute("LOGIN_CUSTOMER_IMG", "man.png");
                        } else if (user.getGender().equals("woman")) {
                            session.setAttribute("LOGIN_CUSTOMER_IMG", "girl.png");
                        }
                    }
                } else {
                    session.setAttribute("LOGIN_CUSTOMER_IMG", user.getAvtLink());
                }
                session.setAttribute("LOGIN_EMAIL", user.getEmail());
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
                request.setAttribute("message", "Username or Password is incorrect!");
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
                                new PhoneNumber("+18158578891"),
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
                    request.setAttribute("messagePW", "Password must contain at least 8 letters with lower, upper letter and a special digit!");
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
            throws ServletException, IOException, SQLException, Exception {
        //UserManager userManager = new UserManager();
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
            User user = new User(0, name, null, phone, null, 2, password, "", null, null);
            if (UserManager.register(user)) {
                request.setAttribute("controller", "user");
                User us = UserManager.getUserByPhone(user.getPhone());
                NotificationManager.add(us.getUserId(), us.getName() + " has created new account");
                request.setAttribute("action", "login");
            }
        } else {
            request.setAttribute("message", "Wrong OTP, please check again!");
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException, ParseException {
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
        if (request.getSession().getAttribute("ticketIdChange") != null && request.getParameter("book") == null) {
            request.setAttribute("controller", "user");
            request.setAttribute("action", "changeTicket");
        } else {
            request.setAttribute("controller", "user");
            request.setAttribute("action", "booking");
        }
    }

    private void filter(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, UnsupportedEncodingException, ParseException {
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
            if (request.getSession().getAttribute("ticketIdChange") != null) {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "changeTicket");
            } else {
                request.getSession().setAttribute("ticketIdChange", null);
                request.setAttribute("controller", "user");
                request.setAttribute("action", "booking");
            }
            HttpSession session = request.getSession();
            session.setAttribute("deNum", deNum);
        } catch (SQLException e) {
            log("Error at SortController:" + e.toString());
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {

            String filename = null;
            HttpSession session = request.getSession();
            String phone = (String) session.getAttribute("LOGIN_CUSTOMER_PHONE");
            String img = (String) session.getAttribute("LOGIN_CUSTOMER_IMG");
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

// Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

// Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
// Parse the request
            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
            Iterator<FileItem> iter = items.iterator();
            HashMap<String, String> fields = new HashMap<>();
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString("utf-8"));
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    System.out.println("name: " + name);
                    System.out.println("value: " + value);
                } else {
                    filename = item.getName();
                    System.out.println("filename: " + filename);
                    if (filename == null || filename.equals("")) {
                        filename = "";
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
            String gender = fields.get("gender").toLowerCase();
            String email = fields.get("newEmail");
            String newPhone = fields.get("newPhone");
            String link = "<a href='http://localhost:8080/swp391-se1609-here-we-go/user/profile.do'><img src='https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/315514627_3272981566295938_7366370551689330929_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=N3mfCHcxcfQAX8OK7ZI&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfC2lgUw6QexVUnhtFyK86LxPTedLjZxHxlTVvjEyz3bxA&oe=637693D1'></a>";
            User user = UserManager.getUserByPhone(phone);
            if (!email.equals("")) {
                final String fromEmail = "herewego.letstravel@gmail.com"; //requires valid gmail id
                final String password = "sdoyrmgixklbgzle"; // correct password for gmail id
                // your host email smtp server details
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                Session session1 = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });
                try {
                    javax.mail.Message message = new MimeMessage(session1);
                    message.setFrom(new InternetAddress(fromEmail));
                    message.setRecipients(javax.mail.Message.RecipientType.TO,
                            InternetAddress.parse(email));
                    message.setSubject("Welcome to HereWeGo");
                    message.setContent(link, "text/html");
                    Transport.send(message);
                    if (UserManager.updateUserEmail(user.getUserId(), email)) {
                        NotificationManager.add(user.getUserId(), user.getName() + " has verify email");
                    }
                    session.setAttribute("LOGIN_EMAIL", email);

                    request.setAttribute("email", email);
                    System.out.println("Done");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }
            if (newName != null && filename.equals("") && gender != null && newPhone != null) {
                if (UserManager.updateUser(newName, user.getUserId(), img, gender.toLowerCase(), newPhone)) {
                    NotificationManager.add(user.getUserId(), user.getName() + " has edit profile imformation");
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "profile");
                    session.setAttribute("LOGIN_CUSTOMER_PHONE", newPhone);
                    session.setAttribute("LOGIN_CUSTOMER_NAME", newName);
                    session.setAttribute("LOGIN_CUSTOMER_IMG", img);
                    System.out.println("-------save-------");
                }
            }
            if (newName != null && filename != "" && gender != null && newPhone != null) {
                if (UserManager.updateUser(newName, user.getUserId(), filename, gender.toLowerCase(), newPhone)) {
                    NotificationManager.add(user.getUserId(), user.getName() + " has edit profile imformation");
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "profile");
                    session.setAttribute("LOGIN_CUSTOMER_PHONE", newPhone);
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

    private void send(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String mess = request.getParameter("message");
            final String fromEmail = "herewego.letstravel@gmail.com"; //requires valid gmail id
            final String password = "sdoyrmgixklbgzle"; // correct password for gmail id
            // your host email smtp server details
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            try {
                javax.mail.Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(fromEmail));
                message.setRecipients(javax.mail.Message.RecipientType.TO,
                        InternetAddress.parse(fromEmail));
                String link = "<p> Email: " + email + " </p>"
                        + "<p>Name: " + name + "</p>"
                        + "<p> Message: " + mess + "</p>";
                message.setSubject("Contact HereWeGo");
                message.setContent(link, "text/html");
                Transport.send(message);
                System.out.println("Done");
                NotificationManager.add("HereWeGo has new contact.");
                request.getRequestDispatcher(Config.ABOUT_US).forward(request, response);

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } catch (Exception ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());
        }
    }

    private void checkPass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userFound = (User) session.getAttribute("userFound");
        String SUBMIT_OTP = (String) session.getAttribute("SUBMIT_OTP");
        String otp1 = request.getParameter("otp1");
        String otp2 = request.getParameter("otp2");
        String otp3 = request.getParameter("otp3");
        String otp4 = request.getParameter("otp4");
        String otp5 = request.getParameter("otp5");
        String otp6 = request.getParameter("otp6");
        String otpCheck = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
        if (otpCheck.equals(SUBMIT_OTP)) {
            if (userFound != null) {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "changePass");
            }

        } else {
            request.setAttribute("message", "Wrong OTP, please check again!");
        }
    }

    private void forgot(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserManager um = new UserManager();
            String forgotPhone = request.getParameter("forgotPhone");
            User user = um.getUserByPhone(forgotPhone);
            if (user != null) {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "otpSMSChange");
                //Generate OTP
                int ramdonNum = (int) (Math.random() * 9000) + 100000;
                String otp = String.valueOf(ramdonNum);
                HttpSession session = request.getSession();
                session.setAttribute("SUBMIT_OTP", otp);
                if (session != null) {
                    //Send OTP
                    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
                    //process phone to +84
                    String newPhone = "+84" + forgotPhone.substring(1);
                    Message message = Message.creator(
                            new PhoneNumber(newPhone),
                            new PhoneNumber("+18158578891"),
                            otp
                    ).create();

                }
                session.setAttribute("userFound", user);
            } else {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "forgotPass");
                request.setAttribute("message", "Looks like the phone number doesn't exist in the system!");
            }
        } catch (SQLException ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());
        }

    }

    private void reset(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        try {

            HttpSession session = request.getSession();
            User userFound = (User) session.getAttribute("userFound");
            String resetPass = request.getParameter("resetPass");
            String confirmRPass = request.getParameter("confirmRPass");
            if (resetPass.equals(confirmRPass)) {
                if (UserManager.changePasword(userFound.getUserId(), resetPass)) {
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "login");
                    request.setAttribute("message", "Successfully change password!");
                }
            } else {
                request.setAttribute("controller", "user");
                request.setAttribute("action", "changePass");
                request.setAttribute("message", "Confirm password doesn't match!");
            }
        } catch (SQLException ex) {
            request.setAttribute("controller", "error");
            request.setAttribute("action", "index");
            request.setAttribute("message", ex.getMessage());
            log("Error at MainController: " + ex.toString());
        }
    }

    private void about(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Config.ABOUT_US).forward(request, response);
    }

    private void resetPassProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        try {
            HttpSession session = request.getSession();
            User userReset = (User) session.getAttribute("LOGIN_CUSTOMER");
            String resetPass = request.getParameter("resetPass");
            String confirmRPass = request.getParameter("confirmRPass");
            if (resetPass.equals(confirmRPass)) {
                if (UserManager.changePasword(userReset.getUserId(), resetPass)) {
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "profile");
                    request.setAttribute("message", "Successfully changed!");
                } else {
                    request.setAttribute("controller", "user");
                    request.setAttribute("action", "changePassProfile");
                    request.setAttribute("message", "Confirm password doesn't match!");
                }
            }
        } catch (SQLException ex) {
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
        } catch (Exception ex) {
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
        } catch (Exception ex) {
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
