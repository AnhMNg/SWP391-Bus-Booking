<%-- 
    Document   : notification
    Created on : Oct 12, 2022, 8:46:09 PM
    Author     : Admin
--%>

<%@page import="manager.NotificationManager"%>
<%@page import="model.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Admin Notification Panel</title>
    </head>
    <body>
        <div class="overview">
            <div class="title">
                <i class="uil uil-bell"></i>
                <span class="text">Notification</span>
            </div>
        </div>

        <div class="activity">
            <!-- Hoverable Table rows -->
            <div class="card">
                <form action="<c:url value="/notification/sort.do"/>" method="post">
                    <div class="card-header">
                        <label for="sel1" class="form-label">Sorting by</label>
                        <select class="btn btn-outline-light text-dark" id="sel1" name="sellist" onchange="this.form.submit()"">
                            <option value="latest">Latest</option>
                            <option value="oldest">Oldest</option> 
                            
                        <!--     <input type="radio" id="latest" name="sortby" value="latest">
                                <label for="latest">Latest</label>
                                <input type="radio" id="oldest" name="sortby" value="oldest">
                                <label for="oldest">Oldest</label>
                                <input type="submit" value="sort" name="action"> 
                        -->                              
                        </select>                       
                    </div>
                    <table class="notification">
                        <thead>
                            <tr>
                                <th>Message</th>
                                <th>Time</th>
                            </tr> 
                        </thead>
                    <tbody>
                        <%
                            ArrayList<Notification> list = (ArrayList<Notification>) request.getAttribute("list");
                            //if (list == null) list = NotificationManager.getList();
                            for (Notification no : list) {
                        %>
                        <tr>
                            <td><%= no.getMessage()%></td>
                            <td><%= no.getDate()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    </table>
                </form>
                </div>
                <div class="get-list">
                        <form action="<c:url value="/notification/getlist.do"/>" method="post">
                            <table class="notification">
                                <thead>
                                    <tr>
                                        <th>Message</th>
                                        <th>Time</th>
                                    </tr> 
                                </thead>
                            <tbody>
                                <%
                                    ArrayList<Notification> list1 = (ArrayList<Notification>)request.getAttribute("list1");
                                    if (list1 == null) list1 = NotificationManager.getList();
                                    for (Notification no : list1){
                                    %>
                                    <tr>
                                        <td><%= no.getMessage() %></td>
                                        <td><%= no.getDate() %></td>
                                    </tr>
                                    <%
                                    }
                                    %>
                            </tbody>
                        </table>
                        </form>
                    </div>
            
            <!--/ Hoverable Table rows -->
        </div>
    </body>
</html>
