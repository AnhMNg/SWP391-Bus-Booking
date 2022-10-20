<%-- 
    Document   : index
    Created on : Sep 29, 2022, 6:49:01 PM
    Author     : Admin
--%>

<%@page import="manager.CompanyManager"%>
<%@page import="manager.TicketManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.UserManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/style_admin.css"/>"/>
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
            />
        <title>Admin Dashboard Panel</title>
    </head>
    <body>
        <div class="overview">
            <div class="title">
                <i class="uil uil-tachometer-fast-alt"></i>
                <span class="text">Admin Dashboard</span>
            </div>

            <div class="boxes">
                <div class="box box1">
                    <i class="uil uil-user"></i>
                    <span class="text">Customers</span>
                    <span class="number"><%= UserManager.countCustomer() %></span>
                </div>
                <div class="box box2">
                    <i class="uil uil-ticket"></i>
                    <span class="text">Tickets Sold</span>
                    <span class="number"><%=TicketManager.countTicketSold()%></span>
                </div>
                <div class="box box3">
                    <i class="uil uil-share"></i>
                    <span class="text">TC Partners</span>
                    <span class="number"><%=CompanyManager.countCompany()%></span>
                </div>
            </div>
        </div>

        <div class="activity">
            <div class="title">
                <i class="uil uil-clock-three"></i>
                <span class="text">Recent Activity</span>
            </div>

            <table class="table table-responsive-sm table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Joined</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<model.User> list  = UserManager.getListCustomer();
        for (model.User user : list) {
            %>
                    
                      <tr>
                        <td><%= user.getUserId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><%= user.getDateCreate() %></td>
                        <td>Coming soon</td>
                    </tr>
                    <%
        }
                    %>
                    
                </tbody>
            </table>
        </div>
    </body>
</html>
