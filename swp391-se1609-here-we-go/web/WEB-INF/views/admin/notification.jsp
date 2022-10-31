<%-- 
    Document   : notification
    Created on : Oct 12, 2022, 8:46:09 PM
    Author     : Admin
--%>

<%@page import="manager.NotificationManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Notification"%>
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
                        <select class="btn btn-outline-light text-dark" id="sel1" name="sellist">
                            <option value="latest">Latest</option>
                            <c:if test="${not empty oldest}">
                                <option selected="selected" value="oldest">Oldest</option>
                            </c:if>
                                <c:if test="${empty oldest}">
                                <option value="oldest">Oldest</option>
                            </c:if>
                            <input type="submit" value="sort" name="sort"/>
                        </select>
                    </div>
                    </form>
               
                    <div class="list-group">
                        
                        <c:forEach var="no" items="${list}">  
                            <div class="list-group-item list-group-item-action nt-ct-group">
                                <div class="col-md-6">
                                    <ul class="d-flex list-unstyled nt-ct">
                                        <li>${no.message}</li>
                                    </ul>
                                </div>
                                <div class="col-md-6 nt-ct-time">
                                    <p>${no.date}</p>
                                </div>              
                            </div>
                            
                        </c:forEach>
                    </div> 
            
            </div>
            <div class="get-list">
                <form action="<c:url value="/notification/getlist.do"/>" method="post">
                    <div class="list-group">
                        <c:forEach var="no1" items="${list1}">
                            <div class="list-group-item list-group-item-action nt-ct-group">
                                <div class="col-md-6">
                                    <ul class="d-flex list-unstyled nt-ct">
                                        <li>${no1.message}</li>
                                    </ul>
                                </div>
                                <div class="col-md-6 nt-ct-time">
                                    <p>${no1.date}</p>
                                </div>                
                            </div>
                        </c:forEach>
                    </div>
                </form>
            </div> 
            <!--/ Hoverable Table rows -->
        </div>
    </body>
</html>
